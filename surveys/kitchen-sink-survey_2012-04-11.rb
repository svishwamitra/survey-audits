survey "Kitchen Sink survey", :display_order=>0 do
  section "Basic questions", :display_order=>0 do

    label "These questions are examples of the basic supported input types", :display_order=>0

    q_1 "What is your favorite color?", :pick=>"one", :display_order=>1
    a "red", :display_order=>0

    a "blue", :display_order=>1

    a "green", :display_order=>2

    a "yellow", :display_order=>3

    a :other, :display_order=>4


    q_2 "Choose the colors you don't like", :pick=>"any", :display_order=>2
    a_1 "red", :display_order=>0

    a_2 "blue", :display_order=>1

    a_3 "green", :display_order=>2

    a_4 "yellow", :display_order=>3

    a :omit, :display_order=>4


    q_2a "Please explain why you don't like this color?", :display_order=>3
    a_1 "explanation", :text, :display_order=>0

    dependency :rule=>"A or B or C or D"
    condition_A :q_2, "==", {:answer_reference=>"1"}
    condition_B :q_2, "==", {:answer_reference=>"2"}
    condition_C :q_2, "==", {:answer_reference=>"3"}
    condition_D :q_2, "==", {:answer_reference=>"4"}

    q_2b "Please explain why you dislike so many colors?", :display_order=>4
    a_1 "explanation", :text, :display_order=>0

    dependency :rule=>"Z"
    condition_Z :q_2, "count>2", {:answer_reference=>""}

    q_montypython3 "What... is your name? (e.g. It is 'Arthur', King of the Britons)", :display_order=>5
    a_1 "String", :string, :display_order=>0, :display_type=>"hidden_label"


    q_montypython4 "What... is your quest? (e.g. To seek the Holy Grail)", :display_order=>6
    a_1 "String", :string, :display_order=>0, :display_type=>"hidden_label"

    dependency :rule=>"A"
    condition_A :q_montypython3, "==", {:string_value=>"It is 'Arthur', King of the Britons", :answer_reference=>"1"}

    q_montypython5 "What... is the air-speed velocity of an unladen swallow? (e.g. What do you mean? An African or European swallow?)", :display_order=>7
    a_1 "String", :string, :display_order=>0, :display_type=>"hidden_label"

    dependency :rule=>"A"
    condition_A :q_montypython4, "==", {:string_value=>"To seek the Holy Grail", :answer_reference=>"1"}

    label "Huh? I-- I don't know that! Auuuuuuuugh!", :display_order=>8
    dependency :rule=>"A"
    condition_A :q_montypython5, "==", {:string_value=>"What do you mean? An African or European swallow?", :answer_reference=>"1"}

    q_improv_start "Get me started on an improv sketch", :data_export_identifier=>"i_s", :common_namespace=>"sketch comedy questions", :common_identifier=>"get me started", :display_order=>9
    a "who", :string, :display_order=>0

    a "what", :string, :display_order=>1

    a "where", :string, :display_order=>2


    q "How many pets do you own?", :display_order=>10
    a "Integer", :integer, :display_order=>0, :display_type=>"hidden_label"

    validation :rule=>"A"
    condition_A ">=", :integer_value=>0

    q "What is your address?", :display_order=>11, :custom_class=>"address"
    a "Text", :text, :display_order=>0, :custom_class=>"mapper", :display_type=>"hidden_label"

    validation :rule=>"A"
    condition_A "=~", :regexp=>"[0-9a-zA-z. #]"

    q "Pick your favorite date AND time", :display_order=>12
    a "Datetime", :datetime, :display_order=>0, :display_type=>"hidden_label"


    q_time_lunch "What time do you usually take a lunch break?", :display_order=>13
    a_1 "Time", :time, :display_order=>0, :display_type=>"hidden_label"


    q "When would you like to meet for dinner?", :display_order=>14
    a "Date", :date, :display_order=>0, :display_type=>"hidden_label"


    q "Adjust the slider to reflect your level of awesomeness", :pick=>"one", :display_order=>15, :display_type=>"slider"
    a "1", :display_order=>0

    a "2", :display_order=>1

    a "3", :display_order=>2

    a "4", :display_order=>3

    a "5", :display_order=>4

    a "6", :display_order=>5

    a "7", :display_order=>6

    a "8", :display_order=>7

    a "9", :display_order=>8

    a "10", :display_order=>9


    q "How much do you like Ruby?", :pick=>"one", :display_order=>16, :display_type=>"slider"
    a "not at all", :display_order=>0

    a "a little", :display_order=>1

    a "some", :display_order=>2

    a "a lot", :display_order=>3

    a "a ton", :display_order=>4


    q "How much money do you want?", :display_order=>17
    a "$|USD", :float, :display_order=>0


    group "How much oil do you use per day?" do
      q "Quantity", :display_order=>18
      a "Quantity", :float, :display_order=>0

      q "Unit", :pick=>"one", :display_order=>19, :display_type=>"dropdown"
      a "Barrels", :display_order=>0

      a "Gallons", :display_order=>1

      a "Quarts", :display_order=>2

    end

    q "Choose your Illinois county", :pick=>"one", :display_order=>20, :display_type=>"dropdown"
    a "Adams", :display_order=>0

    a "Alexander", :display_order=>1

    a "Bond", :display_order=>2

    a "Boone", :display_order=>3

    a "Brown", :display_order=>4

    a "Bureau", :display_order=>5

    a "Calhoun", :display_order=>6

    a "Carroll", :display_order=>7

    a "Cass", :display_order=>8

    a "Champaign", :display_order=>9

    a "Christian", :display_order=>10

    a "Clark", :display_order=>11

    a "Clay", :display_order=>12

    a "Clinton", :display_order=>13

    a "Coles", :display_order=>14

    a "Cook", :display_order=>15

    a "Crawford", :display_order=>16

    a "Cumberland", :display_order=>17

    a "DeKalb", :display_order=>18

    a "De Witt", :display_order=>19

    a "Douglas", :display_order=>20

    a "DuPage", :display_order=>21

    a "Edgar", :display_order=>22

    a "Edwards", :display_order=>23

    a "Effingham", :display_order=>24

    a "Fayette", :display_order=>25

    a "Ford", :display_order=>26

    a "Franklin", :display_order=>27

    a "Fulton", :display_order=>28

    a "Gallatin", :display_order=>29

    a "Greene", :display_order=>30

    a "Grundy", :display_order=>31

    a "Hamilton", :display_order=>32

    a "Hancock", :display_order=>33

    a "Hardin", :display_order=>34

    a "Henderson", :display_order=>35

    a "Henry", :display_order=>36

    a "Iroquois", :display_order=>37

    a "Jackson", :display_order=>38

    a "Jasper", :display_order=>39

    a "Jefferson", :display_order=>40

    a "Jersey", :display_order=>41

    a "Jo Daviess", :display_order=>42

    a "Johnson", :display_order=>43

    a "Kane", :display_order=>44

    a "Kankakee", :display_order=>45

    a "Kendall", :display_order=>46

    a "Knox", :display_order=>47

    a "La Salle", :display_order=>48

    a "Lake", :display_order=>49

    a "Lawrence", :display_order=>50

    a "Lee", :display_order=>51

    a "Livingston", :display_order=>52

    a "Logan", :display_order=>53

    a "Macon", :display_order=>54

    a "Macoupin", :display_order=>55

    a "Madison", :display_order=>56

    a "Marion", :display_order=>57

    a "Marshall", :display_order=>58

    a "Mason", :display_order=>59

    a "Massac", :display_order=>60

    a "McDonough", :display_order=>61

    a "McHenry", :display_order=>62

    a "McLean", :display_order=>63

    a "Menard", :display_order=>64

    a "Mercer", :display_order=>65

    a "Monroe", :display_order=>66

    a "Montgomery", :display_order=>67

    a "Morgan", :display_order=>68

    a "Moultrie", :display_order=>69

    a "Ogle", :display_order=>70

    a "Peoria", :display_order=>71

    a "Perry", :display_order=>72

    a "Piatt", :display_order=>73

    a "Pike", :display_order=>74

    a "Pope", :display_order=>75

    a "Pulaski", :display_order=>76

    a "Putnam", :display_order=>77

    a "Randolph", :display_order=>78

    a "Richland", :display_order=>79

    a "Rock Island", :display_order=>80

    a "Saline", :display_order=>81

    a "Sangamon", :display_order=>82

    a "Schuyler", :display_order=>83

    a "Scott", :display_order=>84

    a "Shelby", :display_order=>85

    a "St. Clair", :display_order=>86

    a "Stark", :display_order=>87

    a "Stephenson", :display_order=>88

    a "Tazewell", :display_order=>89

    a "Union", :display_order=>90

    a "Vermilion", :display_order=>91

    a "Wabash", :display_order=>92

    a "Warren", :display_order=>93

    a "Washington", :display_order=>94

    a "Wayne", :display_order=>95

    a "White", :display_order=>96

    a "Whiteside", :display_order=>97

    a "Will", :display_order=>98

    a "Williamson", :display_order=>99

    a "Winnebago", :display_order=>100

    a "Woodford", :display_order=>101


    q "Choose your favorite meats", :pick=>"any", :display_order=>21, :display_type=>"inline"
    a "Chicken", :display_order=>0

    a "Pork", :display_order=>1

    a "Beef", :display_order=>2

    a "Shellfish", :display_order=>3

    a "Fish", :display_order=>4

    a "I don't eat meats!!!", :display_order=>5, :is_exclusive=>true


    q "All out of ideas for questions?", :pick=>"one", :display_order=>22, :display_type=>"inline"
    a "yes", :display_order=>0

    a "maybe", :display_order=>1

    a "no", :display_order=>2

    a "I don't know", :display_order=>3

  end
  section "Complicated questions", :display_order=>1 do

    grid "Tell us how often do you cover these each day" do
      a "1", :display_order=>1

      a "2", :display_order=>1

      a "3", :display_order=>1

      q "Head", :pick=>"one", :display_order=>0
      q "Knees", :pick=>"one", :display_order=>1
      q "Toes", :pick=>"one", :display_order=>2
    end

    grid "Tell us how you feel today day" do
      a "-2", :display_order=>1

      a "-1", :display_order=>1

      a "0", :display_order=>1

      a "1", :display_order=>1

      a "2", :display_order=>1

      q "down|up", :pick=>"one", :display_order=>3
      q "sad|happy", :pick=>"one", :display_order=>4
      q "limp|perky", :pick=>"one", :display_order=>5
    end

    grid "For each of the car types checked, what type of options would you prefer?" do
      a "Leather seats", :display_order=>1

      a "Shiny rims", :display_order=>1

      a "Subwoofer", :display_order=>1

      a "Sunroof", :display_order=>1

      a "Turbocharger", :display_order=>1

      q "SUV", :pick=>"any", :display_order=>6
      q "Sedan", :pick=>"any", :display_order=>7
      q "Coupe", :pick=>"any", :display_order=>8
      q "Convertible", :pick=>"any", :display_order=>9
      q "Minivan", :pick=>"any", :display_order=>10
      q "Crossover", :pick=>"any", :display_order=>11
      q "Wagon", :pick=>"any", :display_order=>12
      q "Other", :pick=>"any", :display_order=>13
    end

    q "Please rank the following foods based on how much you like them", :display_order=>14
    a "|pizza", :integer, :display_order=>0

    a "|salad", :integer, :display_order=>1

    a "|sushi", :integer, :display_order=>2

    a "|ice cream", :integer, :display_order=>3

    a "|breakfast ceral", :integer, :display_order=>4


    q "Choose your favorite utensils and enter frequency of use (daily, weekly, monthly, etc...)", :pick=>"any", :display_order=>15
    a "spoon", :string, :display_order=>0

    a "fork", :string, :display_order=>1

    a "knife", :string, :display_order=>2

    a :other, :string, :display_order=>3


    q_car "Do you own a car?", :pick=>"one", :display_order=>16
    a_y "Yes", :display_order=>0

    a_n "No", :display_order=>1


    repeater "Tell us about the cars you own" do
      q "Make", :pick=>"one", :display_order=>17, :display_type=>"dropdown"
      a "Toyota", :display_order=>0

      a "Ford", :display_order=>1

      a "GMChevy", :display_order=>2

      a "Ferrari", :display_order=>3

      a "Tesla", :display_order=>4

      a "Honda", :display_order=>5

      a "Other weak brand", :display_order=>6

      q "Model", :display_order=>18
      a "String", :string, :display_order=>0, :display_type=>"hidden_label"

      q "Year", :display_order=>19
      a "String", :string, :display_order=>0, :display_type=>"hidden_label"

    end

    repeater "Tell us the name and age of your siblings" do
      q "Sibling", :display_order=>20
      a "Name", :string, :display_order=>0

      a "Age|years", :integer, :display_order=>1

    end
  end
end
