----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:50:23 05/14/2024 
-- Design Name: 
-- Module Name:    proba - Behavioral 
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

entity lab2 is
    Port (
        X0     : in  STD_LOGIC;
        X1     : in  STD_LOGIC;
        Y0     : out STD_LOGIC;
        Y1     : out STD_LOGIC;
        Y2     : out STD_LOGIC;
        Y3     : out STD_LOGIC;
        a      : out STD_LOGIC;
        b      : out STD_LOGIC;
        c      : out STD_LOGIC;
        d      : out STD_LOGIC;
        e      : out STD_LOGIC;
        f      : out STD_LOGIC;
        g      : out STD_LOGIC;
        h      : out STD_LOGIC;
        Switch : in  STD_LOGIC
    );
end lab2;

architecture Behavioral of lab2 is
begin
    Y0 <= (not X1) and (not X0) and Switch;
    Y1 <= (not X1) and X0 and (not Switch);
    Y2 <= X1 and (not X0);
    Y3 <= X1 and X0;
    
    process (X0, X1, Switch)
    begin
        if X1 = '0' and X0 = '0' and Switch = '1' then
            b <= '1';
            d <= '1';
            f <= '1';
            h <= '1';
            a <= '0';
            c <= '0';
            e <= '0';
            g <= '0';
        elsif X1 = '0' and X0 = '0' and Switch = '0' then
            a <= '1';
            c <= '1';
            e <= '1';
            g <= '1';
            b <= '0';
            d <= '0';
            f <= '0';
            h <= '0';
        else
            a <= '0';
            b <= '0';
            c <= '0';
            d <= '0';
            e <= '0';
            f <= '0';
            g <= '0';
            h <= '0';
        end if;
    end process;
end Behavioral;


