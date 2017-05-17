import java.util.Scanner;
import java.util.Arrays;

String[] inputSrcPaths = new String[] {
  "\\tables\\style.tsv"
};
String outputSrcPath = "\\..\\index.html";

final String tab = "  ";
final String tab2 = tab + tab;
final String tab3 = tab2 + tab;

void setup() {
  try {
    //create writer to write to the output document
    PrintWriter writer = new PrintWriter(new File(sketchPath() + outputSrcPath), "UTF-8");
    
    //write heading
    writer.println("# p5.js-HTML5-canvas-comparison");
    
    //write description
    writer.println("A comparison of the APIs of p5.js and the HTML5 Canvas");
    writer.println();
    
    for (int i=0; i<inputSrcPaths.length; i++) {
      writeTable(writer, inputSrcPaths[i]);
    }
    
  } catch (IOException e) {
    println(e);
  }
}

void writeTable(PrintWriter writer, String inputSrcPath) throws IOException {
  //create scanner to read the input document
  Scanner scanner = new Scanner(new File(sketchPath() + inputSrcPath));
  
  //start table
  writer.println("<table>");
  
  //read / write row of header cells
  if (scanner.hasNextLine()) {
    writeRow(scanner.nextLine(), writer, true);
  }
  
  //read / write rows of data cells
  while (scanner.hasNextLine()) {
    writeRow(scanner.nextLine(), writer, false);
  }
  
  //end table
  writer.println();
  writer.println("</table>");

  //close writer
  writer.close();
  println("done");
}

void writeRow(String inputRow, PrintWriter writer, boolean isHeader) {
  //create scanner to read the row from the input document
  Scanner lineScanner = new Scanner(inputRow);
  lineScanner.useDelimiter("\t");
  
  //start row
  writer.println();
  writer.println(tab + "<tr>");
  
  //read / write each cell in the row
  while(lineScanner.hasNext()) {
    
    //read data
    String tsvEntry = lineScanner.next();

    if (isHeader) {
      //write header cell
      writer.print(tab2 + "<th>");
      writeCell(writer, tsvEntry);
      writer.println("</th>");
    }
    else {  
      //write data cell
      writer.println(tab2 + "<td>");
      writer.print(tab3 + "<pre lang=\"javascript\">");
      writeCell(writer, tsvEntry);
      writer.println("</pre>");
      writer.println(tab2 + "</td>");
    }
  }
  
  //end row
  writer.println(tab + "</tr>");
}

void writeCell(PrintWriter writer, String data) {
  String[] lns = data.split("NEW_LINE"); //Splitting with a wacky new line indicator rather than "\n" because "\n" isn't working.
  for (int i=0; i<lns.length; i++) {
    if (i == lns.length-1) {
      writer.print(lns[i]);
    }
    else {
      writer.println(lns[i]);
    }
  }
}