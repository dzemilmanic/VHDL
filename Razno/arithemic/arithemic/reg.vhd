

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

entity reg is
    port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        enable  : in  STD_LOGIC;
        d       : in  STD_LOGIC_VECTOR(6 downto 0);
        q       : out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity reg;

architecture Behavioral of reg is
    signal reg : STD_LOGIC_VECTOR(6 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                reg <= d;
            end if;
        end if;
    end process;
    q <= reg;
end architecture Behavioral;