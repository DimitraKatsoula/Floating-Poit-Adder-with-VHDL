# Floating-Poit-Adder-with-VHDL
Designed and simulated a custom floating-point unit using VHDL on Spartan 3E FPGA. This project involved understanding 
IEEE 754 representation and managing exponent/mantissa alignment. Compare CLA and Pipeline technics.

Very large numbers and very small fractional quantities cannot be displayed. Additionally, the quotient of a 
division, between two very large numbers can possibly be lost. This limitation, can be surpassed in decimal 
number, by using a scientific display. We dynamically move the decimal point to a convenient spot, and use an exponent 
of 10, so we can identify the location of the decimal point. This technique, allows the representation of a very wide 
range of big and small numbers, with the use of very few digits. The same exact approach can be followed for binary 
numbers. A number can be represented in the following form: ±S∙B±E.

Most important floating point representation, is by the IEEE 754 standard, which is adopted since 1985, and
revised in 2008. This standard, was developed to facilitate the portability of programs from one processor to
another, and to encourage the development of modern, numerically oriented programs. The standard has been widely 
adopted and used in virtually all modern processors and numerical co-processors.

The sum of moving decimal point numbers is implemented using two methods. Ranking design was utilized for both 
methods. In method Α, addition is succeeded with the creation of components, which contain CLA digit adders. 
In method B, the pipeline technique is used, in which, every digit is summed with CLA addition.

The 28Bits of the two significant parts of the addends were added, using the pipeline technique. This is of course 
done when the two significant parts are ready for addition, that is, after the right_shift_mantissa unit (comp2 of 
adder_block).
Therefore, the second way of adding concerns the Adder entity, and more specifically modifies the adding_same_exp and 
CLA entities, which are in the Adder subunit of adder_block , which is a subunit of fpadder.

Both methods are simulated, and extensive comparison is constructed on the performance and characteristics of each one.
