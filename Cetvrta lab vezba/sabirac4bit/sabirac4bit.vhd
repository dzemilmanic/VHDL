----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:36:17 05/21/2024 
-- Design Name: 
-- Module Name:    sabirac4bit - Behavioral 
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourBitAdder is
     Port (
        A       : in  STD_LOGIC_VECTOR(3 downto 0);
        B       : in  STD_LOGIC_VECTOR(3 downto 0);
        Icarry  : in  STD_LOGIC;
        Ocarry  : out STD_LOGIC;
        Sum     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end FourBitAdder;

architecture Behavioral of FourBitAdder is
   signal carry : STD_LOGIC_VECTOR(4 downto 0);
	component adder1bit is
	Port ( 
        a       : in  STD_LOGIC;
        b       : in  STD_LOGIC;
        Icarry : in  STD_LOGIC;
        Ocarry  : out STD_LOGIC;
        Osum    : out STD_LOGIC
    );
	end component;
begin
    carry(0) <= Icarry;
    sab1: adder1bit Port map (
            a       => A(0),
            b       => B(0),
            Icarry => carry(0),
            Ocarry  => carry(1),
            Osum    => Sum(0)
        );
	 sab2: adder1bit Port map (
            a       => A(1),
            b       => B(1),
            Icarry => carry(1),
            Ocarry  => carry(2),
            Osum    => Sum(1)
        );

    sab3: adder1bit Port map (
            a       => A(2),
            b       => B(2),
            Icarry => carry(2),
            Ocarry  => carry(3),
            Osum    => Sum(2)
        );

    sab4: adder1bit Port map (
            a       => A(3),
            b       => B(3),
            Icarry => carry(3),
            Ocarry  => carry(4),
            Osum    => Sum(3)
        );
    Ocarry <= carry(4);
end Behavioral;