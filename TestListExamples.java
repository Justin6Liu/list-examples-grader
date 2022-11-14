import static org.junit.Assert.*;
import org.junit.*;



import java.lang.reflect.Array;

import java.util.ArrayList;
import java.util.List;

public class TestListExamples {
  @Test
    public void testForFilter(){
        List<String> input1 = new ArrayList<>();
        input1.add("a");
        input1.add("b");
        input1.add("c");
        // false output should be c,b,a
        assertEquals(input1, ListExamples.filter(input1,new AlwaysCorrectChecker()));
    }

    @Test
    public void testForMerge(){
        List<String> input1 = new ArrayList<>();
        input1.add("a");
        input1.add("c");
        input1.add("e");
        List<String> input2 = new ArrayList<>();
        input2.add("b");
        input2.add("d");
        input2.add("f");
        List<String> correct = new ArrayList<>();
        String[] sl = new String[]{"a","b","c","d","e","f"};
        for(String s:sl){correct.add(s);}
        assertEquals(correct, ListExamples.merge(input1,input2));

    }

    class AlwaysCorrectChecker implements StringChecker{
      @Override
      public boolean checkString(String s){
        return true;
      }
    }

    
}
