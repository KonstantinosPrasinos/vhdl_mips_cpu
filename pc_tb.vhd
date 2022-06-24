library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity test_pc is 
end test_pc;

architecture test_1 of test_pc is
  signal Output1, Input1: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
  signal clk1: std_logic;
  component program_counter port(
    Input: in std_logic_vector(31 downto 0);
    clk: in std_logic;
    Output: out std_logic_vector(31 downto 0));
  end component;
begin
  M1: program_counter port map(Input => Input1, clk => clk1, Output => Output1);
  Roloi: process begin
  Input1 <= Input1 + 4;
    clk1 <= '1';
    wait for 5ns;
    clk1 <= '0';
    wait for 5ns;
  end process Roloi;
  --Input1 <= "00000000000000000000000000000000";
end test_1;
