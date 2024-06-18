----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:18:30 05/30/2024 
-- Design Name: 
-- Module Name:    AritmetickoKolo - Behavioral 
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

entity AritmetickoKolo is
Port(
	clk : in std_logic;
	rst : in std_logic;
	oRESULT : out std_logic_vector(7 downto 0)
);
end AritmetickoKolo;

architecture Behavioral of AritmetickoKolo is
	signal sR0_ENABLE : std_logic;
   signal sR1_ENABLE : std_logic;
	
	component Shift_Left is
	Port(
		  clk : in STD_LOGIC;         
        rst : in STD_LOGIC;        
        shift_in : in STD_LOGIC_VECTOR(1 downto 0);  
        shift_out : out STD_LOGIC_VECTOR(1 downto 0) 
	);
	end component;
	
begin
Shift_Left : Shift_Left port map (
        clk => clk,
        rst => rst,
        shift_in => shift_in,
        shift_out => shift_out_internal
    );
	 
process(inCLK, inRESET)
    begin
        if inRESET = '1' then
            sR0_ENABLE <= '0';
            sR1_ENABLE <= '0';
        elsif rising_edge(inCLK) then
            if sR0_ENABLE = '1' then
					
            end if;

            if sR1_ENABLE = '1' then

            end if;
        end if;
    end process;
	 shift_out <= shift_out_internal;
end Behavioral;