package cn.jit.recommend;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FindKNeighbors extends Base{
    public List<Integer> findKNeighbors(int[] score, int i, double[][] similarityMatrix) {	//该方法有三个参数，score表示某一用户对所有项目的评分；i表示某个项目的序号
        List<Integer> neighborSerial = new ArrayList<Integer>();
        double[] similarity = new double[similarityMatrix.length];
        for (int j = 0; j < similarityMatrix.length; j++) {
            if(score[j] != 0) {
                similarity[j] = similarityMatrix[j][i];
            }
            else {
                similarity[j] = 0;
            }
        }
        double[] temp = new double[similarity.length];
        for (int j = 0; j < temp.length; j++) {
            temp[j] = similarity[j];
        }
        Arrays.sort(temp);
        for(int j = 0; j < similarity.length; j++) {
            for (int m = temp.length - 1; m >= temp.length - KNEIGHBOUR; m--) {
                if (similarity[j] == temp[m] && similarity[j] != 0.0)
                    neighborSerial.add(new Integer(j));
            }
        }
        return neighborSerial;
    }
}
