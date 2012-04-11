survey "Date Survey", :display_order=>2 do
  section "Simple date questions", :display_order=>0 do

    q "What is your birth date?", :display_order=>0
    a "Date", :date, :display_order=>0, :display_type=>"hidden_label"


    q "At what time were you born?", :display_order=>1
    a "Time", :time, :display_order=>0, :display_type=>"hidden_label"


    q "When would you like to schedule your next appointment?", :display_order=>2
    a "Datetime", :datetime, :display_order=>0, :display_type=>"hidden_label"

  end
end
