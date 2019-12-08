----------------------------------------------------------------------------------
-- TP Final diseno logico
-- Nombre del componente: Registro generico de 8 bits (Para RegA y RegOut)
-- Descripcion del componente: TODO
-- Alumnos: Ivan Szysz, Valentin Tourrilhes
-- Profesores Martín Vázquez, Lucas Leiva
----------------------------------------------------------------------------------

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_8b is

    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           we : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0));

end reg_8b;



architecture reg_8b_arq of reg_8b is

  signal reg: STD_LOGIC_VECTOR(7 downto 0);
  
  begin 

    process (clk,rst)
    begin
      --si el reset es 1, seteo 0 en todos los bits
      if rst= '1' then
          reg <= (others => '0');
      --si el clock es 1 y  write enable 1 guardo el in en el registro
      elsif (clk'event and clk = '1') then
        if (we = '1') then
          reg <= din;
        end if;
      end if; 
    end process; 

  dout <= reg; 

end reg_8b_arq;



