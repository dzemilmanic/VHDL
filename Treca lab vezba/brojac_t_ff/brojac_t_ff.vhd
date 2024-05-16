----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:35 05/16/2024 
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

entity brojac_t_ff is
Port(
	CLK, RESET, EN : in std_logic;
	Q: out std_logic_vector(2 downto 0)
);
end brojac_t_ff;

architecture Behavioral of brojac_t_ff is
	signal divider : std_logic_vector(50 downto 0) := (others => '0');
   signal slow_clk : std_logic := '0';
	
	signal T : std_logic_vector(2 downto 0);
	signal Q_pom : std_logic_vector(2 downto 0);
begin
	clk_divider_proc: process(CLK, RESET)
   begin
		if RESET = '1' then
			divider <= (others => '0');
         slow_clk <= '0';
      elsif rising_edge(CLK) then
          divider <= std_logic_vector(unsigned(divider) + 1);
          slow_clk <= divider(50); 
      end if;
    end process;
	 
	process(slow_clk, RESET)
	begin
	if(RESET = '1') then
		Q_pom <= (others => '0');
	elsif (rising_edge(slow_clk)) then
		if(EN = '1') then 
			Q_pom <= T;
		end if;
	end if;
	end process;
	
	T(0) <= not (Q_pom(0) and Q_pom(1) and Q_pom(2));
	T(1) <= Q_pom(0);
	T(2) <= Q_pom(1);
	
	Q <= Q_pom;
end Behavioral;
