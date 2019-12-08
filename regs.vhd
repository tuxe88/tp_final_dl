----------------------------------------------------------------------------------
-- TP Final diseno logico
-- Nombre del componente: Banco de 16 registros de 8 bits cada uno (Regs)
-- Descripcion del componente: TODO
-- Alumnos: Ivan Szysz, Valentin Tourrilhes
-- Profesores Martín Vázquez, Lucas Leiva
----------------------------------------------------------------------------------

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity regs is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           we : in  STD_LOGIC;
           rd : in  STD_LOGIC_VECTOR (3 downto 0);
           rs : in  STD_LOGIC_VECTOR (3 downto 0);
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0));

end regs;



architecture registers_table_arq of regs is

  constant reg_tam : INTEGER := 16;
  type mem is array(reg_tam-1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
  signal reg: mem;
  
begin 

  process (clk,rst)
  begin
    --si el reset es 1, recorro todos los registros y les seteo 0
    if rst= '1' then
      for i in 0 to reg_tam-1 loop
        reg(i) <= (others => '0');
      end loop;
    --si el clock es 1 y  write enable 1 guardo el in en el registro especificado por rd
    elsif (clk'event and clk = '1') then
      if (we = '1') then
        reg(conv_integer(rd)) <= din;
      end if;
    end if; 
  end process; 

dout <= reg(conv_integer(rs)); 

end registers_table_arq;


