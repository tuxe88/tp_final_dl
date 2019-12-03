--
-- TestBench para Program Counter
--


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.std_logic_arith.ALL;

entity rom_prog_tb is
end rom_prog_tb;


architecture tp_final of rom_prog_tb is 

   component rom_prog 
      port (
            addr : in  STD_LOGIC_VECTOR (6 downto 0);
            output : out  STD_LOGIC_VECTOR (15 downto 0));
   end component;
   
   -- Señales de estímulo
   signal addr_signal: STD_LOGIC_VECTOR (6 downto 0); 
   
   -- Señales a observar
   signal output_signal: STD_LOGIC_VECTOR (15 downto 0);
   
begin
   
   -- Unit Under Test port map
   UUT: rom_prog port map (
               addr => addr_signal,
               output => output_signal);

   -- TestBench
   
process
  begin
      -- direccion 1
      WAIT FOR 10 ns;
      addr_signal<="0000000";
      WAIT FOR 10 ns;

      if (output_signal = X"0130") then
         report "Direccion 1 en ROM exitosa"
         severity note;
      else
         assert false report "Error leyendo ROM" 
         severity error;
      end if;

      -- direccion 2
      WAIT FOR 10 ns;
      addr_signal<="0000001";
      WAIT FOR 10 ns;

      if (output_signal = X"0404") then
         report "Direccion 2 en ROM exitosa"
         severity note;
      else
         assert false report "Error leyendo ROM" 
         severity error;
      end if;

      -- direccion 3
      WAIT FOR 10 ns;
      addr_signal<="0000010";
      WAIT FOR 10 ns;

      if (output_signal = X"1043") then
         report "Direccion 3 en ROM exitosa"
         severity note;
      else
         assert false report "Error leyendo ROM" 
         severity error;
      end if;

end process;

end tp_final; 
