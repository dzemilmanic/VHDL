----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:06 05/30/2024 
-- Design Name: 
-- Module Name:    Reg - Behavioral 
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

entity Reg is
port(
	R_IN: in std_logic_vector(2 downto 0);
	CLK: in std_logic;
	R_OUT: out std_logic_vector(2 downto 0)
);
end Reg;

architecture Behavioral of Reg is
signal o: std_logic_vector(2 downto 0) := "000";
begin

process(clk)
    begin
        if rising_edge(CLK) then
           o <= R_IN;
        end if;
    end process;
	R_OUT <= o;
end Behavioral;

