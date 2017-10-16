require_dependency 'hooks'
require_dependency 'patches/issue'
require_dependency 'patches/issue_query'

Redmine::Plugin.register :draggable_issues do
  name 'Draggable Issues plugin for Redmine'
  author 'Veronkia Meinarte'
  description 'This is a simple plugin for making droppable issues table rows'
  version '0.0.3'
  url 'https://github.com/nikaalv/draggable_issues'
  author_url 'https://github.com/nikaalv'
end

