-- 1. List all titles in book and include ISBN number and Author First & last name as combined Full_Name 
select b.title as Title, b.ISBN as ISBN_Number, a.id as ID , Name(a.AUTHOR_NAME.fname, a.AUTHOR_NAME.lname) as Full_Name 
    from author a, book b 
    where a.id in (
        SELECT COLUMN_VALUE b_author_id  
        FROM TABLE (b_author_id)
    );

-- 2. List All the Customer who have purchased book with 'Pearson Education'
select CONCAT(CONCAT(c.Customer_NAME.fname, ' '),c.Customer_NAME.lname) as Customer_Name, c.phone as Phone_Number, b.title
    from book_sale BS, customer c, book b
    where b.book_publisher.PUB_NAME in 'Pearson Education' and BS.BS_customer_id = c.customer_id and BS.BS_ISBN = B.ISBN;

-- 3. List customers (as combined from customer.fname and customer.lname) who have purchased books published in the UK or the US, as well as the title of the book they purchased and the name of its publisher and order by last name of customer.
select CONCAT(CONCAT(c.Customer_NAME.fname, ' '),c.Customer_NAME.lname) as Customer_Name, b.Title as Book_Name, b.book_publisher.PUB_NAME As Publisher
    from book b, customer c, book_sale bs
    where bs.bs_customer_id = c.customer_id and bs.bs_ISBN = b.ISBN and b.book_publisher.branch in ('US','UK')
    order by c.Customer_NAME.lname ;

-- 4.	List the different (distinct) categories and how many books belong to each category, order alphabetically by category.
select DISTINCT b.category as Category_Name, count(b.category) as Book_Count 
    from book b 
    group by b.category
    ORDER BY b.category
;

-- 5.	List the number of books sold that have been written by each author and group by author’s first name.
select a.Author_Name.fname as Author_Name, count(a.id)
    from Author a, book b, book_sale bs
    where bs.bs_ISBN = b.ISBN and a.id in (
        SELECT COLUMN_VALUE b_author_id  
        FROM TABLE (b_author_id)
        )
    group by a.Author_Name.fname
    ORDER BY COUNT(a.id) DESC    
;