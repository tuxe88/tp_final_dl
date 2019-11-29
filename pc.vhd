library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pc is
	port (clk, rst : in std_logic;
	       o : out std_logic_vector(6 downto 0));
end pc;

architecture beh_proc of pc is 
signal count: std_logic_vector(6 downto 0); 

begin
   pc: process (clk, rst)
   begin
      if (rst='1') then
         count <= (others => '0');
      elsif (clk'event and clk='1') then
         count <= count + 1;                
      end if;
   end process;
   o <= count;
end beh_proc;