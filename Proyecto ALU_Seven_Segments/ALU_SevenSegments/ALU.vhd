-- Alu completa de n bits en n = 8
--
-- Componentes de la ALU 
--      AlU(A ,B ,S, R, NF, ZF, VF, CF)
--
-- Terminal  Tipo      Bits    Descripsión
--     A    Entrada      n     Operando A
--     B    Entrada      n     Operando B
--     S    Entrada      4     Selector de Operacón  
--                               0000    A+B
--                               0001    A AND B
--                               0010    Clear A
--                               0011    NOT A
--                               0100    Comparar A con B
--                               0101    A - 1
--                               0110    A + 1
--                               0111    A OR B
--                               1000    A MOV W
--                               1001    A Complemento a 2
--                               1010    Rotar bit a la izquierda
--                               1011    Rotar bit a la derecha
--                               1100    SET A
--                               1101    A - B
--                               1110    SWAP A
--                               1111    A XOR B
--     R    Salida       n     Resultado  
--     Sn   Salida       1     Negativo
--     Z    Salida       1     zero
--     V    Salida       1     Sobreflujo
--     C    Salida       1     Acarreo de Salida
--     G    Salida       1     Bandera A > B
--     L    Salida       1     Bandera A < B
--     E    Salida       1     Bandera A = B

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
Entity ALU is
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
End ALU;

Architecture Behavioral of ALU is
Component comparator
  generic(n : integer := 8);
  port( A : in  std_logic_vector(n-1 downto 0);
        B : in  std_logic_vector(n-1 downto 0);
        G : out std_logic;
        E : out std_logic;
        L : out std_logic);
  end Component;
    signal M, P     : std_logic_vector(n-1 downto 0);
    signal Go,Eo,Lo : std_logic;
    signal Zero     : std_logic_vector(n-1 downto 0) := (others => '0');
begin
  
    CMP : comparator Port Map (A,B,Go,Eo,Lo);
	 Zero <= "00000000";

    Combinational : process(A,B,S,M,P,Zero,Go,Eo,Lo)
        Variable S_0  : unsigned(n downto 0); -- Reslutado de operacion en estado 0 suma de dos entradas
        Variable S_5  : unsigned(n downto 0); -- resultado de operasion en estado 5 resta 1 a A 
        Variable S_6  : unsigned(n downto 0); -- Resultado de operasion en estado 6 suma 1 a A
        variable S_9  : unsigned(n downto 0); -- Resultado de oprecion en estado 9 complemento a 2
        Variable S_13 : unsigned(n downto 0); -- Resultado de operacion en estado 13 resta a B a A
    begin
        S_0 := unsigned('0' & A) + unsigned('0'& B);
        S_5 := unsigned('0' & A) - unsigned(Zero & '1');
        S_6 := unsigned('0' & A) + unsigned(Zero & '1');
        S_9 := unsigned('0' & NOT(A)) + unsigned(Zero & '1');
        S_13 := unsigned('0' & A) + unsigned('0'& NOT(B));
        
        Case S is

            when "0000" =>                                           -- Operación Suma A+B
                M <= std_logic_vector(S_0(n-1 downto 0));
                C <= std_logic(S_0(n));
                V <= (A(n-1) AND B(n-1) AND (NOT(M(n-1))))OR((NOT(A(n-1))) AND (NOT(B(n-1))) AND M(n-1));
                G <='0';
                L <='0';
                E <='0';
            when "0001" =>                                            --Operación A AND B
                M <= A AND B;
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <='0';
            when "0010" =>                                            -- Operacion Clear
                M <= (others => '0');
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <='0';
             when "0011" =>                                           -- Operación NOT A
                M <= NOT(A);
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <='0';
             when "0100" =>                                           -- Comparación A a B
                M <= (others => '0');
                C <='0';
                V <='0';
                G <= Go;
                L <= Lo;
                E <= Eo;
            when "0101" =>                                             -- Operacion A - 1
                M <= std_logic_vector(S_5(n-1 downto 0));
                C <= std_logic(S_5(n));
                V <= (A(n-1) AND B(n-1) AND (NOT(M(n-1))))OR((NOT(A(n-1))) AND (NOT(B(n-1))) AND M(n-1));
                G <='0';
                L <='0';
                E <='0';
            when "0110" =>                                             -- Operacion A + 1
                M <= std_logic_vector(S_6(n-1 downto 0)); 
                C <= std_logic(S_6(n));
                V <= (A(n-1) AND B(n-1) AND (NOT(M(n-1))))OR((NOT(A(n-1))) AND (NOT(B(n-1))) AND M(n-1));
                G <='0';
                L <='0';
                E <='0';
              when "0111" =>                                           -- Operación A OR B
                M <= A OR B;
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <= '0';
              when "1000" =>                                           -- Mover A a F
                M <= A;
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <= '0';
              when "1001" =>                                            -- A Complemento a 2
                M <= std_logic_vector(S_9(n-1 downto 0));
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <= '0';
              when "1010" =>
                M(n-1 downto 1) <= A(n-2 downto 0);                    -- Rotar un bit a la Izquierda
                M(0) <= M(n-1);
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E<='0';
               when "1011" =>
                M(n-2 downto 0) <= A(n-1 downto 1);                   --Rotar un bit a la derecha
                M(n-1) <= M(0);
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <= '0';
               when "1100" =>                                         -- Poner Registro F en 1
                M <= (others => '1');
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <= '0';
               when "1101" =>                                         -- Operasión A - B
                M <= std_logic_vector(S_13(n-1 downto 0));
                C <= std_logic(S_13(n));
                V <= (A(n-1) AND B(n-1) AND (NOT(M(n-1))))OR((NOT(A(n-1))) AND (NOT(B(n-1))) AND M(n-1));
                G <='0';
                L <='0';
                E <='0';
             when "1110" =>                                           -- Operasión Swap A
                M(n-1 downto mid_n) <= A(mid_n-1 downto 0);
                M(mid_n-1 downto 0) <= A(n-1 downto mid_n);
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <='0';  
             when others  =>                                          -- Operasión A XOR B
                M <= A XOR B;
                C <='0';
                V <='0';
                G <='0';
                L <='0';
                E <='0';
         end case;
         R <= M;
         Sn <= M(n-1);
         P(0) <= M(0);

         for i in 1 to n-1 loop
             P(i) <= P(i-1) or M(i);
         end loop;
         Z <= NOT(P(n-1));
     end Process Combinational;
 End Behavioral;
