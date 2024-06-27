-- Maquina expendedora

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

Entity maquina_expendedora is
    port(
        RST : in  std_logic;    -- Reset Maestro
        CLK : in  std_logic;    -- Relog Maestro
        U   : in  std_logic;    -- Moneda de $1
        D   : in  std_logic;    -- Moneda de $2
        C   : out std_logic;    -- Cambio
        P   : out std_logic);   -- Producto
End maquina_expendedora;

Architecture FSM of maquina_expendedora is
    signal Qn, Qp : std_logic_vector( 2 downto 0); -- Estados de la maquina
    begin
        Combinacional: process(Qp,U,D)
            begin
                case Qp is
                    when "000" => -- Estado Inicial 
                        C <= '0';
                        P <= '0';
                        if(U = '1') then
                            Qn <= "001";
                        elsif (D = '1') then
                            Qn <= "010";
                        else
                            Qn <= Qp;
                        end if;
                    when "001" => -- Acumulado $1
                        C <= '0';
                        P <= '0';
                        if(U = '1') then
                            Qn <= "010";
                        elsif (D = '1') then
                            Qn <= "011";
                        else
                            Qn <= Qp;
                        end if;
                    when "010" => -- Acumulado $2
                        C <= '0';
                        P <= '0';
                        if(U = '1') then
                            Qn <= "011";
                        elsif (D = '1') then
                            Qn <= "100";
                        else
                            Qn <= Qp;
                        end if;
                    when "011" => -- Acumulado $3
                        C <= '0';
                        P <= '1';
                
                        Qn <= "000";
                    when others =>
                        C <= '1';
                        P <= '1';
                
                        Qn <= "000";
                    end case;
            end process Combinacional;

    Secuencial: process(RST,CLK,Qn)
    begin
        if(RST <= '0') then
            Qp <= "000";
        elsif (CLK 'event AND CLK = '1') then
            Qp <= Qn;
        end if;
    end process Secuencial;
end FSM;
                        