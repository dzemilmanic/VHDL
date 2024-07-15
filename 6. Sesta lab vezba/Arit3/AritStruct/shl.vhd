----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:12:02 05/30/2024 
-- Design Name: 
-- Module Name:    shl - Behavioral 
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

entity LeftShifter2bit is
    Port (
		EN: in std_logic;
        A : in  STD_LOGIC_VECTOR (2 downto 0);
        Y : out STD_LOGIC_VECTOR (2 downto 0)
    );
end LeftShifter2bit;

architecture Behavioral of LeftShifter2bit is
begin
    process(A, EN)
    begin
        if EN = '1' then
            Y(2) <= A(1);
            Y(1) <= A(0);
            Y(0) <= '0';
        else
            Y <= A;
        end if;
    end process;
end Behavioral;


