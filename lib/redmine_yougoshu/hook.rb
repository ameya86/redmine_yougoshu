module RedmineYougoshu
  class Hook < Redmine::Hook::ViewListener
    render_on :view_layouts_base_content, :partial => 'yougoshu/list'
  end
end
