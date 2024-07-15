----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:08 05/18/2024 
-- Design Name: 
-- Module Name:    dec3-8 - Behavioral 
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

entity dec3-8 is
port(
	d_in: in std_logic_vector(2 downto 0);
	d_out: out std_logic_vector(7 downto 0)
);
end dec3-8;

architecture Behavioral of dec3-8 is

component Dec2to4 is
port(
	d1_in: in std_logic_vector(1 downto 0);
	en: in std_logic;
	d1_out: out std_logic_vector(3 downto 0)
);
end component;

begin

dec1: Dec2to4 port map(en => d_in(2), d1_in(1) => d_in(1), d1_in(0) => d_in(0), d1_out(3 downto 0) => d_out(7 downto 4));
dec2: Dec2to4 port map(en => not(d_in(2)), d1_in(1) => d_in(1), d1_in(0) => d_in(0), d1_out(3 downto 0) => d_out(3 downto 0));

end Behavioral;
