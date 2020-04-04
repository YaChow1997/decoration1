package cn.jit.recommend;

import cn.jit.po.Rating;
import cn.jit.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
@Component
public class Recommendation extends Base{

	@Autowired
	private RatingService ratingService;

	public int[] generateRecommendations(Integer clientId) {
		int[][] preference = new ReadFile().readFile(PREFROWCOUNT, "G:\\javaworkspace1\\decoration\\decoration\\preference.data");
		int[] test =new int[COLUMNCOUNT];
		List <Rating> list=ratingService.queryRatingByClientId(clientId);
		for(Rating   data    :    list)    {
		   test[data.getExampleId()-1501]=data.getScore();
		}

		double[][] similarityMatrix = new ProduceSimilarityMatrix().produceSimilarityMatrix(preference);
		List<Integer> neighborSerial = new ArrayList<Integer>();

		double[] rec=new double[COLUMNCOUNT];
			for (int j = 0; j < COLUMNCOUNT; j++) {
				if(test[j] == 0) {
					double similaritySum = 0;
					double sum = 0;
					double score = 0;
					neighborSerial = new FindKNeighbors().findKNeighbors(test, j, similarityMatrix);
					for (int m = 0; m < neighborSerial.size(); m++) {
						sum += similarityMatrix[j][neighborSerial.get(m)] * test[neighborSerial.get(m)];
						similaritySum += similarityMatrix[j][neighborSerial.get(m)];
					}
					score = sum / similaritySum;
					rec[j]=score;
				}
			}
		double[] rec1=rec.clone();
		Arrays.sort(rec1);
		int[] n=new int[3];
		int count=0;
		for(int k=0;k<COLUMNCOUNT;k++){
			for(int l=COLUMNCOUNT-3;l<COLUMNCOUNT;l++){
				if(rec[k]==rec1[l]){
					n[count]=k+1501;
					count++;
					break;
				}
			}
		}
		return n;

	}

}
