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

//建立分支
<pre><code>
$ git checkout -b static-pages
$ rails g controller StaticPages home help --no-test-framework //加参数，禁止自动生成rspec测试代码
//相关的操作
//销毁生成的控制器 rails destory controller StaticPages home help
//新建模型 rails g model User name:string age:integer
//销毁模型 rails destroy model User
//数据库相关
// rake db:migrate
// rake db:rollback
// rake db:migrate VERSION=0(或其他数字)
</code></pre>

//测试部分
//配置[capybara](https://github.com/jnicklas/capybara),见官网
<pre><code>
$ rails g integration_test static_pages
</code></pre>

//页面布局
<pre>
在gemfile中添加boostrap-sass
gem "bootstrap-sass" "3.2.02"
</pre>
//测试相关的函数:subject before should have_content have_title 
