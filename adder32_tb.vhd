LIBRARY ieee ;
USE ieee.std_logic_1164.all;


entity test_adder32 is
end test_adder32;

architecture test_1 of test_adder32 is
  signal Input11, Input21, Output1: std_logic_vector(31 downto 0);
  component adder32 port (
    Input1, Input2: in std_logic_vector(31 downto 0);
    Output: out std_logic_vector(31 downto 0));
  end component;
  
  begin
    A32: adder32 port map(Input1 => Input11, Input2 => Input21, Output => Output1);
  process begin
    Input11 <= "11111111111111111111111111111101";
    Input21 <= "00000000000000000000000000001010";
    wait for 20 ns;
  end process;
end test_1;