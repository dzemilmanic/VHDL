library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity StopWatch is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        start : in STD_LOGIC;
        stop : in STD_LOGIC;
        continue : in STD_LOGIC;
        time_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end StopWatch;

architecture Behavioral of StopWatch is

    signal counter : unsigned(7 downto 0) := (others => '0');
    signal running : boolean := false;

begin

    process(clk, rst)
    begin
        if rst = '1' then
            counter <= (others => '0');
            running <= false;
        elsif rising_edge(clk) then
            if start = '1' then
                running <= true;
            elsif stop = '1' then
                running <= false;
            elsif continue = '1' then
                running <= true;
            end if;
            
            if running = true then
                counter <= counter + 1;
            end if;
        end if;
    end process;

    time_out <= std_logic_vector(counter);

end Behavioral;

