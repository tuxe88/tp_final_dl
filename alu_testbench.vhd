----------------------------------------------------------------------------------
-- TP Final diseno logico
-- Testbench de componente: ALU
-- Descripcion del testbench: TODO
-- Alumnos: Ivan Szysz, Valentin Tourrilhes
-- Profesores Martín Vázquez, Lucas Leiva
----------------------------------------------------------------------------------

LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ALU_TB IS 
-- empty
END ENTITY;

ARCHITECTURE TEST_ALU OF ALU_TB IS

	COMPONENT ALU IS
		  PORT(a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		       b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		       op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		       s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		       );
	END COMPONENT;

	SIGNAL a : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
	SIGNAL b : STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
	SIGNAL op :STD_LOGIC_VECTOR(2 DOWNTO 0):="000";
	SIGNAL s : STD_LOGIC_VECTOR(7 DOWNTO 0);

	BEGIN

  -- Connect DUT
  UUT: ALU PORT MAP(a, b, op, s);

  PROCESS
  BEGIN
    -- Suma 1 en ALU
    WAIT FOR 100 ns;
    a<="00000000";
    b<="00000001";
	  op<="010";
    WAIT FOR 100 ns;

    if (s = "00000001") then
		report "Suma 1 en ALU exitosa"
    	severity note;
	else
		assert false report "Error en suma 1 de ALU" 
		severity error;
	end if;

	-- Suma 2 en ALU
    WAIT FOR 100 ns;
    a<="00000001";
    b<="00000001";
	  op<="010";
    WAIT FOR 100 ns;

    if (s = "00000010") then
		report "Suma 2 en ALU exitosa"
    	severity note;
	else
		assert false report "Error en suma 2 de ALU" 
		severity error;
	end if;

	-- Suma 3 en ALU
    WAIT FOR 100 ns;
    a<="11111111";
    b<="11111111";
	  op<="010";
    WAIT FOR 100 ns;

    if (s = "11111110") then
		report "Suma 3 en ALU exitosa"
    	severity note;
	else
		assert false report "Error en suma 3 de ALU" 
		severity error;
	end if;

	-- Resta 1 en en ALU
    WAIT FOR 100 ns;
    a<="00000000";
    b<="00000000";
	  op<="011"; WAIT FOR 100 ns;

    if (s = "00000000") then
		report "Resta 1 en ALU exitosa"
    	severity note;
	else
		assert false report "Error en resta 1 de ALU" 
		severity error;
	end if;

	-- Resta 2 en en ALU
    WAIT FOR 100 ns;
    a<="10100111";
    b<="10010111";
	  op<="011"; WAIT FOR 100 ns;

    if (s = "00010000") then
		report "Resta 2 en ALU exitosa"
    	severity note;
	else
		assert false report "Error en resta 2 de ALU" 
		severity error;
	end if;


	-- SHL 1 en en ALU
    WAIT FOR 100 ns;
    a<="00000000";
    b<="00000000";
	  op<="001"; WAIT FOR 100 ns;

    if (s = "11111110") then
		report "SHL 1 en ALU exitoso"
    	severity note;
	else
		assert false report "Error en SHL 1 de ALU" 
		severity error;
	end if;

	-- SHR 1 en en ALU
    WAIT FOR 100 ns;
    a<="00000000";
    b<="00000000";
	  op<="111"; WAIT FOR 100 ns;

    if (s = "11111110") then
		report "SHR 1 en ALU exitoso"
    	severity note;
	else
		assert false report "Error en SHR 1 de ALU" 
		severity error;
	end if;

	-- AND 1 en en ALU
    WAIT FOR 100 ns;
    a<="10101010";
    b<="01010101";
	  op<="100"; WAIT FOR 100 ns;

    if (s = "00000000") then
		report "AND 1 en ALU exitosa"
    	severity note;
	else
		assert false report "Error en AND 1 de ALU" 
		severity error;
	end if;

	-- OR 1 en en ALU
    WAIT FOR 100 ns;
    a<="10101010";
    b<="01010101";
	  op<="101"; WAIT FOR 100 ns;

    if (s = "11111111") then
		report "OR 1 en ALU exitosa"
    	severity note;
	else
		assert false report "Error en OR 1 de ALU" 
		severity error;
	end if;

	-- XOR 1 en en ALU
    WAIT FOR 110 ns;
    a<="10101010";
    b<="01010101";
	  op<="101"; WAIT FOR 100 ns;

    if (s = "11111111") then
		report "XOR 1 en ALU exitosa"
    	severity note;
	else
		assert false report "Error en XOR 1 de ALU" 
		severity error;
	end if;

  END PROCESS;

END TEST_ALU;

