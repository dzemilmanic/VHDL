--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:17:31 05/16/2024
-- Design Name:   
-- Module Name:   C:/Users/Samir/Desktop/VHDL/Vezbanje/brojac/tb.vhd
-- Project Name:  brojac
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: brojac
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT brojac
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         LD : IN  std_logic;
         UP : IN  std_logic;
         DIN : IN  std_logic_vector(7 downto 0);
         COUNT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal LD : std_logic := '0';
   signal UP : std_logic := '0';
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal COUNT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: brojac PORT MAP (
          RESET => RESET,
          CLK => CLK,
          LD => LD,
          UP => UP,
          DIN => DIN,
          COUNT => COUNT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
       -- Reset
        RESET <= '1';
        wait for 10 ns;
        RESET <= '0';

        -- Load data
        LD <= '1';
        DIN <= "00000001";  -- Load with some data
        wait for 10 ns;
        LD <= '0';

        -- Increment
        UP <= '1';
        wait for 10 ns;
        UP <= '0';

        -- Decrement
        UP <= '0';
        wait for 10 ns;
        UP <= '1';
        wait for 10 ns;
        UP <= '0';

        -- Additional test cases can be added here

        wait;
    end process stim_proc;

END;
