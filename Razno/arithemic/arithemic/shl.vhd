----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:29 05/30/2024 
-- Design Name: 
-- Module Name:    arithemtic - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity shl is
    port (
        a       : in  STD_LOGIC_VECTOR(6 downto 0);
        y       : out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity shl;

architecture Behavioral of shl is
begin
    y <= a(5 downto 0) & '0';
end architecture Behavioral;



