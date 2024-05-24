----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:51:17 05/16/2024 
-- Design Name: 
-- Module Name:    brojac - Behavioral 
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity brojac is
 port (
        RESET, CLK, LD, UP : in std_logic;
        DIN : in std_logic_vector (7 downto 0);
        COUNT : out std_logic_vector (7 downto 0)
    );
end brojac;

architecture Behavioral of brojac is

  signal t_cnt : std_logic_vector(7 downto 0);
	 
    signal divider : std_logic_vector(20 downto 0) := (others => '0');
    signal slow_clk : std_logic := '0';

begin

    -- Clock Divider Process
    clk_divider_proc: process(CLK, RESET)
    begin
        if RESET = '1' then
            divider <= (others => '0');
            slow_clk <= '0';
        elsif rising_edge(CLK) then
            divider <= std_logic_vector(unsigned(divider) + 1);
            slow_clk <= divider(20); 
        end if;
    end process;

    -- Counter Process
    counter_proc: process(slow_clk, RESET)
    begin
        if RESET = '1' then
            t_cnt <= (others => '0'); -- clear
        elsif rising_edge(slow_clk) then
            if LD = '1' then
                t_cnt <= DIN; -- load
            else
                if UP = '1' then
                    t_cnt <= std_logic_vector(unsigned(t_cnt) + 1); -- incr
                else
                    t_cnt <= std_logic_vector(unsigned(t_cnt) - 1); -- decr
                end if;
            end if;
        end if;
    end process;

    COUNT <= t_cnt;
	 
end Behavioral;