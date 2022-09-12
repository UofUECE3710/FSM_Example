module FSM #(
	parameter IDLE = 6'h0,
	parameter AR = 6'h2,
	parameter AY = 6'h4,
	parameter AG = 6'h8,
	parameter BR = 6'h10,
	parameter BY = 6'h20,
	parameter BG = 6'h40,
	parameter RED = 3'h1,
	parameter YELLOW = 3'h2,
	parameter GREEN = 3'h4
) (input wire clk, en, ta, tb, output reg [5:0] lights) begin

reg [5:0] next_state;
reg [5:0] _state;
wire [5:0] state;

// only allow state to change on the rising edge of our enable signal
DFlipFlop dff(.en(en), .data(_state), .out(state));

always @(posedge clk) begin
	_state <= next_state;
end

// set the next state based on the value for state
always @(*) begin
	case (state):
		AR: next_state  <= BG;
		AY: next_state <= AR;
		AG: next_state <= AY;
		BR: next_sate <= AG;
		BY: next_state <= BR;
		BG: next_state <= BY;
		default: begin
		  // idle case
		  if(ta) next_state <= AG;
		  else next_state <= BG;
		end
	endcase
end

always @(*) begin
  case (state):
	AR: lights = {0{3}, RED};
	AY: lights = {0{3}, YELLOW};
	AG: lights = {0{3}, GREEN};
	BR: lights = {RED, 0{3}};
	BY: lights = {YELLOW, 0{3}};
	BG: lights = {GREEN, 0{3}};
	default: lights = {{1}6}; // error state, something bad happened if we get here.
end

endmodule
