----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:56 06/18/2024 
-- Design Name: 
-- Module Name:    mux4x1 - Behavioral 
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

entity mux4x1 is
PORT (
 iX0, iX1, iX2, iX3: IN std_logic_vector(3 DOWNTO 0);
 iSEL: IN std_logic_vector(1 DOWNTO 0);
 oY: OUT std_logic_vector(3 DOWNTO 0)
 ); 
end mux4x1;

architecture Behavioral of mux4x1 is
	BEGIN
	PROCESS (iX0, iX1, iX2, iX3, iSEL) 
	BEGIN
	CASE iSEL IS
		WHEN "00" => oY <= iX0;
		WHEN "01" => oY <= iX1;
		WHEN "10" => oY <= iX2;
		WHEN OTHERS => oY <= iX3;
	END CASE;
	END PROCESS; 
end Behavioral;

