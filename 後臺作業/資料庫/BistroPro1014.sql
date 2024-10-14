--管理者-------------------------------------------------------------------------------------------------------------------------------------------
		
		CREATE TABLE Users (
			id INT IDENTITY(8001,1) PRIMARY KEY NOT NULL,		-- 管理者ID，自動遞增
			users_account VARCHAR(50) UNIQUE NOT NULL,			-- 管理者帳號
			users_password VARCHAR(50) NOT NULL,				-- 管理者密碼
			created_at DATETIME DEFAULT GETDATE()				-- 建立時間，自動設置為當前時間
		);
		INSERT INTO Users (users_account, users_password)
				VALUES
						('admin1', 'password123'),
						('admin2', 'password456'),
						('admin3', 'password789'),
						('admin4', 'password321'),
						('admin5', 'password654');
-------------------------------------------------------------------------------------------------------------------------------------------
--員工-----------------------------------------------------------------------------------------------------------------------------------
		
		CREATE TABLE Employee (
			id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,       -- 員工ID，自動遞增
			users_id INT NOT NULL,                           -- 使用者ID (FK)
				FOREIGN KEY (users_id) REFERENCES Users(id),
			Empolyee_name NVARCHAR(50) NOT NULL,            -- 姓名
			Empolyee_gender NVARCHAR(50) NOT NULL,          -- 性別
			Empolyee_born DATE NOT NULL,                     -- 出生年月日
			Empolyee_tel VARCHAR(15) NOT NULL,               -- 電話
			Empolyee_seniority INT NOT NULL,                 -- 年資
			Empolyee_salary INT NOT NULL                      -- 薪資

		);
		INSERT INTO Employee (users_id, Empolyee_name, Empolyee_gender, Empolyee_born, Empolyee_tel, Empolyee_seniority, Empolyee_salary)
				VALUES
						(8001, '張偉', '男', '1990-05-01', '0912345678', 5, 60000),
						(8002, '李娜', '女', '1988-11-20', '0923456789', 7, 72000),
						(8003, '王小明', '男', '1995-03-15', '0934567890', 3, 50000),
						(8004, '陳美玲', '女', '1992-07-30', '0945678901', 4, 65000),
						(8005, '劉德華', '男', '1985-01-25', '0956789012', 10, 90000);
---------------------------------------------------------------------------------------------------------------------------------------------

--供應商-----------------------------------------------------------------------------------------------------------------------------------

		CREATE TABLE Supply (
			id INT IDENTITY(7001,1) PRIMARY KEY NOT NULL,			-- ID，自動遞增
			users_id INT NOT NULL,									-- 使用者ID (FK)
				FOREIGN KEY (users_id) REFERENCES Users(id),
			supply_name VARCHAR(50) NOT NULL,						-- 供應廠商
			supply_product VARCHAR(50) NOT NULL,					-- 產品
			supply_count INT NOT NULL,								-- 數量
			supply_price INT NOT NULL,								-- 價格
			created_at DATETIME DEFAULT GETDATE()					-- 建立時間，自動設置為當前時間
		);
		INSERT INTO Supply (users_id, supply_name, supply_product, supply_count, supply_price)
			VALUES
				(8005, '台灣米商', '米', 1000, 1500),
				(8005, '新鮮蔬果供應', '生菜', 500, 800),
				(8005, '海鮮直送', '鮭魚', 200, 3000),
				(8005, '肉類專賣', '雞胸肉', 300, 2500),
				(8005, '調味料之家', '黑胡椒粉', 150, 200),
				(8005, '飲料供應商', '橙汁', 1000, 1200),
				(8005, '冰品供應', '雪糕', 800, 1500),
				(8005, '烘焙原料', '麵粉', 600, 1000),
				(8005, '台灣茶葉', '綠茶', 400, 700),
				(8005, '堅果供應商', '杏仁', 300, 1800);
---------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Employee;
SELECT * FROM Users;
SELECT * FROM Supply;
---------------------------------------------------------------------------------------------------------------------------------------------

---會員Members--------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Members (
    id INT IDENTITY(1001,1) PRIMARY KEY NOT NULL,			-- 會員ID，自動遞增
    member_account VARCHAR(50) UNIQUE NOT NULL,				-- 帳號(手機)，唯一
    member_password VARCHAR(50) NOT NULL,					-- 密碼
    created_at DATETIME DEFAULT GETDATE()					-- 建立日期，自動設置為當前時間
);
INSERT INTO Members (member_account, member_password)
VALUES
		('0912345678', 'password1'),
		('0922345678', 'password2'),
		('0933345678', 'password3'),
		('0944345678', 'password4'),
		('0955345678', 'password5'),
		('0966345678', 'password6'),
		('0977345678', 'password7'),
		('0988345678', 'password8'),
		('0999345678', 'password9'),
		('0900345678', 'password10'),
		('0911345678', 'password11'),
		('0921345678', 'password12'),
		('0931345678', 'password13'),
		('0941345678', 'password14'),
		('0951345678', 'password15'),
		('0961345678', 'password16'),
		('0971345678', 'password17'),
		('0981345678', 'password18'),
		('0991345678', 'password19'),
		('0901345678', 'password20');
