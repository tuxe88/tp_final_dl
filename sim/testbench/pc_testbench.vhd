--
-- TestBench para Program Counter
--


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.std_logic_arith.ALL;

entity pc_tb is
end pc_tb;


architecture tp_final of pc_tb is 

   component pc 
      port (
            clk, rst: in std_logic;
            o: out std_logic_vector(6 downto 0));
   end component;
   
   -- Señales de estímulo
   signal clock, reset: std_logic; 
   
   -- Señales a observar
   signal o: std_logic_vector(6 downto 0);
   
   constant delay: time:= 5 ns;
   constant tper: time:= 10 ns;	
  
begin
   
   -- Unit Under Test port map
   UUT: pc port map (
               clk => clock,
               rst => reset,
               o => o);

   -- TestBench
   
   Pclk: process 
   begin
      clock <= '0';
      wait for tper/2;
      clock <= '1';
      wait for tper/2;
   end process;       
   
   PRst: process 
   begin
      reset <= '0';
      wait for 10*delay;
      reset <= '1';
      wait for 10*delay;
      reset <= '0';        
      wait;
   end process; 

end tp_final; 
