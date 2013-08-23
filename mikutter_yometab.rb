# -*- coding:utf-8 -*-
################################################################################
##  mikutter_yome
##    https://github.com/Akkiesoft/mikutter_yome
##

Plugin.create :mikuttre_yometab do
  tab(:mikutter_yometab, '嫁タブ') do
    icon = File.expand_path(File.join(File.dirname(__FILE__), 'yome.png'))
    set_icon icon

    expand
    picture = Gtk::WebIcon.new("http://cdn-ak.f.st-hatena.com/images/fotolife/A/Akkiesoft/20120124/20120124015632.png",400, 654)
    nativewidget Gtk::HBox.new(false, 0).closeup(picture)
  end
end
