module LIFO(clk,
            reset,
			write,
			read,
			data_in,
			address,
			empty,
			full,
			data_out);


parameter Full=7;
parameter EMPTY=0;

input clk;
input reset;
input write;
input read;
input [7:0] address;
input [7:0] data_in;
output  empty;
output  full;
output reg [7:0] data_out ;

 reg [7:0]  memory[0:7];
 reg [3:0]  w_counter;
 reg [3:0]  r_counter;
 
 assign empty = (r_counter <= EMPTY) ? 1:0;
 assign full =  (w_counter == Full) ? 1:0;
 
 

always@(posedge clk or negedge reset )
 begin
   if(reset)
     begin
	   data_out<= 1'b0;
	 end
  else 
   begin
      if(write)
	      memory[w_counter]<=data_in;
      if(read)	
	     data_out<=memory[r_counter]; 
   end 
 end
 
 always @(posedge clk or negedge reset)
 begin
   if(reset)
     begin
      r_counter <=8'd8;
      w_counter <=1'b0;
     end 
   else 
     begin
      if(write)
         w_counter<=w_counter+1'b1;
       else
         
     if(read)	
          r_counter <=r_counter-1'b1;  
        else
          r_counter <= r_counter;
          
   end
 end
endmodule
