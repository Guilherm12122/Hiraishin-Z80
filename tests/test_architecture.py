"""Testes do modelo lógico da proposta v1.0, não de um netlist elétrico.

Executar: python3 -m unittest discover -s tests -v
Não verifica atrasos, níveis, clock, pulsos, fiação nem implementação dos CIs.
"""

import unittest


def memory_selection(address, mreq=0, rfsh=1):
    enabled = mreq == 0 and rfsh == 1
    return (enabled and address < 0x8000,
            enabled and address >= 0x8000)


def io_selection(address, iorq=0, m1=1):
    enabled = iorq == 0 and m1 == 1
    window = (address >> 5) & 7
    return tuple(enabled and window == index for index in range(4))


class ArchitectureTests(unittest.TestCase):
    def test_memory_map_and_refresh(self):
        for address in range(0x10000):
            self.assertEqual(sum(memory_selection(address)), 1)
            self.assertFalse(any(memory_selection(address, mreq=1)))
            self.assertFalse(any(memory_selection(address, rfsh=0)))
        self.assertEqual(memory_selection(0), (True, False))
        self.assertEqual(memory_selection(0x8000), (False, True))

    def test_io_windows_and_acknowledge(self):
        for address in range(0x10000):
            self.assertLessEqual(sum(io_selection(address)), 1)
            self.assertEqual(sum(io_selection(address)), int((address & 255) < 128))
            self.assertFalse(any(io_selection(address, iorq=1)))
            self.assertFalse(any(io_selection(address, m1=0)))
        for index, address in enumerate((0x00, 0x20, 0x40, 0x60)):
            self.assertTrue(io_selection(address)[index])

    def test_documented_mirrors(self):
        for high in range(256):
            for low in range(256):
                self.assertEqual(io_selection((high << 8) | low), io_selection(low))
        self.assertEqual(io_selection(0x00), io_selection(0x18))


if __name__ == '__main__':
    unittest.main()
