-- Sumador de N bits
-- Autor Gustavo David Mendoza Pinto
-- Circuitos Lógicos
-- Feb 12 2018

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Sumador_nbits is 
    generic(n : integer :=4);
    port(
    A,B : in  std_logic_vector(n-1 downto 0);
    Cin : in  std_logic;
    S   : out std_logic_vector(n-1 downto 0);
    Cout: out std_logic
    );
End Sumador_nbits;

Architecture Combinational of Sumador_nbits is
    Signal C : std_logic_vector(n downto 0);
begin
    Process(A,B,Cin,C)
    begin
        C(0) <= Cin;
        for i in 0 to n-1 loop
            S(i) <= A(i) XOR B(i) XOR C(i);
            C(i+1) <= (A(i) AND B(i)) OR (A(i) AND C(i)) OR (B(i) AND C(i));
        end loop;
        Cout <= C(n);
    end Process;
End Combinational;
