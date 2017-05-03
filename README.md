# p5.js-HTML5-canvas-comparison
A comparison of the APIs of p5.js and the HTML5 Canvas

<table>

  <tr>
    <th>p5.js</th>
    <th>canvas.createContext("2D")</th>
  <tr>

  <tr>
    <td>
      <pre lang="javascript">p5.fill('#0000AA');</pre>
    </td>
    <td>
      <pre lang="javascript">ctx.fillStyle = '#0000AA';</pre>
    </td>
  </tr>

  <tr>
    <td>
      <pre lang="javascript">p5.stroke('#0000AA');</pre>
    </td>
    <td>
      <pre lang="javascript">ctx.strokeStyle = '#0000AA';</pre>
    </td>
  </tr>

  <tr>
    <td>
      <pre lang="javascript">p5.strokeCap(ROUND);</pre>
    </td>
    <td>
      <pre lang="javascript">ctx.lineCap = "round";</pre>
    </td>
  </tr>

</table>
