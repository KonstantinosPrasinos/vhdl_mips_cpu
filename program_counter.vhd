library ieee;
use ieee.std_logic_1164.all;

entity program_counter is
  port(
    Input: in std_logic_vector(31 downto 0);
    Clk, Reset: in std_logic;
    Output: out std_logic_vector(31 downto 0));
end program_counter;

architecture behavioral of program_counter is
  signal address: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
begin
  process(Clk, Reset) begin
    if Reset = '1' then
      address <= "00000000000000000000000000000000";
    elsif rising_edge(Clk) then
      address <= Input;
    end if;
    
    
  end process;
  Output <= address;
end behavioral;