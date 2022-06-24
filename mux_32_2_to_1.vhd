LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity mux_32_2_to_1 is
  port (
    Input0, Input1: in std_logic_vector(31 downto 0);
    Choice: in std_logic;
    Output: out std_logic_vector(31 downto 0));
end mux_32_2_to_1;

architecture behavioral of mux_32_2_to_1 is
begin
 Output <= Input1 when Choice='1' else Input0;
end behavioral;