/*  Ex. 1 -- Query all of the entries in the Genre table

select * from Genre
*/

/* Ex. 2 -- Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords

select * from Artist order by Artist.ArtistName
*/

/*  Ex. 3 -- Write a SELECT query that lists all the songs in the Song table and include the Artist name

select Song.Title SongTitle,
	   Artist.ArtistName
	from Song 
	left join Artist on Artist.Id = Song.ArtistId
*/


/*  Ex. 4 -- Write a SELECT query that lists all the Artists that have a Pop Album

select Album.*,
	   Artist.ArtistName
	   from Album
	   left join Artist on Artist.Id = Album.ArtistId
	   left join Genre on Genre.Id = Album.GenreId 
	   where Genre.Name = 'Pop';
*/

/*  Ex. 5 -- Write a SELECT query that lists all the Artists that have a Jazz or Rock Album  

select Album.*,
	   Artist.ArtistName,
	   Genre.Name
	   from Album
	   left join Artist on Artist.Id = Album.ArtistId
	   left join Genre on Genre.Id = Album.GenreId 
	   where Genre.Name = 'Jazz' 
	   or Genre.Name = 'Rock';
*/

/* Ex. 6 -- Write a SELECT statement that lists the Albums with no songs 

select Album.Title 
	   from Album 
	   left join Song on Song.AlbumId = Album.Id 
	   where Song.AlbumId is null
	   order by Album.Title;
*/

/* Ex. 7 -- Using the INSERT statement, add one of your favorite artists to the Artist table 

insert into Artist (ArtistName, YearEstablished) values ('Lamb of God', 1997);
*/

/* Ex. 8 -- Using the INSERT statement, add one, or more, albums by your artist to the Album table 

insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ('Ashes of the Wake', '08/31/2004', 2860, 'Epic', 28, 5);
*/

/* Ex. 9 -- Using the INSERT statement, add some songs that are on that album to the Song table 

insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('Laid to Rest', 230, '08/31/2004', 5, 28, 23);
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('Hourglass', 240, '08/31/2004', 5, 28, 23);
*/

/* Ex. 10 -- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
			 Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. 

select s.Title,
	   al.Title,
	   ar.ArtistName
	   from Song s 
	   left join Album al on al.Id = s.AlbumId
	   left join Artist ar on s.ArtistId = ar.Id 
	   where ar.ArtistName = 'Lamb of God';
*/

/* Ex. 11 -- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence 

select count(Song.Title) as SongCount,
	   Album.Title
	   from Song 
	   left join Album on Album.Id = Song.AlbumId
	   group by Album.Title;
*/

/* Ex. 12 -- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence 

select count(Song.Title) as SongCount,
	   Artist.ArtistName
	   from Song 
	   left join Artist on Artist.Id = Song.ArtistId
	   group by Artist.ArtistName;
*/

/* Ex. 13 -- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence 

select count(Song.Title) as SongCount,
		Genre.Name
		from Song left join Genre on Genre.Id = Song.GenreId
		group by Genre.Name;
*/

/* Ex. 14 -- Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword 

select Artist.ArtistName,
	   count(Label)
	   from Album left join Artist on Artist.Id = Album.ArtistId
	   group by ArtistName
	   having count(Label) > 1;
*/

/* Ex. 15 -- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration 

[solution 1]			select Album.AlbumLength as Length,
							   Album.Title as Name
							   from Album
							   where AlbumLength = (select max(AlbumLength) from Album);

[solution 2]			select top 1 max(Album.AlbumLength) as Length,
							   Album.Title as Name
							   from Album
							   group by Title, AlbumLength
							   order by Album.AlbumLength desc

*/

/* Ex. 16 -- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration 

	   select top 1 max(Song.SongLength) as Length,
					Song.Title as Name
					from Song
					group by Title, SongLength
					order by SongLength desc;

*/

/* Ex. 17 -- Modify the previous query to also display the title of the album 

	   select top 1 max(Song.SongLength) as Length,
					Song.Title as Name,
					Album.Title as Album
					from Song
					left join Album on AlbumId = Song.AlbumId
					group by Song.Title, Song.SongLength, Album.Title 
					order by SongLength desc;
*/

