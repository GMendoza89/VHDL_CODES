LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
entity ALU_SevenSegments is
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
end ALU_SevenSegments;
Architecture Behavioral of ALU_SevenSegments is
    component ALU is
        generic (n     : integer := 8;
             mid_n : integer := 4);
        port(    A : in  std_logic_vector(n-1 downto 0);
                B : in  std_logic_vector(n-1 downto 0);
                S : in  std_logic_vector(3 downto 0);
                R : out std_logic_vector(n-1 downto 0);
                Sn : out std_logic;
                Z : out std_logic;
                V : out std_logic;
                C : out std_logic;
                G : out std_logic;
                L : out std_logic;
                E : out std_logic);
    end component;

    component binary_SevenSegments is
        port(
            X : in  std_logic_vector(7 downto 0);
            Y : out std_logic_vector(27 downto 0));
        END component;
    signal R : std_logic_vector(n-1 downto 0);
    Begin
        Bloque01: ALU PORT MAP (A,B,S,R,Sn,Z,V,C,G,L,E);
        Bloque02: binary_SevenSegments PORT MAP (R,D);
END Behavioral;


