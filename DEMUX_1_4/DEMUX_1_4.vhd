LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity DEMUX_1_4 is
    port(
        X0 : in std_logic;
        S  : in std_logic_vector(1 downto 0);
        Y0 : out std_logic;
        Y1 : out std_logic;
        Y2 : out std_logic;
        Y3 : out std_logic);
End DEMUX_1_4;

Architecture Simple of DEMUX_1_4 is
    begin
        Y0 <= X0 AND NOT S(1) AND NOT S(0);
        Y1 <= X0 AND NOT S(1) AND S(0);
        Y2 <= X0 AND S(1) AND NOT S(0);
        Y3 <= X0 AND  S(1) AND S(0);
End Simple;