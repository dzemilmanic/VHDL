----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:29:40 05/30/2024 
-- Design Name: 
-- Module Name:    ArithStruct - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ArithStruct is
port(
	inR1, inR2, inAdderOp: in std_logic_vector(2 downto 0);
	SHL_EN, CLK: in std_logic;
	RESULT: out std_logic_vector(2 downto 0)
);
end ArithStruct;

architecture Behavioral of ArithStruct is

signal r1Out, r2Out, adderOut, shlOut: std_logic_vector(2 downto 0);
signal cmpIn: std_logic_vector(2 downto 0) := "100";
signal slow_clk: std_logic;

component TwoBitAdder is
    Port (
        A : in STD_LOGIC_VECTOR (2 downto 0);
        B : in STD_LOGIC_VECTOR (2 downto 0);
        Sum : out STD_LOGIC_VECTOR (2 downto 0);
        Carry : out STD_LOGIC
    );
end component;

component Comparator2bit is
    Port (
        A : in  STD_LOGIC_VECTOR (2 downto 0);
        B : in  STD_LOGIC_VECTOR (2 downto 0);
        A_greater_B : out STD_LOGIC;
        A_equal_B   : out STD_LOGIC;
        A_less_B    : out STD_LOGIC
    );
end component;

component Reg is
port(
	R_IN: in std_logic_vector(2 downto 0);
	CLK: in std_logic;
	R_OUT: out std_logic_vector(2 downto 0)
);
end component;

component LeftShifter2bit is
    Port (
		  EN: in std_logic;
        A : in  STD_LOGIC_VECTOR (2 downto 0);
        Y : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

component clock_divider is
port(
	CLK_IN: in std_logic;
	CLK_OUT: out std_logic
);
end component;

begin
	clk_divider: clock_divider port map(CLK_IN => CLK, CLK_OUT => slow_clk);
	reg1: Reg port map(R_IN => inR1, CLK => slow_clk, R_OUT => r1Out);
	reg2: Reg port map(R_IN => inR2, CLK => slow_clk, R_OUT => r2Out);
	adder: TwoBitAdder port map (A => r1Out, B => r2Out, Sum => adderOut);
	SHL1: LeftShifter2bit port map (EN => SHL_EN, A => adderOut, Y => shlOut);
	Cmp1: Comparator2bit port map (A => shlOut, B => cmpIn, A_greater_B => RESULT(2), A_equal_B => RESULT(1), A_less_B => RESULT(0));


end Behavioral;

