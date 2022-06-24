library ieee;
use ieee.std_logic_1164.all;

entity sign_extender is
  port(
    Input: in std_logic_vector(15 downto 0);
    Output: out std_logic_vector(31 downto 0));
end sign_extender;

architecture behavioral of sign_extender is
begin
  Output <= "0000000000000000" & Input(15 downto 0) when Input(15) = '0' else
            "1111111111111111" & Input(15 downto 0);
end behavioral;