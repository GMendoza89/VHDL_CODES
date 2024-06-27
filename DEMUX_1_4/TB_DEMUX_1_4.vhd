LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity TB_DEMUX_1_4 is

END TB_DEMUX_1_4;

Architecture Simulation of TB_DEMUX_1_4 is
    Component DEMUX_1_4 is 
        port(
            X0 : in std_logic;
            S  : in std_logic_vector(1 downto 0);
            Y0 : out std_logic;
            Y1 : out std_logic;
            Y2 : out std_logic;
            Y3 : out std_logic);
        end Component;
    signal X0, Y0, Y1, Y2, Y3 : std_logic;
    signal S : std_logic_vector(1 downto 0);
    begin
        SIMBLK00 : DEMUX_1_4 PORT MAP (X0,S,Y0,Y1,Y2,Y3);
        process
        begin
            --
            X0 <= '0';
            S  <= "00";
            wait for 20 ns;
            --
            X0 <= '1';
            S  <= "00";
            wait for 20 ns;
            --
            X0 <= '1';
            S  <= "01";
            wait for 20 ns;
            --
            X0 <= '0';
            S  <= "01";
            wait for 20 ns;
            --
            X0 <= '0';
            S  <= "10";
            wait for 20 ns;
            --
            X0 <= '1';
            S  <= "10";
            wait for 20 ns;
            --
            X0 <= '1';
            S  <= "11";
            wait for 20 ns;
            X0 <= '0';
            S  <= "11";
            wait;

    end process;
end Simulation;

