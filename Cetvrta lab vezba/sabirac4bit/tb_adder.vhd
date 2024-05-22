--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:28:30 05/21/2024
-- Design Name:   
-- Module Name:   C:/Users/Samir/Desktop/VHDL/Cetvrta lab vezba/sabirac4bit/tb_adder.vhd
-- Project Name:  sabirac4bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitAdder
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
 
ENTITY tb_adder IS
END tb_adder;
 
ARCHITECTURE behavior OF tb_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitAdder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Icarry : IN  std_logic;
         Ocarry : OUT  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Icarry : std_logic := '0';

 	--Outputs
   signal Ocarry : std_logic;
   signal Sum : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitAdder PORT MAP (
          A => A,
          B => B,
          Icarry => Icarry,
          Ocarry => Ocarry,
          Sum => Sum
        );

   process
    begin
        A <= "0000"; B <= "0000"; Icarry <= '0';
        wait for 10 ns;

        A <= "0001"; B <= "0001"; Icarry <= '0';
        wait for 10 ns;

        A <= "0010"; B <= "0011"; Icarry <= '0';
        wait for 10 ns;

        A <= "0110"; B <= "0101"; Icarry <= '0';
        wait for 10 ns;

        A <= "0111"; B <= "0111"; Icarry <= '0';
        wait for 10 ns;

        A <= "1111"; B <= "0001"; Icarry <= '0';
        wait for 10 ns;

        A <= "1111"; B <= "1111"; Icarry <= '0';
        wait for 10 ns;

        A <= "1010"; B <= "0101"; Icarry <= '1';
        wait for 10 ns;

        A <= "1100"; B <= "0110"; Icarry <= '1';
        wait for 10 ns;

        wait;
    end process;

end;