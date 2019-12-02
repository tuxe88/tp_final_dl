library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Arith.ALL;
use IEEE.STD_LOGIC_Unsigned.ALL;

entity BUS_SELECTOR is
    Port (bus_sel : in STD_LOGIC_VECTOR (1 downto 0);
          in_0 : in STD_LOGIC_VECTOR (7 downto 0);
          in_1 : in STD_LOGIC_VECTOR (7 downto 0);
          in_2 : in STD_LOGIC_VECTOR (7 downto 0);
          out_0 : out STD_LOGIC_VECTOR (7 downto 0));
end BUS_SELECTOR;

architecture Behavioral of BUS_SELECTOR is

begin

process(bus_sel)
begin
    case bus_sel is
      --DESDE BANCO DE REGISTROS--
      when "00" => out_0 <= in_0;
      
      --DESDE INMEDIATO--
      when "01" => out_0 <= in_1;
      
      --DESDE INPUT--
      when "10" => out_0 <= in_2;             
      
      --OTROS VALORES--
      when others => out_0 <= x"00";   
    end case;  
       
end process;
end Behavioral;