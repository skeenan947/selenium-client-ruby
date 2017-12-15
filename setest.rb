require 'selenium-webdriver'
#caps = Selenium::WebDriver::Remote::Capabilities.safari()
#caps['platform'] = 'Mac 10.12'
#caps['browser'] = 'safari'
#caps['version'] = '10'
#caps['seleniumVersion'] = '3.6.0'
caps = {browserName: 'chrome'}
caps['seleniumVersion'] = '3.4.0'
caps['_containerizedChef'] = true
caps['recordVideo'] = false
caps['recordScreenshots'] = false

wd_url="http://user:pass@host:4444/wd/hub"
base_url='https://www.saucelabs.com'
puts "starting browser for cap #{caps.to_json}"
driver = Selenium::WebDriver.for(:remote, url: wd_url, desired_capabilities: caps)
driver.logger.level = :debug
driver.logger.output = 'selenium.log'
driver.manage.timeouts.implicit_wait = 10
driver.get("#{base_url}/test-guinea-pig.html")
to_type = '0 1 2 3 4 5 6 7 8 9 '\
          'a b c d e f g h j k l m n o p q r s t u v w x y z'
textarea = driver.find_element(:id, 'comments')
textarea.send_keys(to_type)
puts "Test #{driver.id}completed"
driver.quit()
