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
   
   -- Señales de estímulo
   signal clk_signal, rst_signal, we_signal: STD_LOGIC;
   signal rd_signal, rs_signal: STD_LOGIC_VECTOR (3 downto 0);
   signal din_signal: STD_LOGIC_VECTOR (7 downto 0);
          
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
process
  begin
  
  --falta implementar

end process;

end tp_final; 
