<<<<<<< HEAD
# Lab 2: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME
=======
# Lab 2: Jan Čipl
>>>>>>> 8f7550826a465b124a456ec3f1f80613692302bc

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

<<<<<<< HEAD
   ![K-maps](images/kmap_empty.png)

   Less than:

   ![K-maps](images/kmap_empty.png)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](images/comparator_min.png)
=======
   ![K-maps](kmap_empty.png)

   Less than:

   ![K-maps](kmap_empty%201.png)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](rvnice.png)
>>>>>>> 8f7550826a465b124a456ec3f1f80613692302bc

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

<<<<<<< HEAD
   Last two digits of my student ID: **xxxx??**
=======
   Last two digits of my student ID: **xxxx00**
>>>>>>> 8f7550826a465b124a456ec3f1f80613692302bc

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
<<<<<<< HEAD
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "BCD_OF_YOUR_SECOND_LAST_ID_DIGIT"; -- Such as "0101" if ID = xxxx56
        s_a <= "BCD_OF_YOUR_LAST_ID_DIGIT";        -- Such as "0110" if ID = xxxx56
        wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = 'WRITE_CORRECT_VALUE_HERE') and
                (s_B_equals_A  = 'WRITE_CORRECT_VALUE_HERE') and
                (s_B_less_A    = 'WRITE_CORRECT_VALUE_HERE'))
        -- If false, then report an error
        report "Input combination COMPLETE_THIS_TEXT FAILED" severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
=======
        report "Stimulus process started";

        -- First test case ...
        s_b <= "0000"; --ID xxxx00
        s_a <= "0000"; --ID xxxx00
        wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination 0000, 0000 FAILED" severity error;
        


        -- Report a note at the end of stimulus process
        report "Stimulus process finished";
        wait; -- Data generation process is suspended forever
>>>>>>> 8f7550826a465b124a456ec3f1f80613692302bc
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

<<<<<<< HEAD
   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)
=======
   [https://www.edaplayground.com/...](https://www.edaplayground.com/x/qa_c)
>>>>>>> 8f7550826a465b124a456ec3f1f80613692302bc
