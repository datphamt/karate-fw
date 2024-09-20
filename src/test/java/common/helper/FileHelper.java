package common.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.attribute.BasicFileAttributes;
import java.time.LocalDateTime;
import java.time.ZoneId;

import javax.annotation.Nonnull;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * <p>
 * A Collection of helper methods for files.
 * </p>
 */
public class FileHelper {

	private static final Logger logger = LogManager.getLogger(FileHelper.class.getName());

	/**
	 * <p>
	 * Copy file from a location to another.
	 * </p>
	 *
	 * @param sourceFile the location of source file
	 * @param targetFile location of the target file
	 * 
	 * @throws IOException Signals that an I/O exception has occurred.
	 * 
	 * @example {@code File sourceFile = new File("/resources/copyfile.txt");}
	 *          //Create the source file
	 *          {@code File targetFile = new File("/resources/demo/copyfile.txt");}
	 *          //Create the destination file
	 *          {@code FileHelper.copyFile(sourceFile, targetFile);} //Copy the file
	 *          from source to destination location
	 */
	public static void copyFile(File sourceFile, File targetFile) throws IOException {
		try (FileInputStream in = new FileInputStream(sourceFile)) {
			copyFile(in, targetFile);
		}
	}

	/**
	 * <p>
	 * Copy an input file stream to a location.
	 * </p>
	 *
	 * @param in         the input file stream
	 * @param targetFile location of the target file
	 * @throws IOException Signals that an I/O exception has occurred.
	 * 
	 * @example {@code File sourceFile = new File("/resources/copyfile.txt");}
	 *          //Create the source file
	 *          {@code File targetFile = new File("/resources/demo/copyfile.txt");}
	 *          //Create the destination file
	 *          {@code FileInputStream in = new FileInputStream(sourceFile);}
	 *          //Create an input file stream to read from the source file
	 *          {@code FileHelper.copyFile(in, targetFile);} //Write the content to
	 *          the destination file
	 */
	public static void copyFile(InputStream in, File targetFile) throws IOException {
		ensureParentFolderExists(targetFile);

		try (FileOutputStream out = new FileOutputStream(targetFile)) {
			byte[] buffer = new byte[1024];
			int len;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}
		}
	}

	/**
	 * <p>
	 * Create parent folder of the files if not exists.
	 * </p>
	 *
	 * @param targetFile the file to create parent folder
	 * 
	 * @example {@code File targetFile = new File("/resources/demo/copyfile.txt");}
	 *          //Create the file
	 *          {@code FileHelper.ensureParentFolderExists(targetFile)} //Create the
	 *          parent folder of this file if not existed
	 */
	public static void ensureParentFolderExists(File targetFile) {
		ensureFolderExists(targetFile.getParentFile());
	}

	/**
	 * <p>
	 * Create a folder if not existed.
	 * </p>
	 *
	 * @param folder the folder location
	 * 
	 * @return File, the folder location
	 * 
	 * @example {@code File folder = new File("/resources/demo");} //Create the
	 *          folder location {@code FileHelper.ensureFolderExists(folder)}
	 *          //Create a folder if not existed.
	 */
	public static File ensureFolderExists(File folder) {
		if (!folder.exists()) {
			logger.info(String.format("Creating folder: %s", folder.getAbsolutePath()));
			if (!folder.mkdirs()) {
				logger.error(String.format("Failed to create folder: %s", folder.getAbsolutePath()));
			}
		}
		return folder;
	}

	/**
	 * <p>
	 * Move file from a location to another.
	 * </p>
	 *
	 * @param srcFile  the location of source file
	 * @param destFile the location of the destination file
	 * 
	 * @example {@code File srcFile = new File("/resources/movefile.txt");} //Create
	 *          the source file
	 *          {@code File destFile = new File("/resources/demo/movefile.txt");}
	 *          //Create the destination file
	 *          {@code FileHelper.moveFile(srcFile, destFile);} //Move file from the
	 *          source file to destination file
	 */
	public static void moveFile(File srcFile, File destFile) {
		try {
			FileUtils.moveFile(srcFile, destFile);
		} catch (IOException e) {
			throw new IllegalStateException(
					"Failed to move file " + srcFile.getAbsolutePath() + " to " + destFile.getAbsolutePath(), e);
		}
	}

	/**
	 * <p>
	 * Delete folder if empty.
	 * </p>
	 *
	 * @param folder the folder location
	 * 
	 * @example {@code File folder = new File("/resources/demo");} //Create the
	 *          folder location {@code FileHelper.deleteFolderIfEmpty(folder);}
	 *          //Delete folder if empty.
	 */
	public static void deleteFolderIfEmpty(@Nonnull File folder) {
		if (folder.isDirectory()) {
			File[] files = folder.listFiles();
			if (files == null || files.length == 0) {
				if (folder.delete()) {
					logger.info(String.format("Deleted empty folder: %s", folder.getAbsolutePath()));
				} else {
					logger.error(String.format("Failed to delete empty folder: %s", folder.getAbsolutePath()));
				}
			}
		}
	}

	/**
	 * Delete folder with previous days.
	 * 
	 * @param days
	 * @param directoryPath
	 * @param fileExtension
	 */
	public static void deleteFilesOlderThan(int days, String directoryPath, String fileExtension) {
		File dir = new File(directoryPath);
		if (dir.length() != 0) {
			File[] files = dir.listFiles((d, name) -> name.endsWith(fileExtension));

			if (files != null) {
				for (File file : files) {
					try {
						BasicFileAttributes attr = Files.readAttributes(file.toPath(), BasicFileAttributes.class);
						LocalDateTime creationTime = attr.creationTime().toInstant().atZone(ZoneId.systemDefault())
								.toLocalDateTime();

						if (creationTime.plusDays(days).isBefore(LocalDateTime.now())) {
							if (file.delete()) {
								logger.info("Deleted " + file.getName());
							}
						}
					} catch (IOException e) {
						System.out.println(e.getMessage());
					}
				}
			}
		}
	}

	/**
	 * Delete all files in folder
	 * 
	 * @param directoryPath - folder path
	 */
	public static void deleteAllFiles(String directoryPath) {
		File file = new File(directoryPath);
		if (file.length() != 0) {
			File[] files = file.listFiles();
			for (File f : files) {
				if (f.isFile() && f.exists()) {
					f.delete();
					logger.info("Deleted " + f.getName());
				} else {
					logger.error(String.format("Failed to delete empty folder: %s", file.getAbsolutePath()));
				}
			}
		}
	}
	
	/**
	 * Delete file
	 * @param filePath - location of file
	 */
	public static void deleteFile(String filePath) {
		File file = new File(filePath);
		if (file.delete()) {
			logger.info("Deleted " + file.getName());
		} else {
			logger.error(String.format("Failed to delete %s", file.getAbsolutePath()));
		}
	}

	/**
	 * Check file exists
	 * @param filePath - location of file
	 */
	public static boolean exists(String filePath) {
		if (filePath.startsWith("classpath:"))
			filePath = filePath.replace("classpath:", System.getProperty("user.dir") + "/src/test/java");
		File file = new File(filePath);
		return file.exists();
	}

}