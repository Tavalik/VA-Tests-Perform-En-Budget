﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для создания НСИ в 1C:ERP УХ

Сценарий: Я создаю вид номенклатуры с именем '[ТекИмяВидаНоменклатуры]' тип '[ТекТип]' группа доступа '[ТекГруппаДоступа]' в 1C:ERPУХ

	* Удаляем товарные категории
		И В командном интерфейсе я выбираю "Корпоративные закупки" "Product categories"
		Когда открылось окно "Product categories"
		И я выбираю пункт контекстного меню с именем 'СписокВидовНоменклатурыКонтекстноеМенюНайти' на элементе формы с именем 'СписокВидовНоменклатуры'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Type номенклатуры"
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяВидаНоменклатуры]'
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Product categories"
		Если в таблице 'СписокВидовНоменклатуры' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНастройкаСписка'
			И Я устанавливаю отбор в форме списка 'Наименование' 'Не начинается с' 'Удалить_'
			И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
				* Ставим пометку на удаление
					Если в таблице 'Список' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
				* Переименовываем
					И Я запоминаю значение выражения "'Удалить_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'УИД'
					И в таблице 'Список' я выбираю текущую строку
					Тогда открылось окно "* (Product categories)"
					И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					И я жду закрытия окна '* (Product categories)' в течение 20 секунд						
			И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНастройкаСписка'
			И Я снимаю все отборы в форме списка

			* Удаляем вид номенклатуры
				Когда открылось окно "Product categories"
				И в таблице 'СписокВидовНоменклатуры' я выбираю текущую строку
				Тогда открылось окно "[ТекNameВидаНоменклатуры] (Type номенклатуры)"
				И я разворачиваю группу с именем 'СтраницаОсновное'
				И Я запоминаю значение выражения "'Удалить_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'УИД'
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Тогда открылось окно "1C:Enterprise"
				И я нажимаю на кнопку с именем 'Button0'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна '[ТекИмяВидаНоменклатуры] (Type номенклатуры) *' в течение 20 секунд
				Тогда открылось окно "Product categories"
				И Я закрываю окно "Product categories"

	* Открываем  форму списка	
		И В командном интерфейсе я выбираю "Quick menu" "Product range"
		Когда открылось окно "Product range"
	
	* Создаем новый элемент
		И я устанавливаю флаг с именем 'ИспользоватьФильтры'
		И я нажимаю на кнопку с именем 'СоздатьВидНоменклатуры'
		Тогда открылось окно "Type номенклатуры (create)"
		И у поля с именем 'ТипНоменклатуры' я нажимаю гиперссылку 'указать'
		Тогда открылось окно "Выберите тип номенклатуры"
		И я меняю значение переключателя с именем 'ТипНоменклатурыТовар' на '[ТекТип]'
		И я нажимаю на кнопку с именем 'ОК'
		Тогда открылось окно "Type номенклатуры (create) *"
		И в поле с именем 'Родитель' я ввожу текст ''
		И из выпадающего списка с именем 'ГруппаДоступа' я выбираю точное значение '[ТекГруппаДоступа]'
		И в поле с именем 'Наименование' я ввожу текст '[ТекИмяВидаНоменклатуры]'	
		И я разворачиваю группу с именем 'СтраницаЗначенияПоУмолчанию'
		И из выпадающего списка с именем 'СтавкаНДС' я выбираю точное значение '20%'
		И из выпадающего списка с именем 'ЕдиницаИзмерения' я выбираю по строке "PCs"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Вид номенклатуры (Create) *' в течение 20 секунд

	* Закрываем формы
		Когда открылось окно "Product range"
		И Я закрываю окно "Product range"

Сценарий: Я создаю соглашение с клиентом с именем '[ТекИмяСоглашения]' валютой '[ТекВалюта]' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "CRM и маркетинг" "Типовые Fromоглашения From клиентами"
		Тогда открылось окно "Типовые соглашения об условиях продаж"

	* Создаем типовое соглашение с клиентом			
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение 'Наименование'
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяСоглашения]'
		И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'Список' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения "'Удалить_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'УИД'		
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Типовое соглашение об условиях продаж"
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна 'Типовое соглашение об условиях продаж *' в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокСоздать'
		Тогда открылось окно "Типовое соглашение об условиях продаж (create)"
		И в поле с именем 'Наименование' я ввожу текст "VA - Agreement with the client"
		И я перехожу к закладке с именем 'СтраницаУсловияПродаж'
		И из выпадающего списка с именем 'Валюта' я выбираю точное значение 'RUB'
		И я изменяю флаг с именем 'ЦенаВключаетНДС'
		Тогда открылось окно "1C:Enterprise"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Типовое соглашение об условиях продаж (create) *"		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Типовое соглашение об условиях продаж (Create) *' в течение 20 секунд

	* Закрываем форму списка
		Тогда открылось окно "Типовые соглашения об условиях продаж"
		И я закрываю окно "Типовые соглашения об условиях продаж"

