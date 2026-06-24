import java.io.IOException;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapreduce.Mapper;

public class WordCountMapper
    extends Mapper<Object, Text, Text, IntWritable> {

    private final static IntWritable one =
        new IntWritable(1);

    private Text word = new Text();

    public void map(
        Object key,
        Text value,
        Context context
    ) throws IOException, InterruptedException {

        String[] words =
            value.toString().split("\\s+");

        for (String w : words) {
            word.set(w);
            context.write(word, one);
        }
    }
}
