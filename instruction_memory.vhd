library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity instruction_memory is port (
    Address : in std_logic_vector(31 downto 0);
    ReadData : out std_logic_vector(31 downto 0));
end instruction_memory;
architecture dataflow of instruction_memory is
  type regArray is array(0 to 15) of std_logic_vector(31 downto 0);
  signal regfile : regArray := (
    "00100000000000000000000000000000", --addi 0 0 0
    "00100000010000100000000000000000", --addi 2 2 0
    "00100000100000100000000000000000", --addi 2 4 0
    "00100000000000110000000000000001", --addi 3 0 1 
    "00100000000001010000000000000011", --addi 5 0 3
    "00000000011000000011000000100000", --add 6 3 0
    "10101100100001100000000000000000", --sw 6 0(4)
    "00100000011000110000000000000001", --addi $3 $3 1
    "00100000100001000000000000000001", --addi $4 $4 1
    "00100000101001011111111111111111", --addi $5 $5 -1
    "00010100000001011111111111111010", --bne $5 $0 L1 (-6)
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000",
    "00000000000000000000000000000000"
    );
begin
  ReadData <= regfile(to_integer(unsigned(Address)));
end dataflow;