----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:46 06/18/2024 
-- Design Name: 
-- Module Name:    alj - Behavioral 
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

entity alj is
PORT(
 iA, iB: IN std_logic_vector(3 DOWNTO 0);
 iSEL: IN std_logic_vector(2 DOWNTO 0);
 oH: OUT std_logic_vector(3 DOWNTO 0);
 oC: OUT std_logic ); 
end alj;

architecture Behavioral of alj is
-- operandi koji su prosireni za jedan bit
 -- zbog racunanja izlaznog prenosa
 SIGNAL sA, sB: unsigned(4 DOWNTO 0);
 -- rezultat operacije, ulaz u pomerac
 -- prosiren za jedan bit gde ce se smestiti
 -- izracunati izlazni prenos
 SIGNAL sF: unsigned(4 DOWNTO 0);
BEGIN
 sA <= unsigned('0' & iA); -- operand A prosiren za jedan bit
 sB <= unsigned('0' & iB); -- operand B prosiren za jedan bit

 PROCESS(iSEL, sA, sB) BEGIN
 CASE iSEL IS
 WHEN "000" => sF <= sA;
 WHEN "001" => sF <= sA - 1;
 WHEN "010" => sF <= sA + 1;
 WHEN "011" => sF <= sA - sB;
 WHEN "100" => sF <= sA + sB;
 WHEN "101" => sF <= sA - sB - 1;
 WHEN "110" => sF <= sA + sB + 1;
 WHEN OTHERS => sF <= "00000";
 END CASE; 
 END PROCESS;
 -- formiranje izlaza ALJ
 oH <= std_logic_vector(sF(3 DOWNTO 0));
 oC <= std_logic(sF(4)); 
end Behavioral;

