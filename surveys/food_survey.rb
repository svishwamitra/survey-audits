survey "Food Survey" do

  section "Basic questions" do
    # A label is a question that accepts no answers
    label "These questions are examples of the basic supported input types"

    # A basic question with radio buttons
    question_1 "Do you eat in the cafeteria?", :pick => :one
    answer "Yes"
    answer "No"

    # A basic question with checkboxes
    # "question" and "answer" may be abbreviated as "q" and "a"
    q_2 "If you do not eat in the cafeteria, what is the reason and why?", :pick => :any
    a_1 "Rate"
    a_2 "Quality"
    a_3 "Crowd"
    a_4 "Taste"
    a :omit

    # A dependent question, with conditions and rule to logically join them  
    # the question's reference identifier is "2a", and the answer's reference_identifier is "1"
    # question reference identifiers used in conditions need to be unique on a survey for the lookups to work
    q_2a "Please explain why you don't like to eat in cafeteria?"
    a_1 "explanation", :text
    dependency :rule => "A or B or C or D"
    condition_A :q_2, "==", :a_1
    condition_B :q_2, "==", :a_2
    condition_C :q_2, "==", :a_3
    condition_D :q_2, "==", :a_4

    # A dependant question demonstrating the count operator. The 
    # dependency condition checks the answer count for the referenced question.
    # It understands conditions of the form count> count< count>= count<=
    # count!=
    q_2b "Please explain why you have so many reasons?"
    a_1 "explanation", :text
    dependency :rule => "Z"
    condition_Z :q_2, "count>1"

    # When :pick isn't specified, the default is :none (no checkbox or radio button)
    q_montypython3 "What... is your name?"
    a_1 :string
    
    q_time_lunch "What time do you usually take a lunch break?"
    a_1 :time
            
    q "On a scale of 1 to 5, what would you rate the flavors of the cafeteria food?", :pick => :one, :display_type => :slider
    ["1-Excellent", "2-Good", "3-Average", "4-Unsatisfactory", "5-Bad"].each{|level| a level}
    
    # The "|" pipe is used to place labels before or after the input elements
    q "What should be the reasonable rate for lunch?"
    a "$|USD", :float

    # When an is_exclusive answer is checked, it unchecks all other options and disables them (using Javascript)
    q "Choose your favorite meats", :display_type => :inline, :pick => :any
    a "Chicken"
    a "Pork"
    a "Beef"
    a "Shellfish"
    a "Fish"
    a "I don't eat meats!!!", :is_exclusive => true

  end

  section "Complicated questions" do
   
    q "Please rank the following foods based on how much you like them"
    a "|pizza", :integer
    a "|salad", :integer
    a "|sushi", :integer
    a "|ice cream", :integer
    a "|breakfast ceral", :integer
    
    # :other, :string allows someone to specify both the "other" and some other information
    q "Choose your favorite type of drinks and enter frequency of consumptions (daily, weekly, monthly, etc...)", :pick => :any
    a "Juices", :string
    a "Energy Drink", :string
    a "Mocktails", :string
    a :other, :string
    
    q_car "Do you use sodexho coupons?", :pick => :one
    a_y "Yes"
    a_n "No"
    
    # Repeaters allow multiple responses to a question or set of questions
    repeater "Tell us about the usage of sodexho coupons" do
      dependency :rule => "A"
      condition_A :q_car, "==", :a_y
      q "Used for", :pick => :one, :display_type => :dropdown
      a "Meal"
      a "Groceries"
      a "Cosmetics"
      a "Eatables"
      a "Jwelleries"
      q "Average Expenses"
      a :string
    end

  end
end
