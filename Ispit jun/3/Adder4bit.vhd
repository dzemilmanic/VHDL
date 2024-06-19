----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:52 06/19/2024 
-- Design Name: 
-- Module Name:    Adder4bit - Behavioral 
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


	entity Adder4bit is
		 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
				  B : in STD_LOGIC_VECTOR (3 downto 0);
				  sum : out STD_LOGIC_VECTOR (3 downto 0));
	end Adder4bit;

	architecture Behavioral of Adder4bit is
	begin
		 process (A, B)
		 begin
			  sum <= (A + B);
		 end process;
		 
	end Behavioral;
