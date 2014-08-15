class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :slogan
      # Combat - Use SW Rules
      # 2, 4, 6, 8, 10, 12, 20 (0..7)
      t.integer :strength  # Power
      t.integer :fight
      t.integer :notice    # Notice
      t.integer :vigor     # Morale
      t.integer :toughness # Resistance
      t.integer :agility   # Influence
      t.integer :wounds    # Wounds

      #
      t.datetime :manipulated_until
      t.datetime :guarded_until
      
      t.integer :cp
      # Personnel 
      t.integer :leaders
      t.integer :cadre
      t.integer :recruits
      # How visible a group's data is.
      t.integer :secrecy
      # Cash
      t.integer :wealth
      t.integer :income
      # Type - for STI
      t.string  :type 
          
      # Alignments (Fudge, Applied to Attacks somehow)
        # Violence - Violent (Kratos) / Peaceful (Akrateia) - Tendency to use force, violence
        t.integer :kratos
        # Religious - Atheist / Theist
        t.integer :reverence
        # Sector - Public / Charity / Private
        t.integer :sector
        # Law & Order - Criminal / Lawful
        t.integer :law
        # Zealous - Apathy / Zeal
        t.integer :zeal
        # Strangeness - Normal / Odd / Strange
        t.integer :odd
        # Politics
        # t.integer :politics # Sum of each of the following for simple math.
          # Personal Freedom - Archy / Anarchy - Rank recognition (equal v. rank)
          t.integer :personal
          # Economic Freedom - Socialist / Capitalist
          t.integer :economic
          # Political Freeom - Authoritarian / Libertarian
          t.integer :political

      t.timestamps
    end
  end
end
      # t.integer :secrecy
      # t.integer :orthodoxy
      # t.integer :violence
      # t.integer :slant
      # t.integer :authority
      # t.integer :sector
      # t.integer :criminality
      # t.integer :zeal
      # t.integer :strangeness