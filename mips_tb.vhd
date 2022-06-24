library ieee;
use ieee.std_logic_1164.all;

entity test_mips is 
end test_mips;

architecture test_1 of test_mips is
  signal clk1, reset1: std_logic;
  component mips port(
  clk: in std_logic;
  reset: in std_logic);
  end component;
begin
  M1: mips port map(clk => clk1, reset => reset1);
    
  Roloi: process begin
    clk1 <= '0';
    wait for 5 ns;
    clk1 <= '1';
    wait for 5 ns;
  end process Roloi;
  
  process begin
    reset1 <= '1';
    wait for 10 ns;
    reset1 <= '0';
    wait;
  end process;
end test_1;