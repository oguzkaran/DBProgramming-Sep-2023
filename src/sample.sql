/*----------------------------------------------------------------------------------------------------------------------
	sqlcmd SQLServer için bir komut yorumlayıcı (command promt) uygulamadır. Bu tarz komut yorumlayıcı programlara 
	REPL (Read, Evaluate, Print, Loop) da denilmektedir. sqlcmd Windows sistemlerinde genel olarak SQL Server kurulduğunda
	yüklenir. Programcı isterse sqlcmd'yi hiç SQLServer yüklenmemiş bir sisteme de yükleyebilir. sqlcmd Windows, MacOS X
	ve Linux sistemlerine yüklenebilmektedir:
	Link: https://learn.microsoft.com/en-us/sql/tools/sqlcmd/sqlcmd-utility?view=sql-server-ver16&tabs=go%2Cmac&pivots=cs1-bash (21 Ocak 2024 22:08)
	sqlcmd ile bir IDE olmadan da veritabanı işlemleri yapılabilmektedir. Şüphesiz bu programın görseli çok iyi değildir.
	Çok karmaşık işlemlerin yapılması görece zahmetlidir. Dolayısıyla programcı açısından gerektiğinde kullanmak üzere
	öğrenilmelidir. Sürekli kullanılması zaman kaybına yol açabilir. Burada sqlcmd, pratikte gerekebilecek kadar ele
	alınacaktır. Diğer detaylar için dökumantasyon incelenebilir. sqlcmd'nin bazı yararlı komutları şunlardır:
	- sqlcmd programı doğrudan çalıştırıldığında "Windows Authentication" bağlantısı olarak komut satırına düşer.

	- Komut satırından istenmilen bir T-SQL cümlesi yazıldığında hafızaya alınır. 

	- go komutu ile son hafızaya alınmış tüm T-SQL cümleleri sırasıyla çalıştırılır. Hafızadaki cümle hatalı ise uygun
	hata mesajı	verilir. go komutundan sonra artık hafızada cümle kalmamıştır.

	- sqlcmd q seçeneği ile çalıştırıldığında ilgili cümle veritabanına gönderilir. Örneğin:
		sqlcmd -q "use testdb; select * from staff"
	Bir SP parametresiz ise ismi verilerek doğrudan exec yapılabilir. Örneğin
		sqlcmd -S . -q "sp_databases"

	- sqlcmd programına ilişkin yardım almak için ? seçeneği kullanılabilir
		sqlcmd -?

	- i seçeneği yolu belirtilen dosya içerisindeki script çalıştırılabilir

	- S seçeneği ile istenilen bir server'a bağlanılabilir

	- o seçeneği ile çıktılar istenilen bir dosyaya yazdırılabilir. Örneğin:
		sqlcmd -S . -i "staff.sql" -o "result.txt"

	- sqlcmd komut yorumlayıcısı içerisindeyken :r ile dosyadan okuma yapılıp çalıştırılabilir. Örneğin
		1>:r staff.txt

	- q seçeneği ile bir SP ismi verildiğinde exec işlemi yapılır:
		
	- U ve P seçeneleri ile login ve password bilgileri verilerek ilgili server'a bağlanılabilir
		sqlcmd -S . -U burak -P csd1993
-----------------------------------------------------------------------------------------------------------------------*/

create login burak with password='csd1993', default_database=testdb

use testdb

create user burak

use mydb

create user burak