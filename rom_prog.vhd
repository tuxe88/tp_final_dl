----------------------------------------------------------------------------------
-- TP Final diseno logico
-- Nombre del componente: ROM (Read Only Memory)
-- Descripcion del componente: TODO
-- Alumnos: Ivan Szysz, Valentin Tourrilhes
-- Profesores Martín Vázquez, Lucas Leiva
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rom_prog is
	Port (addr : in  STD_LOGIC_VECTOR (6 downto 0);
        output : out  STD_LOGIC_VECTOR (15 downto 0));
end rom_prog;

architecture Behavioral of rom_prog is

type rom is array (0 to 127) of std_logic_vector (15 downto 0);

constant memoria: rom:=(
		X"0130",
		X"0404",
		X"1043",
		X"1154",
		X"1364",
		X"1270",
		X"03E4",
		X"0203",
		X"0204",
		X"0205",
		X"0206",
		X"0207",
		X"0208",
		X"020D",
		X"020E",
		others => X"0000");

begin

		output <= memoria(conv_integer(addr));
		
end Behavioral;