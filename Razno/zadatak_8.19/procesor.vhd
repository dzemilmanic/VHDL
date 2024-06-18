----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:35 06/18/2024 
-- Design Name: 
-- Module Name:    procesor - Behavioral 
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

PACKAGE CPU_PKG IS
 COMPONENT REG
 GENERIC (
 pWIDTH: integer := 4
 );
 PORT (
 iCLK, iCLR: IN STD_LOGIC;
 iCE: IN STD_LOGIC;
 iD: IN STD_LOGIC_VECTOR(pWIDTH-1 DOWNTO 0);
 oQ: OUT STD_LOGIC_VECTOR(pWIDTH-1 DOWNTO 0)
 );
 END COMPONENT; 
 COMPONENT MUX4x1 IS
 GENERIC (
 pWIDTH: integer := 4
 );
 PORT (
 iX0, iX1,
 iX2, iX3: IN std_logic_vector(pWIDTH-1 DOWNTO 0);
 iSEL: IN std_logic_vector(1 DOWNTO 0);
 oY: OUT std_logic_vector(pWIDTH-1 DOWNTO 0)
 );
 END COMPONENT;

 COMPONENT DECODER IS
 PORT(
 iX: IN std_logic_vector (1 DOWNTO 0);
 iEN: IN std_logic;
 oY: OUT std_logic_vector (3 DOWNTO 0)
 );
 END COMPONENT;
 COMPONENT ALJ IS
 PORT(
 iA, iB: IN std_logic_vector(3 DOWNTO 0);
 iSEL: IN std_logic_vector(2 DOWNTO 0);
 oH: OUT std_logic_vector(3 DOWNTO 0);
 oC: OUT std_logic
 );
 END COMPONENT; 
 COMPONENT BROJAC
 GENERIC (
 pWIDTH: integer := 4
 );
 PORT(
 iCLK: IN STD_LOGIC;
 iRESET: IN STD_LOGIC;
 iINC: IN STD_LOGIC;
 iDEC: IN STD_LOGIC;
 oQ: OUT STD_LOGIC_VECTOR(pWIDTH-1 DOWNTO 0)
 );
 END COMPONENT;
END CPU_PKG; 
