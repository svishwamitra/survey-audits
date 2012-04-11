survey "Favorites", :display_order=>1 do
  section "Foods", :display_order=>0 do

    q_1 "What is the best meat?", :pick=>"one", :display_order=>0
    a_oink "bacon", :display_order=>0

    a_tweet "chicken", :display_order=>1

    a_moo "beef", :display_order=>2

  end
end
