LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity adder32 is
  port (
    Input1, Input2: in std_logic_vector(31 downto 0);
    Output: out std_logic_vector(31 downto 0));
end adder32;

architecture dataflow of adder32 is
begin
  Output <= Input1 + Input2;
end dataflow;
