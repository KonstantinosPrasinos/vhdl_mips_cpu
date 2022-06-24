library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity mips is port(
  clk: in std_logic;
  reset: in std_logic);
end mips;

architecture behavioral of mips is
  signal pcOutput, adder1Output, mux321Output, instruction, writeData, readData1, readData2: std_logic_vector(31 downto 0);
  signal signExtenderOutput, adder2Output, mux322Output, memoryReadData, aluResult: std_logic_vector(31 downto 0);
  signal signExtenderInput: std_logic_vector(15 downto 0);
  signal dataMemoryAddress, opCode, funct: std_logic_vector(5 downto 0);
  signal rs, rt, rd, mux5Output: std_logic_vector(4 downto 0);
  signal aluControlSignal: std_logic_vector(3 downto 0);
  signal aluOp: std_logic_vector(1 downto 0);
  signal regDst, branch, memRead, memtoReg, memWrite, aluSrc, regWrite, mux321Choice, aluZero: std_logic;
  
  component program_counter port(
    Input: in std_logic_vector(31 downto 0);
    Clk, Reset: in std_logic;
    Output: out std_logic_vector(31 downto 0));
  end component;
  component adder32 port (
    Input1, Input2: in std_logic_vector(31 downto 0);
    Output: out std_logic_vector(31 downto 0));
  end component;
  component mux_32_2_to_1 port (
    Input0, Input1: in std_logic_vector(31 downto 0);
    Choice: in std_logic;
    Output: out std_logic_vector(31 downto 0));
  end component;
  component instruction_memory port (
    Address : in std_logic_vector(31 downto 0);
    ReadData : out std_logic_vector(31 downto 0));
  end component;
  component control_unit port (
    OpCode: in std_logic_vector(5 downto 0);
    RegDst: out std_logic;
    Branch: out std_logic;
    MemRead: out std_logic;
    MemtoReg: out std_logic;
    ALUOp: out std_logic_vector(1 downto 0);
    MemWrite: out std_logic;
    ALUSrc: out std_logic;
    RegWrite: out std_logic);
  end component;
  component regfile port (
    WriteData : in std_logic_vector(31 downto 0);
    ReadAddr1: in std_logic_vector(4 downto 0);
    ReadAddr2: in std_logic_vector(4 downto 0);
    WriteAddr: in std_logic_vector(4 downto 0);
    We : in std_logic;
    Clk : in std_logic;
    Rst : in std_logic;
    ReadData1 : out std_logic_vector(31 downto 0);
    ReadData2 : out std_logic_vector(31 downto 0));
  end component;
  component mux_5_2_to_1 port (
    Input0, Input1: in std_logic_vector(4 downto 0);
    Choice: in std_logic;
    Output: out std_logic_vector(4 downto 0));
  end component;
  component sign_extender port(
    Input: in std_logic_vector(15 downto 0);
    Output: out std_logic_vector(31 downto 0));
  end component;
  component alu_controller port (
    ALUOp: in std_logic_vector(1 downto 0);
    Funct: in std_logic_vector(5 downto 0);
    Output: out std_logic_vector(3 downto 0));
  end component;
  component alu port( 
    Input1, Input2 : in std_logic_vector(31 downto 0); 
    CtrlMessage : in std_logic_vector(3 downto 0); 
    ALUResult: out std_logic_vector(31 downto 0); 
    Zero: out std_logic);
  end component;
  component data_memory port (
    WriteData: in std_logic_vector(31 downto 0);
    Address: in std_logic_vector(5 downto 0);
    We: in std_logic;
    Re: in std_logic;
    Clk: in std_logic;
    Rst: in std_logic;
    ReadData: out std_logic_vector(31 downto 0));
  end component;
begin
  opCode <= instruction(31 downto 26);
  rs <= instruction(25 downto 21);
  rt <= instruction(20 downto 16);
  rd <= instruction(15 downto 11);
  signExtenderInput <= instruction(15 downto 0);
  funct <= instruction(5 downto 0);
  mux321Choice <= aluZero and branch;
  dataMemoryAddress <= aluResult(5 downto 0);
  
  PC: program_counter port map(Input => mux321Output, Clk => clk, Reset => reset, Output => pcOutput);
  A1: adder32 port map(Input1 => pcOutput, Input2 => "00000000000000000000000000000001", Output => adder1Output);
  MUX1: mux_32_2_to_1 port map(Input0 => adder1Output, Input1 => adder2Output, Choice => mux321Choice, Output => mux321Output);
  
  IM1: instruction_memory port map(Address => pcOutput, ReadData => instruction);
  CU1: control_unit port map(OpCode => opCode, RegDst => regDst, Branch => branch, MemRead => memRead, MemtoReg => memtoReg, ALUOp => aluOp, MemWrite => memWrite, ALUSrc => aluSrc, RegWrite => regWrite);
  
  MUX2: mux_5_2_to_1 port map(Input0 => rt, Input1 => rd, Choice => regDst, Output => mux5Output);
  RF1: regfile port map(WriteData => writeData, ReadAddr1 => rs, ReadAddr2 => rt, WriteAddr => mux5Output, We => regWrite, Clk => clk, Rst => reset, ReadData1 => readData1, ReadData2 => readData2);
  
  SE1: sign_extender port map(Input => signExtenderInput, Output => signExtenderOutput);
  A2: adder32 port map(Input1 => adder1Output, Input2 => signExtenderOutput, Output => adder2Output);
  
  MUX3: mux_32_2_to_1 port map(Input0 => readData2, Input1 => signExtenderOutput, Choice => aluSrc, Output => mux322Output);
  ALUC1: alu_controller port map(AlUOp => aluOp, Funct => funct, Output => aluControlSignal);
  ALU1: alu port map(Input1 => readData1, Input2 => mux322Output, CtrlMessage => aluControlSignal, ALUResult => aluResult, Zero => aluZero);
  
  DM1: data_memory port map(WriteData => ReadData2, Address => dataMemoryAddress, We => memWrite, Re => memRead, Clk => clk, Rst => reset, ReadData => memoryReadData);
  MUX4: mux_32_2_to_1 port map(Input0 => aluResult, Input1 => memoryReadData, Choice => memtoReg, Output => writeData);
end behavioral;