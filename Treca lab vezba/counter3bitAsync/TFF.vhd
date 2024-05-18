----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:25 05/18/2024 
-- Design Name: 
-- Module Name:    TFF - Behavioral 
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

entity TFF is
port(
	T1, TR, T_CLK : in std_logic;
	T_EN, UP : in std_logic;
	Q : out std_logic
);
end TFF;

architecture Behavioral of TFF is
signal tmp, tmp1, tmp2: std_logic:= '0';

begin
	process(T_CLK, TR, T_EN)
	begin
		if(T_EN = '0') then
			tmp1 <= tmp1;
			tmp2 <= tmp2;
		else
			if(TR = '1') then
				tmp1 <= '0';
				tmp2 <= '0';
			elsif(UP = '1') then
				if(falling_edge(T_CLK)) then
					if (T1 = tmp1) then
						tmp1 <= '0';
					else 
						tmp1 <= '1';
					end if;
				end if;
			elsif(UP = '0') then
				if(rising_edge(T_CLK)) then
					if (T1 = tmp2) then
						tmp2 <= '0';
					else 
						tmp2 <= '1';
					end if;
				end if;
			end if;
		end if;
		if(UP = '1') then
			tmp <= tmp1;
		else
			tmp <= tmp2;
		end if;
	end process;
	Q <= tmp;

end Behavioral;

