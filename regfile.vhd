library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
entity regfile is
  port (
    WriteData : in std_logic_vector(31 downto 0);
    ReadAddr1: in std_logic_vector(4 downto 0);
    ReadAddr2: in std_logic_vector(4 downto 0);
    WriteAddr: in std_logic_vector(4 downto 0);
    We : in std_logic;
    Clk : in std_logic;
    Rst : in std_logic;
    ReadData1 : out std_logic_vector(31 downto 0);
    ReadData2 : out std_logic_vector(31 downto 0));
end regfile;

architecture behavioral of regfile is
type regArray is array(0 to 31) of std_logic_vector(31 downto 0);
signal regfile : regArray;
begin
process(Clk) begin
  if rising_edge(Clk) then
    if Rst='1' then
      regfile <= (others=>(others=>'0'));
    elsif We='1' then
      regfile(to_integer(unsigned(WriteAddr))) <= WriteData; 
    end if;
  end if;
  
end process;
ReadData1 <= regfile(to_integer(unsigned(ReadAddr1)));
ReadData2 <= regfile(to_integer(unsigned(ReadAddr2)));
end behavioral;