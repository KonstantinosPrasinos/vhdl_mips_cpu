library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity test_control_unit is 
end test_control_unit;

architecture test_1 of test_control_unit is
  signal OpCode1: std_logic_vector(5 downto 0);
  signal ALUOp1: std_logic_vector(1 downto 0);
  signal RegDst1, Branch1, MemRead1, MemtoReg1, MemWrite1, ALUSrc1, RegWrite1: std_logic;
  component control_unit port (
    OpCode: in std_logic_vector(5 downto 0);
    RegDst: out std_logic;
    Branch: out std_logic;
    MemRead: out std_logic;
    MemtoReg: out std_logic;
    ALUOp: out std_logic_vector(1 downto 0);
    MemWrite: out std_logic;
    ALUSrc: out std_logic;
    RegWrite: out std_logic);
  end component;
begin
  CU1: control_unit port map(OpCode => OpCode1, RegDst => RegDst1, Branch => Branch1, MemRead => MemRead1, MemtoReg => MemtoReg1, ALUOp => ALUOp1, MemWrite => MemWrite1, ALUSrc => ALUSrc1, RegWrite => RegWrite1);
  process begin
    OpCode1 <= "001000"; wait for 5 ns;
    OpCode1 <= "000000"; wait for 5 ns;
    OpCode1 <= "101011"; wait for 5 ns;
    OpCode1 <= "000101"; wait for 5 ns;
  end process;
end test_1;

