----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:46 05/30/2024 
-- Design Name: 
-- Module Name:    Ar_kolo - Behavioral 
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

entity Ar_kolo is
    Port (
        clk       : in std_logic;
        reset     : in std_logic;
        ADDER_OP  : in std_logic_vector(1 downto 0);
        SHL_EN    : in std_logic;
        CMP_WITH  : in std_logic_vector(2 downto 0);
        CMP_EN    : in std_logic;
			--signali
        R0_ENABLE : out std_logic;
        R1_ENABLE : out std_logic;
        ADD_OP1   : out std_logic_vector(2 downto 0);
        ADD_OP2   : out std_logic_vector(2 downto 0);
        SHIFT_ENABLE : out std_logic;
        CMP_ENABLE : out std_logic
    );
end Ar_kolo;

architecture Behavioral of Ar_kolo is
    signal sR0_ENABLE : std_logic;
    signal sR1_ENABLE : std_logic;
    signal sADD_OP1   : std_logic_vector(2 downto 0);
    signal sADD_OP2   : std_logic_vector(2 downto 0);
    signal sSHIFT_ENABLE : std_logic;
    signal sCMP_ENABLE : std_logic;
    
    -- Interni signali za sabirac
    signal sADD_RESULT : std_logic_vector(2 downto 0);

    -- Interni signal za komparator
    signal sCMP_RESULT : std_logic;
begin
    -- Proces za kontrolu registara
    process(clk, reset)
    begin
        if reset = '1' then
            sR0_ENABLE <= '0';
            sR1_ENABLE <= '0';
        elsif rising_edge(clk) then
            if sR0_ENABLE = '1' then
                -- Implementacija logike za dozvolu upisa u R0
            end if;

            if sR1_ENABLE = '1' then
                -- Implementacija logike za dozvolu upisa u R1
            end if;
        end if;
    end process;

    -- Proces za kontrolu sabiraca
    process(clk, reset)
    begin
        if reset = '1' then
            sADD_RESULT <= (others => '0');
        elsif rising_edge(clk) then
            case ADDER_OP is
                when "00" =>
                    -- Prvi operand je R0, drugi operand je R1
                    -- Implementacija logike za sabiranje
                    sADD_RESULT <= -- Rezultat sabiranja
                when "01" =>
                    -- Prvi operand je 1, drugi operand je R1
                    -- Implementacija logike za sabiranje
                    sADD_RESULT <= -- Rezultat sabiranja
                when "10" =>
                    -- Prvi operand je R0, drugi operand je 0
                    -- Implementacija logike za sabiranje
                    sADD_RESULT <= -- Rezultat sabiranja
                when others =>
                    -- Prvi operand je 0, drugi operand je R1
                    -- Implementacija logike za sabiranje
                    sADD_RESULT <= -- Rezultat sabiranja
            end case;
        end if;
    end process;

    -- Proces za kontrolu komparatora
    process(clk, reset)
    begin
        if reset = '1' then
            sCMP_RESULT <= '0';
        elsif rising_edge(clk) then
            if CMP_EN = '1' then
                -- Implementacija logike za poredenje
                sCMP_RESULT <= -- Rezultat poredenja
            else
                sCMP_RESULT <= '0';
            end if;
        end if;
    end process;

    -- Logika za kontrolu pomeraca
    process(clk, reset)
    begin
        if reset = '1' then
            sSHIFT_ENABLE <= '0';
        elsif rising_edge(clk) then
            if SHL_EN = '1' then
                -- Implementacija logike za dozvolu pomeranja
                sSHIFT_ENABLE <= -- Implementacija izlaznog signala dozvole pomeranja
            else
                sSHIFT_ENABLE <= '0';
            end if;
        end if;
    end process;

    -- Dodela izlaznih signala
    R0_ENABLE <= sR0_ENABLE;
    R1_ENABLE <= sR1_ENABLE;
    ADD_OP1 <= sADD_RESULT;
    ADD_OP2 <= sCMP_WITH;
    SHIFT_ENABLE <= sSHIFT_ENABLE;
    CMP_ENABLE <= sCMP_RESULT;

end Behavioral;
