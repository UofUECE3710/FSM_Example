module ClockDivider(input fc, output reg sc);
	parameter divisor = 25000000;
	reg [31:0] counter;
	always @(posedge fc) begin
		if(counter == divisor) begin
			sc = ~sc;
			counter = 0;
		end
		else
			counter = counter + 1;
	end
endmodule
