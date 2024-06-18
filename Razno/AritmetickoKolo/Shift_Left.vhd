----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:56:40 05/30/2024 
-- Design Name: 
-- Module Name:    Shift_Left - Behavioral 
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

entity Shift_Left is
    Port (
        clk: in STD_LOGIC;          
        rst: in STD_LOGIC;         
        shift_in: in STD_LOGIC_VECTOR(1 downto 0);  
        shift_out: out STD_LOGIC_VECTOR(1 downto 0)  
    );
end entity Shift_Left;

architecture Behavioral of Shift_Left is
begin
    process (clk, rst)
    begin
        if rst = '1' then
            
            shift_out <= (others => '0');
        elsif rising_edge(clk) then
           
            shift_out(0) <= shift_in(1);
            shift_out(1) <= shift_in(0);
        end if;
    end process;
end architecture Behavioral;


