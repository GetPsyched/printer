<script lang="ts">
  export let questionPaper: {
    title: string;
    subtitle: string;
    date: { day: number; month: string; year: number };
    programme: string;
    course: { name: string; code: string };
    semester: number;
    pages: number;
    time: string;
    questions: Array<{
      contents: Array<{ text: string; image: string; prompt: string }>;
      marks: number;
    }>;
  };

  const dateObject = questionPaper.date;
  const date =
    (dateObject.day ? `${dateObject.day} ` : '') +
    `${dateObject.month}, ${dateObject.year}`;
</script>

<table class="w-full">
  <tbody class="p-4 w-full">
    <tr>
      <td><strong>Date:</strong> {date}</td>
      <td><strong>Semester:</strong> {questionPaper.semester}</td>
    </tr>
    <tr>
      <td><strong>Programme:</strong> {questionPaper.programme}</td>
      <td><strong>Number of Pages:</strong> {questionPaper.pages}</td>
    </tr>
    <tr>
      <td><strong>Course Name:</strong> {questionPaper.course.name}</td>
      <td><strong>Time Allowed:</strong> {questionPaper.time}</td>
    </tr>
    <tr>
      <td><strong>Course Code:</strong> {questionPaper.course.code}</td>
      <td>
        <strong>Maximum Marks:</strong>
        {questionPaper.questions.reduce(
          (accumulator, { marks }) => accumulator + marks,
          0
        )}
      </td>
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
