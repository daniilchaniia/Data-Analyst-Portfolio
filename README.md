![Power Bi](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)
![](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=Tableau&logoColor=white)
![Canva](https://img.shields.io/badge/Canva-%2300C4CC.svg?style=for-the-badge&logo=Canva&logoColor=white)
![PPT](https://img.shields.io/badge/Microsoft_PowerPoint-B7472A?style=for-the-badge&logo=microsoft-powerpoint&logoColor=white)
![MS OFFICE](https://img.shields.io/badge/Microsoft_Office-D83B01?style=for-the-badge&logo=microsoft-office&logoColor=white)
![EXCEL](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![GOOGLE SHEETS](https://img.shields.io/badge/Google%20Sheets-34A853?style=for-the-badge&logo=google-sheets&logoColor=white)
![VSCODE](https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)
![PREZI](https://img.shields.io/badge/Prezi-3181FF?style=for-the-badge&logo=prezi&logoColor=white)
![SQL Server](https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![GITHUB ACTIONS](https://img.shields.io/badge/Github%20Actions-282a2e?style=for-the-badge&logo=githubactions&logoColor=367cfe)
![WINDOWS TERMINAL](https://img.shields.io/badge/windows%20terminal-4D4D4D?style=for-the-badge&logo=windows%20terminal&logoColor=white)

# Data Analyst Portfolio — Daniil Chaniia

## Ecommerce Funnel & Traffic Analytics

Аналитический проект по исследованию эффективности ecommerce-воронки и источников трафика для сервиса онлайн-продаж.

В проекте анализируется путь пользователя от просмотра страницы товара до покупки: `page_view → add_to_cart → checkout_start → payment_info → purchase`. На основе событийных данных рассчитаны ключевые показатели воронки: количество событий, количество уникальных пользователей на каждом этапе, конверсия между этапами, общая конверсия в покупку, эффективность traffic source и revenue-метрики.

**Ключевые задачи:**
- рассчитать ecommerce-воронку по событиям и уникальным пользователям;
- определить этапы с наибольшей потерей пользователей;
- сравнить эффективность каналов трафика: organic, email, social, paid_ads;
- оценить среднее время прохождения пути от просмотра товара до покупки;
- рассчитать выручку на заказ, покупателя и посетителя;
- подготовить результаты для визуализации в Power BI.

**Инструменты:** PostgreSQL, SQL, Power BI, аналитика воронки продаж, продуктовые метрики.

**Что реализовано:**
- SQL-запросы с `COUNT FILTER`, `COUNT DISTINCT`, `CASE WHEN`, CTE и расчетом conversion rate;
- анализ конверсии между этапами воронки;
- сегментация пользователей по источникам трафика;
- расчет revenue-метрик: revenue per order, revenue per buyer, revenue per visitor;
- Power BI-дашборд для визуального анализа воронки и эффективности трафика.

[Открыть проект](./ecommerce)
