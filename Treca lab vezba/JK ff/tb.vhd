--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:23:43 05/16/2024
-- Design Name:   
-- Module Name:   C:/Users/Samir/Desktop/VHDL/Treca lab vezba/JK/tb.vhd
-- Project Name:  JK
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: jk
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT jk
    PORT(
         J : IN  std_logic;
         K : IN  std_logic;
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         Q : OUT  std_logic;
         Q1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal J : std_logic := '0';
   signal K : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal Q1 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: jk PORT MAP (
          J => J,
          K => K,
          CLK => CLK,
          RESET => RESET,
          Q => Q,
          Q1 => Q1
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
      wait for 100 ns;	
		J <='0';
		K <= '0';
		wait for 100 ns;
		J <='1';
		K <= '0';
		wait for 100 ns;
		J <= '0';
		K <= '1';
		wait for 100 ns;
		J <= '1';
		K <= '1';
      wait;
   end process;

END;
