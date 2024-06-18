----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:28 06/18/2024 
-- Design Name: 
-- Module Name:    brojac - Behavioral 
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

entity brojac is
GENERIC (
 pWIDTH: integer := 4 -- pretpostavljeni broj bita je 4
 );
 PORT(
 iCLK: IN STD_LOGIC;
 iRESET: IN STD_LOGIC;
 iINC: IN STD_LOGIC;
 iDEC: IN STD_LOGIC;
 oQ: OUT STD_LOGIC_VECTOR(pWIDTH-1 DOWNTO 0)
 ); 
end brojac;

architecture Behavioral of brojac is
-- stanje brojaca
 SIGNAL sCNT: UNSIGNED(pWIDTH-1 DOWNTO 0);
 -- vektor za upravljanje stanjem brojaca
 SIGNAL sCTRL: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
 -- formiranje vektora za upravljanje sa brojacem
 sCTRL <= (iDEC & iINC); 
 PROCESS(iCLK) BEGIN
 IF (iCLK'EVENT AND iCLK='1') THEN
 IF (iRESET = '1') THEN -- sinhroni reset
 sCNT <= (OTHERS => '0');
 ELSE
 CASE sCTRL IS
 WHEN "00" => sCNT <= sCNT; -- zadrzavanje stanja
 WHEN "01" => sCNT <= sCNT + 1; -- brojanje na gore
 WHEN "10" => sCNT <= sCNT - 1; -- brojanje na dole
 WHEN OTHERS => sCNT <= sCNT; -- zadrzavanje stanja
 END CASE;
 END IF;
 END IF;
 END PROCESS;
 -- preslikavanje stanja brojaca na izlazni vektor
 oQ <= STD_LOGIC_VECTOR(sCNT); 


end Behavioral;

