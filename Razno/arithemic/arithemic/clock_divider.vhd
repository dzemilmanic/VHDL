library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity clock_divider is
    Port (
        CLOCK_IN  : in  std_logic;
        CLOCK_OUT : out std_logic
    );
end clock_divider;

architecture Behavioral of clock_divider is
    constant FREQ    : natural := 5_000_000;
    constant DIVIDER : natural := FREQ;
    signal counter   : unsigned(30 downto 0) := (others => '0');
    signal slow_clk  : std_logic := '0';
begin
    process(CLOCK_IN)
    begin 
        if rising_edge(CLOCK_IN) then
            counter <= counter + 1;
				
            if counter = DIVIDER - 1 then
                slow_clk <= not slow_clk;
                counter <= (others => '0');
            end if;
        end if;
    end process;
    CLOCK_OUT <= slow_clk;
end Behavioral;
