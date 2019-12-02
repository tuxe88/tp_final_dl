library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Arith.ALL;
use IEEE.STD_LOGIC_Unsigned.ALL;

entity DECODE is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           out_we : out STD_LOGIC;
           reg_we : out STD_LOGIC;
           alu_op : out STD_LOGIC_VECTOR (2 downto 0);
           reg_a_we : out STD_LOGIC;
           bus_sel : out STD_LOGIC_VECTOR (1 downto 0));
end DECODE;

architecture Behavioral of DECODE is

begin

process(input)
begin
    case input is
      --IN--
      when X"01" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "000";
                    reg_a_we <= '0';
                    bus_sel <= "10";
      --OUT--
      when X"02" =>
                    out_we <= '1';
                    reg_we <= '0';
                    alu_op <= "000";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --MOV--
      when X"03" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "000";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --LDA--
      when X"04" =>
                    out_we <= '0';
                    reg_we <= '0';
                    alu_op <= "000";
                    reg_a_we <= '1';
                    bus_sel <= "00";
      --LDI--
      when X"05" =>
                    out_we <= '0';
                    reg_we <= '0';
                    alu_op <= "000";
                    reg_a_we <= '1';
                    bus_sel <= "01";
      --ADD--              
      when X"10" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "010";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --SUB--
      when X"11" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "011";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --AND--
      when X"12" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "100";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --OR--
      when X"13" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "101";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --XOR--
      when X"14" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "110";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --SHL--
      when X"20" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "001";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --SHR--
      when X"21" =>
                    out_we <= '0';
                    reg_we <= '1';
                    alu_op <= "111";
                    reg_a_we <= '0';
                    bus_sel <= "00";
      --OTROS VALORES--
      when others => 
                    out_we <= '0';
                    reg_we <= '0';
                    alu_op <= "000";
                    reg_a_we <= '0';
                    bus_sel <= "00";   
    end case;  
       
end process;
end Behavioral;