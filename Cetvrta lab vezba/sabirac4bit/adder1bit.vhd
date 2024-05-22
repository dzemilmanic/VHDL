----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:37 05/21/2024 
-- Design Name: 
-- Module Name:    adder1bit - Behavioral 
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

entity adder1bit is
 Port ( 
        a       : in  STD_LOGIC;
        b       : in  STD_LOGIC;
        Icarry : in  STD_LOGIC;
        Ocarry  : out STD_LOGIC;
        Osum    : out STD_LOGIC
    );
end adder1bit;

architecture Behavioral of adder1bit is
begin
    Osum <= a XOR b XOR Icarry;
    Ocarry <= (a AND b) OR (Icarry AND (a XOR b));
end Behavioral;

