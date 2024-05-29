----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:10:41 05/28/2024 
-- Design Name: 
-- Module Name:    stoperica - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stoperica is
Port(
	Start : in std_logic;
	Stop : in std_logic;
	Cont : in std_logic;
	Izlaz : out std_logic_vector(7 downto 0);
	CLK : in std_logic;
	Reset : in std_logic
);
end stoperica;

architecture Behavioral of stoperica is
   signal counter : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
	signal slow_clk : std_logic;
	
	component clock_divider is
	Port(
		CLK_in : in std_logic;
		CLK_out : out std_logic
	);
	end component;
	
begin
	process(CLK, Reset)
	begin
		if Reset = '1' then
			counter <= (others => '0');
			elsif rising_edge(slow_clk) then
			if Start = '1' then
			counter <= (others => '0');
				elsif Stop = '1' then
				elsif Cont = '1' then 
					counter <= counter + 1;
				end if;
			end if;
	end process;
	
	Izlaz <= counter;
	clk_div : clock_divider port map (CLK_in => CLK, CLK_out => slow_clk);

end Behavioral;