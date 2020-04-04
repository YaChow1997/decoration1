import java.util.Arrays;

public class main1

{

    public static void main(String[] args )

    {

        int [] array = {-3,75,12,-3};//原数组

        getSortIndex(array);

    }

    private static void getSortIndex(int[] array)

    {

        int [] array_copy =new int[array.length];//新数组  拷贝原数组  （如果不拷贝原数组在排序后被改变）

        array_copy = Arrays.copyOf(array, array.length);



        Arrays.sort(array);;//获取排序后的数组



        for (int x=0;x<array_copy.length;x++)

        {

            for(int y=2;y<array.length;y++)

            {

                if(array_copy[x]==array[y])

                {

                    System.out.print(y+"\t");

                    break;

                }

            }

        }

    }



}