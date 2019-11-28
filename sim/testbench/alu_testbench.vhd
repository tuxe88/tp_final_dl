-- Testbench de ALU

LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ALU_TB IS 
-- empty
END ENTITY;

ARCHITECTURE BEV OF ALU_TB IS

	-- DUT component
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
    -- pedir operaciones a la ALU
    WAIT FOR 100 ns;
    a<="00000000";
    b<="00000001";
	  op<="010";
    WAIT FOR 100 ns;
    
    ASSERT s="00000001" REPORT "Exito en suma.";
  END PROCESS;

END BEV;

