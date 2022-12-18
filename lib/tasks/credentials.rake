desc "Helpers for editing credential files"
namespace :credentials do
  task :edit_production do
    exec('EDITOR="code --wait" bin/rails credentials:edit --environment production')
  end

  task :edit_staging do
    exec('EDITOR="code --wait" bin/rails credentials:edit --environment staging')
  end

  task :edit_local do
    exec('EDITOR="code --wait" bin/rails credentials:edit')
  end
end
