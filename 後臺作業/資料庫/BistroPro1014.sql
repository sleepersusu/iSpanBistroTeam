--�޲z��-------------------------------------------------------------------------------------------------------------------------------------------
		
		CREATE TABLE Users (
			id INT IDENTITY(8001,1) PRIMARY KEY NOT NULL,		-- �޲z��ID�A�۰ʻ��W
			users_account VARCHAR(50) UNIQUE NOT NULL,			-- �޲z�̱b��
			users_password VARCHAR(50) NOT NULL,				-- �޲z�̱K�X
			created_at DATETIME DEFAULT GETDATE()				-- �إ߮ɶ��A�۰ʳ]�m����e�ɶ�
		);
		INSERT INTO Users (users_account, users_password)
				VALUES
						('admin1', 'password123'),
						('admin2', 'password456'),
						('admin3', 'password789'),
						('admin4', 'password321'),
						('admin5', 'password654');
-------------------------------------------------------------------------------------------------------------------------------------------
--���u-----------------------------------------------------------------------------------------------------------------------------------
		
		CREATE TABLE Employee (
			id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,       -- ���uID�A�۰ʻ��W
			users_id INT NOT NULL,                           -- �ϥΪ�ID (FK)
				FOREIGN KEY (users_id) REFERENCES Users(id),
			Empolyee_name NVARCHAR(50) NOT NULL,            -- �m�W
			Empolyee_gender NVARCHAR(50) NOT NULL,          -- �ʧO
			Empolyee_born DATE NOT NULL,                     -- �X�ͦ~���
			Empolyee_tel VARCHAR(15) NOT NULL,               -- �q��
			Empolyee_seniority INT NOT NULL,                 -- �~��
			Empolyee_salary INT NOT NULL                      -- �~��

		);
		INSERT INTO Employee (users_id, Empolyee_name, Empolyee_gender, Empolyee_born, Empolyee_tel, Empolyee_seniority, Empolyee_salary)
				VALUES
						(8001, '�i��', '�k', '1990-05-01', '0912345678', 5, 60000),
						(8002, '���R', '�k', '1988-11-20', '0923456789', 7, 72000),
						(8003, '���p��', '�k', '1995-03-15', '0934567890', 3, 50000),
						(8004, '������', '�k', '1992-07-30', '0945678901', 4, 65000),
						(8005, '�B�w��', '�k', '1985-01-25', '0956789012', 10, 90000);
---------------------------------------------------------------------------------------------------------------------------------------------

--������-----------------------------------------------------------------------------------------------------------------------------------

		CREATE TABLE Supply (
			id INT IDENTITY(7001,1) PRIMARY KEY NOT NULL,			-- ID�A�۰ʻ��W
			users_id INT NOT NULL,									-- �ϥΪ�ID (FK)
				FOREIGN KEY (users_id) REFERENCES Users(id),
			supply_name VARCHAR(50) NOT NULL,						-- �����t��
			supply_product VARCHAR(50) NOT NULL,					-- ���~
			supply_count INT NOT NULL,								-- �ƶq
			supply_price INT NOT NULL,								-- ����
			created_at DATETIME DEFAULT GETDATE()					-- �إ߮ɶ��A�۰ʳ]�m����e�ɶ�
		);
		INSERT INTO Supply (users_id, supply_name, supply_product, supply_count, supply_price)
			VALUES
				(8005, '�x�W�̰�', '��', 1000, 1500),
				(8005, '�s�A���G����', '�͵�', 500, 800),
				(8005, '���A���e', '�D��', 200, 3000),
				(8005, '�����M��', '���ݦ�', 300, 2500),
				(8005, '�ը��Ƥ��a', '�­J�ԯ�', 150, 200),
				(8005, '���ƨ�����', '���', 1000, 1200),
				(8005, '�B�~����', '���|', 800, 1500),
				(8005, '�M�H���', '�ѯ�', 600, 1000),
				(8005, '�x�W����', '���', 400, 700),
				(8005, '��G������', '����', 300, 1800);
---------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Employee;
SELECT * FROM Users;
SELECT * FROM Supply;
---------------------------------------------------------------------------------------------------------------------------------------------