---------------------------------------------------------------------------------------------------------------------------------------------
---會員詳情MembersDetail----------------------------------------------------------------------------------------------------------
CREATE TABLE MembersDetail (
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,			-- 會員資料ID，自動遞增
    members_id INT NOT NULL,							-- 會員ID (FK)
		FOREIGN KEY (members_id) REFERENCES Members(id),
    memebers_img VARBINARY(MAX) NULL,					-- 會員圖片
    members_name NVARCHAR(50) NOT NULL,					-- 姓名
    members_age TINYINT NOT NULL,						-- 年齡
    members_sex TINYINT NOT NULL,						-- 性別 (0=Female, 1=Male)
    members_birthday DATE NOT NULL,						-- 生日
    members_favor TINYINT NOT NULL,						-- 興趣 (0=introvert, 1=extrovert)
    members_address NVARCHAR(255) NOT NULL,				-- 位址
    members_phone CHAR(10) NULL,						-- 聯絡電話
    members_email VARCHAR(255) NOT NULL,				-- 電子信箱
    created_at DATETIME DEFAULT GETDATE()				-- 建立日期，自動設置為當前時間
);
INSERT INTO MembersDetail (members_id, memebers_img, members_name, members_age, members_sex, members_birthday, members_favor, members_address, members_phone, members_email)
	VALUES
		(1001, NULL, '張三', 28, 1, '1996-01-15', 0, '台北市大安區信義路123號', '0912345678', 'zhangsan@example.com'),
		(1002, NULL, '李四', 35, 0, '1988-04-22', 1, '高雄市前鎮區建國路456號', '0922345678', 'lisi@example.com'),
		(1003, NULL, '王五', 40, 1, '1983-06-18', 1, '台中市南區建國北路321號', '0933345678', 'wangwu@example.com'),
		(1004, NULL, '趙六', 45, 0, '1978-03-15', 0, '新北市三峽區清水路654號', '0944345678', 'zhaoliu@example.com'),
		(1005, NULL, '孫七', 30, 1, '1994-07-22', 1, '桃園市蘆竹區長庚路987號', '0955345678', 'sunqi@example.com'),
		(1006, NULL, '周八', 22, 0, '2001-01-11', 1, '台南市中西區中華路123號', '0966345678', 'zhouba@example.com'),
		(1007, NULL, '吳九', 38, 1, '1985-02-28', 0, '基隆市仁愛區和平路456號', '0977345678', 'wujio@example.com'),
		(1008, NULL, '鄭十', 26, 0, '1998-09-09', 1, '新竹市東區光復路789號', '0988345678', 'zhengshi@example.com'),
		(1009, NULL, '許百', 40, 1, '1983-06-12', 1, '台北市大安區光復南路321號', '0999345678', 'xubai@example.com'),
		(1010, NULL, '蔡千', 31, 0, '1993-04-04', 0, '高雄市前鎮區民生路456號', '0900345678', 'caichian@example.com'),
		(1011, NULL, '陳一', 29, 1, '1995-05-15', 1, '台北市中正區博愛路123號', '0911345678', 'chenyi@example.com'),
		(1012, NULL, '黃二', 35, 0, '1989-07-18', 0, '高雄市前鎮區民生路456號', '0921345678', 'huanger@example.com'),
		(1013, NULL, '林三', 41, 1, '1982-09-21', 1, '新北市新莊區中華路789號', '0931345678', 'linsan@example.com'),
		(1014, NULL, '蔡四', 27, 0, '1997-11-30', 1, '台中市北區台灣大道321號', '0941345678', 'caisisi@example.com'),
		(1015, NULL, '郭五', 34, 1, '1989-01-01', 0, '桃園市蘆竹區長庚路654號', '0951345678', 'guowu@example.com'),
		(1016, NULL, '陳六', 23, 0, '2000-02-14', 1, '台南市南區大同路123號', '0961345678', 'chenliu@example.com'),
		(1017, NULL, '王七', 37, 1, '1986-08-12', 0, '新竹市西區光復路456號', '0971345678', 'wangqi@example.com'),
		(1018, NULL, '林八', 29, 0, '1995-10-24', 1, '基隆市七堵區和平路789號', '0981345678', 'linba@example.com'),
		(1019, NULL, '吳九', 42, 1, '1981-03-30', 0, '台北市士林區文昌路321號', '0991345678', 'wujio@example.com'),
		(1020, NULL, '蔡十', 33, 0, '1991-12-12', 1, '新北市淡水區中正路456號', '0901345678', 'caishi@example.com');
-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM Members;
		SELECT * FROM MembersDetail;
-------------------------------------------------------------------------------------------------------------------------------------------



---會員積分----------------------------------------------------------------------------------------------------------------------------

