module TrafficController(input wire Ta, Tb, clk, output wire [2:0] La, Lb);
	wire en;
	ClockDivider div(.fc(clk), .sc(en));
	FSM fsm(.clk(clk), .en(en), .ta(Ta), .tb(Tb), .lights({Lb, La}));
endmodule
