module DFlipFlop #(
	parameter size = 16;
) (
	input wire en,
	input wire [size - 1 : 0] data,
	output reg [size - 1 : 0] out
)

	always @(posedge en) begin
		out = data;
	end

endmodule
