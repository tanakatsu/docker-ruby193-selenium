# coding: utf-8

require 'selenium-webdriver'

# https://stackoverflow.com/questions/45275586/how-to-use-chrome-options-in-ruby-selenium
driver = Selenium::WebDriver.for :chrome, switches: ["--headless", "--no-sandbox"]

driver.navigate.to 'https://www.yahoo.co.jp/'
driver.save_screenshot './screenshot.png'
