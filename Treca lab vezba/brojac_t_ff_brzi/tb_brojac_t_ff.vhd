--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:22:06 05/16/2024
-- Design Name:   
-- Module Name:   C:/Users/Samir/Desktop/VHDL/Treca lab vezba/brojac_t_ff/tb_brojac_t_ff.vhd
-- Project Name:  brojac_t_ff
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: brojac_t_ff
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
 
ENTITY tb_brojac_t_ff IS
END tb_brojac_t_ff;
 
ARCHITECTURE behavior OF tb_brojac_t_ff IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT brojac_t_ff
    PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         EN : IN  std_logic;
         Q : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal EN : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: brojac_t_ff PORT MAP (
          CLK => CLK,
          RESET => RESET,
          EN => EN,
          Q => Q
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
		EN <= '1';
		RESET <= '0';
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
