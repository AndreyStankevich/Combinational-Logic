library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end and3;

architecture Behavioral of and3 is

    component and2
	     port(
		      A, B : in std_logic;
				Z : out std_logic
	         );
    end component;

signal BC : std_logic;
begin
    AND_1 : and2 port map (A, BC, Z);
	 AND_2 : and2 port map (B, C, BC);
end Behavioral;

