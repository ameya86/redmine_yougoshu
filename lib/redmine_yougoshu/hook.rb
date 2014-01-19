module RedmineYougoshu
  class Hook < Redmine::Hook::ViewListener
    render_on :view_layouts_base_body_bottom, :partial => 'yougoshu/layouts_base_body_bottom'
  end
end
