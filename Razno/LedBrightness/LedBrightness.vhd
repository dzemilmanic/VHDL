----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:21:26 05/29/2024 
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
Port(	clk : in std_logic;
      reset : in std_logic;
      LOn : in std_logic;
      LOut : out std_logic_vector(7 downto 0)
);
end LedBrightness;

architecture Behavioral of LedBrightness is

	 signal slow_clk : std_logic;
    signal duty_cycles : std_logic_vector(63 downto 0);
    signal state : integer range 0 to 7 := 0;
	 signal pwm_outs : std_logic_vector(7 downto 0);
    
    component Clock_Divider is
        Port ( CLK_IN : in std_logic;
               CLK_OUT : out std_logic
				);
    end component;
    
    component PWM_Generator is
        Port ( clk : in  std_logic;
               reset : in  std_logic;
               duty_cycle : in  std_logic_vector(7 downto 0);
               pwm_out : out  std_logic);
    end component;
    
begin
    clk_divider : Clock_Divider port map(CLK_IN => clk, CLK_OUT => slow_clk);
    gen_pwm: for i in 0 to 7 generate
        U2: PWM_Generator port map(clk => slow_clk, reset => reset, duty_cycle => duty_cycles(i*8+7 downto i*8), pwm_out => pwm_outs(i));
    end generate;

    process(slow_clk, reset)
    begin
        if reset = '1' then
            state <= 0;
        elsif rising_edge(slow_clk) then
            if LOn = '1' then
                state <= state + 1;
                if state = 7 then
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
                duty_cycles <= "00011010" & "00110011" & "01001101" & "01100110" & "10000000" & "10011001" & "11001100" & "11111111"; 
            when 1 =>
                duty_cycles <= "00110011" & "01001101" & "01100110" & "10000000" & "10011001" & "11001100" & "11111111" & "00011010"; 
            when 2 =>
                duty_cycles <= "01001101" & "01100110" & "10000000" & "10011001" & "11001100" & "11111111" & "00011010" & "00110011"; 
            when 3 =>
                duty_cycles <= "01100110" & "10000000" & "10011001" & "11001100" & "11111111" & "00011010" & "00110011" & "01001101"; 
            when 4 =>
                duty_cycles <= "10000000" & "10011001" & "11001100" & "11111111" & "00011010" & "00110011" & "01001101" & "01100110"; 
            when 5 =>
                duty_cycles <= "10011001" & "11001100" & "11111111" & "00011010" & "00110011" & "01001101" & "01100110" & "10000000"; 
            when 6 =>
                duty_cycles <= "11001100" & "11111111" & "00011010" & "00110011" & "01001101" & "01100110" & "10000000" & "10011001"; 
            when 7 =>
                duty_cycles <= "11111111" & "00011010" & "00110011" & "01001101" & "01100110" & "10000000" & "10011001" & "11001100"; 
            when others =>
                duty_cycles <= (others => '0');
        end case;
    end process;

    process(LOn, pwm_outs)
    begin
        if LOn = '1' then
            LOut <= pwm_outs;
        else
            LOut <= (others => '0');
        end if;
    end process;

end Behavioral;

