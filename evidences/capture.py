import time
import traceback
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import chromedriver_binary


options = Options()
options.add_argument('--headless')
options.add_argument('--user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 10_2 like Mac OS X) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0 Mobile/14C92 Safari/602.1')
driver = webdriver.Chrome(options=options)

driver.get('http://localhost:3000/')
# 簡易的にJSが評価されるまで秒数で待つ
time.sleep(3)

driver.get('http://localhost:3000/users/sign_in')
# 簡易的にJSが評価されるまで秒数で待つ
time.sleep(3)

# ID/PASSを入力
id = driver.find_element_by_name("user[email]")
id.send_keys("test@test.com")
password = driver.find_element_by_name("user[password]")
password.send_keys("password")

time.sleep(1)

# ログインボタンをクリック
login_button = driver.find_element_by_name('commit')
login_button.click()

time.sleep(1)

# 「質問する」ボタンをクリック
driver.get('http://localhost:3000/posts/new')
time.sleep(3)

# 投稿画面のクラス定義
question = driver.find_element_by_id("textform_question")
qimg = driver.find_element_by_class_name("btn_qimg")
answer = driver.find_element_by_id("textform_answer")
aimg = driver.find_element_by_class_name("btn_aimg")
content = driver.find_element_by_id("textform_content")
title = driver.find_element_by_id("post_title")
category_one = driver.find_element_by_class_name("cat-one")
unit_check_one = driver.find_element_by_id("post_unit_ids_1")
supplement = driver.find_element_by_id("post_supplement")
commit_btn = driver.find_element_by_class_name("button_submit")



# 正常テスト（全項目埋める）
# question.send_keys('this is test')
# qimg.click()
# time.sleep(3)
# qimg.send_keys('/Users/rascal/Pictures/Mathmate用サンプル画像/20190410143818.jpg')
# answer.send_keys('this is test')
# aimg.click()
# time.sleep(3)
# aimg.send_keys('/Users/rascal/Pictures/Mathmate用サンプル画像/20190410143818.jpg')
content.send_keys('this is test')
title.send_keys('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
category_one.click()
time.sleep(3)
unit_check_one.click()
# supplement.send_keys('this is test')

# commit_btn.click()
time.sleep(2)

w = driver.execute_script('return document.body.scrollWidth')
h = driver.execute_script('return document.body.scrollHeight')
driver.set_window_size(w, h)
driver.save_screenshot('test_51.png')



driver.quit()