-----------------------會員總積分-----------------------------
	CREATE TABLE Points (
		id INT PRIMARY KEY NOT NULL,                 -- 積分記錄唯一識別碼
		member_id INT NOT NULL,                      -- 會員ID (FK)
			FOREIGN KEY (member_id) REFERENCES Members(id),
		points INT NOT NULL,                         -- 獲得或使用的積分
		current_points INT NOT NULL,                 -- 會員當前積分
		transaction_date DATETIME NOT NULL,         -- 交易日期
		type NVARCHAR(20) NOT NULL,                 -- 積分類型（獲得/使用）
		order_id INT NULL,                          -- 訂單ID (可選)
		FOREIGN KEY (member_id) REFERENCES Members(id)  -- 會員外鍵約束
	);
	INSERT INTO Points (id, member_id, points, current_points, transaction_date, type, order_id) 
		VALUES
			(1, 1001, 100, 100, '2023-10-01 10:30:00', '獲得', NULL),
			(2, 1002, -50, 50, '2023-10-05 12:20:00', '使用', 101),   -- 使用積分的例子
			(3, 1003, 150, 150, '2023-10-02 11:15:00', '獲得', NULL),
			(4, 1004, 200, 200, '2023-10-03 12:20:00', '獲得', NULL),
			(5, 1005, -100, 150, '2023-10-04 13:10:00', '使用', 102);  -- 使用積分的例子

-----------------------積分獎品表-----------------------------
	CREATE TABLE PointPrizes (
		id INT PRIMARY KEY NOT NULL,                 -- 獎品唯一識別碼
		name NVARCHAR(50) NOT NULL,					 -- 獎品名稱
		required_points INT NOT NULL,                -- 獲得獎品所需的積分
		description NVARCHAR(300) NULL,              -- 獎品描述
		quantity INT NOT NULL,                       -- 獎品數量
		created_at DATETIME NOT NULL                 -- 獎品創建日期
	);
	INSERT INTO PointPrizes (id, name, required_points, description, quantity, created_at) 
		VALUES
		(1, '咖啡券', 100, '可兌換一杯咖啡', 50, '2023-10-01 10:00:00'),
		(2, '甜點券', 150, '可兌換一份甜點', 30, '2023-10-01 11:00:00'),
		(3, '折扣券', 200, '可享受10%折扣', 20, '2023-10-01 12:00:00'),
		(4, '餐券', 500, '可用於任意餐點', 10, '2023-10-01 13:00:00'),
		(5, '生日優惠', 1000, '可於生日當月使用', 5, '2023-10-01 14:00:00');

-----------------------兌換紀錄表-----------------------------
	CREATE TABLE RedemptionRecords (
		id INT PRIMARY KEY NOT NULL,                 -- 兌換紀錄唯一識別碼
		member_id INT NOT NULL,                      -- 會員ID (FK)
			FOREIGN KEY (member_id) REFERENCES Members(id),			-- 會員外鍵約束
		prize_id INT NOT NULL,                       -- 獎品ID (FK)
			FOREIGN KEY (prize_id) REFERENCES PointPrizes(id),     -- 獎品外鍵約束
		points_used INT NOT NULL,                    -- 兌換所用積分
		redemption_date DATETIME NOT NULL,           -- 兌換日期
	);
	INSERT INTO RedemptionRecords (id, member_id, prize_id, points_used, redemption_date) 
	VALUES
		(1, 1001, 1, 100, '2023-10-01 10:00:00'),
		(2, 1002, 2, 150, '2023-10-02 11:00:00'),
		(3, 1003, 3, 200, '2023-10-03 12:00:00'),
		(4, 1004, 4, 500, '2023-10-04 13:00:00'),
		(5, 1005, 5, 1000, '2023-10-05 14:00:00');


-------------------------------------------------------------------------------------------------------------------------------------------






---訂位系統----------------------------------------------------------------------------------------------------------------------------

-----------------------桌位-----------------------------
	CREATE TABLE Seats (
		id INT ,											-- 座位編號
		seat_type NVARCHAR(50) NOT NULL,					-- 座位類型
		seat_number NVARCHAR(10) PRIMARY KEY NOT NULL       -- 座位號碼
	);
	INSERT INTO Seats (id, seat_type, seat_number)
			VALUES
					(1, '包廂', 'B1'),
					(2, '靠窗', 'A2'),
					(3, '普通', 'C1'),
					(4, '包廂', 'B2'),
					(5, '靠窗', 'A1'),
					(6, '包廂', 'A3'),
					(7, '靠窗', 'B3'),
					(8, '普通', 'C3'),
					(9, '包廂', 'A4');
