class Weather

  def stormy?
    random_outlook == 'stormy'
  end

  private

  OUTLOOK = ['stormy', 'fine', 'fine', 'fine']

  def random_outlook
    OUTLOOK.sample
  end
end
