module LIFO_tb;
reg clk;
reg reset;
reg write;
reg read;
reg [7:0] data_in;
reg [7:0]address;
wire empty;
wire full;
wire [7:0] data_out ;

parameter clkperiod=40;

LIFO DUT(.clk(clk    ),
         .reset   (reset  ),
		 .write   (write  ),
		 .address (address),
		 .read    (read   ),
		 .data_in (data_in),
		 .empty   (empty  ),
		 .full    (full   ),
		 .data_out(data_out));

   

initial
 begin
    clk = 0;
    forever 
         #5 clk = ~clk;
end

initial
   begin
    reset<=1'b1;
    write <=1'b0;
    read <= 1'b0;
    
    #1000;
	reset<=1'b0;
	#30;
write_test();
read_test();

#1000;
$finish;	
   end  
   
   task write_test();
     begin
     write<=1'b1;
	 data_in<=8'd2;
	 #10;
	 data_in<=8'd4;
	  #10;
	 data_in<=8'd6;
	  #10;
	 data_in<=8'd8;
	  #10;
	 data_in<=8'd10;
	  #10;
	 data_in<=8'd12;
	  #10;
	 data_in<=8'd16;
	  #10;
	 data_in<=8'd18;
	 #5;
	 write<=1'b0;
	 end
   endtask
   
   task read_test();
    begin
     #100;
	  read<=1'b1;
	  #100;
	  read<=1'b0;
     end
   endtask    		 
endmodule
