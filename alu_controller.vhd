library ieee;
use ieee.std_logic_1164.all;

entity alu_controller is
  port (
    ALUOp: in std_logic_vector(1 downto 0);
    Funct: in std_logic_vector(5 downto 0);
    Output: out std_logic_vector(3 downto 0));
end alu_controller;

architecture behavioral of alu_controller is 
begin
  process(ALUOp, Funct)
  begin
    case ALUOp is
      when "10" =>
        
        --Register
        case Funct is
        when "100000" =>
          --Add
          Output <= "0010";
        when "100010" =>
          --Sub
          Output <= "0110";
        when others => Output <= "0010";
        end case;
        
      when "00" =>
        --Lw, Sw (, Addi ?)
        Output <= "0010";
      when "01" =>
        --Bne ?
        Output <= "0110";
      when others => Output <= "0000";
    end case;
  end process;
end behavioral;