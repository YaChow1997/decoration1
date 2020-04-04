package cn.jit.recommend;

import java.io.*;

public class ReadFile extends  Base{
    public int[][] readFile(int rowCount,String fileName) {
        int[][] preference = new int[rowCount][COLUMNCOUNT];
        try {
            File file = new File(fileName);
            FileReader fr = new FileReader(file);
            BufferedReader br = new BufferedReader(fr);
            String line = "";
            int i = 0;
            while (br.ready()) {
                line = br.readLine();
                String[] data = line.split(",");
                for (int j = 0; j < data.length; j++) {
                    preference[i][j] = Integer.parseInt(data[j]);
                }
                i++;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return preference;
    }
}
