----------------------------------------------------------
--
-- Testbench for 7-segment display decoder.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Definition of "to_unsigned"

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_hex_7seg is
  -- Entity of testbench is always empty
end entity tb_hex_7seg;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_hex_7seg is

  -- Testbench local signals
  signal sig_blank : std_logic;
  signal sig_hex   : std_logic_vector(9 downto 0);
  signal sig_seg   : std_logic_vector(6 downto 0);

begin

  -- Connecting testbench signals with decoder entity
  -- (Unit Under Test)
  uut_hex_7seg : entity work.hex_7seg
    port map (
      reset => sig_blank,
      hex   => sig_hex,
      seg   => sig_seg
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    sig_blank <= '0';    -- Normal operation
    sig_hex   <= "1111111111"; -- Some default value
    wait for 50 ns;

    sig_blank <= '1';    -- Blank display
    wait for 115 ns;
    sig_blank <= '0';    -- Normal operation
    wait for 25 ns;

    -- Loop for all hex values
    

      -- Convert ii decimal value to 4-bit wide binary
      -- sig_hex <= std_logic_vector(to_unsigned(ii, sig_hex'length));
    
     

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
