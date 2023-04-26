------------------------------------------------------------
--
-- Example of 2-bit binary comparator using the when/else
-- assignments.
-- EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- Entity declaration for 2-bit binary comparator
------------------------------------------------------------
entity signal_behavorial is
    port (
        clk   : in std_logic;
        en   : in std_logic;
        sig_i : in std_logic_vector(9 downto 0);
        sig_o : out std_logic
    );
end entity;

architecture behavioral of signal_behavorial is
    signal timer : integer range 0 to 40000000;
    signal sig_o_p: std_logic_vector(1 downto 0);
    signal sig_i_p: std_logic_vector(9 downto 0);
    type state_type is (idle, state_1, state_2, gap);
    signal state : state_type := idle;
    signal counter : integer range 0 to 40000000;
begin

    p_1: process (clk)
    begin
                if(timer = 0) then
                sig_i_p <= sig_i;
                sig_o <= '0';
                end if;
     if rising_edge(clk) then
                if(en = '1' and sig_i_p /= "0000000000") then
                timer <= timer + 1; 
                if timer >= 0 and timer < 20 then     
                    sig_o_p <= sig_i(9 downto 8);
                elsif timer >= 20 and timer < 21 then               
                    sig_o_p <= "10";
                elsif timer >= 21 and timer < 40 then               
                    sig_o_p <= sig_i(7 downto 6);
                elsif timer >= 40 and timer < 41 then               
                    sig_o_p <= "10";
                elsif timer >= 41 and timer < 60 then              
                    sig_o_p <= sig_i(5 downto 4);
                elsif timer >= 60 and timer < 61 then               
                    sig_o_p <= "10";
                elsif timer >= 61 and timer < 80 then     
                    sig_o_p <= sig_i(3 downto 2);
                elsif timer >= 80 and timer < 81 then               
                    sig_o_p <= "10";
                elsif timer >= 81 and timer < 99 then    
                    sig_o_p <= sig_i(1 downto 0);  
                elsif timer >= 99 and timer < 100 then    
                    sig_o_p <= "10";        
                elsif timer >= 100 then
                    timer <= 0;
                    sig_o <= '0';
                    sig_i_p <= "0000000000";
                end if;
                -----------------------
                
    
        
            case state is
                when idle =>
                    if sig_o_p = "11" then
                        sig_o <= '1';
                        counter <= 0;
                        state <= state_1;
                    elsif sig_o_p = "01" then
                        sig_o <= '1';
                        counter <= 0;
                        state <= state_2;
                    elsif sig_o_p = "10" then
                        sig_o <= '0';
                        counter <= 0;
                        state <= gap;    
                    elsif sig_o_p = "00" then
                        sig_o <= '0';
                        counter <= 0;
                        state <= idle;
                    else
                        -- Handle error cases
                    end if;
                when state_1 =>
                    counter <= counter + 1;
                    if counter >= 0 and counter < 15 then
                        sig_o <= '1';

                    elsif counter >= 15 and counter <= 20 then
                        sig_o <= '0';
                    else 
                        counter <= 0;
                        sig_o <= '0';
                        state <= gap;
                    end if;
                when state_2 =>
                    counter <= counter + 1;
                    if counter >= 0 and counter < 7 then
                        sig_o <= '1';

                    elsif counter >= 7 and counter <= 20 then
                        sig_o <= '0';
                    else 
                        counter <= 0;
                        sig_o <= '0';
                        state <= gap;
                    end if;
                when gap =>
                        --sig_o <= '0';
                        counter <= 0;
                        state <= idle;
                when others =>
                        sig_o <= '0';
                        counter <= 0;
                        state <= idle;
            end case;
        --end if;

                ----------------------

                end if;
     end if;
    end process;
    

end architecture;