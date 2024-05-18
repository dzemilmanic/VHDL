----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:55 05/18/2024 
-- Design Name: 
-- Module Name:    Dec2to4 - Behavioral 
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

entity Dec2to4 is
port(
	d1_in: in std_logic_vector(1 downto 0);
	en: in std_logic;
	d1_out: out std_logic_vector(3 downto 0)
);
end Dec2to4;

architecture Behavioral of Dec2to4 is
	
begin
	process(en, d1_in)
	begin
		if(en = '1') then
			case d1_in is 
				when "00" => d1_out <= "0001";
				when "01" => d1_out <= "0010";
				when "10" => d1_out <= "0100";
				when "11" => d1_out <= "1000";
				when others => d1_out <= "0000"; 
			end case;
		else
			d1_out <= "0000";
		end if;
	end process;
end Behavioral;


