module DraggableIssues
  class Hooks < Redmine::Hook::ViewListener
    render_on(:view_layouts_base_html_head, partial: 'shared/head_includes')
  end
end

