tool
extends EditorPlugin

# A class member to hold the dock during the plugin life cycle
var dock
var view : Control

func _enter_tree():
    view = get_editor_interface().get_editor_viewport()
    view.connect("item_rect_changed",self,"SetSize")
    SetSize()

func _exit_tree():
    view.disconnect("item_rect_changed",self,"SetSize")

func SetSize():
    var view : Control = get_editor_interface().get_editor_viewport()
    var size = view.rect_size
    var pos = view.rect_global_position

    ProjectSettings.set_setting("display/window/size/test_width",size[0])
    ProjectSettings.set_setting("display/window/size/test_height",size[1]-25)
    ProjectSettings.set_setting("display/window/size/borderless",true)
    ProjectSettings.set_setting("display/window/size/fullscreen",false)
    ProjectSettings.set_setting("display/window/size/always_on_top",true)

    get_editor_interface().get_editor_settings().set("run/window_placement/rect",2)
    get_editor_interface().get_editor_settings().set("run/window_placement/rect_custom_position",Vector2(pos[0],pos[1]+50))