Сценарий: Я создаю партнера с именем '[ТекИмяПартнера]' тип '[ТекТип]' группа доступа '[ТекГруппаДоступа]' в 1C:ERPУХ		

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Переименовываем партнера 'Ганимед'			
		И в таблице 'Список' я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяПартнера]'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Партнеры"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'Список' текущая строка не помечена на удаление Тогда
					И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Открываем
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "[ТекNameПартнера] (Партнер)"
				* Удаляем контрагентов
					И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"
					Когда открылось окно "[ТекNameПартнера] (Партнер)"
					И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
					И Я устанавливаю отбор в форме списка 'Рабочее наименование' 'Не начинается с' 'Удалить_'
					И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
						* Ставим пометку на удаление
							Если в таблице 'Список' текущая строка не помечена на удаление Тогда	
								И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
								Тогда открылось окно "1C:Enterprise"
								И я нажимаю на кнопку с именем 'Button0'
						* Переименовываем
							И Я запоминаю значение выражения "'Удалить_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'УИД'
							И в таблице 'Список' я выбираю текущую строку
							Тогда открылось окно "* (Counterparty*)"
							И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
							И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
							И я жду закрытия окна '* (Counterparty*)' в течение 20 секунд
					И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
					И Я снимаю все отборы в форме списка
				* Удаляем договоры
					И В текущем окне я нажимаю кнопку командного интерфейса "Contracts"
					И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНастройкаСписка'
					И Я устанавливаю отбор в форме списка 'Рабочее наименование' 'Не начинается с' 'Удалить_'
					И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
						* Ставим пометку на удаление
							Если в таблице 'Список' текущая строка не помечена на удаление Тогда	
								И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
								Тогда открылось окно "1C:Enterprise"
								И я нажимаю на кнопку с именем 'Button0'
						* Переименовываем
							И Я запоминаю значение выражения "'Удалить_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'УИД'
							И в таблице 'Список' я выбираю текущую строку
							Тогда открылось окно "* (Contract*)"
							И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
							И я нажимаю на кнопку с именем 'ФормаЗаписать'
							Тогда открылось окно "*"
							И Я закрываю окно "*"
					И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНастройкаСписка'
					И Я снимаю все отборы в форме списка
				* Переименовываем
					И В текущем окне я нажимаю кнопку командного интерфейса "Main"
					И Я запоминаю значение выражения "'Удалить_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'УИД'
					Тогда открылось окно "* (Партнер)"
					И в поле с именем 'НаименованиеПолноеКомпания' я ввожу значение переменной 'УИД'
					И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
					И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
					И я жду закрытия окна '* (Партнер) *' в течение 20 секунд

	* Создаем элемент
		Тогда открылось окно "Партнеры"
		И в таблице 'Список' я нажимаю на кнопку с именем 'СоздатьНового'
		Тогда открылось окно "Партнер (create)"
		И в поле с именем 'НаименованиеПолноеКомпания' я ввожу текст '[ТекИмяПартнера]'
		И я изменяю флаг с именем '[ТекТип]'
		И из выпадающего списка с именем 'ГруппаДоступа' я выбираю точное значение '[ТекГруппаДоступа]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Партнер (Create) *' в течение 20 секунд					

	* Закрываем формы
		Когда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Для партнера '[ТекИмяПартнера]' я создаю контрагента с именем '[ТекИмяКонтрагента]' вид '[ТекВидКонтрагента]' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Находим партнера			
		И в таблице 'Список' я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяПартнера]'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Партнеры"
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "[ТекNameПартнера] (Партнер)"		
		И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"

	* Удаляем контрагентов
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение 'Рабочее наименование'
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяКонтрагента]'
		И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'Список' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения "'Удалить_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'УИД'
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "* (Counterparty*)"
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна '* (Counterparty*)' в течение 20 секунд

	* Создаем контрагента
		Тогда открылось окно "[ТекNameПартнера] (Партнер)"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Counterparty (create)"
		И в поле с именем 'Наименование' я ввожу текст '[ТекИмяКонтрагента]'
		Когда открылось окно "Counterparty (create)"
		И из выпадающего списка с именем 'ВидКонтрагента' я выбираю точное значение '[ТекВидКонтрагента]'				
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

	* Закрываем форму
		Когда открылось окно "[ТекNameПартнера] (Партнер)"
		И Я закрываю окно "[ТекNameПартнера] (Партнер)"
		Тогда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"

