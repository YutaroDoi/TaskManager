module ApplicationHelper
    def full_title(page_title = '')
        base_title = "TaskManager"
        if page_title.empty?
          base_title
        else
          page_title + " | " + base_title
        end
      end

    def sortable(column, title = nil)
      # title ||= I18n.t(column)
      title ||= I18n.t column
      css_class = (column == sort_column) ? "current #{sort_direction}" : nil
      direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
      link_to title, { :sort => column, :direction => direction }, { :class => css_class}
    end
end
