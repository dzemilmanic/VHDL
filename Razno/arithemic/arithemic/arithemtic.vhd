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

entity arithmetic_structure is
    port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        oRESULT : out STD_LOGIC_VECTOR(6 downto 0);
		  sR0_EN, sR1_EN, sSHL_EN, sCMP_EN : in std_logic
    );
end entity arithmetic_structure;

architecture Behavioral of arithmetic_structure is
    signal r0, r1, adder_out, shl_out : STD_LOGIC_VECTOR(6 downto 0);
    signal sADDER_OP : STD_LOGIC_VECTOR(1 downto 0);
    signal sCMP_WITH : STD_LOGIC_VECTOR(6 downto 0);
	 signal slow_clock:std_logic;
		
	
	component clock_divider is
		port(
			CLOCK_IN:in std_logic;
			CLOCK_OUT:out std_logic
		);
	end component;

    component reg is
        port (
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            enable  : in  STD_LOGIC;
            d       : in  STD_LOGIC_VECTOR(6 downto 0);
            q       : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    component adder is
        port (
            a       : in  STD_LOGIC_VECTOR(6 downto 0);
            b       : in  STD_LOGIC_VECTOR(6 downto 0);
            sum     : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    component shl is
        port (
            a       : in  STD_LOGIC_VECTOR(6 downto 0);
            y       : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    component control_unit is
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
    end component;

begin
	clock_instance : clock_divider port map(
		CLOCK_IN => clk,
		CLOCK_OUT=> slow_clock
	);
	
    u_R0: reg port map (
        clk => slow_clock,
        reset => reset,
        enable => sR0_EN,
        d => shl_out,
        q => r0
    );

    u_R1: reg port map (
        clk => slow_clock,
        reset => reset,
        enable => sR1_EN,
        d => adder_out,
        q => r1
    );

    u_adder: adder port map (
        a => r0,
        b => r1,
        sum => adder_out
    );

    u_shl: shl port map (
        a => adder_out,
        y => shl_out
    );

    u_control_unit: control_unit port map (
        clk => slow_clock,
        reset => reset,
        sR0_EN => sR0_EN,
        sR1_EN => sR1_EN,
        sADDER_OP => sADDER_OP,
        sSHL_EN => sSHL_EN,
        sCMP_EN => sCMP_EN,
        sCMP_WITH => sCMP_WITH
    );

    oRESULT <= r0;

end architecture Behavioral;