---�|��Members--------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Members (
    id INT IDENTITY(1001,1) PRIMARY KEY NOT NULL,			-- �|��ID�A�۰ʻ��W
    member_account VARCHAR(50) UNIQUE NOT NULL,				-- �b��(���)�A�ߤ@
    member_password VARCHAR(50) NOT NULL,					-- �K�X
    created_at DATETIME DEFAULT GETDATE()					-- �إߤ���A�۰ʳ]�m����e�ɶ�
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
---�|���Ա�MembersDetail----------------------------------------------------------------------------------------------------------
CREATE TABLE MembersDetail (
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,			-- �|�����ID�A�۰ʻ��W
    members_id INT NOT NULL,							-- �|��ID (FK)
		FOREIGN KEY (members_id) REFERENCES Members(id),
    memebers_img VARBINARY(MAX) NULL,					-- �|���Ϥ�
    members_name NVARCHAR(50) NOT NULL,					-- �m�W
    members_age TINYINT NOT NULL,						-- �~��
    members_sex TINYINT NOT NULL,						-- �ʧO (0=Female, 1=Male)
    members_birthday DATE NOT NULL,						-- �ͤ�
    members_favor TINYINT NOT NULL,						-- ���� (0=introvert, 1=extrovert)
    members_address NVARCHAR(255) NOT NULL,				-- ��}
    members_phone CHAR(10) NULL,						-- �p���q��
    members_email VARCHAR(255) NOT NULL,				-- �q�l�H�c
    created_at DATETIME DEFAULT GETDATE()				-- �إߤ���A�۰ʳ]�m����e�ɶ�
);
INSERT INTO MembersDetail (members_id, memebers_img, members_name, members_age, members_sex, members_birthday, members_favor, members_address, members_phone, members_email)
	VALUES
		(1001, NULL, '�i�T', 28, 1, '1996-01-15', 0, '�x�_���j�w�ϫH�q��123��', '0912345678', 'zhangsan@example.com'),
		(1002, NULL, '���|', 35, 0, '1988-04-22', 1, '�������e��ϫذ��456��', '0922345678', 'lisi@example.com'),
		(1003, NULL, '����', 40, 1, '1983-06-18', 1, '�x�����n�ϫذ�_��321��', '0933345678', 'wangwu@example.com'),
		(1004, NULL, '����', 45, 0, '1978-03-15', 0, '�s�_���T�l�ϲM����654��', '0944345678', 'zhaoliu@example.com'),
		(1005, NULL, '�]�C', 30, 1, '1994-07-22', 1, '��饫Ī�˰Ϫ�����987��', '0955345678', 'sunqi@example.com'),
		(1006, NULL, '�P�K', 22, 0, '2001-01-11', 1, '�x�n������Ϥ��ظ�123��', '0966345678', 'zhouba@example.com'),
		(1007, NULL, '�d�E', 38, 1, '1985-02-28', 0, '�򶩥����R�ϩM����456��', '0977345678', 'wujio@example.com'),
		(1008, NULL, '�G�Q', 26, 0, '1998-09-09', 1, '�s�˥��F�ϥ��_��789��', '0988345678', 'zhengshi@example.com'),
		(1009, NULL, '�\��', 40, 1, '1983-06-12', 1, '�x�_���j�w�ϥ��_�n��321��', '0999345678', 'xubai@example.com'),
		(1010, NULL, '���d', 31, 0, '1993-04-04', 0, '�������e��ϥ��͸�456��', '0900345678', 'caichian@example.com'),
		(1011, NULL, '���@', 29, 1, '1995-05-15', 1, '�x�_�������ϳշR��123��', '0911345678', 'chenyi@example.com'),
		(1012, NULL, '���G', 35, 0, '1989-07-18', 0, '�������e��ϥ��͸�456��', '0921345678', 'huanger@example.com'),
		(1013, NULL, '�L�T', 41, 1, '1982-09-21', 1, '�s�_���s���Ϥ��ظ�789��', '0931345678', 'linsan@example.com'),
		(1014, NULL, '���|', 27, 0, '1997-11-30', 1, '�x�����_�ϥx�W�j�D321��', '0941345678', 'caisisi@example.com'),
		(1015, NULL, '����', 34, 1, '1989-01-01', 0, '��饫Ī�˰Ϫ�����654��', '0951345678', 'guowu@example.com'),
		(1016, NULL, '����', 23, 0, '2000-02-14', 1, '�x�n���n�Ϥj�P��123��', '0961345678', 'chenliu@example.com'),
		(1017, NULL, '���C', 37, 1, '1986-08-12', 0, '�s�˥���ϥ��_��456��', '0971345678', 'wangqi@example.com'),
		(1018, NULL, '�L�K', 29, 0, '1995-10-24', 1, '�򶩥��C���ϩM����789��', '0981345678', 'linba@example.com'),
		(1019, NULL, '�d�E', 42, 1, '1981-03-30', 0, '�x�_���h�L�Ϥ����321��', '0991345678', 'wujio@example.com'),
		(1020, NULL, '���Q', 33, 0, '1991-12-12', 1, '�s�_���H���Ϥ�����456��', '0901345678', 'caishi@example.com');
-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM Members;
		SELECT * FROM MembersDetail;
-------------------------------------------------------------------------------------------------------------------------------------------



---�|���n��----------------------------------------------------------------------------------------------------------------------------

