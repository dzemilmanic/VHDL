library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LeftShifter3bit is
    Port (
		EN: in std_logic;
        A : in  STD_LOGIC_VECTOR (2 downto 0);
        Y : out STD_LOGIC_VECTOR (2 downto 0)
    );
end LeftShifter3bit;

architecture Behavioral of LeftShifter3bit is
begin
    process(A, EN)
    begin
        if EN = '1' then
            Y(2) <= A(1);
            Y(1) <= A(0);
            Y(0) <= '0';
        else
            Y <= A;
        end if;
    end process;
end Behavioral;

