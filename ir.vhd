library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;


entity ir is
   port (
         clk, rst: in std_logic;
         input: in std_logic_vector(15 downto 0);
         output: out std_logic_vector(15 downto 0)
   );
end ir;

architecture beh_proc of ir is 

  begin 

    pir: process (clk, rst)
    begin
         if rst='1' then
            output <= x"0000";
         elsif (clk'event and clk='1') then
            output <= input;
         end if;   
    end process;
  
end beh_proc;