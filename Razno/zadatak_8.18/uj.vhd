----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:49 06/18/2024 
-- Design Name: 
-- Module Name:    uj - Behavioral 
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

entity uj is
PORT(
 iCLK, iRESET: IN std_logic;
 iQ, iZ, iC: IN std_logic;
 oS: OUT std_logic_vector(8 DOWNTO 0) );
end uj;

architecture Behavioral of uj is
	SIGNAL sT0, sT1, sT2, sT3, sT4, sT5,
	sT6, sT7, sT8, sT9, sT10 : STD_LOGIC;
	SIGNAL sD0, sD1, sD2, sD3, sD4, sD5,
	sD6, sD7, sD8, sD9, sD10 : STD_LOGIC;
	BEGIN
		sD0 <= (NOT(iQ) AND sT0) OR (iC AND sT5) OR
		(iC AND sT7) OR sT9 OR sT10;
		sD1 <= iQ AND sT0;
		sD2 <= sT1;
		sD3 <= sT2;
		sD4 <= sT3;
		sD5 <= sT4;
		sD6 <= NOT(iC) AND sT5;
		sD7 <= sT6;
		sD8 <= NOT(iC) AND sT7;
		sD9 <= NOT(iZ) AND sT8;
		sD10 <= iZ AND sT8;
	PROCESS (iCLK) 
	BEGIN
	IF (iCLK'event and iCLK='1') THEN
		IF (iRESET = '1') then -- sinhroni reset
			sT0 <= '1'; sT1 <= '0';
			sT2 <= '0'; sT3 <= '0';
			sT4 <= '0'; sT5 <= '0';
			sT6 <= '0'; sT7 <= '0';
			sT8 <= '0'; sT9 <= '0';
			sT10 <= '0';
		ELSE
			sT0 <= sD0; sT1 <= sD1;
			sT2 <= sD2; sT3 <= sD3; 
			sT4 <= sD4; sT5 <= sD5;
			sT6 <= sD6; sT7 <= sD7;
			sT8 <= sD8; sT9 <= sD9;
			sT10 <= sD10;
		END IF;
	END IF;
	END PROCESS;
	oS(0) <= sT4 OR sT9;
	oS(1) <= sT4;
	oS(2) <= sT6 OR sT9;
	oS(3) <= sT4;
	oS(4) <= sT0 OR sT10;
	oS(5) <= sT0 OR sT9 OR sT10;
	oS(6) <= sT1 OR sT3 OR sT9 OR sT10;
	oS(7) <= sT1 OR sT2;
	oS(8) <= sT0 OR sT1 OR sT2 OR sT3 OR sT4 OR sT6 OR sT9 OR sT10; 
end Behavioral;

