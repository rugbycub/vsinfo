# buzzwords = ['Paradigm shift', 'Leverage', 'Pivoting', 'Turn-key', 'Streamlininess', 'Exit strategy', 'Synergy', 'Enterprise', 'Web 2.0'] 
# buzzword_counts = Hash.new({ value: 0 })

# Dashing.scheduler.every '2s', first_in: 1.second.since do
#   random_buzzword = buzzwords.sample
#   buzzword_counts[random_buzzword] = { label: random_buzzword, value: (buzzword_counts[random_buzzword][:value] + 1) % 30 }
  
#   Dashing.send_event('buzzwords', { items: buzzword_counts.values })
# end