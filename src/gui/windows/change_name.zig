const std = @import("std");
const Allocator = std.mem.Allocator;

const main = @import("root");
const Vec2f = main.vec.Vec2f;

const gui = @import("../gui.zig");
const GuiComponent = gui.GuiComponent;
const GuiWindow = gui.GuiWindow;
const Button = @import("../components/Button.zig");
const VerticalList = @import("../components/VerticalList.zig");

var window: GuiWindow = undefined;
var components: [1]GuiComponent = undefined;
pub fn init() !void {
	window = GuiWindow{
		.contentSize = Vec2f{128, 256},
		.id = "cubyz:change_name",
		.title = "Change Name",
		.onOpenFn = &onOpen,
		.onCloseFn = &onClose,
		.components = &components,
	};
	try gui.addWindow(&window, true);
}

const padding: f32 = 8;

pub fn onOpen() Allocator.Error!void {
	var list = try VerticalList.init(main.globalAllocator);
	// TODO
	//try list.add(try Button.init(.{0, 16}, 128, main.globalAllocator, "Singleplayer TODO", &buttonCallbackTest));
	//try list.add(try Button.init(.{0, 16}, 128, main.globalAllocator, "Multiplayer TODO", &buttonCallbackTest));
	//try list.add(try Button.init(.{0, 16}, 128, main.globalAllocator, "Settings", gui.openWindowFunction("cubyz:settings")));
	//try list.add(try Button.init(.{0, 16}, 128, main.globalAllocator, "Exit TODO", &buttonCallbackTest));
	components[0] = list.toComponent(.{padding, padding});
	window.contentSize = components[0].size + @splat(2, @as(f32, 2*padding));
	gui.updateWindowPositions();
}

pub fn onClose() void {
	for(&components) |*comp| {
		comp.deinit();
	}
}