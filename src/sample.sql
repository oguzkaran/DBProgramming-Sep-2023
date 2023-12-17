/*----------------------------------------------------------------------------------------------------------------------
	Sınıf Çalışması: Aşağıdaki tabloları oluşturunuz ve istenenleri yapınız
	- customers
		- customer_id
		- name
		- address
	phones		
		- phone_number
		- customer_id
	phone_invoices
		- id
		- phone_number
		- invoice_date
		- last_pay_date
		- paid_date (nullable)
		- total
	Sorular:
		- Fatura ödeme merkezinin faturaya ilişkin bilgiler ile müşteri bilgilerinin elde edildiği bir view yazınız. 
		Fatura ödenmişse bilgi elde edilmeyecektir. View için gerekli gizlemeleri yapınız

		- Ödenmiş faturaları elde eden bir view yazınız

		- Fatura ödenmemişse fatura ödeme merkezinin ödeme tamamlandığında view ile update yapabileceği bir SP yazınız
-----------------------------------------------------------------------------------------------------------------------*/

create view v_older_people_all_info
as
select * from people where dbo.get_age(birth_date) > 65
with check option 

insert into v_older_people_all_info (citizen_id, first_name, last_name, birth_date, marital_status_id, gender_id) values ('12345678915', 'Fatma', 'Selami', '1940-09-13', 1, 1)

select * from v_people_info

