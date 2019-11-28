library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Arith.ALL;
use IEEE.STD_LOGIC_Signed.ALL;

entity ALU is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           op : in STD_LOGIC_VECTOR (2 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process(a, b, op)
begin
    case op is
    when "000" => s <= a;
    when "001" => s <= a(6 downto 0) & "0";
    when "010" => s <= a + b;
    when "011" => s <= a - b;
    when "100" => s <= a and b;
    when "101" => s <= a or b;
    when "110" => s <= a xor b;
    when "111" => s <= "0" & a(7 downto 1);  
    when others => s <= x"00";   
    end case;  
       
end process;
end Behavioral;