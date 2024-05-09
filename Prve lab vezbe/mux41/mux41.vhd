----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:06 04/29/2024 
-- Design Name: 
-- Module Name:    mux41 - Behavioral 
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

entity mux41 is
    Port ( X3 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X1 : in  STD_LOGIC;
           X0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end mux41;

architecture Behavioral of mux41 is

begin
Y <= ((not S1) and (not S0) and X3) or ((not S1) and S0 and X2) or (S1 and (not S0) and X1) or (S1 and S0 and X0);


end Behavioral;

