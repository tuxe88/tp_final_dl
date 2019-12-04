--
-- TestBench para banco de registros
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.std_logic_arith.ALL;

entity regs_tb is
end regs_tb;


architecture tp_final of regs_tb is 

   component regs 
      port (
            clk, rst, we: in STD_LOGIC;
            rd, rs : in  STD_LOGIC_VECTOR (3 downto 0);
            din: in STD_LOGIC_VECTOR (7 downto 0);
            dout : out  STD_LOGIC_VECTOR (7 downto 0));
   end component;
   
   -- Señales de estimulo
   signal clk_signal, rst_signal, we_signal: STD_LOGIC := '0';
   signal rd_signal, rs_signal: STD_LOGIC_VECTOR (3 downto 0) := "0000";
   signal din_signal: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   constant delay: time:= 7 ns;
   constant tper: time:= 10 ns;
          
   -- Señales a observar
   signal dout_signal: STD_LOGIC_VECTOR (7 downto 0);
   
begin
   
   -- Unit Under Test port map
   UUT: regs port map (
               clk => clk_signal,
               rst => rst_signal,
               we => we_signal,
               rd => rd_signal,
               rs => rs_signal,
               din => din_signal,
               dout => dout_signal);

-- TestBench
--proceso de clock
Pclk: process 
   begin
      clk_signal <= '0';
      wait for tper/2;
      clk_signal <= '1';
      wait for tper/2;
   end process;
   
--proceso de reset del registro
--PRst: process 
--  begin
--      rst_signal <= '1'; 
--      wait for delay;
--      rst_signal <= '0';
--      wait for 100*delay;
--      rst_signal <= '1';
--      wait for 10*delay;
--      rst_signal <= '0';        
--      wait;
--   end process; 

process
  begin
    
    -- Test reset reg
    --seteo un valor en r3
    we_signal<='1';
    din_signal<="10101010";
    rd_signal <="0011";
    rs_signal <="0011";
    rst_signal <='0';
    WAIT FOR 100 ns;
    we_signal<='0';
    din_signal<="00000000";
    rd_signal <="0011";
    rs_signal <="0011";
    rst_signal <='0';
    WAIT FOR 100 ns;
    if (dout_signal = "10101010") then 
      report "Valor a resetear guardado exitosamente en 3r" severity note;
	  else
		  assert false report "Error guardando valor a resetear en r3" severity error;
	  end if;
    rst_signal <= '1';
    wait for 100 ns;
    if (dout_signal = "00000000") then 
      report "Reset exitoso" severity note;
	  else
		  assert false report "Error en reset" severity error;
	  end if;
     
    -- Test 1 reg
    we_signal<='1';
    din_signal<="11111111";
    rd_signal <="0000";
    rs_signal <="0000";
    rst_signal<='0';
    WAIT FOR 100 ns;
    if (dout_signal = "11111111") then 
      report "Valor 1 almacenado exitosamente" severity note;
	  else
		  assert false report "Error guardando valor en registro" severity error;
	  end if;
	  
	  -- Vuelvo a leer r3 para asegurarme que sea x00
    we_signal<='0';
    din_signal<="00000000";
    rd_signal <="0000";
    rs_signal <="0011";
    rst_signal<='0';
    WAIT FOR 100 ns;
    if (dout_signal = "00000000") then 
      report "Valor en r3 reseteado exitosamente" severity note;
	  else
		  assert false report "Error en lectura de r3" severity error;
	  end if;

end process;

end tp_final; 
