module DraggableIssues
  module Patches
    module IssueQuery
      module ActiveRecord
        extend ActiveSupport::Concern

        included do

          alias :original_issues :issues
          def issues(options={})
            new_options = options
            new_options[:order] = "order_positions.index ASC"
            original_issues(new_options)
          end

          alias :original_joins_for_order_statement :joins_for_order_statement
          def joins_for_order_statement(order_options)
            list = [original_joins_for_order_statement(order_options)]
            list << "LEFT OUTER JOIN #{OrderPosition.table_name} ON #{OrderPosition.table_name}.owner_id = #{queried_table_name}.id AND #{OrderPosition.table_name}.owner_type = 'Issue'"
            list.join(' ')
          end

        end
      end
    end
  end
end

IssueQuery.send(:include, DraggableIssues::Patches::IssueQuery::ActiveRecord)
