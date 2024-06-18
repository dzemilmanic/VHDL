----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:38:41 06/18/2024 
-- Design Name: 
-- Module Name:    dec2x4 - Behavioral 
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

entity dec2x4 is
PORT(
 iX: IN std_logic_vector (1 DOWNTO 0);
 iEN: IN std_logic;
 oY: OUT std_logic_vector (3 DOWNTO 0) );
end dec2x4;

architecture Behavioral of dec2x4 is
	begin
	PROCESS (iX, iEN) BEGIN 
	IF (iEN = '1') THEN
	CASE iX IS
	WHEN "00" => oY <= "0001";
	WHEN "01" => oY <= "0010";
	WHEN "10" => oY <= "0100";
	WHEN "11" => oY <= "1000";
	WHEN OTHERS => oY <= "0000";
	END CASE;
	ELSE
	oY <= "0000";
	END IF;
	END PROCESS;

end Behavioral;

