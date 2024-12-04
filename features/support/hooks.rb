After do 
    Capybara.current_session.driver.quit
end

AfterStep do |step|
    if step.failed?
      save_screenshot("screenshots/#{step.name}.png")
    end
  end

Around do |scenario, block|
    start_time = Time.now
    block.call
    end_time = Time.now
    puts "El escenario '#{scenario.name}' tomó #{end_time - start_time} segundos."
end
  