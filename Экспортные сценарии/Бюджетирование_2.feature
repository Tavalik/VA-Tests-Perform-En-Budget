﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой 'Бюджетирование'
		
Сценарий: Я открываю вид отчета с именем 'TheReportKindName'

	И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
	И в таблице 'СписокВидовОтчетов' я выбираю текущую строку
	Тогда открылось окно "* (Report types)"

Сценарий: Я выбираю показатель с кодом 'TheIndicatorCode' вида отчета 'TheReportKindName'

	Когда открылось окно "Report indicators"
	И я нажимаю кнопку выбора у поля с именем 'ВидОтчета'
	Тогда открылось окно "Report types"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылось окно "Find"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Description"
	И я меняю значение переключателя с именем 'CompareType' на "Exact match"
	И в поле с именем 'Pattern' я ввожу текст '[TheReportKindName]'
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Report types"
	И в таблице 'Список' я выбираю текущую строку

	И Я выбираю показатель с кодом '[TheIndicatorCode]'

Сценарий: Я Для вида отчета 'TheReportKindName' открываю бланк сводной таблицы по умолчанию

	* Откроем вид отчета
		// Вариант открытия из формы
		Если текущее окно имеет заголовок "[TheReportKindName] (Report types)" Тогда
			// Форма уже открыта
		Иначе
			И Я нахожу в списке вид отчета с именем '[TheReportKindName]'
			И в таблице 'СписокВидовОтчетов' я выбираю текущую строку
		Когда открылось окно "[TheReportKindName] (Report types)"
		И я перехожу к закладке с именем 'НастройкиПоУмолчанию'
		И я нажимаю на кнопку открытия поля с именем 'БланкСводнойТаблицыПоУмолчанию'

	* Формируем Бланк сводной таблиц
		Тогда Открылся бланк сводной таблицы для вида отчета '[TheReportKindName]'
