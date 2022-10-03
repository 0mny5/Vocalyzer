function setupMatchPaths() {
    // Check if there are any matched results in a section
    function checkNoMatch(section, noMatchText) {
      if (section.children.length <= 1) {
        section.innerHTML += noMatchText;
      }
    }
}
