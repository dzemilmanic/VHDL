--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:20:17 05/07/2024
-- Design Name:   
-- Module Name:   C:/Users/Samir/Desktop/VHDL/Prve pokazne vezbe/mux41/tb.vhd
-- Project Name:  mux41
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux41
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
 
    COMPONENT mux41
    PORT(
         X3 : IN  std_logic;
         X2 : IN  std_logic;
         X1 : IN  std_logic;
         X0 : IN  std_logic;
         S1 : IN  std_logic;
         S0 : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X3 : std_logic := '0';
   signal X2 : std_logic := '0';
   signal X1 : std_logic := '0';
   signal X0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S0 : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux41 PORT MAP (
          X3 => X3,
          X2 => X2,
          X1 => X1,
          X0 => X0,
          S1 => S1,
          S0 => S0,
          Y => Y
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		X3 <='1';
		S1 <='0';
		S0 <='0';
		wait for 200 ns;
		X2 <='1';
		S1 <='0';
		S0 <='1';
		wait for 200 ns;
		X1 <='1';
		S1 <='1';
		S0 <='0';
		wait for 200 ns;
		X0 <='1';
		S1 <='1';
		S0 <='1';
      
      -- insert stimulus here 

      wait;
   end process;

END;
