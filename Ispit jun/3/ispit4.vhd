----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:51:54 06/19/2024 
-- Design Name: 
-- Module Name:    ispit4 - Behavioral 
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

entity ispit4 is
Port ( clk : in std_logic;
       load : in std_logic;
       A : in std_logic_vector (15 downto 0);
       B : in std_logic_vector (15 downto 0);
       sum : out std_logic_vector (15 downto 0));
end ispit4;

architecture Behavioral of ispit4 is

	 signal B_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal sum_temp : STD_LOGIC_VECTOR (15 downto 0);
    signal B_reg_3to0 : STD_LOGIC_VECTOR (3 downto 0);
    signal A_3to0 : STD_LOGIC_VECTOR (3 downto 0);
    signal carry_in : STD_LOGIC := '0';
    signal carry_out : STD_LOGIC;
	 signal slow_clk: std_logic;
	 
	 component Adder4bit is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               sum : out STD_LOGIC_VECTOR (3 downto 0)
					);
    end component;
	 component clock_divider is
		Port(
		CLK_IN: in std_logic;
		CLK_OUT: out std_logic
	);
	end component;
begin
clk_divider: clock_divider port map(CLK_IN => clk, CLK_OUT => slow_clk);
	process(slow_clk)
	begin
	if rising_edge(slow_clk) then
            if load = '1' then
                B_reg <= B;
					 else

                B_reg_3to0 <= B_reg(3 downto 0);
                A_3to0 <= (others => '0') & A(3 downto 0); 
                Adder4bit_instance0: Adder4bit port map (A => A_3to0,  B=> B_reg_3to0, sum => sum_temp(3 downto 0));
                sum_temp(3 downto 0) <= (not B_reg_3to0) + '1'; 
                carry_in <= carry_out;

                B_reg_3to0 <= B_reg(7 downto 4);
                A_3to0 <= (others => '0') & A(7 downto 4); 
                Adder4bit_instance1: Adder4bit port map (A => A_3to0,  B=> B_reg_3to0, sum =>sum_temp(7 downto 4));
                sum_temp(7 downto 4) <= (not B_reg_3to0) + '1'; 
                carry_in <= carry_out;

                B_reg_3to0 <= B_reg(11 downto 8);
                A_3to0 <= (others => '0') & A(11 downto 8); 
                Adder4bit_instance2: Adder4bit port map (A => A_3to0,  B=> B_reg_3to0, sum => sum_temp(11 downto 8));
                sum_temp(11 downto 8) <= (not B_reg_3to0) + '1'; 
                carry_in <= carry_out;

                B_reg_3to0 <= B_reg(15 downto 12);
                A_3to0 <= (others => '0') & A(15 downto 12); 
                Adder4bit_instance3: Adder4bit port map ( A => A_3to0,  B=> B_reg_3to0, sum => sum_temp(15 downto 12));
                sum_temp(15 downto 12) <= (not B_reg_3to0) + '1'; 
                carry_in <= carry_out;
            end if;
        end if;
    end process;

    sum <= sum_temp;


end Behavioral;

