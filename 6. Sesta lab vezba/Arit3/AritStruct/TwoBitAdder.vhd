library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TwoBitAdder is
    Port (
        A : in STD_LOGIC_VECTOR (2 downto 0);
        B : in STD_LOGIC_VECTOR (2 downto 0);
        Sum : out STD_LOGIC_VECTOR (2 downto 0);
        Carry : out STD_LOGIC
    );
end TwoBitAdder;

architecture Behavioral of TwoBitAdder is
begin
    process (A, B)
    variable TempSum : STD_LOGIC_VECTOR (3 downto 0);
    begin
        TempSum := ('0' & A) + ('0' & B);  
        Sum <= TempSum(2 downto 0);  
        Carry <= TempSum(3);  
    end process;
end Behavioral;