-----------------------�|���`�n��-----------------------------
	CREATE TABLE Points (
		id INT PRIMARY KEY NOT NULL,                 -- �n���O���ߤ@�ѧO�X
		member_id INT NOT NULL,                      -- �|��ID (FK)
			FOREIGN KEY (member_id) REFERENCES Members(id),
		points INT NOT NULL,                         -- ��o�ΨϥΪ��n��
		current_points INT NOT NULL,                 -- �|����e�n��
		transaction_date DATETIME NOT NULL,         -- ������
		type NVARCHAR(20) NOT NULL,                 -- �n�������]��o/�ϥΡ^
		order_id INT NULL,                          -- �q��ID (�i��)
		FOREIGN KEY (member_id) REFERENCES Members(id)  -- �|���~�����
	);
	INSERT INTO Points (id, member_id, points, current_points, transaction_date, type, order_id) 
		VALUES
			(1, 1001, 100, 100, '2023-10-01 10:30:00', '��o', NULL),
			(2, 1002, -50, 50, '2023-10-05 12:20:00', '�ϥ�', 101),   -- �ϥοn�����Ҥl
			(3, 1003, 150, 150, '2023-10-02 11:15:00', '��o', NULL),
			(4, 1004, 200, 200, '2023-10-03 12:20:00', '��o', NULL),
			(5, 1005, -100, 150, '2023-10-04 13:10:00', '�ϥ�', 102);  -- �ϥοn�����Ҥl

-----------------------�n�����~��-----------------------------
	CREATE TABLE PointPrizes (
		id INT PRIMARY KEY NOT NULL,                 -- ���~�ߤ@�ѧO�X
		name NVARCHAR(50) NOT NULL,					 -- ���~�W��
		required_points INT NOT NULL,                -- ��o���~�һݪ��n��
		description NVARCHAR(300) NULL,              -- ���~�y�z
		quantity INT NOT NULL,                       -- ���~�ƶq
		created_at DATETIME NOT NULL                 -- ���~�Ыؤ��
	);
	INSERT INTO PointPrizes (id, name, required_points, description, quantity, created_at) 
		VALUES
		(1, '�@�ب�', 100, '�i�I���@�M�@��', 50, '2023-10-01 10:00:00'),
		(2, '���I��', 150, '�i�I���@�����I', 30, '2023-10-01 11:00:00'),
		(3, '�馩��', 200, '�i�ɨ�10%�馩', 20, '2023-10-01 12:00:00'),
		(4, '�\��', 500, '�i�Ω���N�\�I', 10, '2023-10-01 13:00:00'),
		(5, '�ͤ��u�f', 1000, '�i��ͤ���ϥ�', 5, '2023-10-01 14:00:00');

-----------------------�I��������-----------------------------
	CREATE TABLE RedemptionRecords (
		id INT PRIMARY KEY NOT NULL,                 -- �I�������ߤ@�ѧO�X
		member_id INT NOT NULL,                      -- �|��ID (FK)
			FOREIGN KEY (member_id) REFERENCES Members(id),			-- �|���~�����
		prize_id INT NOT NULL,                       -- ���~ID (FK)
			FOREIGN KEY (prize_id) REFERENCES PointPrizes(id),     -- ���~�~�����
		points_used INT NOT NULL,                    -- �I���ҥοn��
		redemption_date DATETIME NOT NULL,           -- �I�����
	);
	INSERT INTO RedemptionRecords (id, member_id, prize_id, points_used, redemption_date) 
	VALUES
		(1, 1001, 1, 100, '2023-10-01 10:00:00'),
		(2, 1002, 2, 150, '2023-10-02 11:00:00'),
		(3, 1003, 3, 200, '2023-10-03 12:00:00'),
		(4, 1004, 4, 500, '2023-10-04 13:00:00'),
		(5, 1005, 5, 1000, '2023-10-05 14:00:00');


-------------------------------------------------------------------------------------------------------------------------------------------






---�q��t��----------------------------------------------------------------------------------------------------------------------------

-----------------------���-----------------------------
	CREATE TABLE Seats (
		id INT ,											-- �y��s��
		seat_type NVARCHAR(50) NOT NULL,					-- �y������
		seat_number NVARCHAR(10) PRIMARY KEY NOT NULL       -- �y�츹�X
	);
	INSERT INTO Seats (id, seat_type, seat_number)
			VALUES
					(1, '�]�[', 'B1'),
					(2, '�a��', 'A2'),
					(3, '���q', 'C1'),
					(4, '�]�[', 'B2'),
					(5, '�a��', 'A1'),
					(6, '�]�[', 'A3'),
					(7, '�a��', 'B3'),
					(8, '���q', 'C3'),
					(9, '�]�[', 'A4');
------------------------------------------------------------------
-----------------------�q���T-----------------------------
	CREATE TABLE Reservations (
		id VARCHAR(10) PRIMARY KEY,								-- �H���r��@���q��s��
		members_id INT  NULL,									-- �|���s��FOREIGN KEY REFERENCES Members(id)
			FOREIGN KEY (members_id) REFERENCES Members(id),
		customer_name NVARCHAR(50) NOT NULL,					-- �U�ȩm�W
		customer_gender TINYINT NOT NULL,						-- �U�ȩʧO�]0=Female, 1=Male�^
		contact_phone CHAR(10) NOT NULL,						-- �p���q��
		reservation_time DATETIME NOT NULL,						-- �q��ɶ�
		number_people INT NOT NULL,								-- �q��H��
		seat_name NVARCHAR(10) NOT NULL,						-- �y��s��FOREIGN KEY REFERENCES Seats(id)
			FOREIGN KEY (seat_name) REFERENCES Seats(seat_number),
		special_requests NVARCHAR(255),							-- �S��n�D
		reservation_status NVARCHAR(50),						-- �q�쪬�p
		notes NVARCHAR(255),									-- �Ƶ�
		created_at DATETIME DEFAULT GETDATE()					-- �إߤ���A�۰ʳ]�m����e�ɶ�
	);
	INSERT INTO Reservations (id, members_id, customer_name, customer_gender, contact_phone, reservation_time, number_people, seat_name, special_requests, reservation_status, notes)
			VALUES
			('R001', 1001, '�i�T', 0, '0912345678', '2024-10-15 18:00', 4, 'A1', '�L', '�w�T�{', ''),
			('R002', NULL, '���p�s', 1, '0923456789', '2024-10-16 19:00', 2, 'A2', '�зǳƥͤ�J�|', '�ݽT�{', ''),
			('R003', 1002, '���|', 1, '0934567890', '2024-10-17 20:00', 3, 'A3', '�L�ӽЪ`�N', '�w�T�{', ''),
			('R004', NULL, '����', 1, '0945678901', '2024-10-18 18:30', 5, 'A4', '����', '�ݽT�{', '�д��ѯ����ﶵ'),
			('R005', 1003, '����', 0, '0956789012', '2024-10-19 19:30', 2, 'B1', '�L', '�w����', '�Ȥ�D�ʨ���'),
			('R006', NULL, '�i���T', 1, '0966789013', '2024-10-20 17:00', 4, 'B2', '�L', '�w�T�{', ''),
			('R007', 1001, '�p��', 0, '0976789014', '2024-10-21 18:00', 3, 'B3', '�L', '�w�T�{', ''),
			('R008', NULL, '������', 1, '0986789015', '2024-10-22 19:00', 6, 'B1', '�L', '�ݽT�{', ''),
			('R009', 1002, '���|', 1, '0996789016', '2024-10-23 20:00', 2, 'C1', '�L', '�w�T�{', ''),
			('R010', NULL, '���p�C', 0, '0906789017', '2024-10-24 18:30', 4, 'C3', '�L', '�ݽT�{', '');
-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM  Members;
		SELECT * FROM Seats;
		SELECT * FROM  Reservations;
-------------------------------------------------------------------------------------------------------------------------------------------



---�A�Ȩt��----------------------------------------------------------------------------------------------------------------------------
	CREATE TABLE ServiceRequests (
		request_id VARCHAR(10) PRIMARY KEY,							-- �A�ȽШD�s��
		seat_name NVARCHAR(10) NOT NULL,							-- �y�츹�XFOREIGN KEY REFERENCES Seats(seat_number)
			FOREIGN KEY (seat_name) REFERENCES Seats(seat_number),
		server_id INT NOT NULL,										-- �A�ȥͽs��FOREIGN KEY REFERENCES Users(id)
			FOREIGN KEY (server_id) REFERENCES Users(id),
		request_time DATETIME NOT NULL,								-- �ШD�ɶ�
		request_content NVARCHAR(255) NOT NULL,						-- �ШD���e
		request_status NVARCHAR(50) NOT NULL,						-- �ШD���A
		completion_time DATETIME,									-- �����ɶ�
		rating TINYINT CHECK (rating BETWEEN 1 AND 5),				-- �����]1-5���^
		notes NVARCHAR(255),										-- �Ƶ�
		created_at DATETIME DEFAULT GETDATE()						-- �إߤ���A�۰ʳ]�m����e�ɶ�
	);
	INSERT INTO ServiceRequests (request_id, seat_name, server_id, request_time, request_content, request_status, completion_time, rating, notes)
			VALUES
				('SR001', 'A1', 8003, '2024-10-15 18:05', '�ݭn�B�~���\��', '�w�B�z', '2024-10-15 18:15', 5, '�A�ȥͦ^�����t'),
				('SR002', 'B2', 8003, '2024-10-16 19:15', '�Х[�I����', '�ݳB�z', NULL, NULL, '�кɧֳB�z'),
				('SR003', 'C1', 8003, '2024-10-17 20:30', '�n�D�����ﶵ', '�w�B�z', '2024-10-17 20:45', 4, '���D����'),
				('SR004', 'A2', 8003, '2024-10-18 18:45', '�ݭn�d�ߵ��', '�w�B�z', '2024-10-18 18:55', 5, '�A�ȥ͸ѵ��M��'),
				('SR005', 'B1', 8003, '2024-10-19 19:00', '�Ч��\��', '�w�B�z', '2024-10-19 19:10', 3, '�y�L�C�F�@�I'),
				('SR006', 'C1', 8003, '2024-10-20 17:30', '�ݭn��h�ը���', '�w�B�z', '2024-10-20 17:35', 4, '�ܺ��N'),
				('SR007', 'A3', 8003, '2024-10-21 18:00', '�д����\�Ტ�I', '�w�B�z', '2024-10-21 18:10', 5, '�D�`�n�Y'),
				('SR008', 'B3', 8003, '2024-10-22 19:20', '�Q�n�F�Ѥ���S�\', '�ݳB�z', NULL, NULL, '�Фήɦ^��'),
				('SR009', 'C3', 8003, '2024-10-23 20:15', '�ݭn�B�~�����Τ�', '�w�B�z', '2024-10-23 20:20', 5, '�A�ȥͫD�`�͵�'),
				('SR010', 'A4', 8003, '2024-10-24 18:45', '�зǳƤ@�Ӥp�J�|', '�w�B�z', '2024-10-24 18:50', 4, '�J�|�D�`����');
-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM  Users;
		SELECT * FROM Seats;
		SELECT * FROM  ServiceRequests;
-------------------------------------------------------------------------------------------------------------------------------------------

---�ӫ~----------------------------------------------------------------------------------------------------------------------------
	CREATE TABLE Products (
			id VARCHAR(10) PRIMARY KEY NOT NULL ,				-- �ӫ~�s��
			product_category NVARCHAR(50) NOT NULL,             -- �ӫ~����
			product_image NVARCHAR(255) NOT NULL,				-- �ӫ~�Ϥ�
			product_name NVARCHAR(50) NOT NULL,					-- �ӫ~�W��
			product_price INT NOT NULL,							-- �ӫ~����
			product_description NVARCHAR(255)					-- �ӫ~�y�z
		);
	INSERT INTO Products (id, product_category, product_image, product_name, product_price, product_description)
			VALUES
			('P001', '�D��', 'image1.jpg', '����', 500, '�A��h�Ī����ơA�f�t�S�s��ġC'),
			('P002', '�F��', 'image2.jpg', '�F��', 150, '�s�A������F�ԡA�L�K�[��ơC'),
			('P003', '�D��', 'image3.jpg', '�q�j�Q��', 300, '�g��q�j�Q�ѡA�@����ġC'),
			('P004', '����', 'image4.jpg', '����', 100, '�M�n���~�A�A�X�L�ѨɥΡC'),
			('P005', '���I', 'image5.jpg', '���I', 200, '�U����o���I�A�f�P���ΡC'),
			('P006', '�D��', 'image6.jpg', '����', 400, '���ܤ��ġA��ܦh�ˡC'),
			('P007', '�D��', 'image7.jpg', '�L��', 350, '�����L���A��ηs�A�����C'),
			('P008', '�p�Y', 'image8.jpg', '�������L', 450, '�U�������A�f�P�p�ܡC'),
			('P009', '�D��', 'image9.jpg', '���A���L', 600, '�s�A���A�A�f�t�S�s��ġC'),
			('P010', '�D��', 'image10.jpg', '�N��', 300, '���N���סA�~�ܤ���C'),
			('P011', '����', 'image11.jpg', '�G��', 120, '�{�^�G�ġA���d�S�����C'),
			('P012', '���I', 'image12.jpg', '�B�N�O', 150, '�U���f�����B�N�O�A�L�u���ơC'),
			('P013', '�p�Y', 'image13.jpg', '�K��', 180, '���ܬK���A���`�״I�C'),
			('P014', '�D��', 'image14.jpg', '������', 250, '�@�����״��A�f�t�u���ѱ��C'),
			('P015', '����', 'image15.jpg', '�@��', 180, '���J�@�ءA���������C'),
			('P016', '�D��', 'image16.jpg', '�ϱ�', 700, '�h�Ī��ϱơA�f�t�󥻭��ơC'),
			('P017', '�p�Y', 'image17.jpg', '����', 230, '�~�p���઺�����A���I�����C'),
			('P018', '���I', 'image18.jpg', '�J�|', 250, '�U���J�|�A�A�X�U�س��X�C'),
			('P019', '�D��', 'image19.jpg', '���A����', 320, '�s�A���A�A�f�t����|���������C'),
			('P020', '����', 'image20.jpg', '����', 160, '���@�����A��ܦh�ˡC');


-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM		Products;
		
-------------------------------------------------------------------------------------------------------------------------------------------





---�q��t��----------------------------------------------------------------------------------------------------------------------------

-----------------------�q���T-----------------------------
	CREATE TABLE Orders (
		order_id VARCHAR(10) PRIMARY KEY,								-- �q��s��
		members_id INT NULL,											-- �|���s�� (FOREIGN KEY REFERENCES Members(id)�A�i�H�� NULL)
			FOREIGN KEY (members_id) REFERENCES Members(id),
		customer_name NVARCHAR(50),										-- �U�ȩm�W�]�A�Ω�D�|���^
		table_number NVARCHAR(10) NOT NULL,								-- �ูFOREIGN KEY REFERENCES Seats(seat_number)
			FOREIGN KEY (table_number) REFERENCES Seats(seat_number),
		order_time DATETIME NOT NULL,									-- �q��ɶ�
		order_status NVARCHAR(50) NOT NULL,								-- �q�檬�p
		created_at DATETIME DEFAULT GETDATE(),							-- �إߤ���A�۰ʳ]�m����e�ɶ�
		/*FOREIGN KEY (member_id) REFERENCES Members(id)   -- �~������A�Ѧҷ|����*/
	);

	INSERT INTO Orders (order_id, members_id, customer_name, table_number, order_time, order_status, created_at)
			VALUES
			('O001', 1001, '�i�T', 'A1', '2024-10-15 12:00', '�w����', GETDATE()),
			('O002', NULL, '�|��', 'B2', '2024-10-15 12:30', '�w����', GETDATE()),
			('O003', 1002, '���|', 'C1', '2024-10-15 13:00', '�ݳB�z', GETDATE()),
			('O004', NULL, '����', 'B1', '2024-10-15 13:30', '�w����', GETDATE()),
			('O005', 1003, '����', 'A2', '2024-10-15 14:00', '�w����', GETDATE()),
			('O006', NULL, '�B�K', 'A1', '2024-10-15 14:30', '�ݳB�z', GETDATE()),
			('O007', 1004, '����', 'B2', '2024-10-15 15:00', '�w����', GETDATE()),
			('O008', NULL, '�P�Q', 'C1', '2024-10-15 15:30', '�w����', GETDATE()),
			('O009', 1001, '�i�T', 'B1', '2024-10-15 16:00', '�ݳB�z', GETDATE()),
			('O010', 1002, '���|', 'A2', '2024-10-15 16:30', '�w����', GETDATE()),
			('O011', NULL, '���Q�@', 'A1', '2024-10-15 17:00', '�w����', GETDATE()),
			('O012', 1003, '����', 'B2', '2024-10-15 17:30', '�w����', GETDATE());

	-----------------------�q��Ա�-----------------------------
		CREATE TABLE OrderDetails (
				orderdetail_id INT PRIMARY KEY IDENTITY(1,1),					-- �۰ʥͦ������ؽs��
				orders_id VARCHAR(10) NOT NULL,									-- �q��s�� (FOREIGN KEY REFERENCES Orders(order_id))
					FOREIGN KEY (orders_id) REFERENCES Orders(order_id),
				product_id VARCHAR(10) NOT NULL,								-- �ӫ~ID (FOREIGN KEY REFERENCES Products(product_id))
					FOREIGN KEY (product_id) REFERENCES Products(id),
				product_quantity INT NOT NULL,									-- �ӫ~�ƶq
				total_quantity INT NOT NULL,									-- �`�ƶq
				total_price DECIMAL(10, 2) NOT NULL,							-- �ӫ~�`����
				special_requests NVARCHAR(255),									-- �S��n�D
				created_at DATETIME DEFAULT GETDATE(),							-- �إߤ���A�۰ʳ]�m����e�ɶ�
				/*FOREIGN KEY (order_id) REFERENCES Orders(order_id)   -- �~������A�Ѧҭq���*/
			);
		INSERT INTO OrderDetails (orders_id, product_id, product_quantity, total_quantity, total_price, special_requests)
				VALUES
				('O001', 'P001', 1, 1, 500.00, '�L�S��n�D'),        -- ���] P001 �O����
				('O001', 'P002', 2, 2, 400.00, '�[��'),               -- ���] P002 �O�F��
				('O002', 'P003', 1, 1, 150.00, '�L�B'),               -- ���] P003 �O����
				('O003', 'P004', 1, 1, 600.00, '�L����'),             -- ���] P004 �O����
				('O004', 'P005', 3, 3, 900.00, '�[��'),               -- ���] P005 �O����
				('O005', 'P006', 1, 1, 350.00, '�L�S��n�D'),         -- ���] P006 �O�q�j�Q��
				('O006', 'P007', 2, 2, 360.00, '�[���J�O'),           -- ���] P007 �O���I
				('O007', 'P008', 1, 1, 700.00, '�L�S��n�D'),         -- ���] P008 �O���A��
				('O008', 'P009', 2, 2, 200.00, '�[�B'),               -- ���] P009 �O�G��
				('O009', 'P001', 1, 1, 500.00, '����'),               -- ���] P001 �O����
				('O010', 'P002', 2, 2, 400.00, '�L�S��n�D'),         -- ���] P002 �O�F��
				('O011', 'P005', 1, 1, 300.00, '�L�S��n�D');         -- ���] P005 �O����

