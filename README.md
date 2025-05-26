# assignment-2

blog-1
    postgreSQL:-

    postgreSQL is database management system.

    এটা দিয়ে database server মাধ্যমে ডাটা আনে হয়, এটাকে আমারা ডাটা সার্বার ও বলতে পারি, একজন ব্যাবহারকারী যখন কোন ডাটা পেতে চায় ডাটাবেজ থেকে তখন postgreSQL user কে ডাটা
    পেতে সাহায্য করে। এখানে query করে ডাটা আনা হয় তার জন্য ভিবিন্ন query language ব্যাবহার করা হয়, যার একটি হলো (SQL) যা হলো একটি standard query language 

blog-2
    Primary key, Foreign key:-

    Primary key: postgreSQL আসলে RDBMS আকারে কাজ করে যেখানে ডাটাগুলো table মধ্যে রাখা হয়, প্রতিটি টেবিলে column এবং ROW আকারে সাজানো থাকে, table কে uniq করার জন্য কিছু key use করা হয়, এগুলোর মধ্যে primary key ব্যাবহার করা হয় যা ওই টেবিলকে আলাদা করতে সাহায্য করে, table মধ্যে (user_id) এটি একটি primary key কারন এটি একবার serial আকারে তৈরি হয়, আর এটা হলো primary key

    Foreign key: এটি খুব প্রয়োজনীয়, যখন একটি table সাথে আরেকটি table সংযোগ করা হয় তখন Foreign key ব্যাবহার করা হয়, এখানে একটি table মধ্যে primary key অন্য table মধ্যে foreign key হয়ে সম্পর্ক তৈরি কর।

blog-3
    VARCHAR, CHAR:-
    
    VARCHAR: এটি হলো string variable রাখতে সাহায্য করে, এটি হলো sql data type, এটার মাধ্যমে বলা হয় একজন ব্যাবহারকারী কতগুলো বর্ণ রাখা হবে যেমন: user_name, contact, email ইত্যাদি এসব মান নিতে ব্যাবহার করা হয়, এটার মান দৈঘ্য ভিন্ন হতে পারে।

    CHAR: এটি হলো sql data type, যখন ডেটার মান বা দৈঘ্য একই হবে তখন এটি ব্যাবহার করা হয়, এখানেও string value রাখা হয় যেমন: PIN, country code BD, USA ইত্যাদি।


blog-4
    JOIN:-
    এটি হলো sql reserved key word, এটির মাধ্যমে একটি table data অন্য একটি table data  সাথে একত্রিত করা হয়, এখানে একটি টেবিলের user_id, name বা অন্য কোন column দিয়ে ডাটাগুলো join করা
    হয়, এখানে একাদিকভাবে join করা যায় যেমন সাধারণভাবে যোড়া লাগাতে JOIN key word ব্যাবহার করা হয়,
    main table left side রাখতে LEFT JOIN ব্যাবহার করা হয়, আবার right সকল ডাটা দেখতে RIGHT JOIN ব্যাবহার করা হয়, আবার সকল ডাটা দেখতে FULL JOIN ব্যাবহার করা হয় ।


blog-5
    GROUP BY:- 
    এটি একটি SQL key word, সাধারণত কোন user যদি একই মান একাধিকবার ব্যাবহার করে তখন তার একাধিক ব্যাবহার করা মান একবার দেখতে GROUP BY key word ব্যাবহার করা হয়, এটার মাধ্যমে cloum অনেক মানকে একত্রিত করে দেখা যায়

