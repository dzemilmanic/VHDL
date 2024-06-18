----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:45 06/18/2024 
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

ENTITY registar IS
 GENERIC (
 pWIDTH: integer := 4 -- pretpostavljeni broj bita je 4
 );
 PORT (
 iCLK, iCLR: IN STD_LOGIC;
 iCE: IN STD_LOGIC;
 iD: IN STD_LOGIC_VECTOR(pWIDTH-1 DOWNTO 0);
 oQ: OUT STD_LOGIC_VECTOR(pWIDTH-1 DOWNTO 0)
 );
END registar;
ARCHITECTURE Behevioral OF REG IS
 -- stanje registra
 SIGNAL sREG: STD_LOGIC_VECTOR(pWIDTH-1 DOWNTO 0);
BEGIN
 PROCESS (iCLK) BEGIN
 IF (iCLK'EVENT AND iCLK = '1') THEN
 -- sinhrono postavljanje pocetne vrednosti
 IF (inCLR = '1') THEN
 sREG <= (OTHERS => '0');
 ELSE
 IF (iCE = '1') THEN -- upis u registar
 sREG <= iD;
 ELSE
 sREG <= sREG;
 END IF;
 END IF;
 END IF;
 END PROCESS;

 -- preslikavanje stanja registra na izlazni vektor
 oQ <= sREG; 

end Behevioral;