------------------------------------------------------------------
-----------------------訂位資訊-----------------------------
	CREATE TABLE Reservations (
		id VARCHAR(10) PRIMARY KEY,								-- 隨機字串作為訂位編號
		members_id INT  NULL,									-- 會員編號FOREIGN KEY REFERENCES Members(id)
			FOREIGN KEY (members_id) REFERENCES Members(id),
		customer_name NVARCHAR(50) NOT NULL,					-- 顧客姓名
		customer_gender TINYINT NOT NULL,						-- 顧客性別（0=Female, 1=Male）
		contact_phone CHAR(10) NOT NULL,						-- 聯絡電話
		reservation_time DATETIME NOT NULL,						-- 訂位時間
		number_people INT NOT NULL,								-- 訂位人數
		seat_name NVARCHAR(10) NOT NULL,						-- 座位編號FOREIGN KEY REFERENCES Seats(id)
			FOREIGN KEY (seat_name) REFERENCES Seats(seat_number),
		special_requests NVARCHAR(255),							-- 特殊要求
		reservation_status NVARCHAR(50),						-- 訂位狀況
		notes NVARCHAR(255),									-- 備註
		created_at DATETIME DEFAULT GETDATE()					-- 建立日期，自動設置為當前時間
	);
	INSERT INTO Reservations (id, members_id, customer_name, customer_gender, contact_phone, reservation_time, number_people, seat_name, special_requests, reservation_status, notes)
			VALUES
			('R001', 1001, '張三', 0, '0912345678', '2024-10-15 18:00', 4, 'A1', '無', '已確認', ''),
			('R002', NULL, '李小龍', 1, '0923456789', '2024-10-16 19:00', 2, 'A2', '請準備生日蛋糕', '待確認', ''),
			('R003', 1002, '李四', 1, '0934567890', '2024-10-17 20:00', 3, 'A3', '過敏請注意', '已確認', ''),
			('R004', NULL, '趙六', 1, '0945678901', '2024-10-18 18:30', 5, 'A4', '素食', '待確認', '請提供素食選項'),
			('R005', 1003, '王五', 0, '0956789012', '2024-10-19 19:30', 2, 'B1', '無', '已取消', '客戶主動取消'),
			('R006', NULL, '張風三', 1, '0966789013', '2024-10-20 17:00', 4, 'B2', '無', '已確認', ''),
			('R007', 1001, '小美', 0, '0976789014', '2024-10-21 18:00', 3, 'B3', '無', '已確認', ''),
			('R008', NULL, '李王端', 1, '0986789015', '2024-10-22 19:00', 6, 'B1', '無', '待確認', ''),
			('R009', 1002, '李四', 1, '0996789016', '2024-10-23 20:00', 2, 'C1', '無', '已確認', ''),
			('R010', NULL, '陳小每', 0, '0906789017', '2024-10-24 18:30', 4, 'C3', '無', '待確認', '');
-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM  Members;
		SELECT * FROM Seats;
		SELECT * FROM  Reservations;
-------------------------------------------------------------------------------------------------------------------------------------------



---服務系統----------------------------------------------------------------------------------------------------------------------------
	CREATE TABLE ServiceRequests (
		request_id VARCHAR(10) PRIMARY KEY,							-- 服務請求編號
		seat_name NVARCHAR(10) NOT NULL,							-- 座位號碼FOREIGN KEY REFERENCES Seats(seat_number)
			FOREIGN KEY (seat_name) REFERENCES Seats(seat_number),
		server_id INT NOT NULL,										-- 服務生編號FOREIGN KEY REFERENCES Users(id)
			FOREIGN KEY (server_id) REFERENCES Users(id),
		request_time DATETIME NOT NULL,								-- 請求時間
		request_content NVARCHAR(255) NOT NULL,						-- 請求內容
		request_status NVARCHAR(50) NOT NULL,						-- 請求狀態
		completion_time DATETIME,									-- 完成時間
		rating TINYINT CHECK (rating BETWEEN 1 AND 5),				-- 評價（1-5分）
		notes NVARCHAR(255),										-- 備註
		created_at DATETIME DEFAULT GETDATE()						-- 建立日期，自動設置為當前時間
	);
	INSERT INTO ServiceRequests (request_id, seat_name, server_id, request_time, request_content, request_status, completion_time, rating, notes)
			VALUES
				('SR001', 'A1', 8003, '2024-10-15 18:05', '需要額外的餐具', '已處理', '2024-10-15 18:15', 5, '服務生回應迅速'),
				('SR002', 'B2', 8003, '2024-10-16 19:15', '請加點飲料', '待處理', NULL, NULL, '請盡快處理'),
				('SR003', 'C1', 8003, '2024-10-17 20:30', '要求素食選項', '已處理', '2024-10-17 20:45', 4, '味道不錯'),
				('SR004', 'A2', 8003, '2024-10-18 18:45', '需要查詢菜單', '已處理', '2024-10-18 18:55', 5, '服務生解答清楚'),
				('SR005', 'B1', 8003, '2024-10-19 19:00', '請更換餐桌', '已處理', '2024-10-19 19:10', 3, '稍微慢了一點'),
				('SR006', 'C1', 8003, '2024-10-20 17:30', '需要更多調味料', '已處理', '2024-10-20 17:35', 4, '很滿意'),
				('SR007', 'A3', 8003, '2024-10-21 18:00', '請提供餐後甜點', '已處理', '2024-10-21 18:10', 5, '非常好吃'),
				('SR008', 'B3', 8003, '2024-10-22 19:20', '想要了解今日特餐', '待處理', NULL, NULL, '請及時回應'),
				('SR009', 'C3', 8003, '2024-10-23 20:15', '需要額外的飲用水', '已處理', '2024-10-23 20:20', 5, '服務生非常友善'),
				('SR010', 'A4', 8003, '2024-10-24 18:45', '請準備一個小蛋糕', '已處理', '2024-10-24 18:50', 4, '蛋糕非常美味');
-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM  Users;
		SELECT * FROM Seats;
		SELECT * FROM  ServiceRequests;
