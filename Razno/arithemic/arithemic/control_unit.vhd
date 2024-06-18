

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:16:29 05/30/2024 
-- Design Name: 
-- Module Name:    arithemtic - Behavioral 
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




entity control_unit is
    port (
        clk          : in  STD_LOGIC;
        reset        : in  STD_LOGIC;
        sR0_EN       : out STD_LOGIC;
        sR1_EN       : out STD_LOGIC;
        sADDER_OP    : out STD_LOGIC_VECTOR(1 downto 0);
        sSHL_EN      : out STD_LOGIC;
        sCMP_EN      : out STD_LOGIC;
        sCMP_WITH    : out STD_LOGIC_VECTOR(6 downto 0)
    );
end entity control_unit;

architecture Behavioral of control_unit is
    type state_type is (S0, S1, S2);
    signal state : state_type := S0;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            case state is
                when S0 =>
                    sR0_EN <= '1';
                    sR1_EN <= '0';
                    sADDER_OP <= "00";
                    sSHL_EN <= '1';
                    sCMP_EN <= '0';
                    state <= S1;
                when S1 =>
                    sR0_EN <= '0';
                    sR1_EN <= '1';
                    sADDER_OP <= "01";
                    sSHL_EN <= '0';
                    sCMP_EN <= '0';
                    state <= S2;
                when S2 =>
                    sR0_EN <= '0';
                    sR1_EN <= '0';
                    sADDER_OP <= "00";
                    sSHL_EN <= '0';
                    sCMP_EN <= '1';
                    sCMP_WITH <= "0000100"; 
                    state <= S0;
            end case;
        end if;
    end process;
end architecture Behavioral;

