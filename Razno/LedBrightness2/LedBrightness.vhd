----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:04 05/29/2024 
-- Design Name: 
-- Module Name:    LedBrightness - Behavioral 
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

entity LedBrightness is
Port ( clk : in std_logic;
       reset : in std_logic;
       LOn : in std_logic;
       LOut : out std_logic_vector(7 downto 0);
		 L: out std_logic
		 );
end LedBrightness;

architecture Behavioral of LedBrightness is

	 signal slow_clk : std_logic;
    signal pwm_signal : std_logic;
    signal duty_cycle : std_logic_vector(7 downto 0);
    signal state : integer range 0 to 3 := 0;
    
    component Clock_Divider is
        Port ( CLK_IN: in  std_logic;
               CLK_OUT : out  std_logic);
    end component;
    
    component PWM_Generator is
        Port ( clk : in  std_logic;
               reset : in  std_logic;
               duty_cycle : in  std_logic_vector(7 downto 0);
               pwm_out : out  std_logic);
    end component;
    
begin
    U1: Clock_Divider port map(CLK_IN => clk, CLK_OUT => slow_clk);
    U2: PWM_Generator port map(clk => slow_clk, reset => reset, duty_cycle => duty_cycle, pwm_out => pwm_signal);

    process(slow_clk, reset)
    begin
        if reset = '1' then
            state <= 0;
        elsif rising_edge(slow_clk) then
            if LOn = '1' then
                state <= state + 1;
                if state = 3 then
                    state <= 0;
                end if;
            else
                state <= 0;
            end if;
        end if;
    end process;

    process(state)
    begin
        case state is
            when 0 =>
                duty_cycle <= "01000000"; 
            when 1 =>
                duty_cycle <= "10000000"; 
            when 2 =>
                duty_cycle <= "11000000"; 
            when 3 =>
                duty_cycle <= "11111111"; 
            when others =>
                duty_cycle <= "00000000"; 
        end case;
    end process;

    process(LOn, pwm_signal)
    begin
        if LOn = '1' then
            LOut <= (others => pwm_signal);
				L <= '1';
        else
            LOut <= "00000000";
        end if;
    end process;

end Behavioral;

