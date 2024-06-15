----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:45:41 05/30/2024 
-- Design Name: 
-- Module Name:    ledShow - Behavioral 
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

entity ledShow is
Port(
        inCLK : in std_logic;
        inSTOP : in std_logic;
        inRL : in std_logic;
        inRR : in std_logic;
        inBLINK : in std_logic;
        oLED : out std_logic_vector(7 downto 0) 
    );
end ledShow;

architecture Behavioral of ledShow is
type state_type is (IDLE, ROTATE_LEFT, ROTATE_RIGHT, BLINK);
    signal current_state, next_state : state_type;
    signal LED_out, last_LED_state: STD_LOGIC_VECTOR(7 downto 0);
    signal blink_counter: integer range 0 to 1000000 := 0; -- Brojac za pracenje trajanja svake faze BLINK-a
begin
    process (inCLK)
    begin
        if rising_edge(inCLK) then
            if inSTOP = '1' then
                next_state <= IDLE;
                LED_out <= last_LED_state;
                blink_counter <= 0; -- Resetuj brojac kada se aktivira STOP signal
            else
                case current_state is
                    when IDLE =>
                        if inRL = '1' then
                            next_state <= ROTATE_LEFT;
                            LED_out <= "00000001";  
                        else
                            next_state <= IDLE;
                            LED_out <= "10000000";  
                        end if;
                    when ROTATE_LEFT =>
                        if inRL = '1' then
                            next_state <= ROTATE_LEFT;
                            LED_out <= LED_out(6 downto 0) & LED_out(7);  
                        else
                            next_state <= ROTATE_LEFT;
                        end if;
                    when ROTATE_RIGHT =>
                        if inRR = '1' then
                            next_state <= ROTATE_RIGHT;
                            LED_out <= LED_out(0) & LED_out(7 downto 1);  
                        else
                            next_state <= ROTATE_RIGHT;
                        end if;
                    when BLINK =>
                        -- Ako je BLINK faza, povecaj brojac
                        blink_counter <= blink_counter + 1;
                        -- Ako je prošlo dovoljno vremena za promenu stanja diode
                        if blink_counter = 500000 then
                            next_state <= BLINK;
                            LED_out <= not LED_out;  -- Promeni stanje LED-a
                            blink_counter <= 0;  -- Resetuj brojac
                        else
                            next_state <= BLINK; -- Ostanimo u BLINK fazi ako nije prošlo dovoljno vremena
                        end if;
                end case;
            end if;
        end if;
    end process;

    current_state <= next_state;

    oLED <= LED_out;
    last_LED_state <= LED_out; -- Sacuvaj trenutno stanje LED-a

end Behavioral;

