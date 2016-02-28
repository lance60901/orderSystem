# Demo
http://bowei.xeo.tw:12345/login
# orderSystem
Let people in office order what they want and the assistant could order conveniently according to the lists which made by the system.
這是一個訂餐系統，因為看到很多辦公室裡面都還是使用excel之類的共同編輯方法來訂定午餐，覺得很沒效率，以及在人數眾多的時候會讓負責訂餐的行政助理非常麻煩，因此決定製作一個訂餐系統，好方便行政助理方便訂餐，以及讓大家可以一目了然今天有什麼東西可以訂。
# Function
1.When you login with your name, you would see what other eat, and you could choose the same meal just by click the meal's name. If you're the first one order meal today, you could choose all of the store on everywhere. When anyone has order meals, the system would lock area, and the next person would be order that the store is in the same area.But, there is a special area not belong to any area. It will put some store like convenient stores or beverage shop.
當你用你的名字登入的時候，你會看到今天大家都吃了什麼，如果你懶得思考你要吃什麼，或許以可以直接跟他們吃一樣的東西，只要輕輕的點他們的食物的名字，訂餐就完成了！ 就是那麼簡單。
每天第一個登入並訂餐的使用者，可以隨意的選擇自己今天想吃什麼東西，當第一個訂餐的人一決定他要吃什麼東西並送出訂單後，今天的訂餐的區域便已經決定，後續的使用者都只能根據第一個訂餐的人所買的東西的區域，來決定要訂什麼，不過有個例外，有一個區域是常駐的，不管你買那個區域的東西，這個區域的東西將永遠都可以被購買，這個區域我們常常會用來放便利商店之類的商店。
2.Users could add store and meals by themselves.
使用者可以自己添加商店還有菜單，也就是說所有的操作都可以在前端完成，不需要自己去動資料庫。
3.Users could look for history lists.
此系統也有提供歷史訂單的查詢
4.Only admin users could end the order, and if any order exist, the next user who login will create a new order. And order would be ended on next day automaticlly.
只有用admin這個帳號登入，才可以看到結束訂單以及影印訂單的按鈕，當你按了結束訂單後，將清空今日的菜單，如果你今天沒有手動清除菜單，系統會自動在隔日清除，並且在下一個使用者登入的時候，自動產生一張新的訂單。

版權限制：此系統開發供個人使用，請勿有商業用途，或是經改寫有營利之用。

# Dependency on node Js /MongoDB
NodeJs version: v5.3.0
NPM version: 3.3.12
MongoDB version: 3.2.1
# Install
1.Download the package or clone from github.
2.Ensure that mongo & nodejs work correctly on you system.
3.cd to project folder 
4.command: npm install
5.run your own mongo service (like mongod --dbpath ./db) program defaults on port: 27017
6.node ./bin/www 
7.the system default service on port: 12345, if you want to chage it, it would be editted in ./bin/www
8.Open your browser and enter http://localhost:12345/ 
9.Yout will look the login page.

# Ps.
If you have any question, please contact me with mail.
johnny914425@gmail.com
I'll response you as soon as posible.
