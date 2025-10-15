const $status = document.getElementById("status");
const $output = document.getElementById("output");
const $btnPing = document.getElementById("btnPing");
const $btnInfo = document.getElementById("btnInfo");

function setStatus(text, cls = "") {
  $status.textContent = text;
  $status.className = `badge ${cls}`;
}

function print(obj) {
  $output.textContent = typeof obj === "string" ? obj : JSON.stringify(obj, null, 2);
}

async function call(endpoint) {
  try {
    const res = await fetch(endpoint);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const data = await res.json();
    return data;
  } catch (e) {
    throw e;
  }
}

$btnPing.addEventListener("click", async () => {
  setStatus("Probando...", "warn");
  print("Llamando a /api/hello ...");
  try {
    const data = await call("/api/hello");
    setStatus("En línea", "ok");
    print(data);
  } catch (e) {
    setStatus("Error", "warn");
    print(String(e));
  }
});

$btnInfo.addEventListener("click", async () => {
  print("Llamando a /api/info ...");
  try {
    const data = await call("/api/info");
    print(data);
  } catch (e) {
    print(String(e));
  }
});

// Probar automáticamente el estado al cargar
document.addEventListener("DOMContentLoaded", async () => {
  try {
    await call("/api/hello");
    setStatus("En línea", "ok");
  } catch {
    setStatus("Desconocido", "warn");
  }
});
