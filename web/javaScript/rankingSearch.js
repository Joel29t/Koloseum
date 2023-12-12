$(document).ready(function () {

  let opcionBusqueda = "Player";

  $("#btnBuscarPlayer").click(function () {
    opcionBusqueda = "Player";
    $("#btnBuscarPlayer").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnBuscarOpciones").removeClass("btn-primary").addClass("btn-secondary");
  });

  $("#btnBuscarOpciones").click(function () {
    opcionBusqueda = "OtrasOpciones";
    $("#btnBuscarOpciones").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnBuscarPlayer").removeClass("btn-primary").addClass("btn-secondary");
  });

  $("#buscar").on("keyup", function () {
    let value = $(this).val().toLowerCase();
    $("table tbody tr").each(function () {
      let mostrarFila = false;
      if (opcionBusqueda === "Player") {
        mostrarFila = $(this).find("td:nth-child(2)").text().toLowerCase().indexOf(value) > -1;
      } else if (opcionBusqueda === "OtrasOpciones") {
        // Lógica para buscar por otras opciones como PJ, PG, PP, Points
        for (let i = 3; i <= 6; i++) { 
          if ($(this).find("td:nth-child(" + i + ")").text().toLowerCase().indexOf(value) > -1) {
            mostrarFila = true;
            break;
          }
        }
      }

      $(this).toggle(mostrarFila);
    });
  });
});
