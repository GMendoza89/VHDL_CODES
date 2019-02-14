-- Comparador generico de n bits con n = 8
--
-- Componentes del comparador
--          comparator(A,B,G,E,L)
-- Terminal  Tipo      Bits    Descripsión
--     A    Entrada      n     Operando A
--     B    Entrada      n     Operando B
--     G    Salida       1     Bandera A > B
--     L    Salida       1     Bandera A < B
--     E    Salida       1     Bandera A = B


Library IEEE;
USE IEEE.std_logic_1164.all;

Entity comparator is
  generic(n : integer := 8);
  port( A : in  std_logic_vector(n-1 downto 0);
        B : in  std_logic_vector(n-1 downto 0);
        G : out std_logic;
        E : out std_logic;
        L : out std_logic);
End comparator;

Architecture BehaviorAL of comparator is
component mcom_1
    port(
        A  : in  std_logic;
        B  : in  std_logic;
        Go : out std_logic;
        Eo : out std_logic;
        Lo : out std_logic );
end Component;

Component ccom_7
    generic(n : integer := 7);
    port(
        A  : in  std_logic_vector(n-1 downto 0); -- Operandos
        B  : in  std_logic_vector(n-1 downto 0); -- Operando
        Gi : in  std_logic;
        Ei : in  std_logic;
        Li : in  std_logic;
        Go : out std_logic;
        Eo : out std_logic;
        Lo : out std_logic );
end Component;
signal Gi, Ei, Li : std_logic;
begin
  Block_one : mcom_1 Port Map (A(n-1),B(n-1),Gi,Ei,Li);                             -- Se comparan los bits mas Significativos
  BloCk_two : ccom_7 Port Map (A(n-2 downto 0), B(n-2 downto 0),Gi,Ei,Li,G,E,L);    -- Se sigue la comparación en cascada
End Behavioral;

