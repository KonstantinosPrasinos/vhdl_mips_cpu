library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
  port (
    OpCode: in std_logic_vector(5 downto 0);
    RegDst: out std_logic;
    Branch: out std_logic;
    MemRead: out std_logic;
    MemtoReg: out std_logic;
    ALUOp: out std_logic_vector(1 downto 0);
    MemWrite: out std_logic;
    ALUSrc: out std_logic;
    RegWrite: out std_logic);
end control_unit;

architecture behavioral of control_unit is
  --000000 is Register, 100011 is lw, 101011 is sw, 000101 is bne, 001000 is addi
begin
  with OpCode select RegDst <= '1' when "000000", '1' when "100011", '0' when "101011", '0' when "000101", '0' when "001000", '0' when others;
  with OpCode select ALUSrc <= '0' when "000000", '1' when "100011", '1' when "101011", '0' when "000101", '1' when "001000", '1' when others;
  with OpCode select MemtoReg <= '0' when "000000", '1' when "100011", '0' when "101011", '0' when "000101", '0' when "001000", '0' when others;
  with OpCode select RegWrite <= '1' when "000000", '1' when "100011", '0' when "101011", '0' when "000101", '1' when "001000", '1' when others;
  with OpCode select MemRead <= '0' when "000000", '1' when "100011", '0' when "101011", '0' when "000101", '0' when "001000", '0' when others;
  with OpCode select MemWrite <= '0' when "000000", '0' when "100011", '1' when "101011", '0' when "000101", '0' when "001000", '0' when others;
  with OpCode select branch <= '0' when "000000", '0' when "100011", '0' when "101011", '1' when "000101", '0' when "001000", '0' when others;
  with OpCode select ALUOp <= "10" when "000000", "00" when "100011", "00" when "101011", "01" when "000101", "00" when "001000", "00" when others;
end behavioral;