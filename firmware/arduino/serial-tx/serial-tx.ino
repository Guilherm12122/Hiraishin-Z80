// Teste isolado no SimulIDE: Z80 a 1 kHz, Uno a 16 MHz.
// Q0..Q7 do latch -> Arduino D2..D9; IE do latch -> D10.
// Detecta o fim da escrita (IE alto -> baixo) e envia o byte retido.
// Sem handshake: nao usar para transferencias continuas ou clock alto.
const uint8_t aviso = 10;
bool escritaVista = false;

void setup() {
  for (uint8_t p = 2; p <= 9; ++p) pinMode(p, INPUT);
  pinMode(aviso, INPUT);
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(aviso) == HIGH) {
    escritaVista = true;
  } else if (escritaVista) {
    escritaVista = false;
    uint8_t dado = 0;
    for (uint8_t bit = 0; bit < 8; ++bit) {
      if (digitalRead(2 + bit) == HIGH) dado |= (1U << bit);
    }
    Serial.write(dado);
  }
}