-------------------------------------------------------------------------------------------------------------------------------------------

---商品----------------------------------------------------------------------------------------------------------------------------
	CREATE TABLE Products (
			id VARCHAR(10) PRIMARY KEY NOT NULL ,				-- 商品編號
			product_category NVARCHAR(50) NOT NULL,             -- 商品分類
			product_image NVARCHAR(255) NOT NULL,				-- 商品圖片
			product_name NVARCHAR(50) NOT NULL,					-- 商品名稱
			product_price INT NOT NULL,							-- 商品價格
			product_description NVARCHAR(255)					-- 商品描述
		);
	INSERT INTO Products (id, product_category, product_image, product_name, product_price, product_description)
			VALUES
			('P001', '主菜', 'image1.jpg', '牛排', 500, '鮮嫩多汁的牛排，搭配特製醬汁。'),
			('P002', '沙拉', 'image2.jpg', '沙拉', 150, '新鮮的蔬菜沙拉，無添加醬料。'),
			('P003', '主菜', 'image3.jpg', '義大利麵', 300, '經典義大利麵，濃郁醬汁。'),
			('P004', '飲料', 'image4.jpg', '飲料', 100, '清爽飲品，適合夏天享用。'),
			('P005', '甜點', 'image5.jpg', '甜點', 200, '各式精緻甜點，口感絕佳。'),
			('P006', '主菜', 'image6.jpg', '比薩', 400, '香脆比薩，選擇多樣。'),
			('P007', '主菜', 'image7.jpg', '燉飯', 350, '美味燉飯，選用新鮮食材。'),
			('P008', '小吃', 'image8.jpg', '炸物拼盤', 450, '各式炸物，口感酥脆。'),
			('P009', '主菜', 'image9.jpg', '海鮮拼盤', 600, '新鮮海鮮，搭配特製醬汁。'),
			('P010', '主菜', 'image10.jpg', '烤雞', 300, '香烤雞肉，外脆內嫩。'),
			('P011', '飲料', 'image11.jpg', '果汁', 120, '現榨果汁，健康又美味。'),
			('P012', '甜點', 'image12.jpg', '冰淇淋', 150, '各式口味的冰淇淋，夏季必備。'),
			('P013', '小吃', 'image13.jpg', '春捲', 180, '香脆春捲，內餡豐富。'),
			('P014', '主菜', 'image14.jpg', '牛肉麵', 250, '濃郁牛肉湯，搭配彈牙麵條。'),
			('P015', '飲料', 'image15.jpg', '咖啡', 180, '香醇咖啡，提神醒腦。'),
			('P016', '主菜', 'image16.jpg', '羊排', 700, '多汁的羊排，搭配草本香料。'),
			('P017', '小吃', 'image17.jpg', '炸雞', 230, '外酥內嫩的炸雞，必點美食。'),
			('P018', '甜點', 'image18.jpg', '蛋糕', 250, '各式蛋糕，適合各種場合。'),
			('P019', '主菜', 'image19.jpg', '海鮮炒飯', 320, '新鮮海鮮，搭配香氣四溢的炒飯。'),
			('P020', '飲料', 'image20.jpg', '奶昔', 160, '香濃奶昔，選擇多樣。');


-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM		Products;
		
-------------------------------------------------------------------------------------------------------------------------------------------





---訂單系統----------------------------------------------------------------------------------------------------------------------------

