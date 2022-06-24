
library ieee;
use ieee.std_logic_1164.all;

entity test_sign_extender is
end test_sign_extender;

architecture test_1 of test_sign_extender is
  signal Input1: std_logic_vector(15 downto 0);
  signal Output1: std_logic_vector(31 downto 0);
  component sign_extender port(
    Input: in std_logic_vector(15 downto 0);
    Output: out std_logic_vector(31 downto 0));
  end component;
begin
  SE: sign_extender port map(Input => Input1, Output => Output1);
  process begin
    Input1 <= "1111111111111111"; wait for 10 ns;
    Input1 <= "0000000000000000"; wait for 10 ns;
  end process;
end test_1;