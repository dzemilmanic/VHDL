----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:02:14 05/29/2024 
-- Design Name: 
-- Module Name:    stoperica - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity stoperica is
 Port (
        iEN       : in  std_logic;
        iCLK      : in  std_logic;
        iRST      : in  std_logic;
        iDIR      : in  std_logic;  -- Direction control: '1' for up, '0' for down
        oCNT      : out std_logic_vector(4 downto 0);
        loadValue : in  std_logic_vector(4 downto 0);
        ILd       : in  std_logic   -- Load control signal
		  );
end stoperica;

architecture Behavioral of stoperica is

	 signal t_cnt     : unsigned(4 downto 0) := (others => '0');
    signal slow_clk  : std_logic; 
    signal loaded    : boolean := false; -- Flag to indicate if the value has been loaded
    
    -- Component declaration
    component clock_divider is
	port(
		CLK_IN: in std_logic;
		CLK_OUT: out std_logic
	);
	end component;

begin
    -- Clock divider instantiation
    clk_divider: clock_divider port map(CLK_IN => iCLK, CLK_OUT => slow_clk);
    
    -- Counter process
    process(slow_clk, iRST, ILd)
    begin
        if iRST = '1' then
            t_cnt <= (others => '0'); 
        elsif rising_edge(slow_clk) then
            if ILd = '1' then
                t_cnt <= unsigned(loadValue);
            elsif iEN = '1' then
                if iDIR = '1' then
                    if t_cnt < unsigned(loadValue) then
                        t_cnt <= t_cnt + 1;
                    end if;
                else
                    t_cnt <= t_cnt - 1;
						  
                    if t_cnt = "0000" then
						  
						    t_cnt<= unsigned(loadValue);
						  
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    oCNT <= std_logic_vector(t_cnt);

end Behavioral;