-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM		Orders;
		SELECT * FROM		Products;
		SELECT * FROM		Orders;
		SELECT * FROM		OrderDetails;
-------------------------------------------------------------------------------------------------------------------------------------------


---���רt��----------------------------------------------------------------------------------------------------------------------------

		-----------------------���ׯd��-----------------------------

		CREATE TABLE Reviews (
			review_id INT PRIMARY KEY IDENTITY(1,1),									-- �۰ʥͦ�������ID
			orders_id VARCHAR(10) NOT NULL,												-- �q��s�� (FOREIGN KEY REFERENCES Orders(order_id))
				FOREIGN KEY (orders_id) REFERENCES Orders(order_id),
			product_name NVARCHAR(50) NOT NULL,											-- �ӫ~�W��
			member_id INT NULL,															-- �|���s�� (FOREIGN KEY REFERENCES Members(id)�A�i�H�� NULL)
				FOREIGN KEY (member_id) REFERENCES Members(id),
			rating TINYINT CHECK (rating BETWEEN 1 AND 5) NOT NULL,						-- �����]1-5���^
			review_content NVARCHAR(255),												-- ���פ��e
			review_date DATETIME NOT NULL,												-- ���פ��
			created_at DATETIME DEFAULT GETDATE()										-- �إߤ���A�۰ʳ]�m����e�ɶ�
				/*FOREIGN KEY (order_id) REFERENCES Orders(order_id),						-- �~������A�Ѧҭq���*/
				/*FOREIGN KEY (member_id) REFERENCES Members(id)							-- �~������A�Ѧҷ|����*/
		);
		INSERT INTO Reviews (orders_id, product_name, member_id, rating, review_content, review_date)
				VALUES
					('O001', '����', 1001, 5, '�D�`�n�Y�A�ȱo�A�ӡI', '2024-10-01'),
					('O001', '�F��', 1001, 4, '�s�A�A���y�L�ФF�@�I�C', '2024-10-01'),
					('O002', '����', NULL, 3, '�@���A�S���S�O�����D�C', '2024-10-02'),  -- �D�|��
					('O003', '����', 1002, 5, '�o�O�ڦY�L�̦n�Y�����ġI', '2024-10-03'),
					('O004', '����', 1003, 4, '�~�p����A���n�Y���C', '2024-10-04'),
					('O005', '�q�j�Q��', 1002, 5, '�f���@�y�A���ˡI', '2024-10-05'),
					('O006', '���I', 1004, 4, '�Ӳ��F�A���f�P�ܦn�C', '2024-10-06'),
					('O007', '���A��', NULL, 5, '���A�D�`�s�A�A�ȱo�@�աI', '2024-10-07'),  -- �D�|��
					('O008', '�G��', 1001, 3, '���D�٦�A�������B�C', '2024-10-08'),
					('O009', '����', 1001, 5, '�C���ӳ��|�I���I', '2024-10-09'),
					('O010', '�F��', 1002, 4, '�f�t�ܦn�A�ٷ|�A�ӡC', '2024-10-10'),
					('O011', '����', 1003, 2, '���I�o���A���ӳ��w�C', '2024-10-11');
	-----------------------�ӫ~�`����-----------------------------
		CREATE TABLE ProductRatings (
			id INT PRIMARY KEY IDENTITY(1,1) ,					-- �۰ʥͦ�������ID
			product_id VARCHAR(10) NOT NULL,							-- �ӫ~ID (FOREIGN KEY REFERENCES Products(product_id))
				FOREIGN KEY (product_id) REFERENCES Products(id),
			ranking_id int not null,
				FOREIGN KEY (ranking_id) REFERENCES Reviews(review_id),
			total_rating INT NOT NULL,									-- �`����
			rating_count INT NOT NULL,									-- ��������
			average_rating DECIMAL(3, 2) NOT NULL,						-- ��������
			highest_rating TINYINT NOT NULL,							-- �̰�����
			lowest_rating TINYINT NOT NULL,								-- �̧C����
			last_rating_date DATETIME NOT NULL,							-- �̪�������
			created_at DATETIME DEFAULT GETDATE(),                 -- �إߤ���A�۰ʳ]�m����e�ɶ�
					/*FOREIGN KEY (product_id) REFERENCES Products(id) -- �~������A�ѦҰӫ~��*/
	);
	INSERT INTO ProductRatings (product_id, ranking_id, total_rating, rating_count, average_rating, highest_rating, lowest_rating, last_rating_date)
		VALUES
			('P001', 1, 20, 4, 5.00, 5, 4, '2024-10-09'),  -- ����
			('P002', 2, 16, 4, 4.00, 4, 3, '2024-10-10'),  -- �F��
			('P003', 3, 6, 2, 3.00, 4, 2, '2024-10-02'),   -- ����
			('P004', 4, 10, 2, 5.00, 5, 5, '2024-10-03'),  -- ����
			('P005', 5, 9, 3, 3.00, 4, 2, '2024-10-11');   -- ����
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
		SELECT * FROM		Orders;
		SELECT * FROM		Members;
		SELECT * FROM		Products;
		SELECT * FROM		ProductRatings;
		SELECT * FROM		Reviews;
