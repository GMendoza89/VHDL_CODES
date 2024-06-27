LIBRARY IEEE;
use IEEE.std_logic_1164.all;

Entity  ccom_7 is
    generic(n : integer := 7);
    port(
        A  : in  std_logic_vector(n-1 downto 0); -- Operandos
        B  : in  std_logic_vector(n-1 downto 0); -- Operando
        Gi : in  std_logic;                      -- Ganancia de entrada Bandera
        Ei : in  std_logic;                      -- Empate de entrada Bandera
        Li : in  std_logic;                      -- Perdida de entrada Bandera
        Go : out std_logic;                      -- Ganancia de Salida Bandera
        Eo : out std_logic;                      -- Empate de salida Bandera
        Lo : out std_logic );                    -- Perdida de Salida Bander
End ccom_7;

Architecture complete of ccom_7 is
    signal G, E, L : std_logic_vector(n downto 0);
begin
    process(A,B,Gi,Ei,Li,G,E,L)
    begin
        G(n)<= Gi;
        E(n)<= Ei;
        L(n)<= Li;
        for i in n-1 downto 0 loop
            G(i) <= G(i+1) OR(E(i+1) AND (A(i) AND NOT(B(i))));
            E(i) <= E(i+1)AND(A(i) XNOR B(i));
            L(i) <= L(i+1)OR((E(i+1)) AND (NOT(A(i))AND B(i)));
        end loop;
    end process;
    Go <= G(0);
    Eo <= E(0);
    Lo <= L(0);
End complete;
