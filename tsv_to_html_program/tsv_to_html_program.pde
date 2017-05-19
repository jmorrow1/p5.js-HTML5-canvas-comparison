import java.util.Scanner;
import java.util.Arrays;

String path = "\\tables\\";

String[] inputSrcPaths = new String[] {
  path + "style\\stroke style.tsv",
  path + "style\\fill style.tsv",
  path + "style\\text style.tsv",
  path + "style\\misc style.tsv"
};
String outputSrcPath = "\\..\\index.html";

final String tab = "  ";
final String tab2 = tab + tab;
final String tab3 = tab2 + tab;

void setup() {
  try {
    //create writer to write to the output document
    PrintWriter writer = new PrintWriter(new File(sketchPath() + outputSrcPath), "UTF-8");
    
    //write doctype declaration and html tag
    writer.println("<!DOCTYPE html>");
    writer.println("<html>");
    writer.println();
    
    //link style sheet
    writer.println("<link href=\"style.css\" rel=\"stylesheet\">");
    writer.println();
    
    //write heading
    writer.println("<h3>HTML5 / p5.js API Comparison</h3>");
    
    //write description
    writer.println("<p>A comparison of the APIs of p5.js and the HTML5 Canvas</p>");
    writer.println();
    
    for (int i=0; i<inputSrcPaths.length; i++) {
      writeTable(writer, inputSrcPaths[i]);
    }
    
    //close html tag
    writer.println("</html>");
    
    //close writer
    writer.close();
    
  } catch (IOException e) {
    println(e);
  }
}

void writeTable(PrintWriter writer, String inputSrcPath) throws IOException {
  //create scanner to read the input document
  Scanner scanner = new Scanner(new File(sketchPath() + inputSrcPath));
  
  //start table
  writer.println("<table>");
  
  //write a table caption
  if (scanner.hasNextLine()) {
    writer.println(tab + "<caption class=\"table-header\">" + scanner.nextLine() + "</caption>");
  }
  
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