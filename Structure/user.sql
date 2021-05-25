drop user 'user0'@'localhost';
CREATE USER 'user0'@'localhost' IDENTIFIED BY 'TODO';
use Tableaux;
GRANT SELECT,
	  INSERT,
      UPDATE,
      DELETE
ON *.*
TO 'user0'@'localhost';
