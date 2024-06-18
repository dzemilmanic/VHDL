----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:54:27 06/18/2024 
-- Design Name: 
-- Module Name:    registar - Behavioral 
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

entity registar is
PORT (
 iCLK, iCLR: IN STD_LOGIC;
 iCE: IN STD_LOGIC;
 iD: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 oQ: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
 );
end registar;

architecture Behavioral of registar is
	SIGNAL sREG: STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
	PROCESS (iCLK) BEGIN
		IF (iCLK'EVENT AND iCLK = '1') THEN
			IF (inCLR = '1') THEN
				sREG <= (OTHERS => '0');
			ELSE
				IF (iCE = '1') THEN 
					sREG <= iD;
				ELSE
					sREG <= sREG;
				END IF;
			END IF;
		END IF;
	END PROCESS;
 oQ <= sREG; 
end Behavioral;

