module ApplicationHelper
  def task_des_text_and_label(task)
    label_text, label = case task.status
    when 'start'
      ['open', 'lbl-primary']
    when 'process'
      ['process', 'lbl-success']
    when 'done'
      ['closed', 'lbl-default']
    else
      []
    end
    return label_text, label
  end
end
