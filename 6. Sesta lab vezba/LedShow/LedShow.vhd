----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:15:25 05/30/2024 
-- Design Name: 
-- Module Name:    LedShow - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LedShow is
    Port(
        inCLK : in std_logic;
        inSTOP : in std_logic;
        inRL : in std_logic;
        inRR : in std_logic;
        inBLINK : in std_logic;
        oLED : out std_logic_vector(7 downto 0) 
    );
end LedShow;

architecture Behavioral of LedShow is
    type state_type is (IDLE, ROTATE_LEFT, ROTATE_RIGHT, BLINK);
    signal current_state, next_state : state_type;
    signal LED_out: STD_LOGIC_VECTOR(7 downto 0);
	 signal slow_clk : std_logic;
	
	component clock_divider is
	port(
		CLK_IN: in std_logic;
		CLK_OUT: out std_logic
	);
	end component;

begin
clk_divider: clock_divider port map(CLK_IN => inCLK, CLK_OUT => slow_clk);

    process (slow_clk)
    begin
        if rising_edge(slow_clk) then
            case current_state is
                when IDLE =>
                    if inRL = '1' then
                        next_state <= ROTATE_LEFT;
                        
							elsif inRR = '1' then
                        next_state <= ROTATE_RIGHT;
                        
							elsif inBLiNK = '1' then
                        next_state <= BLINK;
                        
                    else
                        next_state <= IDLE;
                        LED_out <= "10000000";  
                    end if;
                when ROTATE_LEFT =>
                    if inRL = '1' then
                        next_state <= ROTATE_LEFT;
                        LED_out <= LED_out(6 downto 0) & LED_out(7);  
                    elsif inSTOP = '1' then
                        next_state <= IDLE;
                        LED_out <= "00000001";  
                    else
                        next_state <= ROTATE_LEFT;
                    end if;
                when ROTATE_RIGHT =>
                    if inRR = '1' then
                        next_state <= ROTATE_RIGHT;
                        LED_out <= LED_out(0) & LED_out(7 downto 1);  
                    elsif inSTOP = '1' then
                        next_state <= IDLE;
                        LED_out <= "00000001";  
                    else
                        next_state <= ROTATE_RIGHT;
                    end if;
                when BLINK =>
                    if inBLINK = '1' then
                        next_state <= BLINK;
                        LED_out <= not LED_out;  
                    elsif inSTOP = '1' then
                        next_state <= IDLE;
                        LED_out <= "00000001";  
                    else
                        next_state <= BLINK;
                    end if;
            end case;
        end if;
    end process;

    current_state <= next_state;

    oLED <= LED_out;

end Behavioral;

