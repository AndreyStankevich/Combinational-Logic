library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux is
    Port ( X : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Z1 : out  STD_LOGIC;
           Z2 : out  STD_LOGIC);
end demux;

architecture Behavioral of demux is

    component inv
        port(
            A : in std_logic;
				nA : out std_logic
				);
    end component;
	 
	 component and2
	     port(
		      A, B : in std_logic;
				Z : out std_logic
	         );
    end component;

signal nS : std_logic;
begin
    INV_1 : inv port map (S, nS);
	 AND_1 : and2 port map (nS, X, Z1);
	 AND_2 : and2 port map (S, X, Z2);
end Behavioral;

