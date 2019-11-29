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
---/*		CARGAR CON LAS INSTRUCCIONES DEL TP
---		X"0131502a",
---		X"1140000c",
---		X"01280018",
---		X"00005812",
---		X"020b5820",
---		X"8d6b0000",
---		X"024b602a",
---		X"11800001",
---		X"000b9020",
---		X"0173602a",
---		X"11800001",
---		X"000b9820",
---		X"21290001",
---		X"0810001c",
---		X"00121020",
---		X"00131820",
---*/			
		others => X"0000");

begin

		output <= memoria(conv_integer(addr));
		
end Behavioral;