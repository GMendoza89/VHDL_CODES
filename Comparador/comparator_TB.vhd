Library IEEE;
USE IEEE.std_logic_1164.all;

Entity comparator_TB is
  generic(n : integer := 8);
End comparator_TB;

Architecture Simulation of comparator_TB is
    signal A,B  : std_logic_vector(n-1 downto 0);
    signal G,E,L: std_logic;
   Component  comparator
    generic(n : integer := 8);
     port( A : in  std_logic_vector(n-1 downto 0);
        B : in  std_logic_vector(n-1 downto 0);
        G : out std_logic;
        E : out std_logic;
        L : out std_logic);
    end component;
Begin
    SimBLK00: comparator Port Map(A,B,G,E,L);
    process
    begin
        --Primer Segmento de simulación
        A <= "10101111";
        B <= "10101110";
        wait for 20 ns;
         --Segundo Segmento de simulación
        A <= "10001111";
        B <= "10101110";
        wait for 20 ns;
        -- Tercer Segmento de simulación
        A <= "10101111";
        B <= "10101111";
        wait for 20 ns;
        -- Termina simulación
        A <= "00000000";
        B <= "00000000";
        wait;
   end process;
End Simulation;
 
