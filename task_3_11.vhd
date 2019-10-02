library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task_3_11 is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           F : out  STD_LOGIC;
           G : out  STD_LOGIC);
end task_3_11;

architecture struct of task_3_11 is

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

signal nY, nX, XY, nXnY, nXZ, YZ : std_logic;
begin
    INV_1 : inv port map (Y, nY);
	 INV_2 : inv port map (X, nX);
	 AND_1 : and2 port map (X, Y, XY);
	 AND_2 : and2 port map (Y, Z, YZ);
	 AND_3 : and2 port map (nX, nY, nXnY);
	 AND_4 : and2 port map (nX, Z, nXZ);
	 OR_1 : or2 port map (XY, YZ, F);
	 OR_2 : or2 port map (nXnY, nXZ, G);
end struct;

architecture beh of task_3_11 is
begin
    F <= (X and Y) or (Y and Z);
	 G <= ((not X) and (not Y)) or ((not X) and Z);
end;

