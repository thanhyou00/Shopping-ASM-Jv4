package FPOLY.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ImportExcelUtil {
	//references 
	// https://www.youtube.com/watch?v=gbtXpXHomlA
	// https://www.codejava.net/coding/java-code-example-to-import-data-from-excel-to-database
	private String workbookName = "";

	public ImportExcelUtil(String workbookName) {
		super();
		this.workbookName = workbookName;
	}

	public void readData(String fileName) {
		String jdbcURL = "jdbc:mysql://localhost:3306/sof3011";
		String username = "root";
		String password = "123456";
		int batchSize = 20;

		Connection connection = null;

		try {
			long start = System.currentTimeMillis();

			FileInputStream inputStream = new FileInputStream(fileName);

			Workbook workbook = new XSSFWorkbook(inputStream);

			Sheet firstSheet = (Sheet) workbook.getSheetAt(0);
			Iterator<Row> rowIterator = firstSheet.iterator();

			connection = (Connection) DriverManager.getConnection(jdbcURL, username, password);
			connection.setAutoCommit(false);

			String sql = "INSERT INTO products (name, price, image, descriptions, color, size, brand) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = (PreparedStatement) connection.prepareStatement(sql);
			int count = 0;

			while (rowIterator.hasNext()) {
				rowIterator.next(); // skip the header row
				Row nextRow = rowIterator.next();
				Iterator<Cell> cellIterator = nextRow.cellIterator();
				while (cellIterator.hasNext()) {
					Cell nextCell = cellIterator.next();
					int columnIndex = nextCell.getColumnIndex();
					switch (columnIndex) {
					case 0:
						String nameProduct = nextCell.getStringCellValue();
						statement.setString(1, nameProduct);
						break;
					case 1:
						int price =(int) nextCell.getNumericCellValue();
						statement.setInt(2, price);
						break;
					case 2:
						String image =nextCell.getStringCellValue();
						statement.setString(3,String.valueOf(image));
						break;
					case 3:
						String description =nextCell.getStringCellValue();
						statement.setString(4, description);
						break;
					case 4:
						String color =nextCell.getStringCellValue();
						statement.setString(5, color);
						break;
					case 5:
						String size =nextCell.getStringCellValue();
						statement.setString(6, size);
						break;
					case 6:
						String brand =nextCell.getStringCellValue();
						statement.setString(7, brand);	
						break;
					}
				}

				statement.addBatch();

				if (count % batchSize == 0) {
					statement.executeBatch();
				}

			}

			workbook.close();
			// execute the remaining queries
			statement.executeBatch();
			connection.commit();
			connection.close();
			long end = System.currentTimeMillis();
			System.out.printf("Import done in %d ms\n", (end - start));

		} catch (IOException ex1) {
			System.out.println("Error reading file");
			ex1.printStackTrace();
		} catch (SQLException ex2) {
			System.out.println("Database error");
			ex2.printStackTrace();
		}
	}

}
