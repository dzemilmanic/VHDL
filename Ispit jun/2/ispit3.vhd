----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:27 06/19/2024 
-- Design Name: 
-- Module Name:    ispit3 - Behavioral 
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

entity ispit3 is
Port(
	clk : in std_logic;
	input : in std_logic_vector(7 downto 0);
	sel : in std_logic;
	sel2 : in std_logic;
	output: out std_logic_vector(7 downto 0)
);
end ispit3;

architecture Behavioral of ispit3 is
   signal counter : unsigned(2 downto 0) := (others => '0');  
	   signal counter2 : unsigned(2 downto 0) := (others => '0');  
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
                case counter is
                    when "000" =>
                        dioda_active <= "10000000";
                    when "001" =>
                        dioda_active <= "01000000";
                    when "010" =>
                        dioda_active <= "00100000";
                    when "011" =>
                        dioda_active <= "00010000";
                    when "100" =>
                        dioda_active <= "00001000";
                    when "101" =>
                        dioda_active <= "00000100";
                    when "110" =>
                        dioda_active <= "00000010";
                    when "111" =>
                        dioda_active <= "00000001";
                    when others =>
                        dioda_active <= (others => '0');
                end case;
                counter <= counter + 1;
				elsif sel2 = '0' and input = "11111111" then
					case counter2 is
                    when "000" =>
                        dioda_active <= "00000011";
                    when "010" =>
                        dioda_active <= "00001100";
                    when "100" =>
                        dioda_active <= "00110000";
                    when "110" =>
                        dioda_active <= "11000000";
                    when others =>
                        dioda_active <= (others => '0');
                end case;
                counter2 <= counter2 + 2;
            else
                dioda_active <= (others => '0');  
            end if;
        end if;
    end process;
	 
    output <= dioda_active;

end Behavioral;

