$(document).ready(function () {
  // Por defecto, buscará por Player
  let opcionBusqueda = "Player";

  $(".dropdown-item").click(function () {
    opcionBusqueda = $(this).data("opcion");
    $(".btn-outline-secondary").text("Buscar por " + opcionBusqueda);
  });

  $("#buscar").on("keyup", function () {
    let value = $(this).val().toLowerCase();
    $("table tbody tr").each(function () {
      let mostrarFila = false;
      switch (opcionBusqueda) {
        case "Player":
          mostrarFila = $(this).find("td:nth-child(2)").text().toLowerCase().indexOf(value) > -1;
          break;
        case "PJ":
        case "PG":
        case "PP":
        case "Points":
          let columnaIndex = ["PJ", "PG", "PP", "Points"].indexOf(opcionBusqueda) + 3;
          mostrarFila = $(this).find("td:nth-child(" + columnaIndex + ")").text().toLowerCase().indexOf(value) > -1;
          break;
      }

      $(this).toggle(mostrarFila);
    });
  });
});