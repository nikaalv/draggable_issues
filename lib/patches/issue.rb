module DraggableIssues
  module Patches
    module Issue

      module ActiveRecord
        extend ActiveSupport::Concern

        included do
          has_one :order_position, dependent: :destroy, autosave: true, as: :owner
          after_initialize :initialize_order_position
          before_save :change_order_index!, if: :changed_assigning_person?
        end

        def initialize_order_position
          build_order_position if !order_position.try(:persisted?)
        end

        def changed_assigning_person?
          assigned_to_id_changed?
        end

        def change_order_index!
          order_position.update_attribute(:index, OrderPosition::MAX_INDEX)
        end
      end

      module ActionController
        extend ActiveSupport::Concern

        included do

          alias :original_retrieve_query :retrieve_query
          def retrieve_query
            original_retrieve_query
          end

        end
      end

    end
  end
end

Issue.send(:include, DraggableIssues::Patches::Issue::ActiveRecord)
IssuesController.send(:include, DraggableIssues::Patches::Issue::ActionController)


