----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:18 05/18/2024 
-- Design Name: 
-- Module Name:    counter3bitAsync - Behavioral 
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

entity counter3bitAsync is
port(
	T, CLK, R, C_EN, C_UP: in std_logic;
	C_OUT: out std_logic_vector(2 downto 0)
);
end counter3bitAsync;

architecture Behavioral of counter3bitAsync is

signal slow_clk: std_logic;
signal clk1, clk2: std_logic;

component TFF is
port(
	T1, TR, T_CLK : in std_logic;
	T_EN, UP : in std_logic;
	Q : out std_logic
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
t1 : TFF port map(T1 => T, T_CLK => slow_clk,  TR => R, UP => C_UP, T_EN => C_EN, Q => clk1);
t2 : TFF port map(T1 => T, T_CLK => clk1, TR => R, UP => C_UP, T_EN => C_EN, Q => clk2);
t3 : TFF port map(T1 => T, T_CLK => clk2, TR => R, UP => C_UP, T_EN => C_EN, Q => C_OUT(2));

C_OUT(0) <= clk1;
C_OUT(1) <= clk2;

end Behavioral;