Сценарий: Для партнера '[ТекИмяПартнера]' контрагента '[ТекИмяКонтрагента]' я создаю договор с видом '[ТекВидДоговора]' номер '[ТекНомер]' от '[ТекДата]' организация '[ТекОрганизация]' валюта '[ТекВалюта]' сумма '[ТекСумма]' соглашение '[ТекСоглашение]' в 1C:ERPУХ

	* Открываем форму списка
		И В командном интерфейсе я выбираю "Quick menu" "Партнеры"
		И я жду открытия окна 'Партнеры' в течение 20 секунд

	* Находим партнера			
		И в таблице 'Список' я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяПартнера'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
		И я меняю значение переключателя с именем 'CompareType' на "Exact match"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Партнеры"
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "[ТекNameПартнера] (Партнер)"		
		И В текущем окне я нажимаю кнопку командного интерфейса "Counterparties"

	* Находим контрагента
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение 'Рабочее наименование'
		И в поле с именем 'Pattern' я ввожу текст '[ТекИмяКонтрагента]'
		И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		И в таблице 'Список' количество строк 'равно' 1
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "[ТекNameКонтрагента] (Counterparty *)"
		И В текущем окне я нажимаю кнопку командного интерфейса "Contracts"

	* Удаляем договор
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение 'Рабочее наименование'
		И в поле с именем 'Pattern' я ввожу текст '[ТекНомер] от [ТекДата]'
		И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				Если в таблице 'Список' текущая строка не помечена на удаление Тогда	
					И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
					Тогда открылось окно "1C:Enterprise"
					И я нажимаю на кнопку с именем 'Button0'
			* Переименовываем
				И Я запоминаю значение выражения "'Удалить_' + СтрЗаменить(Новый УникальныйИдентификатор, '-', '')" в переменную 'УИД'
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "* (Contract*)"
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				Тогда открылось окно "*"
				И Я закрываю окно "*"

	* Создаем договор
		И в таблице 'Список' я нажимаю на кнопку с именем 'СписокСоздать'
		Тогда открылось окно "Выберите вид договора"
		И в таблице 'ВидыДоговоров' я перехожу к строке:
			| 'Вид договора'     |
			| '[ТекВидДоговора]' |
		И в таблице 'ВидыДоговоров' я выбираю текущую строку
		Тогда открылось окно "Contract * (create)"
		И в поле с именем 'Номер' я ввожу текст '[ТекНомер]'
		И в поле с именем 'Дата' я ввожу текст '[ТекДата]'
		И из выпадающего списка с именем 'Организация' я выбираю по строке '[ТекОрганизация]'
		И из выпадающего списка с именем 'ВалютаВзаиморасчетов' я выбираю точное значение '[ТекВалюта]'
		И я изменяю флаг с именем 'ФиксированнаяСуммаДоговора'
		И в поле с именем 'СуммаДоговора' я ввожу текст '[ТекСумма]'		
		И я перехожу к закладке с именем 'ГруппаРасчеты'
		И Пауза 1
		И из выпадающего списка с именем 'Соглашение' я выбираю по строке '[ТекСоглашение]'
		Тогда открылось окно "Contract From покупателем / заказчиком (create) *"
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Договор с покупателем / заказчиком (Create) *' в течение 20 секунд

	* Закрываем форму
		Когда открылось окно "[ТекNameКонтрагента] (Counterparty *)"
		И Я закрываю окно "[ТекNameКонтрагента] (Counterparty *)"				
		Когда открылось окно "[ТекNameПартнера] (Партнер)"
		И Я закрываю окно "[ТекNameПартнера] (Партнер)"
		Тогда открылось окно "Партнеры"
		И Я закрываю окно "Партнеры"				
