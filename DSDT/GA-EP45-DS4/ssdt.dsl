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

                Device (MCHC) // Usefull for Power Management
                {
                    Name (_ADR, Zero)
                }

                Device (PEG0)
                {
                   Name (_ADR, 0x00010000)
                   Device (GFX0) // Giving our GPU device a name
                   {
                        Name (_SUN, One)    // A simple cosmetic only change
                        Name (_ADR, Zero)
                   }
                }

                External (AZAL, DeviceObj)
                Scope (AZAL)  // Disabling AZAL (cosmetic will be rename to HDEF)
                {
                    Name (_STA, Zero)
                }
                Device (HDEF) // Adding audio device
                {
                    Name (_ADR, 0x001B0000)
                    Alias (PWD5, _PRW)
                }

                External (PX43, DeviceObj)
                Scope (PX43)  // Disabling PX43 (0x001F0003): be rename to SBUS
                {
                    Name (_STA, Zero)
                }
                Device (SBUS)       // SBUS device
                {
                    Name (_ADR, 0x001F0003)
                    Device (BUS0)
                    {
                        Name (_CID, "smbus")
                        Name (_ADR, Zero)
                        Device (DVL0)
                        {
                            Name (_ADR, 0x57)
                            Name (_CID, "diagsvault")
                        }
                    }
                }
            }
        }
    }
}

