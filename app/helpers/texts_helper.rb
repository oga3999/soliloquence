module TextsHelper
 def choose_new_or_edit
  if action_name == 'new' || action_name == 'confirm'
   confirm_texts_path
  elsif action_name == 'edit'
   text_path
  end
 end
end
