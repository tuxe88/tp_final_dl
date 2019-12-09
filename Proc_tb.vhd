----------------------------------------------------------------------------------
-- TP Final diseno logico
-- Testbench de componente: Procesador
-- Descripcion del testbench: TODO
-- Alumnos: Ivan Szysz, Valentin Tourrilhes
-- Profesores Martín Vázquez, Lucas Leiva
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.std_logic_arith.ALL;

entity proc_tb is
end proc_tb;

architecture tp_final of proc_tb is 

   component Proc 
      port (
            clk, rst: in STD_LOGIC;
            input: in STD_LOGIC_VECTOR (7 downto 0);
            output : out STD_LOGIC_VECTOR (7 downto 0));
   end component;
   
   -- Señales de estimulo
   signal clk_signal, rst_signal: STD_LOGIC := '0';
   signal input_signal: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   constant delay: time:= 7 ns;
   constant tper: time:= 10 ns;
          
   -- Señales a observar
   signal output_signal: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   
  begin
   
    -- Unit Under Test port map
    UUT: Proc port map (
               clk => clk_signal,
               rst => rst_signal,
               input => input_signal,
               output => output_signal
               );

  -- TestBench
  --proceso de clock
  Pclk: process 
     begin
        clk_signal <= '0';
        wait for tper/2;
        clk_signal <= '1';
        wait for tper/2;
  end process;
  
process
  begin
  
  input_signal <= "00000000";
  wait on clk_signal until clk_signal = '1'; -- 1 en clock
  wait on clk_signal until clk_signal = '0'; -- caida del clock
  
end process;

end tp_final; 


