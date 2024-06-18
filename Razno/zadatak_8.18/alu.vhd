----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:07 06/18/2024 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
USE ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
PORT(
	iA, iB: IN std_logic_vector(3 DOWNTO 0);
	iSEL: IN std_logic_vector(1 DOWNTO 0);
	oH: OUT std_logic_vector(3 DOWNTO 0);
	oC: OUT std_logic ); 
end alu;

architecture Behavioral of alu is
-- rezultat operacije
 -- prosiren za jedan bit gde ce se smestiti
 -- izracunati izlazni prenos
	SIGNAL sF: unsigned(4 DOWNTO 0);
	BEGIN
	PROCESS(iSEL, iA, iB)
 -- operandi koji su prosireni za jedan bit zbog racunanja izlaznog prenosa
	VARIABLE vA, vB: unsigned(4 DOWNTO 0);
	BEGIN
	vA := unsigned('0' & iA); -- operand A prosiren za jedan bit
	vB := unsigned('0' & iB); -- operand B prosiren za jedan bit

	CASE iSEL(1 DOWNTO 0) IS
	WHEN "00" => sF <= vA + vB;
	WHEN "01" => sF <= vA + (('0' & NOT(vB(3 DOWNTO 0)))) + 1;
	WHEN "10" => sF <= ('0' & (vA(3 DOWNTO 0) XNOR vB(3 DOWNTO 0)));
	WHEN OTHERS => sF <= "00000";
	END CASE;
	END PROCESS;
 	oH <= std_logic_vector(sF(3 DOWNTO 0));
	oC <= std_logic(sF(4)); 
end Behavioral;

