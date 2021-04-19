function count_text(){
  const wordLength = document.getElementById("count-text");
  wordLength.addEventListener("keyup", () => {
    const point = wordLength.value.length;
    const pointOutput = document.getElementById("word-length");
    pointOutput.innerHTML = `${point}文字`;
  });
};
window.addEventListener("load",count_text)