-------------------------------------------------------------------------------------------------------------------------------------------


---�������----------------------------------------------------------------------------------------------------------------------------

-----------------------���ʪ�-----------------------------
	CREATE TABLE Campaign  (
		id INT PRIMARY KEY NOT NULL,               -- ���ʪ��ߤ@�ѧO�X
		title NVARCHAR(50) NOT NULL,               -- ���ʪ����D
		campaign_description NVARCHAR(300) NOT NULL,        -- ���ʪ����e�y�z
		campaign_type NVARCHAR(50) NOT NULL,          -- ���ʪ������]�Ҧp�G�����B��t���^
		campaign_start_date DATETIME NOT NULL,              -- ���ʪ��}�l����M�ɶ�
		end_date DATETIME NOT NULL,                -- ���ʪ���������M�ɶ�
		created_at DATETIME NOT NULL,              -- ���ʳЫت�����M�ɶ�
		note NVARCHAR(300) NULL                     -- ��L�Ƶ��H���]�i��^
	);
	INSERT INTO Campaign (id, title, campaign_description, campaign_type, campaign_start_date , end_date, created_at, note) 
		VALUES
			(1, '�����`', '�ܽЦU�j�\�U�ѥ[���������|�C', '����', '2024-11-01 10:00:00', '2024-11-01 20:00:00', '2023-10-14 12:00:00', '�J���K�O'),
			(2, '�p�v�q', '���W�p�v�{���i����t�C', '��t', '2024-11-05 18:00:00', '2024-11-05 21:00:00', '2023-10-14 12:30:00', '�ݴ��e���W'),
			(3, '�~�s�|', '�M�~�~�s�v�a�A�~�|�U�ج��s�C', '�~�s', '2024-11-10 19:00:00', '2024-11-10 22:00:00', '2023-10-14 13:00:00', '���B30�H'),
			(4, '�����Ʋz�ҵ{', '�ǲߦp��s�@�������������a�C', '�ҵ{', '2024-11-15 10:00:00', '2024-11-15 13:00:00', '2023-10-14 14:00:00', '���ѭ���'),
			(5, '�a�x��', '�A�X���a���\�U���ʡA�w�ֹC���C', '�a�x', '2024-11-20 11:00:00', '2024-11-20 16:00:00', '2023-10-14 14:30:00', '�K�O�C��'),
			(6, '���A���]', '�ɨ��s�A���A���������b�C', '���\', '2024-11-25 18:00:00', '2024-11-25 22:00:00', '2023-10-14 15:00:00', '�w������'),
			(7, '���I�u�@�{', '�ǲ߻s�@�U�ج������I�C', '�u�@�{', '2024-11-30 14:00:00', '2024-11-30 17:00:00', '2023-10-14 15:30:00', '���ѧ���'),
			(8, '�@�ث~Ų', '�����U�ة@�ت������C', '�~Ų', '2024-12-05 15:00:00', '2024-12-05 18:00:00', '2023-10-14 16:00:00', '���B20�H'),
			(9, '��ڬ�����', '�U��Ʋz���E�|�C', '����', '2024-12-10 12:00:00', '2024-12-10 18:00:00', '2023-10-14 16:30:00', '�p�ħK�O'),
			(10, '�`��S�\', '�S�O�`��������C', '�S�\', '2024-12-20 17:00:00', '2024-12-20 22:00:00', '2023-10-14 17:00:00', NULL);

-----------------------���~��-----------------------------
	CREATE TABLE Campaignprizes (
		id INT PRIMARY KEY NOT NULL,               -- ���~���ߤ@�ѧO�X
		campaign_id INT NOT NULL,                  -- ���ʪ��ѧO�X�AFOREIGN KEY (campaign_id) REFERENCES Campaign(id)
			FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
		name NVARCHAR(30) NOT NULL,                -- ���~���W��
		quantity INT NOT NULL,                      -- ���~���ƶq
		description NVARCHAR(300) NULL,            -- ���~���y�z�]�i��^
		created_at DATETIME NOT NULL,              -- ���~�Ыت�����M�ɶ�
	);
	INSERT INTO Campaignprizes (id, campaign_id, name, quantity, description, created_at) 
		VALUES
			(1, 1, '�\�U�u�f��', 50, '�i�b���w�\�U�ϥΪ�50���u�f��C', '2023-10-14 12:00:00'),
			(2, 2, '�p�vñ�W����', 20, '���W�p�vñ�W�����СA���ح����]�C', '2023-10-14 12:30:00'),
			(3, 3, '�~�s�����', 30, '�i�ѥ[�@���M�~���~�s����C', '2023-10-14 13:00:00'),
			(4, 4, '�����Ʋz��', 15, '���Цh�ڬ����������a���Ʋz�ѡC', '2023-10-14 14:00:00'),
			(5, 5, '�a�x�\�I§��', 25, '�i�ѥ��a�ɥΪ��\�I§��C', '2023-10-14 14:30:00');

-----------------------���ʰѻP��-----------------------------
	CREATE TABLE lottery_entries (
		id INT PRIMARY KEY NOT NULL,               -- �ѻP���ߤ@�ѧO�X
		campaign_id INT NOT NULL,                     -- ���ʪ��ѧO�X�A�~��
			FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
		order_id VARCHAR(10) NOT NULL,                     -- �q�檺�ѧO�X�A�~��
			FOREIGN KEY (order_id) REFERENCES Orders(order_id),
		created_at DATETIME NOT NULL,              -- �ѻP�إߪ�����M�ɶ�
		note NVARCHAR(300) NULL,                   -- ��L�Ƶ��H���]�i��^
		FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
	);
	INSERT INTO lottery_entries (id, campaign_id, order_id, created_at, note) 
		VALUES
			(1, 1, 'O001', '2023-10-14 12:00:00', '�Ĥ@���ѥ[����'),
			(2, 2, 'O002', '2023-10-14 12:30:00', '���ݼp�v�q'),
			(3, 3, 'O003', '2023-10-14 13:00:00', '�Ʊ�����'),
			(4, 4, 'O004', '2023-10-14 14:00:00', '�������ʫܦ���'),
			(5, 5, 'O005', '2023-10-14 14:30:00', '���a�@�_�ѥ[');

-----------------------���ʵ��G��-----------------------------
	CREATE TABLE LotteryWinners (
		id INT PRIMARY KEY NOT NULL,                -- ���G���ߤ@�ѧO�X
		campaign_id INT NOT NULL,                      -- ���ʪ��ѧO�X�A�~��FOREIGN KEY (campaign_id) REFERENCES Campaign(id)
			FOREIGN KEY (campaign_id) REFERENCES Campaign(id),
		lottery_entry_id INT NOT NULL,              -- �ѻP���ѧO�X�A�~��FOREIGN KEY (lottery_entry_id) REFERENCES lottery_entries(id)
			FOREIGN KEY (lottery_entry_id) REFERENCES lottery_entries(id), 
		prize_id INT NOT NULL,                      -- ���~���ѧO�X�A�~��FOREIGN KEY (prize_id) REFERENCES prizes(id)
			FOREIGN KEY (prize_id) REFERENCES Campaignprizes(id),           
		created_at DATETIME NOT NULL,               -- ���G�إߪ�����M�ɶ�
	);

	INSERT INTO LotteryWinners (id, campaign_id, lottery_entry_id, prize_id, created_at) 
		VALUES
			(1, 1, 1, 1, '2023-10-14 12:00:00'),
			(2, 2, 2, 2, '2023-10-14 12:30:00'),
			(3, 3, 3, 3, '2023-10-14 13:00:00'),
			(4, 4, 4, 4, '2023-10-14 14:00:00'),
			(5, 5, 5, 5, '2023-10-14 14:30:00');
------------------------------------------------------------------------------------------------------------------------------------------