-----------------------訂單資訊-----------------------------
	CREATE TABLE Orders (
		order_id VARCHAR(10) PRIMARY KEY,								-- 訂單編號
		members_id INT NULL,											-- 會員編號 (FOREIGN KEY REFERENCES Members(id)，可以為 NULL)
			FOREIGN KEY (members_id) REFERENCES Members(id),
		customer_name NVARCHAR(50),										-- 顧客姓名（適用於非會員）
		table_number NVARCHAR(10) NOT NULL,								-- 桌號FOREIGN KEY REFERENCES Seats(seat_number)
			FOREIGN KEY (table_number) REFERENCES Seats(seat_number),
		order_time DATETIME NOT NULL,									-- 訂單時間
		order_status NVARCHAR(50) NOT NULL,								-- 訂單狀況
		created_at DATETIME DEFAULT GETDATE(),							-- 建立日期，自動設置為當前時間
		/*FOREIGN KEY (member_id) REFERENCES Members(id)   -- 外鍵約束，參考會員表*/
	);

	INSERT INTO Orders (order_id, members_id, customer_name, table_number, order_time, order_status, created_at)
			VALUES
			('O001', 1001, '張三', 'A1', '2024-10-15 12:00', '已完成', GETDATE()),
			('O002', NULL, '四神', 'B2', '2024-10-15 12:30', '已完成', GETDATE()),
			('O003', 1002, '李四', 'C1', '2024-10-15 13:00', '待處理', GETDATE()),
			('O004', NULL, '六全', 'B1', '2024-10-15 13:30', '已取消', GETDATE()),
			('O005', 1003, '王五', 'A2', '2024-10-15 14:00', '已完成', GETDATE()),
			('O006', NULL, '劉八', 'A1', '2024-10-15 14:30', '待處理', GETDATE()),
			('O007', 1004, '趙六', 'B2', '2024-10-15 15:00', '已完成', GETDATE()),
			('O008', NULL, '周十', 'C1', '2024-10-15 15:30', '已完成', GETDATE()),
			('O009', 1001, '張三', 'B1', '2024-10-15 16:00', '待處理', GETDATE()),
			('O010', 1002, '李四', 'A2', '2024-10-15 16:30', '已完成', GETDATE()),
			('O011', NULL, '蔡十一', 'A1', '2024-10-15 17:00', '已取消', GETDATE()),
			('O012', 1003, '王五', 'B2', '2024-10-15 17:30', '已完成', GETDATE());

	-----------------------訂單詳情-----------------------------
		CREATE TABLE OrderDetails (
				orderdetail_id INT PRIMARY KEY IDENTITY(1,1),					-- 自動生成的項目編號
				orders_id VARCHAR(10) NOT NULL,									-- 訂單編號 (FOREIGN KEY REFERENCES Orders(order_id))
					FOREIGN KEY (orders_id) REFERENCES Orders(order_id),
				product_id VARCHAR(10) NOT NULL,								-- 商品ID (FOREIGN KEY REFERENCES Products(product_id))
					FOREIGN KEY (product_id) REFERENCES Products(id),
				product_quantity INT NOT NULL,									-- 商品數量
				total_quantity INT NOT NULL,									-- 總數量
				total_price DECIMAL(10, 2) NOT NULL,							-- 商品總價格
				special_requests NVARCHAR(255),									-- 特殊要求
				created_at DATETIME DEFAULT GETDATE(),							-- 建立日期，自動設置為當前時間
				/*FOREIGN KEY (order_id) REFERENCES Orders(order_id)   -- 外鍵約束，參考訂單表*/
			);
		INSERT INTO OrderDetails (orders_id, product_id, product_quantity, total_quantity, total_price, special_requests)
				VALUES
				('O001', 'P001', 1, 1, 500.00, '無特殊要求'),        -- 假設 P001 是牛排
				('O001', 'P002', 2, 2, 400.00, '加醬'),               -- 假設 P002 是沙拉
				('O002', 'P003', 1, 1, 150.00, '無冰'),               -- 假設 P003 是飲料
				('O003', 'P004', 1, 1, 600.00, '無香料'),             -- 假設 P004 是披薩
				('O004', 'P005', 3, 3, 900.00, '加辣'),               -- 假設 P005 是炸雞
				('O005', 'P006', 1, 1, 350.00, '無特殊要求'),         -- 假設 P006 是義大利麵
				('O006', 'P007', 2, 2, 360.00, '加巧克力'),           -- 假設 P007 是甜點
				('O007', 'P008', 1, 1, 700.00, '無特殊要求'),         -- 假設 P008 是海鮮飯
				('O008', 'P009', 2, 2, 200.00, '加冰'),               -- 假設 P009 是果汁
				('O009', 'P001', 1, 1, 500.00, '全熟'),               -- 假設 P001 是牛排
				('O010', 'P002', 2, 2, 400.00, '無特殊要求'),         -- 假設 P002 是沙拉
				('O011', 'P005', 1, 1, 300.00, '無特殊要求');         -- 假設 P005 是炸雞

-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM		Orders;
		SELECT * FROM		Products;
		SELECT * FROM		Orders;
		SELECT * FROM		OrderDetails;
-------------------------------------------------------------------------------------------------------------------------------------------


