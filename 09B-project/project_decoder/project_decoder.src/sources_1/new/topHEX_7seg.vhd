----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/12/2023 11:32:30 AM
-- Design Name:
-- Module Name: topHEX_7seg - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity tophex_7seg is
  port (
    CA        : out   std_logic;
    CB        : out   std_logic;
    CC        : out   std_logic;
    CD        : out   std_logic;
    CE        : out   std_logic;
    CF        : out   std_logic;
    CG        : out   std_logic;
    AN        : out   std_logic_vector(7 downto 0);
    BTNC      : in    std_logic;
    CLK100MHZ : in    std_logic;
    BTNU       : in    std_logic
  );
end entity tophex_7seg;

architecture behavioral of tophex_7seg is

  signal sig_en       : std_logic;
  signal sig_en_25    : std_logic;
  signal sig_7segment : std_logic_vector(9 downto 0);

begin

  hex2seg : entity work.hex_7seg

    port map (
      reset  => BTNC,
      hex    => sig_7segment,
      seg(6) => CA,
      seg(5) => CB,
      seg(4) => CC,
      seg(3) => CD,
      seg(2) => CE,
      seg(1) => CF,
      seg(0) => CG
    );

  input : entity work.receiver
    port map (
      clk    => CLK100MHZ,
      rst    => BTNC,
      en     => sig_en,
      input  => BTNU,
      output => sig_7segment
    );

  clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 4
      -- FOR IMPLEMENTATION, CHANGE THIS VALUE TO 400,000
      -- 4      @ 4 ns
      -- 400000 @ 4 ms
      g_max => 20000000
    )
    port map (
      clk => CLK100MHZ,
      rst => BTNC,
      ce  => sig_en
    );

  an <= b"1111_1110";

end architecture behavioral;