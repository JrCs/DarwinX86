/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130117-64 [Jan 19 2013]
 * Copyright (c) 2000 - 2013 Intel Corporation
 *
 * Disassembly of ssdt.aml, Tue Apr  2 11:28:57 2013
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000077 (119)
 *     Revision         0x01
 *     Checksum         0xF6
 *     OEM ID           "APPLE "
 *     OEM Table ID     "general"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20130117 (538116375)
 */
DefinitionBlock ("ssdt.aml", "SSDT", 1, "APPLE ", "general", 0x00001000)
{
    External (PCI0, DeviceObj)

    Scope (\)
    {
        Scope (\_SB)
        {
            Scope (PCI0)
            {
                Name (PWD5, Package() { 0x0d, 0x05} ) // Alias for _PRW

                Device (HDEF) // Adding audio device
                {
                    Name (_ADR, 0x001B0000)
                    Alias (PWD5, _PRW)
                }
            }
        }
    }
}

