-- Frecuencimetro Digital de 4 digitos
--
-- Frecuencia Base 50 MHz
--
--


LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity Frecuencimetro is
    Port(RST,CLK : in std_logic;
        Fx       : in std_logic;
        DU       : out std_logic_vector(7 downto 1);
        DD       : out std_logic_vector(7 downto 1);
        DC       : out std_logic_vector(7 downto 1);
        DM       : out std_logic_vector(7 downto 1));
End Frecuencimetro;

Architecture Bloques of Frecuencimetro is
    component Base_Tiempo 
        Port(CLK : in  std_logic;
             RST : in  std_logic;
             L   : out std_logic;
             C   : out std_logic;
             H   : out std_logic);
    end component;

    component Contador 
    Port(C  : in  std_logic;
         Fx : in std_logic;
         H  : in std_logic;
         N  : out std_logic_vector(15 downto 0));
    end component;

    component Registro
    Port(RST,CLK : in std_logic;
         L       : in std_logic;
         N       : in std_logic_vector(15 downto 0);
         Q       : out std_logic_vector(15 downto 0));
    end component;

    component BCD_7S
    Port(M : in  std_logic_vector(3 downto 0);
         S : out std_logic_vector(7 downto 1));
    end component;

    signal L,C,H : std_logic;
    signal N,Q   : std_logic_vector(15 downto 0);
    signal D1,D2,D3,D4: std_logic_vector(3 downto 0);
Begin
    D4 <= Q(15 downto 12);
    D3 <= Q(11 downto 8);
    D2 <= Q(7 downto 4);
    D1 <= Q(3 downto 0);
    --Generador de Base de tiempo
    Modulo_1: Base_Tiempo Port Map(CLK,RST,L,C,H);
    -- Contador de Pulsos
    Modulo_2: Contador Port Map(C,Fx,H,N);
    -- Registro Interno
    Modulo_3: Registro Port Map (RST,CLK,L,N,Q);
    -- Exhibicion
    Modulo_4: BCD_7S Port Map (D1,DU);
    Modulo_5: BCD_7S Port Map (D2,DD);
    Modulo_6: BCD_7S Port Map (D3,DC);
    Modulo_7: BCD_7S Port Map (D4,DM);
End Bloques;






