import java.util.Scanner;

String inputSrcPath = "\\..\\comparison.tsv";
String outputSrcPath = "\\..\\readme.md";

String tab = "  ";
String tab2 = tab + tab;
String tab3 = tab2 + tab;

try {
    Scanner scanner = new Scanner(new File(sketchPath() + inputSrcPath));
    PrintWriter writer = new PrintWriter(new File(sketchPath() + outputSrcPath), "UTF-8");
    
    writer.println("# p5.js-HTML5-canvas-comparison");
    writer.println("A comparison of the APIs of p5.js and the HTML5 Canvas");
    writer.println();
    writer.println("<table>");
    writer.println();
    writer.println(tab + "<tr>");
    writer.println(tab2 + "<th>p5.js</th>");
    writer.println(tab2 + "<th>canvas.createContext(\"2D\")</th>");
    writer.println(tab + "<tr>");
    
    while (scanner.hasNextLine()) {
      Scanner lineScanner = new Scanner(scanner.nextLine());
      lineScanner.useDelimiter("\t");
      
      writer.println();
      writer.println(tab + "<tr>");
      while(lineScanner.hasNext()) {
        writer.println(tab2 + "<td>");
        String tsvEntry = lineScanner.next();
        writer.println(tab3 + "<pre lang=\"javascript\">" + tsvEntry + "</pre>");
        writer.println(tab2 + "</td>");
      }
      writer.println(tab + "</tr>");
    }
    
    writer.println();
    writer.println("</table>");

    writer.close();
    println("done");
} catch (IOException e) {
   println(e);
}