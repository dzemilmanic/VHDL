--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:21:08 05/28/2024
-- Design Name:   
-- Module Name:   C:/Users/Samir/Desktop/VHDL/Peta lab vezba/stoperica_2/tb.vhd
-- Project Name:  stoperica_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: stoperica
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
 
    COMPONENT stoperica
    PORT(
         Start : IN  std_logic;
         Stop : IN  std_logic;
         Cont : IN  std_logic;
         Izlaz : OUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         MaxCount : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Start : std_logic := '0';
   signal Stop : std_logic := '0';
   signal Cont : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';
   signal MaxCount : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Izlaz : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stoperica PORT MAP (
          Start => Start,
          Stop => Stop,
          Cont => Cont,
          Izlaz => Izlaz,
          CLK => CLK,
          Reset => Reset,
          MaxCount => MaxCount
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Start <= '1';
		wait for 100 ns;	
		Start <= '1';
		MaxCount <= "111";
			-- insert stimulus here 

      wait;
   end process;

END;
