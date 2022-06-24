library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity test_alu is 
end test_alu;

architecture test_1 of test_alu is
  signal Input11, Input21, ALUResult1: std_logic_vector(31 downto 0);
  signal CtrlMessage1: std_logic_vector(3 downto 0);
  signal Zero1: std_logic;
  component alu port( 
    Input1, Input2 : in std_logic_vector(31 downto 0); 
    CtrlMessage : in std_logic_vector(3 downto 0); 
    ALUResult: out std_logic_vector(31 downto 0); 
    Zero: out std_logic); 
  end component;
begin
  A1: alu port map(Input1 => Input11, Input2 => Input21, CtrlMessage => CtrlMessage1, ALUResult => AluResult1, Zero => Zero1);
  process begin
    Input11 <= "00000000000000000000000000000100";
    Input21 <= "00000000000000000000000000000001";
    CtrlMessage1 <= "0010"; wait for 5 ns;
    CtrlMessage1 <= "0110"; wait for 5 ns;
  end process;
end test_1;