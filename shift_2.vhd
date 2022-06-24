LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity shift_2 is
  port(
    Input: in std_logic_vector(31 downto 0);
    Output: out std_logic_vector(31 downto 0));
end shift_2;

architecture behavioral of shift_2 is
begin
  Output <= Input(29 downto 0) & "00";
end behavioral;