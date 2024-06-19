----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:46 06/19/2024 
-- Design Name: 
-- Module Name:    ispit2 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ispit2 is
Port(
	clk : in std_logic;
	input : in std_logic_vector(7 downto 0);
	sel : in std_logic;
	output: out std_logic_vector(7 downto 0)
);
end ispit2;

architecture Behavioral of ispit2 is
	signal counter : unsigned(2 downto 0) := (others => '0');  
   signal dioda_active : std_logic_vector(7 downto 0) := (others => '0');
	signal slow_clk : std_logic;

component clock_divider is
	port(
		CLK_IN: in std_logic;
		CLK_OUT: out std_logic
	);
end component;
begin
clk_divider: clock_divider port map(CLK_IN => clk, CLK_OUT => slow_clk);
	process(slow_clk)
   begin
      if rising_edge(slow_clk) then
            if sel = '0' and input = "11111111" then
                if counter = "000" then
                    dioda_active <= "00000001"; 
                elsif counter = "001" then
                    dioda_active <= "00000010"; 
                elsif counter = "010" then
                    dioda_active <= "00000100"; 
                elsif counter = "011" then
                    dioda_active <= "00001000"; 
                elsif counter = "100" then
                    dioda_active <= "00010000"; 
                elsif counter = "101" then
                    dioda_active <= "00100000";  
                elsif counter = "110" then
                    dioda_active <= "01000000";  
                elsif counter = "111" then
                    dioda_active <= "10000000";  
                end if;
                
                counter <= counter + 1;
            else
                dioda_active <= (others => '0');  
            end if;
        end if;
    end process;
	 
    output <= dioda_active;

end Behavioral;


