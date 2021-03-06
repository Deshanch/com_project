// Computer Architecture (CO224) - Lab 05
// Design: Testbench of Simple Processor
// Author: Deshan L.A.C

//import files
`include "cpu.v"

module cpu_tb;//this is the register file
    //initialize the registers
    reg CLK, RESET;
    reg [31:0]INSTRUCTION;//32 bit size instruction
    wire [31:0] PC;//to get all 1024 address
    reg [7:0] REGISTERS[0:1023];//register is having 1024 elements and each is size 8 bit
    
    cpu mycpu(CLK, RESET, INSTRUCTION, PC);
       
    initial
    begin
        //these are instructions final answers is 4
        /*{REGISTERS[0],REGISTERS[1],REGISTERS[2],REGISTERS[3]} = 32'b00000000000000010000000000000101;//loadi 1 0x05
        {REGISTERS[4],REGISTERS[5],REGISTERS[6],REGISTERS[7]} = 32'b00000001000001110000000000000001;//mov 7 1
        {REGISTERS[8],REGISTERS[9],REGISTERS[10],REGISTERS[11]} = 32'b00000000000000100000000000000111;//loadi 2 0x07
        {REGISTERS[12],REGISTERS[13],REGISTERS[14],REGISTERS[15]} = 32'b00000001000001100000000000000010;//mov 6 2
        {REGISTERS[16],REGISTERS[17],REGISTERS[18],REGISTERS[19]} = 32'b00000010000000110000000100000010;//add 3 1 2
        {REGISTERS[20],REGISTERS[21],REGISTERS[22],REGISTERS[23]} = 32'b00000001000001000000000000000011;//mov 4 3
        {REGISTERS[24],REGISTERS[25],REGISTERS[26],REGISTERS[27]} = 32'b00000011000000000000011000000111;//sub 0 6 7
        {REGISTERS[28],REGISTERS[29],REGISTERS[30],REGISTERS[31]} = 32'b00000001000000010000000000000000;//mov 1 0
        {REGISTERS[32],REGISTERS[33],REGISTERS[34],REGISTERS[35]} = 32'b00000011000000100000011100000110;//sub 2 7 6
        {REGISTERS[36],REGISTERS[37],REGISTERS[38],REGISTERS[39]} = 32'b00000001000000010000000000000010;//mov 1 2
        {REGISTERS[40],REGISTERS[41],REGISTERS[42],REGISTERS[43]} = 32'b00000011000001010000000000000001;//sub 5 0 1
        {REGISTERS[44],REGISTERS[45],REGISTERS[46],REGISTERS[47]} = 32'b00000001000000000000000000000101;//mov 0 5 
      
        {REGISTERS[48],REGISTERS[49],REGISTERS[50],REGISTERS[51]} = 32'b00000000000000010000000000000101;//new instruction set to check the lab 4
        {REGISTERS[52],REGISTERS[53],REGISTERS[54],REGISTERS[55]} = 32'b00000001000000100000000000000001;
        {REGISTERS[56],REGISTERS[57],REGISTERS[58],REGISTERS[59]} = 32'b00000110000000110000000000000000;
        {REGISTERS[60],REGISTERS[61],REGISTERS[62],REGISTERS[63]} = 32'b00000010000001010000000100000010;
        {REGISTERS[64],REGISTERS[65],REGISTERS[66],REGISTERS[67]} = 32'b00000100000001100000000100000010;
        {REGISTERS[68],REGISTERS[69],REGISTERS[70],REGISTERS[71]} = 32'b00001010000000110000000100000011;//00000111 00000011 00000001 00000011
        {REGISTERS[72],REGISTERS[73],REGISTERS[74],REGISTERS[75]} = 32'b00000000000000110000000000000100;
        {REGISTERS[76],REGISTERS[77],REGISTERS[78],REGISTERS[79]} = 32'b00000000000001000000000000000100;
        {REGISTERS[80],REGISTERS[81],REGISTERS[82],REGISTERS[83]} = 32'b00000111111110110000001100000100;
        {REGISTERS[84],REGISTERS[85],REGISTERS[86],REGISTERS[87]} = 32'b00000000000001110000000000000111;
        
        {REGISTERS[88],REGISTERS[89],REGISTERS[90],REGISTERS[91]} = 32'b00000000000000010000000000000101;//loadi 1 0x05
        {REGISTERS[92],REGISTERS[93],REGISTERS[94],REGISTERS[95]} = 32'b00001011000001000000000100000010;//sll 4 1 0x02
        {REGISTERS[96],REGISTERS[97],REGISTERS[98],REGISTERS[99]} = 32'b00001100000001000000000100000010;//srl 4 1 0x02
        {REGISTERS[100],REGISTERS[101],REGISTERS[102],REGISTERS[103]} = 32'b00001101000001000000000100000010;//sra 4 1 0x02
        {REGISTERS[104],REGISTERS[105],REGISTERS[106],REGISTERS[107]} = 32'b00001110000001000000000100000010;//ror 4 1 0x02*/
        
        /*{REGISTERS[0],REGISTERS[1],REGISTERS[2],REGISTERS[3]} = 32'b00000000000000010000000000000101;//loadi 1 0x05
        {REGISTERS[4],REGISTERS[5],REGISTERS[6],REGISTERS[7]} = 32'b00001011000001000000000100000010;//sll 4 1 0x02
        {REGISTERS[8],REGISTERS[9],REGISTERS[10],REGISTERS[11]} = 32'b00001100000001000000000100000010;//srl 4 1 0x02
        {REGISTERS[12],REGISTERS[13],REGISTERS[14],REGISTERS[15]} = 32'b00001101000001000000000100000010;//sra 4 1 0x02
        {REGISTERS[16],REGISTERS[17],REGISTERS[18],REGISTERS[19]} = 32'b00001110000001000000000100000010;//ror 4 1 0x02*/
        
        /*{REGISTERS[0],REGISTERS[1],REGISTERS[2],REGISTERS[3]} = 32'b00000000000000010000000000000101;//loadi 1 0x05
        {REGISTERS[4],REGISTERS[5],REGISTERS[6],REGISTERS[7]} = 32'b00001011000001000000000100000011;//sll 4 1 0x02
        {REGISTERS[8],REGISTERS[9],REGISTERS[10],REGISTERS[11]} = 32'b00001100000001000000000100000011;//srl 4 1 0x02
        {REGISTERS[12],REGISTERS[13],REGISTERS[14],REGISTERS[15]} = 32'b00001101000001000000000100000011;//sra 4 1 0x02
        {REGISTERS[16],REGISTERS[17],REGISTERS[18],REGISTERS[19]} = 32'b00001110000001000000000100000011;//ror 4 1 0x02*/
        {REGISTERS[0],REGISTERS[1],REGISTERS[2],REGISTERS[3]} = 32'b00000000000000010000000000000101;//new instruction set to check the lab 4
        {REGISTERS[4],REGISTERS[5],REGISTERS[6],REGISTERS[7]} = 32'b00000001000000100000000000000001;
        {REGISTERS[8],REGISTERS[9],REGISTERS[10],REGISTERS[11]} = 32'b00000110000000110000000000000000;
        {REGISTERS[12],REGISTERS[13],REGISTERS[14],REGISTERS[15]} = 32'b00000010000001010000000100000010;
        {REGISTERS[16],REGISTERS[17],REGISTERS[18],REGISTERS[19]} = 32'b00000100000001100000000100000010;
        {REGISTERS[20],REGISTERS[21],REGISTERS[22],REGISTERS[23]} = 32'b00000111000000110000000100000011;
        {REGISTERS[24],REGISTERS[25],REGISTERS[26],REGISTERS[27]} = 32'b00000000000000110000000000000100;
        {REGISTERS[28],REGISTERS[29],REGISTERS[30],REGISTERS[31]} = 32'b00000000000001000000000000000100;
        {REGISTERS[32],REGISTERS[33],REGISTERS[34],REGISTERS[35]} = 32'b00000111111110110000001100000100;
        {REGISTERS[36],REGISTERS[37],REGISTERS[38],REGISTERS[39]} = 32'b00000000000001110000000000000111;

        CLK = 1'b1;

        // generate files needed to plot the waveform using GTKWave
        $dumpfile("cpu_wavedata.vcd");
		$dumpvars(0, cpu_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b1;//initially reset all
        #2;
        RESET = 1'b0;
        #40;
        RESET = 1'b1;//in mid reset all
        #2;
        RESET = 1'b0;
        #140;
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
    
    always @ (PC)//Instruction Memory Read
     begin
	  #2;//time delay for this
	  INSTRUCTION = {REGISTERS[PC],REGISTERS[PC+1],REGISTERS[PC+2],REGISTERS[PC+3]};//getting the instruction according to the pc value
     end
     
endmodule
