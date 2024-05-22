----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:15:21 05/21/2024 
-- Design Name: 
-- Module Name:    registar8bit - Behavioral 
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

entity registar8bit is
Port(
	CLK : in std_logic;
	iLOAD : in std_logic;
	aData : in std_logic_vector(7 downto 0);
	iSL : in std_logic;
	iSR : in std_logic;
	AR : in std_logic;
	iOUT : out std_logic_vector(7 downto 0)
);
end registar8bit;

architecture Behavioral of registar8bit is
    signal regis : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	 signal slow_clk : std_logic;
	
	component clock_divider is
	Port(
		CLK_in : in std_logic;
		CLK_out : out std_logic
	);
	end component;
begin
process(CLK)
	begin
	if(rising_edge(slow_clk)) then
		if iLOAD = '1' then
			regis <= aData;
		 
		else if iSL = '1' and iSR = '1' then 
			null;
			elsif iSL = '1' then
			if AR = '1' then
			regis <= regis (6 downto 0) & regis(7);
			else
			regis <= regis(6 downto 0) & '0';
			end if;
		elsif iSR = '1' then
			if AR = '1' then
			regis <= regis(0) & regis(7 downto 1);
			else
			regis <= '0' & regis(7 downto 1);
			end if;
		end if;
	end if;
	end if;
	
end process;
iOUT <= regis;

clk_div : clock_divider port map (CLK_in => CLK, CLK_out => slow_clk);

end Behavioral;