library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity test_alu_control_unit is 
end test_alu_control_unit;

architecture test_1 of test_alu_control_unit is
  signal Funct1: std_logic_vector(5 downto 0);
  signal Output1: std_logic_vector(3 downto 0);
  signal ALUOp1: std_logic_vector(1 downto 0);
  component alu_controller port (
    ALUOp: in std_logic_vector(1 downto 0);
    Funct: in std_logic_vector(5 downto 0);
    Output: out std_logic_vector(3 downto 0));
  end component;
begin
  ACU1: alu_controller port map(ALUOp => ALUOp1, Funct => Funct1, Output => Output1);
  process begin
    ALUOp1 <= "10";
    Funct1 <= "100000"; wait for 5 ns;
    Funct1 <= "100010"; wait for 5 ns;
    ALUOp1 <= "00"; wait for 5 ns;
    ALUOp1 <= "01"; wait for 5 ns;
  end process;
end test_1;


