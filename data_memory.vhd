library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
entity data_memory is
  port (
    WriteData: in std_logic_vector(31 downto 0);
    Address: in std_logic_vector(5 downto 0);
    We: in std_logic;
    Re: in std_logic;
    Clk: in std_logic;
    Rst: in std_logic;
    ReadData: out std_logic_vector(31 downto 0));
end data_memory;

architecture behavioral of data_memory is
type regArray is array(0 to 15) of std_logic_vector(31 downto 0);
signal regfile : regArray;
begin
process(Clk) begin
  if rising_edge(Clk) then
  if Rst='1' then
    regfile <= (others=>(others=>'0'));
  elsif We='1' then
    regfile(to_integer(unsigned(Address))) <= WriteData; 
  end if;
  if Re='1' then
    ReadData <= regfile(to_integer(unsigned(Address)));
  end if;
  end if;
end process;
end behavioral;
