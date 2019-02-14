LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

Entity SumRes_nbits is
    generic(n : integer := 4);
    Port(
        A,B : in  std_logic_vector(n-1 downto 0);  -- Operandos
        Cin : in  std_logic;                       -- Acarreo de entrada
        X   : in  std_logic;                       -- Selector
        S   : out std_logic_vector(n-1 downto 0);  -- Salida
        Cout: out std_logic);                      -- Acarreo de salida
End SumRes_nbits;

Architecture Behavioral of SumRes_nbits is
    signal C   : std_logic;                         -- Acarreos intermedio
    signal P,V : std_logic_vector(n-1 downto 0);    -- Complemento de B Inversion
    Component Sumador_nbits 
    generic(n : integer :=4);
    port(
        A,B : in  std_logic_vector(n-1 downto 0);
        Cin : in  std_logic;
        S   : out std_logic_vector(n-1 downto 0);
        Cout: out std_logic);
    end Component;
Begin
    V <= (others => X);
    P <= B XOR V;
    C <= Cin XOR X;
    
    SUM : Sumador_nbits Port Map (A,P,C,S,Cout);
End BehavioraL;