---評論系統----------------------------------------------------------------------------------------------------------------------------

		-----------------------評論留言-----------------------------

		CREATE TABLE Reviews (
			review_id INT PRIMARY KEY IDENTITY(1,1),									-- 自動生成的評價ID
			orders_id VARCHAR(10) NOT NULL,												-- 訂單編號 (FOREIGN KEY REFERENCES Orders(order_id))
				FOREIGN KEY (orders_id) REFERENCES Orders(order_id),
			product_name NVARCHAR(50) NOT NULL,											-- 商品名稱
			member_id INT NULL,															-- 會員編號 (FOREIGN KEY REFERENCES Members(id)，可以為 NULL)
				FOREIGN KEY (member_id) REFERENCES Members(id),
			rating TINYINT CHECK (rating BETWEEN 1 AND 5) NOT NULL,						-- 評分（1-5分）
			review_content NVARCHAR(255),												-- 評論內容
			review_date DATETIME NOT NULL,												-- 評論日期
			created_at DATETIME DEFAULT GETDATE()										-- 建立日期，自動設置為當前時間
				/*FOREIGN KEY (order_id) REFERENCES Orders(order_id),						-- 外鍵約束，參考訂單表*/
				/*FOREIGN KEY (member_id) REFERENCES Members(id)							-- 外鍵約束，參考會員表*/
		);
		INSERT INTO Reviews (orders_id, product_name, member_id, rating, review_content, review_date)
				VALUES
					('O001', '牛排', 1001, 5, '非常好吃，值得再來！', '2024-10-01'),
					('O001', '沙拉', 1001, 4, '新鮮，但稍微鹹了一點。', '2024-10-01'),
					('O002', '飲料', NULL, 3, '一般般，沒有特別的味道。', '2024-10-02'),  -- 非會員
					('O003', '披薩', 1002, 5, '這是我吃過最好吃的披薩！', '2024-10-03'),
					('O004', '炸雞', 1003, 4, '外酥內嫩，挺好吃的。', '2024-10-04'),
					('O005', '義大利麵', 1002, 5, '口味一流，推薦！', '2024-10-05'),
					('O006', '甜點', 1004, 4, '太甜了，但口感很好。', '2024-10-06'),
					('O007', '海鮮飯', NULL, 5, '海鮮非常新鮮，值得一試！', '2024-10-07'),  -- 非會員
					('O008', '果汁', 1001, 3, '味道還行，但不夠冰。', '2024-10-08'),
					('O009', '牛排', 1001, 5, '每次來都會點的！', '2024-10-09'),
					('O010', '沙拉', 1002, 4, '搭配很好，還會再來。', '2024-10-10'),
					('O011', '炸雞', 1003, 2, '有點油膩，不太喜歡。', '2024-10-11');
	-----------------------商品總評分-----------------------------
		CREATE TABLE ProductRatings (
			id INT PRIMARY KEY IDENTITY(1,1) ,					-- 自動生成的評價ID
			product_id VARCHAR(10) NOT NULL,							-- 商品ID (FOREIGN KEY REFERENCES Products(product_id))
				FOREIGN KEY (product_id) REFERENCES Products(id),
			ranking_id int not null,
				FOREIGN KEY (ranking_id) REFERENCES Reviews(review_id),
			total_rating INT NOT NULL,									-- 總評分
			rating_count INT NOT NULL,									-- 評分次數
			average_rating DECIMAL(3, 2) NOT NULL,						-- 平均評分
			highest_rating TINYINT NOT NULL,							-- 最高評分
			lowest_rating TINYINT NOT NULL,								-- 最低評分
			last_rating_date DATETIME NOT NULL,							-- 最近評分日期
			created_at DATETIME DEFAULT GETDATE(),                 -- 建立日期，自動設置為當前時間
					/*FOREIGN KEY (product_id) REFERENCES Products(id) -- 外鍵約束，參考商品表*/
	);
	INSERT INTO ProductRatings (product_id, ranking_id, total_rating, rating_count, average_rating, highest_rating, lowest_rating, last_rating_date)
		VALUES
			('P001', 1, 20, 4, 5.00, 5, 4, '2024-10-09'),  -- 牛排
			('P002', 2, 16, 4, 4.00, 4, 3, '2024-10-10'),  -- 沙拉
			('P003', 3, 6, 2, 3.00, 4, 2, '2024-10-02'),   -- 飲料
			('P004', 4, 10, 2, 5.00, 5, 5, '2024-10-03'),  -- 披薩
			('P005', 5, 9, 3, 3.00, 4, 2, '2024-10-11');   -- 炸雞
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM		Orders;
		SELECT * FROM		Members;
		SELECT * FROM		Products;
		SELECT * FROM		ProductRatings;
		SELECT * FROM		Reviews;
-------------------------------------------------------------------------------------------------------------------------------------------


---抽獎活動----------------------------------------------------------------------------------------------------------------------------

-----------------------活動表-----------------------------
	CREATE TABLE Campaign  (
		id INT PRIMARY KEY NOT NULL,               -- 活動的唯一識別碼
		title NVARCHAR(50) NOT NULL,               -- 活動的標題
		campaign_description NVARCHAR(300) NOT NULL,        -- 活動的內容描述
		campaign_type NVARCHAR(50) NOT NULL,          -- 活動的類型（例如：美食、表演等）
		campaign_start_date DATETIME NOT NULL,              -- 活動的開始日期和時間
		end_date DATETIME NOT NULL,                -- 活動的結束日期和時間
		created_at DATETIME NOT NULL,              -- 活動創建的日期和時間
		note NVARCHAR(300) NULL                     -- 其他備註信息（可選）
	);
	INSERT INTO Campaign (id, title, campaign_description, campaign_type, campaign_start_date , end_date, created_at, note) 
		VALUES
			(1, '美食節', '邀請各大餐廳參加的美食盛會。', '美食', '2024-11-01 10:00:00', '2024-11-01 20:00:00', '2023-10-14 12:00:00', '入場免費'),
			(2, '廚師秀', '知名廚師現場烹飪表演。', '表演', '2024-11-05 18:00:00', '2024-11-05 21:00:00', '2023-10-14 12:30:00', '需提前報名'),
			(3, '品酒會', '專業品酒師帶你品嚐各種美酒。', '品酒', '2024-11-10 19:00:00', '2024-11-10 22:00:00', '2023-10-14 13:00:00', '限額30人'),
			(4, '素食料理課程', '學習如何製作美味的素食菜餚。', '課程', '2024-11-15 10:00:00', '2024-11-15 13:00:00', '2023-10-14 14:00:00', '提供食材'),
			(5, '家庭日', '適合全家的餐廳活動，歡樂遊戲。', '家庭', '2024-11-20 11:00:00', '2024-11-20 16:00:00', '2023-10-14 14:30:00', '免費遊戲'),
			(6, '海鮮之夜', '享受新鮮海鮮的美味盛宴。', '晚餐', '2024-11-25 18:00:00', '2024-11-25 22:00:00', '2023-10-14 15:00:00', '預約必須'),
			(7, '甜點工作坊', '學習製作各種美味甜點。', '工作坊', '2024-11-30 14:00:00', '2024-11-30 17:00:00', '2023-10-14 15:30:00', '提供材料'),
			(8, '咖啡品鑑', '探索各種咖啡的風味。', '品鑑', '2024-12-05 15:00:00', '2024-12-05 18:00:00', '2023-10-14 16:00:00', '限額20人'),
			(9, '國際美食日', '各國料理的聚會。', '美食', '2024-12-10 12:00:00', '2024-12-10 18:00:00', '2023-10-14 16:30:00', '小孩免費'),
			(10, '節日特餐', '特別節日菜單供應。', '特餐', '2024-12-20 17:00:00', '2024-12-20 22:00:00', '2023-10-14 17:00:00', NULL);

