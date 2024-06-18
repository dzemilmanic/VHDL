----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:06:07 06/18/2024 
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
USE work.CPU_PKG.all;

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
 iRESET: IN STD_LOGIC;
 iX: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 iSEL: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
 oALJ_SEL: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
 oAMUX_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
 oBMUX_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0); 
 oREG_SEL: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
 oREG_WE: OUT STD_LOGIC;
 oINC: OUT STD_LOGIC;
 oDEC: OUT STD_LOGIC;
 oH: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
 oC: OUT STD_LOGIC
 ); 
end cpu;

architecture Behavioral of cpu is
-- konstanta 1
 CONSTANT cONE: STD_LOGIC := '1';
 -- formiranje aliasa na ulazni upravljacki vektor
 -- radi lakse kontrole pojedinih polja upravljacke reci
 ALIAS sALJ_SEL: STD_LOGIC_VECTOR(2 DOWNTO 0) IS iSEL(2 DOWNTO 0);
 ALIAS sAMUX_SEL: STD_LOGIC_VECTOR(1 DOWNTO 0) IS iSEL(4 DOWNTO 3);
 ALIAS sBMUX_SEL: STD_LOGIC_VECTOR(1 DOWNTO 0) IS iSEL(6 DOWNTO 5);
 ALIAS sREG_SEL: STD_LOGIC_VECTOR(1 DOWNTO 0) IS iSEL(8 DOWNTO 7);
 ALIAS sREG_WE: STD_LOGIC IS iSEL(9);
 ALIAS sINC: STD_LOGIC IS iSEL(10);
 ALIAS sDEC: STD_LOGIC IS iSEL(11);
 -- registri
 SIGNAL sR0, sR1, sR2, sR3: STD_LOGIC_VECTOR(3 DOWNTO 0);
 SIGNAL sR30, sR31, sR32, sR33: STD_LOGIC_VECTOR(3 DOWNTO 0);
 -- ulazni vektori u ALJ
 SIGNAL sA, sB: STD_LOGIC_VECTOR(3 DOWNTO 0);
 -- rezultat ALJ
 SIGNAL sF: STD_LOGIC_VECTOR(3 DOWNTO 0);
 SIGNAL sC: STD_LOGIC; -- izlazni prenos
 -- izlaz dekodera -> dozvola upisa u registre
 SIGNAL sWE: STD_LOGIC_VECTOR(3 DOWNTO 0);
 -- izlaz dekodera -> dozvola upisa u stek registre
 SIGNAL sREG3_EN, sWE3: STD_LOGIC_VECTOR(3 DOWNTO 0);
 -- vrednost brojaca
 SIGNAL sCNT: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN 
-- dozvola upisa u registre
 eDEKODER: dec2x4
 PORT MAP(iX=>sREG_SEL, iEN=>sREG_WE, oY=>sWE);
 -- registar na adresi 0
 eREG0: REG
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iRESET, iCE=>sWE(0),
 iD=>sF, oQ=>sR0);
 -- registar na adresi 1
 eREG1: REG
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iRESET, iCE=>sWE(1),
 iD=>sF, oQ=>sR1);
 -- registar na adresi 2
 eREG2: REG
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iRESET, iCE=>sWE(2),
 iD=>sF, oQ=>sR2); 
 -- brojac -> ukazivac steka
 eCNT: BROJAC
 GENERIC MAP (pWIDTH=>2)
 PORT MAP (iCLK=>iCLK, iRESET=>iRESET,
 iINC=>sINC, iDEC=>sDEC, oQ=>sCNT);
 -- dozvola upisa u stek registre
 eSTACK_DEC: dec2x4 PORT MAP(iX=>sCNT, iEN=>cONE, oY=>sREG3_EN);

 -- odredjivanje signala dozvole upisa u stek registre
 sWE3(0) <= sREG3_EN(0) AND sWE(3);
 sWE3(1) <= sREG3_EN(1) AND sWE(3);
 sWE3(2) <= sREG3_EN(2) AND sWE(3);
 sWE3(3) <= sREG3_EN(3) AND sWE(3);
 -- stek registri na adresi 3
 eREG30: REG
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iRESET, iCE=>sWE3(0),
 iD=>sF, oQ=>sR30);
 eREG31: REG
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iRESET, iCE=>sWE3(1),
 iD=>sF, oQ=>sR31);
 eREG32: REG
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iRESET, iCE=>sWE3(2),
 iD=>sF, oQ=>sR32);
 eREG33: REG
 GENERIC MAP (pWIDTH=>4)
 PORT MAP (iCLK=>iCLK, iCLR=>iRESET, iCE=>sWE3(3),
 iD=>sF, oQ=>sR33); 
 -- multiplekser za odabir izlaznog registra iz steka
 eMUXR3: MUX4x1
 PORT MAP(iX0=>sR30, iX1=>sR31, iX2=>sR32, iX3=>sR33,
 iSEL=>sCNT, oY=>sR3);
 -- multiplekser za odabir operanda A
 eMUXA: MUX4x1
 PORT MAP(iX0=>sR0, iX1=>sR1, iX2=>sR2, iX3=>iX,
 iSEL=>sAMUX_SEL, oY=>sA);
 -- multiplekser za odabir operanda B
 eMUXB: MUX4x1
 PORT MAP(iX0=>sR0, iX1=>sR1, iX2=>sR2, iX3=>sR3,
 iSEL=>sBMUX_SEL, oY=>sB);
 -- ALJ
 eALJ: ALJ
 PORT MAP(iA=>sA, iB=>sB, iSEL=>sALJ_SEL, oH=>sF, oC=>sC);
 -- izlazni signali
 oALJ_SEL <= sALJ_SEL;
 oAMUX_SEL <= sAMUX_SEL;
 oBMUX_SEL <= sBMUX_SEL;
 oREG_SEL <= sREG_SEL; 	
 oREG_WE <= sREG_WE;
 oINC <= sINC;
 oDEC <= sDEC;
 oH <= sF;
 oC <= sC; 

end Behavioral;

