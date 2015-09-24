**ruby on rails tutorial(rails4.2.4/ruby2.2.2)**
<pre><code>
	
$ rails new railstutorial --skip-test-unit //加参数，禁用默认的测试框架
$ cd railstutorial
$ subl .
//修改gemfile文件
//在development和test组中添加 gem 'rspec-rails'
//在test组中添加gem ‘selenium-webdriver’ 和 gem ‘capybara’
$ bundle
$ rails g rspec:install //使用rspec
//创建仓库
$ git init
$ git add .
$ git commit -m 'Initial commit'
$ git mv README.rdoc README.md
$ git commit -am 'Improve the README'
$ git remote add origin https://github.com/<username>/railsturorial.git
$ git push -u origin master



</code></pre>

