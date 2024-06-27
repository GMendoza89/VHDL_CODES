LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity TB_ALU_SevenSegments is
    generic(n : integer :=8);
End TB_ALU_SevenSegments;

Architecture Simulation of TB_ALU_SevenSegments is
signal A,B            : std_logic_vector(n-1 downto 0);
signal D              : std_logic_vector(27 downto 0);
signal S              : std_logic_vector(3 downto 0);
signal Sn,Z,V,C,G,L,E : std_logic;
component ALU_SevenSegments is
    generic (n     : integer := 8);
      port (
                 A : in  std_logic_vector(n-1 downto 0);              -- Entrada A
                 B : in  std_logic_vector(n-1 downto 0);              -- Entrada B
                 S : in  std_logic_vector(3 downto 0);              -- Selector de operación
                 D : out std_logic_vector(27 downto 0);             -- Salida de Siete Segmentos
                 Sn : out std_logic;                                --     Sn   Salida       1     Negativo
                 Z : out std_logic;                                 --     Z    Salida       1     zero
                 V : out std_logic;                                 --     V    Salida       1     Sobreflujo
                 C : out std_logic;                                 --     C    Salida       1     Acarreo de Salida
                 G : out std_logic;                                 --     G    Salida       1     Bandera A > B
                 L : out std_logic;                                 --     L    Salida       1     Bandera A < B
                 E : out std_logic);                                --     E    Salida       1     Bandera A = B 
end component;
begin 
    SimBlk: ALU_SevenSegments PORT MAP (A, B, S, D, Sn, Z, V, C, G, L, E);
    process
    begin
        -- PRIMER CICLO DE TRABAJO
        -- Sumar
        A <= "01011101";
        B <= "11001100";
        S <= "0000";
        wait for 20 ns;
        -- AND
        A <= "01111101";
        B <= "11001110";
        S <= "0001";
        wait for 20 ns;
        -- CLEAR
        A <= "01011101";
        B <= "11011100";
        S <= "0010";
        wait for 20 ns;
        -- NOT
        A <= "01011101";
        B <= "11001110";
        S <= "0011";
        wait for 20 ns;
        -- COMPARAR
        A <= "01011101";
        B <= "11000000";
        S <= "0100";
        wait for 20 ns;
        -- A - 1
        A <= "01111101";
        B <= "11001110";
        S <= "0101";
        wait for 20 ns;
        -- A + 1
        A <= "01011101";
        B <= "11001100";
        S <= "0110";
        wait for 20 ns;
        -- OR
        A <= "01011101";
        B <= "10001110";
        S <= "0111";
        wait for 20 ns;
        -- MOV
        A <= "01011101";
        B <= "11001100";
        S <= "1000";
        wait for 20 ns;
        -- COMPLEMENTO A 2
        A <= "01001101";
        B <= "11000010";
        S <= "1001";
        wait for 20 ns;
        -- ROTAR A LA IZQ
        A <= "01000001";
        B <= "11000000";
        S <= "1010";
        wait for 20 ns;
        -- ROTAR A LA DER
        A <= "00001101";
        B <= "11001110";
        S <= "1011";
        wait for 20 ns;
        -- SET
        A <= "00000101";
        B <= "11001100";
        S <= "1100";
        wait for 20 ns;
        -- RESTA
        A <= "01111101";
        B <= "11001110";
        S <= "1101";
        wait for 20 ns;
        -- SWAP
        A <= "00011101";
        B <= "00011100";
        S <= "1110";
        wait for 20 ns;
        -- XOR
        A <= "01011101";
        B <= "11001110";
        S <= "1111";
        wait for 20 ns;
        -- SWEGUNDO CICLO DE TRABAJO
        -- Sumar
        A <= "01011111";
        B <= "11001100";
        S <= "0000";
        wait for 20 ns;
        -- AND
        A <= "01111101";
        B <= "11001110";
        S <= "0001";
        wait for 20 ns;
        -- CLEAR
        A <= "01111101";
        B <= "11111100";
        S <= "0010";
        wait for 20 ns;
        -- NOT
        A <= "01111101";
        B <= "11001110";
        S <= "0011";
        wait for 20 ns;
        -- COMPARAR
        A <= "01011101";
        B <= "01000000";
        S <= "0100";
        wait for 20 ns;
        -- A - 1
        A <= "00000000";
        B <= "11001110";
        S <= "0101";
        wait for 20 ns;
        -- A + 1
        A <= "11111111";
        B <= "11001100";
        S <= "0110";
        wait for 20 ns;
        -- OR
        A <= "01011111";
        B <= "10001110";
        S <= "0111";
        wait for 20 ns;
        -- MOV
        A <= "01011111";
        B <= "11001100";
        S <= "1000";
        wait for 20 ns;
        -- COMPLEMENTO A 2
        A <= "01001111";
        B <= "11000010";
        S <= "1001";
        wait for 20 ns;
        -- ROTAR A LA IZQ
        A <= "01000011";
        B <= "11000000";
        S <= "1010";
        wait for 20 ns;
        -- ROTAR A LA DER
        A <= "00001111";
        B <= "11001110";
        S <= "1011";
        wait for 20 ns;
        -- SET
        A <= "11000101";
        B <= "11001100";
        S <= "1100";
        wait for 20 ns;
        -- RESTA
        A <= "01111101";
        B <= "00001110";
        S <= "1101";
        wait for 20 ns;
        -- SWAP
        A <= "00011100";
        B <= "00011100";
        S <= "1110";
        wait for 20 ns;
        -- XOR
        A <= "01010000";
        B <= "11001110";
        S <= "1111";
        wait for 20 ns;
        -- TERCER  CICLO DE TRABAJO
        -- Sumar
        A <= "01011101";
        B <= "10000010";
        S <= "0000";
        wait for 20 ns;
        -- AND
        A <= "01111101";
        B <= "11000010";
        S <= "0001";
        wait for 20 ns;
        -- CLEAR
        A <= "01011101";
        B <= "11011100";
        S <= "0010";
        wait for 20 ns;
        -- NOT
        A <= "01011101";
        B <= "11001110";
        S <= "0011";
        wait for 20 ns;
        -- COMPARAR
        A <= "01011101";
        B <= "01011101";
        S <= "0100";
        wait for 20 ns;
        -- A - 1
        A <= "00000001";
        B <= "11001110";
        S <= "0101";
        wait for 20 ns;
        -- A + 1
        A <= "00000000";
        B <= "11001100";
        S <= "0110";
        wait for 20 ns;
        -- OR
        A <= "01011101";
        B <= "10001110";
        S <= "0111";
        wait for 20 ns;
        -- MOV
        A <= "01011101";
        B <= "11001100";
        S <= "1000";
        wait for 20 ns;
        -- COMPLEMENTO A 2
        A <= "01001101";
        B <= "11000010";
        S <= "1001";
        wait for 20 ns;
        -- ROTAR A LA IZQ
        A <= "01000001";
        B <= "11000000";
        S <= "1010";
        wait for 20 ns;
        -- ROTAR A LA DER
        A <= "00001101";
        B <= "11001110";
        S <= "1011";
        wait for 20 ns;
        -- SET
        A <= "00000101";
        B <= "11001100";
        S <= "1100";
        wait for 20 ns;
        -- RESTA
        A <= "01111101";
        B <= "11001110";
        S <= "1101";
        wait for 20 ns;
        -- SWAP
        A <= "00011101";
        B <= "00011100";
        S <= "1110";
        wait for 20 ns;
        -- XOR
        A <= "01011101";
        B <= "11001110";
        S <= "1111";
        wait;
    end Process;
End Simulation;