-----------------------獎品表-----------------------------
	CREATE TABLE Campaignprizes (
		id INT PRIMARY KEY NOT NULL,               -- 獎品的唯一識別碼
		campaign_id INT NOT NULL,                  -- 活動的識別碼，FOREIGN KEY (campaign_id) REFERENCES Campaign(id)
			FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
		name NVARCHAR(30) NOT NULL,                -- 獎品的名稱
		quantity INT NOT NULL,                      -- 獎品的數量
		description NVARCHAR(300) NULL,            -- 獎品的描述（可選）
		created_at DATETIME NOT NULL,              -- 獎品創建的日期和時間
	);
	INSERT INTO Campaignprizes (id, campaign_id, name, quantity, description, created_at) 
		VALUES
			(1, 1, '餐廳優惠券', 50, '可在指定餐廳使用的50元優惠券。', '2023-10-14 12:00:00'),
			(2, 2, '廚師簽名菜譜', 20, '知名廚師簽名的菜譜，附贈食材包。', '2023-10-14 12:30:00'),
			(3, 3, '品酒體驗券', 30, '可參加一次專業的品酒體驗。', '2023-10-14 13:00:00'),
			(4, 4, '素食料理書', 15, '介紹多款美味素食菜餚的料理書。', '2023-10-14 14:00:00'),
			(5, 5, '家庭餐點禮券', 25, '可供全家享用的餐點禮券。', '2023-10-14 14:30:00');

-----------------------活動參與表-----------------------------
	CREATE TABLE lottery_entries (
		id INT PRIMARY KEY NOT NULL,               -- 參與表的唯一識別碼
		campaign_id INT NOT NULL,                     -- 活動的識別碼，外鍵
			FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
		order_id VARCHAR(10) NOT NULL,                     -- 訂單的識別碼，外鍵
			FOREIGN KEY (order_id) REFERENCES Orders(order_id),
		created_at DATETIME NOT NULL,              -- 參與建立的日期和時間
		note NVARCHAR(300) NULL,                   -- 其他備註信息（可選）
		FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
	);
	INSERT INTO lottery_entries (id, campaign_id, order_id, created_at, note) 
		VALUES
			(1, 1, 'O001', '2023-10-14 12:00:00', '第一次參加活動'),
			(2, 2, 'O002', '2023-10-14 12:30:00', '期待廚師秀'),
			(3, 3, 'O003', '2023-10-14 13:00:00', '希望能獲獎'),
			(4, 4, 'O004', '2023-10-14 14:00:00', '素食活動很有趣'),
			(5, 5, 'O005', '2023-10-14 14:30:00', '全家一起參加');

-----------------------活動結果表-----------------------------
	CREATE TABLE LotteryWinners (
		id INT PRIMARY KEY NOT NULL,                -- 結果的唯一識別碼
		campaign_id INT NOT NULL,                      -- 活動的識別碼，外鍵FOREIGN KEY (campaign_id) REFERENCES Campaign(id)
			FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
		lottery_entry_id INT NOT NULL,              -- 參與表的識別碼，外鍵FOREIGN KEY (lottery_entry_id) REFERENCES lottery_entries(id)
			FOREIGN KEY (lottery_entry_id) REFERENCES lottery_entries(id), 
		prize_id INT NOT NULL,                      -- 獎品的識別碼，外鍵FOREIGN KEY (prize_id) REFERENCES prizes(id)
			FOREIGN KEY (prize_id) REFERENCES Campaignprizes(id),           
		created_at DATETIME NOT NULL,               -- 結果建立的日期和時間
	);

	INSERT INTO LotteryWinners (id, campaign_id, lottery_entry_id, prize_id, created_at) 
		VALUES
			(1, 1, 1, 1, '2023-10-14 12:00:00'),
			(2, 2, 2, 2, '2023-10-14 12:30:00'),
			(3, 3, 3, 3, '2023-10-14 13:00:00'),
			(4, 4, 4, 4, '2023-10-14 14:00:00'),
			(5, 5, 5, 5, '2023-10-14 14:30:00');
------------------------------------------------------------------------------------------------------------------------------------------






