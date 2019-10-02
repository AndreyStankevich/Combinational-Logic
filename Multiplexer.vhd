library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end Multiplexer;

architecture struct of Multiplexer is

	 component and2
	     port(
		      A, B : in std_logic;
				Z : out std_logic
	         );
    end component;

    component inv
        port(
            A : in std_logic;
				nA : out std_logic
				);
    end component;

    component or2
        port(
		      A, B : in std_logic;
				Z : out std_logic
				);
    end component;					

signal nS, AnS, BS : std_logic;
begin
    U1 : inv port map (S, nS);
	 U2 : and2 port map (A, nS, AnS);
	 U3 : and2 port map (S, B, BS);
	 U4 : or2 port map (BS, AnS, Z);
end struct;

architecture beh of Multiplexer is
begin
    Z <= A when S='0' else B;
end beh;

