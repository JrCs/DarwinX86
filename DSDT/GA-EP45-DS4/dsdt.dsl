/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080926
 *
 * Disassembly of dsdt.aml, Sat Oct 24 17:51:35 2009
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00003787 (14215)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0xFF
 *     OEM ID           "GBT   "
 *     OEM Table ID     "GBTUACPI"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20080926 (537397542)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 1, "GBT   ", "GBTUACPI", 0x00001000)
{

    // Patch _OSI -> OOSI (from clover) We must emulate Windows XP
    Name (WXP1, "Windows 2001")
    Method (GET9, 2, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TCH9)
        Return (TCH9)
    }

    Method (STR9, 2, NotSerialized)
    {
        Name (STR8, Buffer (0x50) {})
        Name (STR9, Buffer (0x50) {})
        Store (Arg0, STR8)
        Store (Arg1, STR9)
        Store (Zero, Local0)
        Store (One, Local1)
        While (Local1)
        {
            Store (GET9 (STR8, Local0), Local1)
            Store (GET9 (STR9, Local0), Local2)
            If (LNotEqual (Local1, Local2))
            {
                Return (Zero)
            }

            Increment (Local0)
        }

        Return (One)
    }

    Method (OOSI, 1, NotSerialized)
    {
        If (STR9 (WXP1, Arg0))
        {
            Return (One)
        }

        Return (Zero)
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00000410, 0x06) {}
        Processor (CPU1, 0x01, 0x00000410, 0x06) {}
        Processor (CPU2, 0x02, 0x00000410, 0x06) {}
        Processor (CPU3, 0x03, 0x00000410, 0x06) {}
    }

    Name (_S0, Package (0x04)
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (SS1, Package (0x04)
    {
        One, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x04)
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S4, Package (0x04)
    {
        0x06, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Name (FLAG, Zero)
    Name (STAT, Zero)
    OperationRegion (SMOD, SystemMemory, 0x000FF840, One)
    Field (SMOD, ByteAcc, NoLock, Preserve)
    {
            ,   7, 
        SUSF,   1
    }

    OperationRegion (DEBG, SystemIO, 0x80, One)
    Field (DEBG, ByteAcc, NoLock, Preserve)
    {
        DBG1,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
                Offset (0x3404), 
            ,   7, 
        HPTF,   1
    }

    OperationRegion (ELKM, SystemMemory, 0x000FFFEA, One)
    Field (ELKM, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
            ,   1, 
        ELSO,   1, 
            ,   1, 
            ,   1, 
            ,   1, 
            ,   1
    }

    OperationRegion (EXTM, SystemMemory, 0x000FF830, 0x10)
    Field (EXTM, WordAcc, NoLock, Preserve)
    {
        ROM1,   16, 
        RMS1,   16, 
        ROM2,   16, 
        RMS2,   16, 
        ROM3,   16, 
        RMS3,   16, 
        AMEM,   32
    }

    OperationRegion (SMIC, SystemIO, 0xB2, One)
    Field (SMIC, ByteAcc, NoLock, Preserve)
    {
        SCP,    8
    }

    OperationRegion (GP2C, SystemIO, 0x042C, 0x02)
    Field (GP2C, ByteAcc, NoLock, Preserve)
    {
        G2C1,   8, 
        G2C2,   8
    }

    OperationRegion (GBLE, SystemIO, 0x0421, One)
    Field (GBLE, ByteAcc, NoLock, Preserve)
    {
        ESMI,   8
    }

    OperationRegion (APMP, SystemIO, 0xB2, 0x02)
    Field (APMP, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (PMRS, SystemIO, 0x0430, One)
    Field (PMRS, ByteAcc, NoLock, Preserve)
    {
            ,   4,
        SLPE,   1
    }

    OperationRegion (AGPS, SystemIO, 0x0438, 0x04)
    Field (AGPS, ByteAcc, NoLock, Preserve)
    {
        GPSE,   16, 
        GPSS,   16
    }

    OperationRegion (GPCN, SystemIO, 0x0442, One)
    Field (GPCN, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
        SWGC,   1, 
                Offset (0x01)
    }

    Name (OSFX, One)
    Name (OSFL, One)
    Method (STRC, 2, NotSerialized)
    {
        If (LNotEqual (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    OperationRegion (INFO, SystemMemory, 0x000FF840, One)
    Field (INFO, ByteAcc, NoLock, Preserve)
    {
        KBDI,   1, 
        RTCW,   1, 
        PS2F,   1, 
        IRFL,   2, 
        DISE,   1, 
        SSHU,   1
    }

    Scope (\)
    {
        Name (PICF, Zero)
        Method (_PIC, 1, NotSerialized)
        {
            Store (Arg0, PICF)
        }
    }

    // _PTS (Prepare To Sleep)
    //     ARG0: sleeping state (1 for S1, 2 for S2, etc.)
    //
    //     S5 is the soft-off state (shutdown)
    Method (_PTS, 1, NotSerialized)
    {
        Or (Arg0, 0xF0, Local0)
        Store (Local0, DBG1)
        OSTP ()
        If (LEqual (Arg0, One)) {}
        If (LEqual (Arg0, 0x03)) {}
        If (LEqual (Arg0, 0x05))
        {
            Store (One, \_SB.PCI0.LPCB.AG3E) // Return to S5 after a power failure
                                             // Mimic "Start up automatically after power failure" checkbox
                                             // on Energy Saver (Preferences).
            Store (Zero, SLPE)
            Sleep(0x10)
        }
        Else
        {
            Store (Zero, \_SB.PCI0.LPCB.AG3E )   // Resume after sleep fix
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LNot (PICF))
            {
                Sleep (0x64)
            }
        }
    }

    Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, Buffer (0x10)
                {
                    /* 0000 */    0xC6, 0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44,
                    /* 0008 */    0xB0, 0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B
                }))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (One)
                        {
                            0x03
                        }, Arg4)
                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (One)
            {
                0x00
            }, Arg4)
        Return (Zero)
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0xFF, DBG1)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x8F, SCP)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LEqual (OSFL, Zero))
            {
                If (LEqual (OSFX, 0x03))
                {
                    Store (0x59, SMIP)
                }
                Else
                {
                    Store (0x58, SMIP)
                }
            }

            If (LEqual (OSFL, One))
            {
                Store (0x56, SMIP)
            }

            If (LEqual (OSFL, 0x02))
            {
                Store (0x57, SMIP)
            }

            If (LEqual (OSFX, 0x03))
            {
                Store (0x59, SMIP)
            }
        }

        If (LEqual (Arg0, One)) {}
        If (OSFL)
        {
            Notify (\_SB.PWRB, 0x02)
        }
        Else
        {
            If (LEqual (RTCW, Zero))
            {
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Notify (\_SB.PCI0.UHC1, Zero)
        Notify (\_SB.PCI0.UHC2, Zero)
        Notify (\_SB.PCI0.UHC3, Zero)
        Notify (\_SB.PCI0.UHC4, Zero)
        Notify (\_SB.PCI0.UHC5, Zero)
        Notify (\_SB.PCI0.UHC6, Zero)
        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }

    Scope (_SI)
    {
        Method (_MSG, 1, NotSerialized)
        {
            Store ("Local0", Local0)
        }

        Method (_SST, 1, NotSerialized)
        {
            Store ("Local0", Local0)
        }
    }

    Scope (_GPE)
    {
        Method (_L08, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.LPCB.UAR1, 0x02)
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC1, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC2, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC3, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC4, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC5, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L20, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UHC6, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.EHC1, 0x02)
            Notify (\_SB.PCI0.EHC2, 0x02)
            Notify (\_SB.PWRB, 0x02)
            Notify (\_SB.PCI0.AZAL, 0x02)
            Notify (\_SB.PCI0.IGBE, 0x02)
        }

        Method (_L02, 0, NotSerialized)
        {
            Store (Zero, SWGC)
            ShiftLeft (One, 0x09, Local0)
            Store (0x02, Local2)
            Store (One, Local3)
            Store (Local3, Local4)
            While (LAnd (LNotEqual (Local4, Zero), LNotEqual (Local2, Zero)))
            {
                Sleep (One)
                Decrement (Local2)
                And (GPSS, Local0, Local1)
                If (LNotEqual (Local1, Local0))
                {
                    Decrement (Local4)
                }
                Else
                {
                    Store (Local3, Local4)
                }
            }

            And (GPSS, Local0, GPSS)
            Or (GPSE, Local0, GPSE)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.HUB0, 0x02)
        }

        Method (_L09, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PEX0, 0x02)
            Notify (\_SB.PCI0.PEX1, 0x02)
            Notify (\_SB.PCI0.PEX2, 0x02)
            Notify (\_SB.PCI0.PEX3, 0x02)
            Notify (\_SB.PCI0.PEX4, 0x02)
            Notify (\_SB.PCI0.PEX5, 0x02)
        }
    }

    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized) {
            // Fix EHCI Wake Up @ Boot
            Store (One, ^PCI0.EHC1.WRTA)
            Store (0x19,^PCI0.EHC1.PMES) // Underpower patch
            Store (Zero,^PCI0.EHC1.WRTA)
            Store (One, ^PCI0.EHC2.WRTA)
            Store (0x19,^PCI0.EHC2.PMES) // Underpowered patch
            Store (Zero,^PCI0.EHC2.WRTA)
        }

        Device (PWRB)
        {
            Name (_CID, EisaId ("PNP0C0C"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
            Name (_UID, Zero)
            Name (_BBN, Zero)
            Method (_S3D, 0, NotSerialized)
            {
                If (LEqual (OSFL, 0x02))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    WordBusNumber (ResourceConsumer, MinNotFixed, MaxNotFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x003F,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0040,             // Length
                        ,, )
                    IO (Decode16,
                        0x0CF8,             // Range Minimum
                        0x0CF8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0CF7,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0CF8,             // Length
                        ,, , TypeStatic)
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Granularity
                        0x0D00,             // Range Minimum
                        0xFFFF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0xF300,             // Length
                        ,, , TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000A0000,         // Range Minimum
                        0x000BFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C0000,         // Range Minimum
                        0x000DFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00020000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0xFED40000,         // Range Minimum
                        0xFED44FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00005000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x00100000,         // Range Minimum
                        0xFEBFFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0xFEB00000,         // Length
                        ,, _Y00, AddressRangeMemory, TypeStatic)
                })
                CreateDWordField (BUF0, _Y00._MIN, TCMM)
                CreateDWordField (BUF0, _Y00._LEN, TOMM)
                Add (AMEM, 0x00040000, TCMM)
                Add (TCMM, 0x00010000, TCMM)
                Subtract (0xFEC00000, TCMM, TOMM)
                Return (BUF0)
            }

            Name (PICM, Package (0x1B)
            {
                Package (0x04)
                {
                    0x001BFFFF, 
                    Zero, 
                    LNK0, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    Zero, 
                    LNK1, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    Zero, 
                    LNKE, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    One, 
                    LNKF, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }
            })
            Name (APIC, Package (0x1B)
            {
                Package (0x04)
                {
                    0x001BFFFF, 
                    Zero, 
                    Zero, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    Zero, 
                    Zero, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    Zero, 
                    Zero, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    One, 
                    Zero, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }
            })
            Method (_PRT, 0, NotSerialized)
            {
                If (LNot (PICF))
                {
                    Return (PICM)
                }
                Else
                {
                    Return (APIC)
                }
            }

            Device (PEX0)
            {
                Name (_ADR, 0x001C0000)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC0, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (API0, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC0)
                    }
                    Else
                    {
                        Return (API0)
                    }
                }
            }

            Device (PEX1)
            {
                Name (_ADR, 0x001C0001)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC1, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (API1, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC1)
                    }
                    Else
                    {
                        Return (API1)
                    }
                }
            }

            Device (PEX2)
            {
                Name (_ADR, 0x001C0002)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC2, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (API2, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC2)
                    }
                    Else
                    {
                        Return (API2)
                    }
                }
            }

            Device (PEX3)
            {
                Name (_ADR, 0x001C0003)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC3, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (API3, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC3)
                    }
                    Else
                    {
                        Return (API3)
                    }
                }
            }

            Device (PEX4)
            {
                Name (_ADR, 0x001C0004)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC4, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (API4, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC4)
                    }
                    Else
                    {
                        Return (API4)
                    }
                }

                Device (LAN0)
                {
                    Name (_ADR, Zero)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package ()
                        {
                          "AAPL,slot-name", Buffer() { "Built In" },
                          "model", Buffer() { "Realtek Semiconductor Co., Ltd. RTL8111/8168B PCI Express Gigabit Ethernet controller" },
                          "location", Buffer() { "1" }
                        }, Local0)

                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0)) // Data injection
                        Return (Local0)
                    }
                }
            }

            Device (PEX5)
            {
                Name (_ADR, 0x001C0005)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x05
                    })
                }

                Name (PIC5, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (API5, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PIC5)
                    }
                    Else
                    {
                        Return (API5)
                    }
                }

                Device (LAN1)
                {
                    Name (_ADR, Zero)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package ()
                        {
                          "AAPL,slot-name", Buffer() { "Built In" },
                          "model", Buffer() { "Realtek Semiconductor Co., Ltd. RTL8111/8168B PCI Express Gigabit Ethernet controller" },
                          "location", Buffer() { "2" }
                        }, Local0)

                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0)) // Data injection
                        Return (Local0)
                    }
                }
            }

            Device (HUB0)
            {
                Name (_ADR, 0x001E0000)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (PICM, Package (0x0C)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (APIC, Package (0x0C)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PICM)
                    }
                    Else
                    {
                        Return (APIC)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                }
            }

            Device (LPCB) // Rename from PX40
            {
                Name (_ADR, 0x001F0000)

                Method (_DSM, 4, NotSerialized) // Inject device-id to load AppleLPC
                                                // using a device (3A18) near to our
                                                // own device id (3A16)
                {
                    Store (Package ()
                    {
                        "device-id", Buffer() { 0x18, 0x3A, 0x00, 0x00 }
                    }, Local0)

                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0)) // Data injection
                    Return (Local0)
                }

                // For _PTS to fix resume after sleep
                OperationRegion (LPC0, PCI_Config, 0xA4, 0x02)    // General PM Configuration 3 Register (ICH10.pdf / 13.8.1.3 / page 454)
                Field (LPC0, ByteAcc, NoLock, Preserve) {
                    AG3E, 1    // Bit 0 – AFTERG3_EN
                }

                OperationRegion (PREV, PCI_Config, 0x08, One)
                Scope (\)
                {
                    Field (\_SB.PCI0.LPCB.PREV, ByteAcc, NoLock, Preserve)
                    {
                        REV0,   8
                    }
                }

                OperationRegion (PIRQ, PCI_Config, 0x60, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.LPCB.PIRQ, ByteAcc, NoLock, Preserve)
                    {
                        PIRA,   8, 
                        PIRB,   8, 
                        PIRC,   8, 
                        PIRD,   8
                    }
                }

                OperationRegion (PIR2, PCI_Config, 0x68, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.LPCB.PIR2, ByteAcc, NoLock, Preserve)
                    {
                        PIRE,   8, 
                        PIRF,   8, 
                        PIRG,   8, 
                        PIRH,   8
                    }
                }

                OperationRegion (LPIO, PCI_Config, 0x80, 0x0E)
                Scope (\)
                {
                    Field (\_SB.PCI0.LPCB.LPIO, ByteAcc, NoLock, Preserve)
                    {
                        UAIO,   8, 
                        PRIO,   8, 
                        LPE1,   8, 
                        LPE2,   8, 
                        GN1L,   8, 
                        GN1H,   8, 
                        GN2L,   8, 
                        GN2H,   8
                    }

                    Method (DISD, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            And (LPE1, 0xFE, LPE1)
                        }

                        If (LEqual (Arg0, One))
                        {
                            And (LPE1, 0xFD, LPE1)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            And (LPE1, 0xFB, LPE1)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            And (LPE1, 0xF7, LPE1)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            And (LPE2, 0xFC, LPE2)
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            And (LPE1, 0xDF, LPE1)
                        }

                        If (LEqual (Arg0, 0x06))
                        {
                            And (GN2L, 0xFE, GN2L)
                        }
                    }

                    Method (CKIO, 2, NotSerialized)
                    {
                        If (LEqual (Arg1, Zero))
                        {
                            Or (LPE1, One, LPE1)
                            And (UAIO, 0xF0, Local0)
                            If (LEqual (Arg0, 0x03F8))
                            {
                                Or (Local0, Zero, UAIO)
                            }

                            If (LEqual (Arg0, 0x02F8))
                            {
                                Or (Local0, One, UAIO)
                            }

                            If (LEqual (Arg0, 0x02E8))
                            {
                                Or (Local0, 0x05, UAIO)
                            }

                            If (LEqual (Arg0, 0x03E8))
                            {
                                Or (Local0, 0x07, UAIO)
                            }
                        }

                        If (LEqual (Arg1, One))
                        {
                            Or (LPE1, 0x02, LPE1)
                            And (UAIO, 0x0F, Local0)
                            If (LEqual (Arg0, 0x03F8))
                            {
                                Or (Local0, Zero, UAIO)
                            }

                            If (LEqual (Arg0, 0x02F8))
                            {
                                Or (Local0, 0x10, UAIO)
                            }

                            If (LEqual (Arg0, 0x02E8))
                            {
                                Or (Local0, 0x50, UAIO)
                            }

                            If (LEqual (Arg0, 0x03E8))
                            {
                                Or (Local0, 0x70, UAIO)
                            }
                        }

                        If (LEqual (Arg1, 0x02))
                        {
                            Or (LPE1, 0x04, LPE1)
                            And (PRIO, 0xFC, Local0)
                            If (LEqual (Arg0, 0x0378))
                            {
                                Or (Local0, Zero, PRIO)
                            }

                            If (LEqual (Arg0, 0x0278))
                            {
                                Or (Local0, One, PRIO)
                            }

                            If (LEqual (Arg0, 0x03BC))
                            {
                                Or (Local0, 0x02, PRIO)
                            }
                        }

                        If (LEqual (Arg1, 0x03))
                        {
                            Or (LPE1, 0x08, LPE1)
                        }

                        If (LEqual (Arg1, 0x04))
                        {
                            If (LEqual (Arg0, 0x0201))
                            {
                                Or (LPE2, One, LPE2)
                            }

                            If (LEqual (Arg0, 0x0209))
                            {
                                Or (LPE2, 0x02, LPE2)
                            }
                        }

                        If (LEqual (Arg1, 0x06))
                        {
                            If (LNotEqual (Arg0, 0xFFFF))
                            {
                                And (Arg0, 0xFF, Local0)
                                Or (Local0, One, GN2L)
                                ShiftRight (Arg0, 0x08, GN2H)
                            }
                            Else
                            {
                                Store (Zero, GN2H)
                                Store (Zero, GN2L)
                            }
                        }
                    }
                }

                Scope (\)
                {
                    Method (SLDM, 2, NotSerialized)
                    {
                    }
                }

                Scope (\)
                {
                    OperationRegion (SCPP, SystemIO, 0xB2, One)
                    Field (SCPP, ByteAcc, NoLock, Preserve)
                    {
                        SMIP,   8
                    }
                }

                Method (^_INI, 0, NotSerialized)
                {
                    If (STRC (_OS, "Microsoft Windows"))
                    {
                        Store (0x56, SMIP)
                    }
                    Else
                    {
                        If (STRC (_OS, "Microsoft Windows NT"))
                        {
                            If (CondRefOf (\OOSI, Local0)) // _OSI renamed to OOSI
                            {
                                If (OOSI ("Windows 2001")) // _OSI renamed to OOSI
                                {
                                    Store (0x59, SMIP)
                                    Store (Zero, OSFL)
                                    Store (0x03, OSFX)
                                }
                            }
                            Else
                            {
                                Store (0x58, SMIP)
                                Store (Zero, OSFL)
                            }
                        }
                        Else
                        {
                            Store (0x57, SMIP)
                            Store (0x02, OSFL)
                        }
                    }
                }

                Scope (\)
                {
                    Method (OSTP, 0, NotSerialized)
                    {
                        If (LEqual (OSFL, One))
                        {
                            Store (0x56, SMIP)
                        }

                        If (LEqual (OSFL, 0x02))
                        {
                            Store (0x57, SMIP)
                        }

                        If (LEqual (OSFL, Zero))
                        {
                            If (LEqual (OSFX, 0x03))
                            {
                                Store (0x59, SMIP)
                            }
                            Else
                            {
                                Store (0x58, SMIP)
                            }
                        }

                        If (LEqual (OSFX, 0x03))
                        {
                            Store (0x59, SMIP)
                        }
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, One)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x01,               // Alignment
                            0x0A,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0074,             // Range Minimum
                            0x0074,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x0091,             // Range Minimum
                            0x0091,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x0290,             // Range Minimum
                            0x0290,             // Range Maximum
                            0x01,               // Alignment
                            0x05,               // Length
                            )
                        IO (Decode16,
                            0x0880,             // Range Minimum
                            0x0880,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                    })
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        /* No IRQ so AppleLPC work fine */
                        /* IRQNoFlags ()
                            {2} */
                    })
                }

                Device (DMA1)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0094,             // Range Minimum
                            0x0094,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (ATT5, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Name (ATT6, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (ATT6) /* No IRQ so AppleLPC work fine */
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (ATT3, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    Name (ATT4, ResourceTemplate ()
                    {
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                                Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                                Return (ATT3)
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (ATT0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags () {8}
                    })
                    Name (ATT1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSFX, 0x03))
                        {
                            If (HPTF)
                            {
                                Return (ATT1)
                            }
                            Else
                            {
                                Return (ATT0)
                            }
                        }
                        Else
                        {
                            Return (ATT0)
                        }
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Scope (\)
                {
                    OperationRegion (WIN1, SystemIO, 0x2E, 0x02)
                    Field (WIN1, ByteAcc, NoLock, Preserve)
                    {
                        INDP,   8, 
                        DATP,   8
                    }

                    OperationRegion (GPIO, SystemIO, 0x0800, 0x05)
                    Field (GPIO, ByteAcc, NoLock, Preserve)
                    {
                        GO01,   8, 
                        GO02,   8, 
                        GO03,   8, 
                        GO04,   8, 
                        GO05,   8
                    }

                    IndexField (INDP, DATP, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x02), 
                        CFG,    8, 
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x20), 
                        IDHI,   8, 
                        IDLO,   8, 
                        POWC,   8, 
                                Offset (0x30), 
                        ACTR,   8, 
                                Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                        IO2H,   8, 
                        IO2L,   8, 
                                Offset (0x70), 
                        INTR,   8, 
                                Offset (0x72), 
                        INT1,   8, 
                                Offset (0x74), 
                        DMCH,   8, 
                                Offset (0xC0), 
                        GP40,   8, 
                                Offset (0xF0), 
                        OPT1,   8, 
                        OPT2,   8, 
                        OPT3,   8, 
                        OPT4,   8
                    }

                    Method (ENFG, 0, NotSerialized)
                    {
                        Store (0x87, INDP)
                        Store (One, INDP)
                        Store (0x55, INDP)
                        Store (0x55, INDP)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Store (0x02, CFG)
                    }

                    Method (GSRG, 1, NotSerialized)
                    {
                        Store (Arg0, INDP)
                        Return (DATP)
                    }

                    Method (SSRG, 2, NotSerialized)
                    {
                        Store (Arg0, INDP)
                        Store (Arg1, DATP)
                    }
                }

                Device (FDC0)
                {
                    Name (_HID, EisaId ("PNP0700"))
                    Method (_STA, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (Zero, LDN)
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (IOAH, IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (Zero)
                            }
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (Zero, LDN)
                        Store (Zero, ACTR)
                        SLDM (DMCH, 0x04)
                        EXFG ()
                        DISD (0x03)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                _Y01)
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        })
                        CreateWordField (BUF0, _Y01._MIN, IOLO)
                        CreateByteField (BUF0, 0x03, IOHI)
                        CreateWordField (BUF0, _Y01._MAX, IORL)
                        CreateByteField (BUF0, 0x05, IORH)
                        ENFG ()
                        EXFG ()
                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateWordField (Arg0, 0x19, IRQW)
                        CreateByteField (Arg0, 0x1C, DMAV)
                        ENFG ()
                        Store (Zero, LDN)
                        Store (One, ACTR)
                        SLDM (DMCH, DMCH)
                        CKIO (IOAD, 0x03)
                        EXFG ()
                    }
                }

                Device (UAR1)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Name (_UID, One)
                    Method (_STA, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (One, LDN)
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (IOAH, IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (Zero)
                            }
                        }

                        EXFG ()
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (One, LDN)
                        Store (Zero, ACTR)
                        EXFG ()
                        DISD (Zero)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF1, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y02)
                            IRQNoFlags (_Y03)
                                {}
                        })
                        CreateWordField (BUF1, _Y02._MIN, IOLO)
                        CreateByteField (BUF1, 0x03, IOHI)
                        CreateWordField (BUF1, _Y02._MAX, IORL)
                        CreateByteField (BUF1, 0x05, IORH)
                        CreateWordField (BUF1, _Y03._INT, IRQW)
                        ENFG ()
                        Store (One, LDN)
                        Store (IOAL, IOLO)
                        Store (IOAL, IORL)
                        Store (IOAH, IOHI)
                        Store (IOAH, IORH)
                        Store (One, Local0)
                        ShiftLeft (Local0, INTR, IRQW)
                        EXFG ()
                        Return (BUF1)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,7,9,10,11,12}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x02, IOAD)
                        CreateWordField (Arg0, 0x09, IRQW)
                        ENFG ()
                        Store (One, LDN)
                        Store (One, ACTR)
                        Store (IOLO, IOAL)
                        Store (IOHI, IOAH)
                        FindSetRightBit (IRQW, Local0)
                        Subtract (Local0, One, INTR)
                        EXFG ()
                        CKIO (IOAD, Zero)
                    }

                    Method (_PRW, 0, NotSerialized)
                    {
                        If (SUSF)
                        {
                            Return (Package (0x02)
                            {
                                0x08, 
                                0x03
                            })
                        }
                        Else
                        {
                            Return (Package (0x02)
                            {
                                0x08, 
                                One
                            })
                        }
                    }

                    Method (_PSW, 1, NotSerialized)
                    {
                        If (Arg0)
                        {
                            Or (G2C2, One, G2C2)
                        }
                        Else
                        {
                            And (G2C2, 0xFE, G2C2)
                        }
                    }
                }

                OperationRegion (KBCT, SystemIO, 0x60, 0x05)
                Field (KBCT, ByteAcc, NoLock, Preserve)
                {
                    P060,   8, 
                            Offset (0x04), 
                    P064,   8
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (PS2F, Zero))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF1, ResourceTemplate ()
                        {
                            IRQNoFlags ()
                                {12}
                        })
                        Name (BUF2, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0060,             // Range Minimum
                                0x0060,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0064,             // Range Minimum
                                0x0064,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {12}
                        })
                        If (LEqual (KBDI, One))
                        {
                            If (LEqual (OSFL, 0x02))
                            {
                                Return (BUF1)
                            }

                            If (LEqual (OSFL, One))
                            {
                                Return (BUF1)
                            }
                            Else
                            {
                                Return (BUF2)
                            }
                        }
                        Else
                        {
                            Return (BUF1)
                        }
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBDI, One))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PSMR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (KBDI, Zero))
                        {
                            Return (Zero)
                        }

                        If (LEqual (PS2F, Zero))
                        {
                            If (LEqual (OSFL, 0x02))
                            {
                                Return (0x0F)
                            }

                            If (LEqual (OSFL, One))
                            {
                                Return (0x0F)
                            }

                            Return (Zero)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Scope (\_SB.PCI0.LPCB)
                {
                    OperationRegion (CCCC, SystemMemory, 0x000FE2BC, 0x05)
                    Field (CCCC, ByteAcc, NoLock, Preserve)
                    {
                        PPRQ,   8, 
                        PPLO,   8, 
                        PPRP,   8, 
                        PPOR,   8, 
                        TPRS,   8
                    }

                    OperationRegion (CMO2, SystemIO, 0x72, 0x73)
                    Field (CMO2, ByteAcc, NoLock, Preserve)
                    {
                        IND2,   8, 
                        DAT2,   8
                    }

                    IndexField (IND2, DAT2, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x52), 
                        PRQC,   4
                    }

                    OperationRegion (TPMI, SystemMemory, 0x000FFFEA, One)
                    Field (TPMI, ByteAcc, NoLock, Preserve)
                    {
                            ,   3, 
                        TPME,   1
                    }

                    Device (TPM)
                    {
                        Name (_HID, EisaId ("IFX0102"))
                        Name (_CID, EisaId ("PNP0C31"))
                        Method (_STA, 0, NotSerialized)
                        {
                            If (TPME)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (_CRS, ResourceTemplate ()
                        {
                            Memory32Fixed (ReadWrite,
                                0xFED40000,         // Address Base
                                0x00005000,         // Address Length
                                )
                            IO (Decode16,
                                0x004E,             // Range Minimum
                                0x004E,             // Range Maximum
                                0x01,               // Alignment
                                0x02,               // Length
                                )
                            IO (Decode16,
                                0x4700,             // Range Minimum
                                0x4700,             // Range Maximum
                                0x01,               // Alignment
                                0x0C,               // Length
                                )
                        })
                        Method (UCMP, 2, NotSerialized)
                        {
                            If (LNotEqual (0x10, SizeOf (Arg0)))
                            {
                                Return (Zero)
                            }

                            If (LNotEqual (0x10, SizeOf (Arg1)))
                            {
                                Return (Zero)
                            }

                            Store (Zero, Local0)
                            While (LLess (Local0, 0x10))
                            {
                                If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (
                                    Arg1, Local0))))
                                {
                                    Return (Zero)
                                }

                                Increment (Local0)
                            }

                            Return (One)
                        }

                        Method (_DSM, 4, Serialized)
                        {
                            If (LEqual (UCMP (Arg0, Buffer (0x10)
                                        {
                                            /* 0000 */    0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E, 
                                            /* 0008 */    0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                                        }), One))
                            {
                                If (LEqual (Arg2, Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                        0x7F
                                    })
                                }

                                If (LEqual (Arg2, One))
                                {
                                    If (LEqual (SizeOf (Arg3), Zero))
                                    {
                                        Return (Buffer (0x04)
                                        {
                                            "1.0"
                                        })
                                    }

                                    Return (One)
                                }

                                If (LEqual (Arg2, 0x02))
                                {
                                    If (LNotEqual (TPRS, Zero))
                                    {
                                        If (LEqual (DerefOf (Index (Arg3, Zero)), Zero))
                                        {
                                            Store (0xF0, SCP)
                                            Store (Zero, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), One))
                                        {
                                            Store (0xF0, SCP)
                                            Store (One, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x02))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x02, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x03))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x03, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x04))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x04, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x05))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x05, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x06))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x06, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x07))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x07, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x08))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x08, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x09))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x09, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0A))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x0A, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0B))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x0B, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0C))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x0C, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (One)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0D))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x0D, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (One)
                                        }

                                        If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0E))
                                        {
                                            Store (0xF0, SCP)
                                            Store (0x0E, PPRQ)
                                            Store (0xF1, SCP)
                                            Return (Zero)
                                        }

                                        Return (One)
                                    }

                                    Return (One)
                                }

                                If (LEqual (Arg2, 0x03))
                                {
                                    Name (TMP1, Package (0x02)
                                    {
                                        Zero, 
                                        Ones
                                    })
                                    Store (PPRQ, Index (TMP1, One))
                                    Return (TMP1)
                                }

                                If (LEqual (Arg2, 0x04))
                                {
                                    Return (One)
                                }

                                If (LEqual (Arg2, 0x05))
                                {
                                    Name (TMP2, Package (0x03)
                                    {
                                        Zero, 
                                        Ones, 
                                        Ones
                                    })
                                    Store (PPLO, Index (TMP2, One))
                                    If (LOr (LOr (LGreater (PPLO, 0x0E), LEqual (PPLO, 0x0C)), LEqual (
                                        PPLO, 0x0D)))
                                    {
                                        Store (0xFFFFFFF1, Index (TMP2, 0x02))
                                        Return (TMP2)
                                    }

                                    If (LEqual (PPRP, 0xFF))
                                    {
                                        Store (0xFFFFFFF1, Index (TMP2, 0x02))
                                        Return (TMP2)
                                    }

                                    If (PPOR)
                                    {
                                        Store (0xFFFFFFF0, Index (TMP2, 0x02))
                                        Return (TMP2)
                                    }

                                    Store (PPRP, Index (TMP2, 0x02))
                                    Return (TMP2)
                                }

                                If (LEqual (Arg2, 0x06))
                                {
                                    CreateByteField (Arg3, 0x04, LAN0)
                                    CreateByteField (Arg3, 0x05, LAN1)
                                    If (LOr (LEqual (LAN0, 0x65), LEqual (LAN0, 0x45)))
                                    {
                                        If (LOr (LEqual (LAN1, 0x6E), LEqual (LAN1, 0x4E)))
                                        {
                                            Return (Zero)
                                        }
                                    }

                                    Return (One)
                                }

                                Return (One)
                            }

                            Return (Buffer (One)
                            {
                                0x00
                            })
                        }
                    }
                }

                Device (PMIO)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0400,             // Range Minimum
                                0x0400,             // Range Maximum
                                0x01,               // Alignment
                                0xD0,               // Length
                                )
                            IO (Decode16,
                                0x04D2,             // Range Minimum
                                0x04D2,             // Range Maximum
                                0x01,               // Alignment
                                0x2E,               // Length
                                )
                        })
                        Return (BUF0)
                    }
                }
            }

            Device (IGBE)
            {
                Name (_ADR, 0x00190000)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x04
                })
            }

            Device (UHC1) // Rename from USB0
            {
                Name (_ADR, 0x001D0000)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02) { 0x03, 0x03 })
            }

            Device (UHC2) // Rename from USB1
            {
                Name (_ADR, 0x001D0001)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02) { 0x04, 0x03 })
            }

            Device (UHC3) // Rename from USB2
            {
                Name (_ADR, 0x001D0002)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02) { 0x0C, 0x03 })
            }

            Device (UHC4) // Rename from USB3
            {
                Name (_ADR, 0x001A0000)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02) { 0x0E, 0x03 })
            }

            Device (UHC5) // Rename from USB4
            {
                Name (_ADR, 0x001A0001)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02) { 0x05, 0x03 })
            }

            Device (UHC6) // Rename from USB5
            {
                Name (_ADR, 0x001A0002)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02) { 0x20, 0x03 })
            }

            Device (EHC1) // Rename from USBE
            {
                Name (_ADR, 0x001D0007)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02) { 0x0D, 0x03 })
                // To fix EHCI wake up
                OperationRegion (PWRC, PCI_Config, 0x52, 0x2F)
                Field (PWRC, ByteAcc, NoLock, Preserve) { , 11, PMES, 5, Offset (0x2E), WRTA, 1 }

                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package ()
                    {
                            // Inject the current that can be used on the USB Ports
                            "AAPL,current-available",         2100, // 2100mA
                            "AAPL,current-extra",             2700, // 2700mA
                            "AAPL,current-extra-in-sleep",    2700, // 2700mA
                            "AAPL,max-port-current-in-sleep", 2100, // 2100mA
                            "AAPL,device-internal",  0x02,
                            Buffer(One) { 0x0 }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (EHC2) // Rename from USE2
            {
                Name (_ADR, 0x001A0007)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }

                    Return (0x03)
                }

                Name (_PRW, Package (0x02) { 0x0D, 0x03 })
                // To fix EHCI wake up
                OperationRegion (PWRC, PCI_Config, 0x52, 0x2F)
                Field (PWRC, ByteAcc, NoLock, Preserve) { , 11, PMES, 5, Offset (0x2E), WRTA, 1 }

                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package ()
                    {
                            // Inject the current that can be used on the USB Ports
                            "AAPL,current-available",         2100, // 2100mA
                            "AAPL,current-extra",             2700, // 2700mA
                            "AAPL,current-extra-in-sleep",    2700, // 2700mA
                            "AAPL,max-port-current-in-sleep", 2100, // 2100mA
                            "AAPL,device-internal",  0x02,
                            Buffer(One) { 0x0 }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (SATA) // Rename from IDE1
            {
                Name (_ADR, 0x001F0002)
                Name (H15F, Zero)
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package ()
                    {
                            "AAPL,slot-name", Buffer() { "Built In" },
                            "device_type",    Buffer() { "AHCI Controller" },
                            "model",          Buffer() { "ICH10R SATA/AHCI Controller" },
                            "name",           Buffer() { "ICH10R SATA/AHCI Controller" }
                    }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

                OperationRegion (PCI, PCI_Config, 0x40, 0x20)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                            Offset (0x08), 
                    UDC0,   2, 
                    UDC1,   2, 
                            Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                            Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                        ,   1, 
                    FAS0,   2, 
                    FAS1,   2
                }

                Device (PRT0)
                {
                    Name (_ADR, Zero)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package ()
                        {
                                "io-device-location", Buffer() { "Int 1" }
                        }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0), Local0)
                        Return (Local0)
                    }

                    Method (_GTF, 0, NotSerialized)
                    {
                        Store (GTF0 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC0)
                        Store (UDT, UDT0)
                        Store (ICF, ICF0)
                        Store (FAS, FAS0)
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, One)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package ()
                        {
                                "io-device-location", Buffer() { "Int 2" }
                        }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0), Local0)
                        Return (Local0)
                    }

                    Method (_GTF, 0, NotSerialized)
                    {
                        Store (GTF1 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC0)
                        Store (UDT, UDT0)
                        Store (ICF, ICF0)
                        Store (FAS, FAS0)
                    }
                }

                Device (PRT2)
                {
                    Name (_ADR, 0x02)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package ()
                        {
                                "io-device-location", Buffer() { "Int 3" }
                        }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1), Local0)
                        Return (Local0)
                    }

                    Method (_GTF, 0, NotSerialized)
                    {
                        Store (GTF0 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC1)
                        Store (UDT, UDT1)
                        Store (ICF, ICF1)
                        Store (FAS, FAS1)
                    }
                }

                Device (PRT3)
                {
                    Name (_ADR, 0x03)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package ()
                        {
                                "io-device-location", Buffer() { "Int 4" }
                        }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1), Local0)
                        Return (Local0)
                    }

                    Method (_GTF, 0, NotSerialized)
                    {
                        Store (GTF1 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC1)
                        Store (UDT, UDT1)
                        Store (ICF, ICF1)
                        Store (FAS, FAS1)
                    }
                }
            }

            Device (IDE2)
            {
                Name (_ADR, 0x001F0005)
                OperationRegion (PCI, PCI_Config, 0x40, 0x20)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    ITM0,   16, 
                    ITM1,   16, 
                    SIT0,   4, 
                    SIT1,   4, 
                            Offset (0x08), 
                    UDC0,   1, 
                        ,   1, 
                    UDC1,   1, 
                            Offset (0x0A), 
                    UDT0,   8, 
                    UDT1,   8, 
                            Offset (0x14), 
                    ICF0,   2, 
                    ICF1,   2, 
                        ,   6, 
                    WPPE,   1, 
                        ,   1, 
                    FAS0,   2, 
                    FAS1,   2
                }

                Device (PRIM)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (GTM (ITM0, SIT0, UDC0, UDT0, ICF0, FAS0), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC0)
                        Store (UDT, UDT0)
                        Store (ICF, ICF0)
                        Store (FAS, FAS0)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (GTF0 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0), Local0)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (GTF1 (ITM0, SIT0, UDC0, UDT0, ICF0, H15F, FAS0), Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (GTM (ITM1, SIT1, UDC1, UDT1, ICF1, FAS1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (STM (Arg0, Arg1, Arg2), Local0)
                        CreateDWordField (Local0, Zero, ITM)
                        CreateDWordField (Local0, 0x04, SIT)
                        CreateDWordField (Local0, 0x08, UDC)
                        CreateDWordField (Local0, 0x0C, UDT)
                        CreateDWordField (Local0, 0x10, ICF)
                        CreateDWordField (Local0, 0x14, FAS)
                        Store (UDC, UDC1)
                        Store (UDT, UDT1)
                        Store (ICF, ICF1)
                        Store (FAS, FAS1)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (GTF0 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1), Local0)
                            Return (Local0)
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)
                        Name (H15F, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (GTF1 (ITM1, SIT1, UDC1, UDT1, ICF1, H15F, FAS1), Local0)
                            Return (Local0)
                        }
                    }
                }
            }

            Method (GTM, 6, NotSerialized)
            {
                Store (Buffer (0x14) {}, Local0)
                CreateDWordField (Local0, Zero, PIO0)
                CreateDWordField (Local0, 0x04, DMA0)
                CreateDWordField (Local0, 0x08, PIO1)
                CreateDWordField (Local0, 0x0C, DMA1)
                CreateDWordField (Local0, 0x10, FLAG)
                Store (0x10, FLAG)
                If (LOr (And (Arg0, 0x08), LNot (And (Arg0, One
                    ))))
                {
                    Store (0x0384, PIO0)
                }
                Else
                {
                    Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                        Arg0, 0x3000), 0x0C), Local1)
                    Multiply (Subtract (0x09, Local1), 0x1E, PIO0)
                }

                If (LOr (LAnd (Arg0, 0x4000), LAnd (Arg2, One)))
                {
                    If (LOr (And (Arg0, 0x80), LNot (And (Arg0, 0x10
                        ))))
                    {
                        Store (0x0384, PIO1)
                    }
                    Else
                    {
                        Add (And (Arg1, 0x03), ShiftRight (And (Arg1, 0x0C), 
                            0x02), Local1)
                        Multiply (Subtract (0x09, Local1), 0x1E, PIO1)
                    }
                }
                Else
                {
                    Store (PIO0, PIO1)
                }

                If (And (Arg2, One))
                {
                    Subtract (0x04, And (Arg3, 0x03), Local1)
                    If (And (Arg5, One))
                    {
                        Store (0x14, DMA0)
                    }
                    Else
                    {
                        If (And (Arg4, One))
                        {
                            Multiply (Local1, 0x0F, DMA0)
                        }
                        Else
                        {
                            Multiply (Local1, 0x1E, DMA0)
                        }
                    }
                }
                Else
                {
                    Store (PIO0, DMA0)
                }

                If (LOr (LAnd (Arg0, 0x4000), LAnd (Arg2, One)))
                {
                    If (And (Arg2, 0x02))
                    {
                        Subtract (0x04, ShiftRight (And (Arg3, 0x30), 0x04), Local1)
                        If (And (Arg5, 0x02))
                        {
                            Store (0x14, DMA1)
                        }
                        Else
                        {
                            If (And (Arg4, 0x02))
                            {
                                Multiply (Local1, 0x0F, DMA1)
                            }
                            Else
                            {
                                Multiply (Local1, 0x1E, DMA1)
                            }
                        }
                    }
                    Else
                    {
                        Store (PIO1, DMA1)
                    }
                }
                Else
                {
                    Store (DMA0, DMA1)
                }

                Store (Zero, FLAG)
                If (And (Arg0, One))
                {
                    Or (FLAG, 0x10, FLAG)
                }

                If (And (Arg2, One))
                {
                    Or (FLAG, One, FLAG)
                }

                If (And (Arg0, 0x02))
                {
                    Or (FLAG, 0x02, FLAG)
                }

                If (And (Arg2, 0x02))
                {
                    Or (FLAG, 0x04, FLAG)
                }

                If (And (Arg0, 0x20))
                {
                    Or (FLAG, 0x08, FLAG)
                }

                Return (Local0)
            }

            Method (STM, 3, NotSerialized)
            {
                Store (Buffer (0x18) {}, Local7)
                CreateDWordField (Local7, Zero, ITM)
                CreateDWordField (Local7, 0x04, SIT)
                CreateDWordField (Local7, 0x08, UDC)
                CreateDWordField (Local7, 0x0C, UDT)
                CreateDWordField (Local7, 0x10, ICF)
                CreateDWordField (Local7, 0x14, FAS)
                CreateDWordField (Arg0, Zero, PIO0)
                CreateDWordField (Arg0, 0x04, DMA0)
                CreateDWordField (Arg0, 0x08, PIO1)
                CreateDWordField (Arg0, 0x0C, DMA1)
                CreateDWordField (Arg0, 0x10, FLAG)
                Store (FLAG, Local4)
                Store (0x8000, Local0)
                If (And (Local4, 0x02))
                {
                    Or (Local0, 0x07, Local0)
                }

                If (And (Local4, 0x08))
                {
                    Or (Local0, 0x4000, Local0)
                    Or (Local0, 0x70, Local0)
                }

                If (LAnd (LLess (DMA0, PIO0), LNot (And (Local4, One))))
                {
                    Or (Local0, 0x08, Local0)
                }

                If (LAnd (LLess (DMA1, PIO1), LNot (And (Local4, 0x04))))
                {
                    Or (Local0, 0x80, Local0)
                }

                If (PIO0)
                {
                    If (LLess (PIO0, 0x0384))
                    {
                        Or (Local0, One, Local0)
                    }
                }

                If (PIO1)
                {
                    If (LLess (PIO1, 0x0384))
                    {
                        Or (Local0, 0x10, Local0)
                    }
                }

                If (And (Local4, One))
                {
                    Store (PIO0, Local1)
                }
                Else
                {
                    Store (DMA0, Local1)
                }

                If (Local1)
                {
                    If (LLessEqual (Local1, 0x78))
                    {
                        Or (Local0, 0x2300, Local0)
                    }
                    Else
                    {
                        If (LLessEqual (Local1, 0xB4))
                        {
                            Or (Local0, 0x2100, Local0)
                        }
                        Else
                        {
                            If (LLessEqual (Local1, 0xF0))
                            {
                                Or (Local0, 0x1000, Local0)
                            }
                        }
                    }
                }

                Store (Local0, ITM)
                Store (Zero, Local0)
                If (And (Local4, 0x04))
                {
                    Store (PIO1, Local1)
                }
                Else
                {
                    Store (DMA1, Local1)
                }

                If (Local1)
                {
                    If (LLessEqual (Local1, 0x78))
                    {
                        Store (0x0B, Local0)
                    }
                    Else
                    {
                        If (LLessEqual (Local1, 0xB4))
                        {
                            Store (0x09, Local0)
                        }
                        Else
                        {
                            If (LLessEqual (Local1, 0xF0))
                            {
                                Store (0x04, Local0)
                            }
                        }
                    }
                }

                Store (Local0, SIT)
                Store (Zero, Local0)
                If (And (Local4, One))
                {
                    Or (Local0, One, Local0)
                }

                If (And (Local4, 0x04))
                {
                    Or (Local0, 0x02, Local0)
                }

                Store (Local0, UDC)
                Store (Zero, Local0)
                If (And (Local4, One))
                {
                    If (LEqual (DMA0, 0x14))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        If (LLess (DMA0, 0x3C))
                        {
                            Divide (DMA0, 0x0F, , Local1)
                        }
                        Else
                        {
                            Divide (DMA0, 0x1E, , Local1)
                        }

                        Subtract (0x04, Local1, Local0)
                    }
                }

                If (And (Local4, 0x04))
                {
                    If (LEqual (DMA1, 0x14))
                    {
                        Store (One, Local1)
                    }
                    Else
                    {
                        If (LLess (DMA1, 0x3C))
                        {
                            Divide (DMA1, 0x0F, , Local1)
                        }
                        Else
                        {
                            Divide (DMA1, 0x1E, , Local1)
                        }

                        Subtract (0x04, Local1, Local1)
                    }

                    ShiftLeft (Local1, 0x04, Local1)
                    Or (Local0, Local1, Local0)
                }

                Store (Local0, UDT)
                Store (Zero, Local0)
                If (DMA0)
                {
                    If (LGreater (DMA0, 0x14))
                    {
                        If (LLess (DMA0, 0x3C))
                        {
                            Or (Local0, One, Local0)
                        }
                    }
                }

                If (DMA1)
                {
                    If (LGreater (DMA1, 0x14))
                    {
                        If (LLess (DMA1, 0x3C))
                        {
                            Or (Local0, 0x02, Local0)
                        }
                    }
                }

                Store (Local0, ICF)
                Store (Zero, Local0)
                If (LEqual (DMA0, 0x14))
                {
                    Or (Local0, One, Local0)
                }

                If (LEqual (DMA1, 0x14))
                {
                    Or (Local0, 0x02, Local0)
                }

                Store (Local0, FAS)
                Return (Local7)
            }

            Method (H15P, 1, NotSerialized)
            {
                Name (BUFF, Buffer (0x08)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Store (Arg0, Local0)
                Store (BUFF, Local1)
                Concatenate (Local0, Local1, Local7)
                CreateWordField (Local7, 0x02, CYL)
                CreateWordField (Local7, 0x06, HEAD)
                CreateWordField (Local7, 0x0C, SPT)
                If (LAnd (LGreaterEqual (HEAD, 0x10), LGreaterEqual (CYL, 0x2000)))
                {
                    Return (SPT)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (GTF0, 7, NotSerialized)
            {
                Store (Buffer (0x07)
                    {
                        0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                    }, Local7)
                CreateByteField (Local7, One, MODE)
                If (And (Arg2, One))
                {
                    And (Arg3, 0x03, Local0)
                    If (And (Arg6, One))
                    {
                        Add (Local0, 0x04, Local0)
                    }
                    Else
                    {
                        If (And (Arg4, One))
                        {
                            Add (Local0, 0x02, Local0)
                        }
                    }

                    Or (Local0, 0x40, MODE)
                }
                Else
                {
                    Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                        Arg0, 0x3000), 0x0C), Local0)
                    If (LGreaterEqual (Local0, 0x05))
                    {
                        Store (0x22, MODE)
                    }
                    Else
                    {
                        If (LGreaterEqual (Local0, 0x03))
                        {
                            Store (0x21, MODE)
                        }
                        Else
                        {
                            Store (0x20, MODE)
                        }
                    }
                }

                Concatenate (Local7, Local7, Local6)
                If (LOr (And (Arg0, 0x08), LNot (And (Arg0, One
                    ))))
                {
                    If (And (Arg0, 0x02))
                    {
                        Store (Zero, MODE)
                    }
                    Else
                    {
                        Store (One, MODE)
                    }
                }
                Else
                {
                    Add (ShiftRight (And (Arg0, 0x0300), 0x08), ShiftRight (And (
                        Arg0, 0x3000), 0x0C), Local0)
                    If (LGreaterEqual (Local0, 0x05))
                    {
                        Store (0x0C, MODE)
                    }
                    Else
                    {
                        If (LGreaterEqual (Local0, 0x03))
                        {
                            Store (0x0B, MODE)
                        }
                        Else
                        {
                            Store (0x0A, MODE)
                        }
                    }
                }

                Concatenate (Local6, Local7, Local5)
                If (Arg5)
                {
                    Store (Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0xAE, 0x91
                        }, Local4)
                    CreateByteField (Local4, One, SPT)
                    Store (Arg5, SPT)
                    Concatenate (Local5, Local4, Local6)
                    Return (Local6)
                }
                Else
                {
                    Return (Local5)
                }
            }

            Method (GTF1, 7, NotSerialized)
            {
                Store (Buffer (0x07)
                    {
                        0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                    }, Local7)
                CreateByteField (Local7, One, MODE)
                If (And (Arg2, 0x02))
                {
                    ShiftRight (And (Arg3, 0x30), 0x04, Local0)
                    If (And (Arg6, 0x02))
                    {
                        Add (Local0, 0x04, Local0)
                    }
                    Else
                    {
                        If (And (Arg4, 0x02))
                        {
                            Add (Local0, 0x02, Local0)
                        }
                    }

                    Or (Local0, 0x40, MODE)
                }
                Else
                {
                    Add (ShiftRight (And (Arg1, 0x03), 0x02), And (Arg1, 
                        0x0C), Local0)
                    If (LGreaterEqual (Local0, 0x05))
                    {
                        Store (0x22, MODE)
                    }
                    Else
                    {
                        If (LGreaterEqual (Local0, 0x03))
                        {
                            Store (0x21, MODE)
                        }
                        Else
                        {
                            Store (0x20, MODE)
                        }
                    }
                }

                Concatenate (Local7, Local7, Local6)
                If (LOr (And (Arg0, 0x80), LNot (And (Arg0, 0x10
                    ))))
                {
                    If (And (Arg0, 0x20))
                    {
                        Store (Zero, MODE)
                    }
                    Else
                    {
                        Store (One, MODE)
                    }
                }
                Else
                {
                    Add (ShiftRight (And (Arg1, 0x03), 0x02), And (Arg1, 
                        0x0C), Local0)
                    If (LGreaterEqual (Local0, 0x05))
                    {
                        Store (0x0C, MODE)
                    }
                    Else
                    {
                        If (LGreaterEqual (Local0, 0x03))
                        {
                            Store (0x0B, MODE)
                        }
                        Else
                        {
                            Store (0x0A, MODE)
                        }
                    }
                }

                Concatenate (Local6, Local7, Local5)
                If (Arg5)
                {
                    Store (Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0xBE, 0x91
                        }, Local4)
                    CreateByteField (Local4, One, SPT)
                    Store (Arg5, SPT)
                    Concatenate (Local5, Local4, Local6)
                    Return (Local6)
                }
                Else
                {
                    Return (Local5)
                }
            }

            Device (PX43)
            {
                Name (_ADR, 0x001F0003)
                OperationRegion (PBAS, PCI_Config, 0x20, 0x02)
                Field (PBAS, ByteAcc, NoLock, Preserve)
                {
                    BAS0,   16
                }

                Method (SMBB, 0, NotSerialized)
                {
                    And (BAS0, 0xFFFE, Local0)
                    Return (Local0)
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x001B0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        0x05
                    })
                }
            }

            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,9,10,11,12,14,15}
            })
            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {}
            })
            CreateWordField (BUFB, One, IRQV)
            Device (LNKA)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, One)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRA, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRA, 0x80, PIRA)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRA, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRA)
                }
            }

            Device (LNKB)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x02)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRB, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRB, 0x80, PIRB)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRB, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRB)
                }
            }

            Device (LNKC)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x03)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRC, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRC, 0x80, PIRC)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRC, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRC)
                }
            }

            Device (LNKD)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x04)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRD, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRD, 0x80, PIRD)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRD, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRD)
                }
            }

            Device (LNKE)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x05)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRE, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRE, 0x80, PIRE)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRE, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRE)
                }
            }

            Device (LNKF)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x06)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRF, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRF, 0x80, PIRF)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRF, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRF)
                }
            }

            Device (LNK0)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x07)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRG, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRG, 0x80, PIRG)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRG, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRG)
                }
            }

            Device (LNK1)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x08)
                Method (_STA, 0, NotSerialized)
                {
                    And (PIRH, 0x80, Local0)
                    If (LEqual (Local0, 0x80))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Or (PIRH, 0x80, PIRH)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    And (PIRH, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQV)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ1)
                    FindSetRightBit (IRQ1, Local0)
                    Decrement (Local0)
                    Store (Local0, PIRH)
                }
            }

            Method (_PRW, 0, NotSerialized)
            {
                Return (Package (0x02)
                {
                    0x0B, 
                    0x05
                })
            }
        }

        Device (MEM)
        {
            Name (_HID, EisaId ("PNP0C01"))
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x000F0000,         // Address Base
                        0x00004000,         // Address Length
                        _Y05)
                    Memory32Fixed (ReadWrite,
                        0x000F4000,         // Address Base
                        0x00004000,         // Address Length
                        _Y06)
                    Memory32Fixed (ReadWrite,
                        0x000F8000,         // Address Base
                        0x00004000,         // Address Length
                        _Y07)
                    Memory32Fixed (ReadWrite,
                        0x000FC000,         // Address Base
                        0x00004000,         // Address Length
                        _Y08)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00040000,         // Address Length
                        _Y04)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x000A0000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00100000,         // Address Base
                        0x00000000,         // Address Length
                        _Y0A)
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED10000,         // Address Base
                        0x0000E000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00070000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFB00000,         // Address Base
                        0x00080000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFF00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x000E0000,         // Address Base
                        0x00010000,         // Address Length
                        _Y09)
                })
                CreateDWordField (BUF0, _Y04._BAS, ACMM)
                CreateDWordField (BUF0, _Y04._LEN, ASSM)
                CreateDWordField (BUF0, _Y05._BAS, RMA1)
                CreateDWordField (BUF0, _Y05._LEN, RSS1)
                CreateDWordField (BUF0, _Y06._BAS, RMA2)
                CreateDWordField (BUF0, _Y06._LEN, RSS2)
                CreateDWordField (BUF0, _Y07._BAS, RMA3)
                CreateDWordField (BUF0, _Y07._LEN, RSS3)
                CreateDWordField (BUF0, _Y08._BAS, RMA4)
                CreateDWordField (BUF0, _Y08._LEN, RSS4)
                CreateDWordField (BUF0, _Y09._BAS, ERMA)
                CreateDWordField (BUF0, _Y09._LEN, ERMS)
                CreateDWordField (BUF0, _Y0A._LEN, EXTM)
                Subtract (AMEM, 0x00100000, EXTM)
                If (LNotEqual (ROM1, Zero))
                {
                    Store (RMA1, RMA2)
                    ShiftLeft (ROM1, 0x08, Local0)
                    Store (Local0, RMA1)
                    ShiftLeft (RMS1, 0x08, Local0)
                    Store (Local0, RSS1)
                    Store (0x8000, RSS2)
                }

                If (LNotEqual (ROM2, Zero))
                {
                    Store (RMA2, RMA3)
                    ShiftLeft (ROM2, 0x08, Local0)
                    Store (Local0, RMA2)
                    ShiftLeft (RMS2, 0x08, Local0)
                    Store (Local0, RSS2)
                    Store (0xC000, RSS3)
                }

                If (LNotEqual (ROM3, Zero))
                {
                    Store (RMA3, RMA4)
                    ShiftLeft (ROM3, 0x08, Local0)
                    Store (Local0, RMA3)
                    ShiftLeft (RMS3, 0x08, Local0)
                    Store (Local0, RSS3)
                    Store (0x00010000, RSS4)
                }

                Store (ERMA, Local1)
                If (LGreater (RMA1, 0x000D0000))
                {
                    If (LLess (RMA1, 0x000F0000))
                    {
                        Add (RMA1, RSS1, Local0)
                        If (LGreater (Local0, 0x000E0000))
                        {
                            If (LGreater (Local0, Local1))
                            {
                                Store (Local0, Local1)
                            }
                        }
                    }
                }

                If (LGreater (RMA2, 0x000D0000))
                {
                    If (LLess (RMA2, 0x000F0000))
                    {
                        Add (RMA2, RSS2, Local0)
                        If (LGreater (Local0, 0x000E0000))
                        {
                            If (LGreater (Local0, Local1))
                            {
                                Store (Local0, Local1)
                            }
                        }
                    }
                }

                If (LGreater (RMA3, 0x000D0000))
                {
                    If (LLess (RMA3, 0x000F0000))
                    {
                        Add (RMA3, RSS3, Local0)
                        If (LGreater (Local0, 0x000E0000))
                        {
                            If (LGreater (Local0, Local1))
                            {
                                Store (Local0, Local1)
                            }
                        }
                    }
                }

                If (LGreater (Local1, ERMA))
                {
                    Subtract (Local1, ERMA, Local0)
                    If (LLessEqual (Local0, 0x00010000))
                    {
                        Store (Local1, ERMA)
                        Subtract (0x00010000, Local0, ERMS)
                    }
                }

                Store (AMEM, ACMM)
                And (AMEM, 0x000FFFFF, Local0)
                Subtract (0x00100000, Local0, ASSM)
                Return (BUF0)
            }
        }

        Device (FWH)
        {
            Name (_HID, EisaId ("INT0800"))
            Method (_CRS, 0, NotSerialized)
            {
                Name (FWH0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFFB80000,         // Address Base
                        0x00080000,         // Address Length
                        )
                })
                Return (FWH0)
            }
        }

        Device (PCI0.EXPL)
        {
            Name (_HID, EisaId ("PNP0C02"))
            Name (_UID, 0x04)
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xF4000000,         // Address Base
                        0x04000000,         // Address Length
                        )
                })
                Return (BUF0)
            }
        }
    }
}

