--  Banco de pruebas de Decodificador hexadecimal (binario) a display Siete Segmentos de ánodo común
-- Autor: Ing. Gustavoo David Mendoza Pinto
--
--            a
--           ----
--          |    | b
--       f  |  g |
--           ----
--          |    | c
--       e  |  d |
--           ----
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity TB_seven_segment_hexadecimal_encoder_CA is

End TB_seven_segment_hexadecimal_encoder_CA;

Architecture simulation of TB_seven_segment_hexadecimal_encoder_CA is
    component seven_segment_hexadecimal_encoder_CA is
        port(
            inputX : in std_logic_vector(3 downto 0);
            outputDisplay : out std_logic_vector(6 downto 0));
    end component;
    signal X : std_logic_vector(3 downto 0);
    signal D : std_logic_vector(6 downto 0);
    Begin
        SimutationBlock: seven_segment_hexadecimal_encoder_CA PORT MAP(x,d);
        process
        begin
            X <= "0000"; -- 0
            wait for 20 ns;
            X <= "0001"; -- 1
            wait for 20 ns;
            X <= "0010"; -- 2
            wait for 20 ns;
            X <= "0011";  --3
            wait for 20 ns;
            X <= "0100"; -- 4
            wait for 20 ns;
            X <= "0101"; -- 5
            wait for 20 ns;
            X <= "0110"; -- 6
            wait for 20 ns;
            X <= "0111"; -- 7
            wait for 20 ns;
            X <= "1000"; -- 8
            wait for 20 ns;
            X <= "1001"; -- 9
            wait for 20 ns;
            X <= "1010"; -- A
            wait for 20 ns;
            X <= "1011"; -- B
            wait for 20 ns;
            X <= "1100"; -- C
            wait for 20 ns;
            X <= "1101"; -- D
            wait for 20 ns;
            X <= "1110"; -- E
            wait for 20 ns;
            X <= "1111"; -- F
            wait;
        end process;
End simulation;




