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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topHEX_7seg is
  Port ( 
    CA   : out   std_logic;
    CB   : out   std_logic;
    CC   : out   std_logic;
    CD   : out   std_logic;
    CE   : out   std_logic;
    CF   : out   std_logic;
    CG   : out   std_logic;
    AN   : out   std_logic_vector(7 downto 0);
    BTNC : in    std_logic;
    CLK100MHZ :  in   std_logic;
    BTNL    :in std_logic;
    BTNR    :in std_logic;
    LED : out std_logic
    
  );
end topHEX_7seg;

architecture Behavioral of topHEX_7seg is
signal sig_en : std_logic;
signal sig_en_25 : std_logic;
signal sig_7segment : std_logic_vector (9 downto 0);
begin
 hex2seg : entity work.hex_7seg
 
      port map(
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
      input: entity work.input
      port map(
       clk      => CLK100MHZ,
       rst      =>BTNC,
       dot      =>BTNL,
       dash     =>BTNR,
       letter   =>sig_7segment,
       en => sig_en
      );
      
      clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 4
      -- FOR IMPLEMENTATION, CHANGE THIS VALUE TO 400,000
      -- 4      @ 4 ns
      -- 400000 @ 4 ms
      g_MAX => 25000000
    )
    port map (
      clk => CLK100MHZ, --clk misto ce
      rst => BTNC,
      ce  => sig_en
    );
      
            clk_en1 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 4
      -- FOR IMPLEMENTATION, CHANGE THIS VALUE TO 400,000
      -- 4      @ 4 ns
      -- 400000 @ 4 ms
      g_MAX => 25000000/10
    )
    port map (
      clk => CLK100MHZ, --clk misto ce
      rst => BTNC,
      ce  => sig_en_25
    );
      
   signal_behavorial: entity work.signal_behavorial
    port map (
        clk   =>CLK100MHZ,
        sig_i =>sig_7segment,
        sig_o =>LED,
        en => sig_en_25
    );

      
      
       AN <= b"1111_1110";
end Behavioral;
