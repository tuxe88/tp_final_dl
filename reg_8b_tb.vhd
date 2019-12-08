----------------------------------------------------------------------------------
-- TP Final diseno logico
-- Testbench de componente: Registro generico de 8 bits
-- Descripcion del testbench: TODO
-- Alumnos: Ivan Szysz, Valentin Tourrilhes
-- Profesores Martín Vázquez, Lucas Leiva
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.std_logic_arith.ALL;

entity reg_8b_tb is
end reg_8b_tb;


architecture tp_final of reg_8b_tb is 

   component reg_8b 
      port (
            clk, rst, we: in STD_LOGIC;
            din: in STD_LOGIC_VECTOR (7 downto 0);
            dout : out  STD_LOGIC_VECTOR (7 downto 0));
   end component;
   
   -- Señales de estimulo
   signal clk_signal, rst_signal, we_signal: STD_LOGIC := '0';
   signal din_signal: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   constant delay: time:= 7 ns;
   constant tper: time:= 10 ns;
          
   -- Señales a observar
   signal dout_signal: STD_LOGIC_VECTOR (7 downto 0) := "00000000";
   
  begin
   
    -- Unit Under Test port map
    UUT: reg_8b port map (
               clk => clk_signal,
               rst => rst_signal,
               we => we_signal,
               din => din_signal,
               dout => dout_signal);

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
    
    -- Test reset reg
    --seteo un valor en el reg
    we_signal<='1';
    din_signal<="10101010";
    rst_signal <='0';
    WAIT FOR 100 ns;
    we_signal<='0';
    din_signal<="00000000";
    rst_signal <='0';
    WAIT FOR 100 ns;
    if (dout_signal = "10101010") then 
      report "Valor a resetear guardado exitosamente en reg" severity note;
	  else
		  assert false report "Error guardando valor a resetear en reg" severity error;
	  end if;
    rst_signal <= '1';
    wait for 100 ns;
    if (dout_signal = "00000000") then 
      report "Reset exitoso" severity note;
	  else
		  assert false report "Error en reset" severity error;
	  end if;
     
    -- Test 1 reg
    we_signal<='1';
    din_signal<="11111111";
    rst_signal<='0';
    WAIT FOR 100 ns;
    if (dout_signal = "11111111") then 
      report "Valor 1 almacenado exitosamente" severity note;
	  else
		  assert false report "Error guardando valor en registro" severity error;
	  end if;
	  
	  -- Vuelvo a leer el reg para asegurarme que sea 11111111
    we_signal<='0';
    din_signal<="00000000";
    rst_signal<='0';
    WAIT FOR 100 ns;
    if (dout_signal = "11111111") then 
      report "Valor en reg sigue almacenado exitosamente" severity note;
	  else
		  assert false report "Error en lectura de reg" severity error;
	  end if;

end process;

end tp_final; 

