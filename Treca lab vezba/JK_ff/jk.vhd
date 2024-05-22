----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:50 05/16/2024 
-- Design Name: 
-- Module Name:    jk - Behavioral 
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

entity jk is
	Port(
		J, K, CLK, RESET: in std_logic;
		Q, Q1: out std_logic
);
end jk;

architecture Behavioral of jk is
    signal Q_temp : std_logic;
begin
    process (CLK, RESET)
    begin
        if (RESET = '1') then
            Q_temp <= '0';
        elsif(rising_edge(CLK))then
		  if(J = '1' and K='1') then
				Q_temp <= not Q_temp;
		  elsif(J = '1' and K='0') then
				Q_temp <= '1';
			elsif(J = '0' and K = '1') then
				Q_temp <= '0';
			end if;
        end if;
      end process;

    Q <= Q_temp;
    Q1 <= not Q_temp;

end Behavioral;

