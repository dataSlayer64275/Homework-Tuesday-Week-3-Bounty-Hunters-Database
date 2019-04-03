require_relative('models/bounty.rb')

bounty1 = Bounty.new({'name' => 'Bad Alien Dude',
                      'bounty_value' => '500',
                      'danger_level' => 'high',
                      'homeworld' => 'Bad Alien Dude Planet'
                      })

bounty1.save

bounty2 = Bounty.new({'name' => 'Octopus Strangler',
                      'bounty_value' => '300',
                      'danger_level' => 'ermagerdyerderd',
                      'homeworld' => 'Strangleworld'
                      })

bounty2.save

bounty1.delete

# bounties = Bounty.delete_all

bounty2.bounty_value = '700'
bounty2.update

bounties = Bounty.all
