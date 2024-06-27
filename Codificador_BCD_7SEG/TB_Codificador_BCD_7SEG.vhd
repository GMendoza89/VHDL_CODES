
LIBRARY IEEE;
use IEEE.std_logic_1164.all;

Entity TB_Codificador_BCD_7SEG is
End TB_Codificador_BCD_7SEG;

Architecture simulation of TB_Codificador_BCD_7SEG is
    component Codificador_BCD_7SEG is
    port(
        X : in std_logic_vector(3 downto 0);
        Y : out std_logic_vector(6 downto 0)); -- abcdefg
    end component;
    signal X : std_logic_vector(3 downto 0);
    signal Y : std_logic_vector(6 downto 0);
    
    begin
        SIMBLK01 : Codificador_BCD_7SEG PORT MAP (X,Y);
        
        process
        begin
            --
            X <= "0000";
            wait for 20 ns;
            --
            X <= "0001";
            wait for 20 ns;
            --
            X <= "0010";
            wait for 20 ns;
            --
            X <= "0011";
            wait for 20 ns;
            --
            X <= "0100";
            wait for 20 ns;
            --
            X <= "0101";
            wait for 20 ns;
            --
            X <= "0110";
            wait for 20 ns;
            --
            X <= "0111";
            wait for 20 ns;
            --
            X <= "1000";
            wait for 20 ns;
            --
            X <= "1001";
            wait for 20 ns;
            --
            X <= "1010";
            wait for 20 ns;
            --
            X <= "1011";
            wait for 20 ns;
            --
            X <= "1100";
            wait for 20 ns;
            --
            X <= "1101";
            wait for 20 ns;
            --
            X <= "1110";
            wait for 20 ns;
            --
            X <= "1111";
            wait;
        end process;
End simulation;