library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_signed.all; 
entity alu is port( 
  Input1, Input2 : in std_logic_vector(31 downto 0); 
  CtrlMessage : in std_logic_vector(3 downto 0); 
  ALUResult: out std_logic_vector(31 downto 0); 
  Zero: out std_logic); 
end alu; 
architecture Behavioral of alu is
signal result: std_logic_vector(31 downto 0); 
begin
process(CtrlMessage, Input1, Input2) begin
  case CtrlMessage is
  when "0010" =>
    result <= Input1 + Input2; 
  when "0110" =>
    result <= Input1 - Input2; 
  when others => result <= Input1 + Input2; 
  end case; 
end process; 
 Zero <= '1' when ((input1 /= input2) and (CtrlMessage = "0110")) else '0'; 
 ALUResult <= result; 
end Behavioral;