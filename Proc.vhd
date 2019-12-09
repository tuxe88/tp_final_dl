----------------------------------------------------------------------------------
-- TP Final diseno logico
-- Nombre del componente: Procesador
-- Descripcion del componente: TODO
-- Alumnos: Ivan Szysz, Valentin Tourrilhes
-- Profesores Martín Vázquez, Lucas Leiva
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Proc is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           input : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  std_logic_vector (7 downto 0));
end Proc;

architecture Beh_Proc of Proc is

-- ================
-- Declaracion de los componentes usados

-- program counter (PC)
component pc 
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           o : out  std_logic_vector (6 downto 0)
    );
end component;

-- ROM prog (Rom con las instrucciones cargadas)
component rom_prog 
    Port ( addr : in  STD_LOGIC_VECTOR (6 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0)
    );
end component;

-- IR (Registro de instucciones)
component ir
    Port ( clk, rst: in std_logic;
         input: in std_logic_vector(15 downto 0);
         output: out std_logic_vector(15 downto 0)
    );
end component;

-- DECODE UNIT
component decode
    Port ( 
           input : in STD_LOGIC_VECTOR (7 downto 0);
           out_we : out STD_LOGIC;
           reg_we : out STD_LOGIC;
           alu_op : out STD_LOGIC_VECTOR (2 downto 0);
           reg_a_we : out STD_LOGIC;
           bus_sel : out STD_LOGIC_VECTOR (1 downto 0)
    );
end component;

-- BUS SELECTOR
component bus_selector
    Port ( 
          bus_sel : in STD_LOGIC_VECTOR (1 downto 0);
          in_0 : in STD_LOGIC_VECTOR (7 downto 0);
          in_1 : in STD_LOGIC_VECTOR (7 downto 0);
          in_2 : in STD_LOGIC_VECTOR (7 downto 0);
          out_0 : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

-- ALU
component alu
    Port ( 
           a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           op : in STD_LOGIC_VECTOR (2 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

--banco de registros
component regs 
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           we : in  std_logic;
           rd : in  std_logic_vector (3 downto 0);
           rs : in  std_logic_vector (3 downto 0);
           din : in  std_logic_vector (7 downto 0);
           dout : out  std_logic_vector (7 downto 0)
    );
end component;

-- REG 8B generico
component reg_8b
    Port ( 
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           we : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

-- declaracion de seniales utilizadas 

-- seniales de PC
signal o_pc: std_logic_vector(6 downto 0);

-- seniales de ROM PROG
signal output_rom : std_logic_vector(15 downto 0);

--seniales de IR
signal output_ir: std_logic_vector(15 downto 0); 

-- seniales de DECODE UNIT
signal out_we_decode : std_logic;
signal reg_we_decode : std_logic;
signal reg_a_we_decode : std_logic;
signal alu_op_decode : std_logic_vector(2 downto 0);
signal bus_sel_decode : std_logic_vector(1 downto 0);

--seniales de bus_selector
signal out_0_bus_sel: std_logic_vector(7 downto 0); 

-- seniales de banco de registros
signal we_regs: std_logic; -- senal para escribir en el banco de registro 
signal dout_regs: std_logic_vector(7 downto 0);

-- seniales de ALU
signal s_alu : std_logic_vector(7 downto 0);

-- seniales de banco de reg A
signal dout_reg_a: std_logic_vector(7 downto 0);

-- seniales de banco de reg out
signal dout_reg_out: std_logic_vector(7 downto 0);

-- ================

begin

-- ================
-- Instaciacion de componentes utilziados
 
-- PC
ePC: pc Port map(
  clk => clk,
  rst => rst,
  o => o_pc
);


-- ROM
eROM_Prog: rom_prog port map (
  addr => o_pc,  --la senial de entrada de la rom es la salida del PC
  output => output_rom
);

-- IR
eIR: ir port map (
  clk => clk,
  rst => rst,
  input => output_rom,
  output => output_ir
);

-- El decodificador de la instrucción
eDecode: decode port map (input => output_ir(15 downto 8),
                          out_we => out_we_decode,
                          reg_we => reg_we_decode,
                          reg_a_we => reg_a_we_decode,
                          alu_op => alu_op_decode,
                          bus_sel => bus_sel_decode
                );

-- BUS SELECTOR
eBusSelector: bus_selector port map (
  bus_sel => bus_sel_decode,
  in_0 => dout_regs,
  in_1 => output_ir(7 downto 0),
  in_2 => input,
  out_0 => out_0_bus_sel
);

-- Banco de registros
eregs:  regs Port map (
	                clk => clk,
	                rst => rst,
	                we => reg_we_decode, 
					rd => output_ir(3 downto 0),
					rs => output_ir(7 downto 4), 
					din =>s_alu,
					dout =>dout_regs
				); 

-- ALU
eAlu: alu port map (a => out_0_bus_sel,
                    b => dout_reg_a,
                    op => alu_op_decode,
                    s => s_alu);

-- regA
eRegA: reg_8b port map (
                    clk => clk,
                    rst => rst,
                    we => reg_a_we_decode,
                    din => out_0_bus_sel,
                    dout => dout_reg_a
              );

-- regOut
eRegOut: reg_8b port map (
                    clk => clk,
                    rst => rst,
                    we => out_we_decode,
                    din => s_alu,
                    dout => output
              );

	process (clk, rst)
	
	begin
	    if (rst='1') then 
		  
		  elsif (rising_edge(clk)) then
		  
		  end if;
		  
	end process;

end Beh_Proc;

