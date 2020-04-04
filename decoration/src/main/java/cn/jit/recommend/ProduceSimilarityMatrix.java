package cn.jit.recommend;

public class ProduceSimilarityMatrix extends Base{
    public double[][] produceSimilarityMatrix(int[][] preference) {
        double[][] similarityMatrix = new double[COLUMNCOUNT][COLUMNCOUNT];
        for (int i = 0; i < COLUMNCOUNT; i++) {
            for (int j = 0; j < COLUMNCOUNT; j++) {
                if (i == j) {
                    similarityMatrix[i][j] = 0;
                }
                else {
                    similarityMatrix[i][j] = new ComputeSimilarity().computeSimilarity(preference[i], preference[j]);
                }
            }
        }
        return similarityMatrix;
    }
}
