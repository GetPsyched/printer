<script lang="ts">
  import data from '../../../dist/data.json';

  const date =
    (data.date.day ? `${data.date.day} ` : null) +
    `${data.date.month}, ${data.date.year}`;
</script>

<table class="w-full">
  <tbody class="p-4 w-full">
    <tr>
      <td><strong>Date:</strong> {date}</td>
      <td><strong>Semester:</strong> {data.semester}</td>
    </tr>
    <tr>
      <td><strong>Programme:</strong> {data.programme}</td>
      <td><strong>Number of Pages:</strong> {data.pages}</td>
    </tr>
    <tr>
      <td><strong>Course Name:</strong> {data.course.name}</td>
      <td><strong>Time Allowed:</strong> {data.time}</td>
    </tr>
    <tr>
      <td><strong>Course Code:</strong> {data.course.code}</td>
      <td><strong>Maximum Marks:</strong> {data['total-marks']}</td>
    </tr>
  </tbody>
</table>

<style>
  table {
    border: 1px black solid;
  }

  tr {
    display: flex;
    justify-content: space-between;
    padding-left: 7.5px;
    padding-right: 7.5px;
  }

  tr:first-child {
    padding-top: 7.5px;
  }

  tr:last-child {
    padding-bottom: 7.5px;
  }
</style>
