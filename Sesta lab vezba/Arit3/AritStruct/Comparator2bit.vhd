library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator3bit is
    Port (
        A : in  STD_LOGIC_VECTOR (2 downto 0);
        B : in  STD_LOGIC_VECTOR (2 downto 0);
        A_greater_B : out STD_LOGIC;
        A_equal_B   : out STD_LOGIC;
        A_less_B    : out STD_LOGIC
    );
end Comparator3bit;

architecture Behavioral of Comparator3bit is
begin
    process(A, B)
    begin
        A_greater_B <= '0';
        A_equal_B <= '0';
        A_less_B <= '0';

        if A > B then
            A_greater_B <= '1';
        elsif A = B then
            A_equal_B <= '1';
        else
            A_less_B <= '1';
        end if;
    end process;
end Behavioral;
