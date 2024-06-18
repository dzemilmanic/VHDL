----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:10 06/18/2024 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
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
USE work.CPU_PKG.all; -- ukljucivanje pakovanja sa komponentama

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpu is
PORT (
 iCLK: IN STD_LOGIC;
 iSTART, iQ: IN STD_LOGIC;
 iX: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 oH: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
 oZ, oC: OUT STD_LOGIC
 );  
end cpu;

architecture Behavioral of cpu is
-- konstanta 1
 CONSTANT cONE: STD_LOGIC := '1';
 -- registri
 SIGNAL sR0, sR1, sR2, sR3: STD_LOGIC_VECTOR(3 DOWNTO 0);
 -- ulazni vektori u ALJ
 SIGNAL sA, sB: STD_LOGIC_VECTOR(3 DOWNTO 0);
 -- rezultat ALJ
 SIGNAL sF: STD_LOGIC_VECTOR(3 DOWNTO 0);
 SIGNAL sC_OUT: STD_LOGIC; -- izlazni prenos
 -- signal koji ukazuje da je rezultat ALJ operacije 0
 SIGNAL sZERO: STD_LOGIC;
 -- statusni registar
 SIGNAL sDATA: STD_LOGIC_VECTOR(1 DOWNTO 0); -- ulazni vektor
 SIGNAL sSREG: STD_LOGIC_VECTOR(1 DOWNTO 0); -- izlazni vektor
 -- statusni biti
 SIGNAL sC, sZ: STD_LOGIC;
 -- izlaz dekodera -> dozvola upisa u registre
 SIGNAL sWE: STD_LOGIC_VECTOR(3 DOWNTO 0);
 -- upravljacki signali
 SIGNAL sS: STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN 
-- registar na adresi 0
 eREG0: registar
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iSTART, iCE=>sWE(0),
 iD=>sF, oQ=>sR0);

 -- registar na adresi 1
 eREG1: registar
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iSTART, iCE=>sWE(1),
 iD=>sF, oQ=>sR1);
 -- registar na adresi 2
 eREG2: registar
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iSTART, iCE=>sWE(2),
 iD=>sF, oQ=>sR2);
 -- registar na adresi 3
 eREG3: registar
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iSTART, iCE=>sWE(3),
 iD=>sF, oQ=>sR3);
 -- multiplekser za odabir operanda A
 eMUXA: MUX4x1
 PORT MAP(iX0=>sR0, iX1=>sR1, iX2=>sR2, iX3=>sR3,
 iSEL=>sS(1 DOWNTO 0), oY=>sA); 
 -- multiplekser za odabir operanda B
 eMUXB: MUX4x1
 PORT MAP(iX0=>iX, iX1=>sR1, iX2=>sR2, iX3=>sR3,
 iSEL=>sS(3 DOWNTO 2), oY=>sB);
 -- ALJ
 eALJ: alu
 PORT MAP(iA=>sA, iB=>sB, iSEL=>sS(5 DOWNTO 4),
 oH=>sF, oC=>sC_OUT);
 -- formiranje signala koji ukazuje
 -- da je rezultat ALJ operacije nula
 sZERO <= NOT(sF(0) OR sF(1) OR sF(2) OR sF(3));
 -- statusni registar
 sDATA <= (sZERO & sC_OUT); -- ulazna vrednost registra
 eSREG: registar
 GENERIC MAP (pWIDTH=>2)
 PORT MAP (iCLK=>iCLK, iCLR=>iSTART, iCE=>cONE,
 iD=>sDATA, oQ=>sSREG);
 -- vrednost statusnih bita
 sC <= sSREG(0); -- carry
 sZ <= sSREG(1); -- zero
 -- dozvola upisa u registre
 eDEKODER: dec2x4
 PORT MAP(iX=>sS(7 DOWNTO 6), iEN=>sS(8), oY=>sWE); 
 -- upravljacka jedinica
 eUJ: uj
 PORT MAP (iCLK=>iCLK, iRESET=>iSTART, iQ=>iQ, iZ=>sZ,
 iC=>sC, oS=>sS);
 -- izlazni signali
 oH <= sF;
 oC <= sC;
 oZ <= sZ; 

end Behavioral;

