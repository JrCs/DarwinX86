/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080926
 *
 * Disassembly of DSDT.aml, Fri Jun 19 16:12:08 2009
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005293 (21139)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0x08
 *     OEM ID           "MSI_NB"
 *     OEM Table ID     "MEGABOOK"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20080926 (537397542)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "MSI_NB", "MEGABOOK", 0x00000000)
{
    Name (SP1O, 0x2E)
    Name (IOCE, Zero)
    Name (IOCL, Zero)
    Name (IO1B, 0x0A20)
    Name (IO1L, 0x20)
    Name (IOEC, 0x0A10)
    Name (IO4L, 0x80)
    Name (IO5L, 0x80)
    Name (IO2B, 0x0A00)
    Name (IO2L, 0x20)
    Name (IOPM, 0x0A00)
    Name (IO3B, Zero)
    Name (IO3L, 0x10)
    Name (SI1P, Zero)
    Name (MCHB, 0xFED14000)
    Name (MCHL, 0x4000)
    Name (EGPB, 0xFED19000)
    Name (EGPL, 0x1000)
    Name (DMIB, 0xFED18000)
    Name (DMIL, 0x1000)
    Name (PEBS, 0xE0000000)
    Name (PELN, 0x10000000)
    Name (LAPB, 0xFEE00000)
    Name (SMBS, 0x1180)
    Name (SMBL, 0x20)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (SMIP, 0xB2)
    Name (GPBS, 0x0500)
    Name (GPLN, 0x40)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (PM30, 0x0430)
    Name (SRCB, 0xFED20000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (HPTB, 0xFED00000)
    Name (HPTC, 0xFED23404)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, Zero)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (CMOS, 0x60)
    Method (RRIO, 4, NotSerialized)
    {
        Store ("RRIO", Debug)
    }

    Method (RDMA, 3, NotSerialized)
    {
        Store ("rDMA", Debug)
    }

    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)
    {
        If (Arg0)
        {
            Store (0xAA, DBG8)
        }
        Else
        {
            Store (0xAC, DBG8)
        }

        Store (Arg0, PICM)
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR)
        }

        If (LEqual (PICM, Zero))
        {
            Store (0xAC, DBG8)
        }

        Store (One, OSVR)
        If (CondRefOf (\_OSI, Local0))
        {
            If (_OSI ("Linux"))
            {
                Store (0x03, OSVR)
            }
            Else
            {
                If (_OSI ("Windows 2001"))
                {
                    Store (0x04, OSVR)
                }
                Else
                {
                    If (_OSI ("Windows 2001.1"))
                    {
                        Store (0x05, OSVR)
                    }
                    Else
                    {
                        If (_OSI ("FreeBSD"))
                        {
                            Store (0x06, OSVR)
                        }
                        Else
                        {
                            If (_OSI ("HP-UX"))
                            {
                                Store (0x07, OSVR)
                            }
                            Else
                            {
                                If (_OSI ("OpenVMS"))
                                {
                                    Store (0x08, OSVR)
                                }
                            }
                        }
                    }
                }
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (Zero, OSVR)
            }
            Else
            {
                If (MCTH (_OS, "Microsoft Windows"))
                {
                    Store (One, OSVR)
                }
                Else
                {
                    If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
                    {
                        Store (0x02, OSVR)
                    }
                    Else
                    {
                        If (MCTH (_OS, "Linux"))
                        {
                            Store (0x03, OSVR)
                        }
                        Else
                        {
                            If (MCTH (_OS, "FreeBSD"))
                            {
                                Store (0x06, OSVR)
                            }
                            Else
                            {
                                If (MCTH (_OS, "HP-UX"))
                                {
                                    Store (0x07, OSVR)
                                }
                                Else
                                {
                                    If (MCTH (_OS, "OpenVMS"))
                                    {
                                        Store (0x08, OSVR)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
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

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (ShiftLeft (SS1, One), Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, 0x80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, 0x90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Name (SS1, One)
    Name (SS2, Zero)
    Name (SS3, One)
    Name (SS4, One)
    Name (IOST, 0x4400)
    Name (TOPM, 0x7FFFFFFF)
    Name (ROMS, 0xFFE00000)
    Name (MG1B, 0x000C0000)
    Name (MG1L, 0x00040000)
    Name (MG2B, 0x80000000)
    Name (MG2L, 0x7FF00000)
    Scope (_SB)
    {
        Name (PR00, Package (0x12)
        {
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
                0x001FFFFF, 
                Zero, 
                LNKC, 
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
                0x001DFFFF, 
                Zero, 
                LNKH, 
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
                0x001EFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001EFFFF, 
                One, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                LNKA, 
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
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }
        })
        Name (AR00, Package (0x12)
        {
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
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x12
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
                0x001EFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001EFFFF, 
                One, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x10
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
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }
        })
        Name (PR02, Package (0x04)
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
        Name (AR02, Package (0x04)
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
        Name (PR04, Package (0x04)
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
        Name (AR04, Package (0x04)
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
        Name (PR05, Package (0x04)
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
        Name (AR05, Package (0x04)
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
        Name (PR06, Package (0x04)
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
        Name (AR06, Package (0x04)
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
        Name (PR07, Package (0x04)
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
        Name (AR07, Package (0x04)
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
        Name (PR08, Package (0x04)
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
        Name (AR08, Package (0x04)
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
        Name (PR09, Package (0x04)
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
        Name (AR09, Package (0x04)
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
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)
            Method (_PRT, 0, NotSerialized)
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Method (_S3D, 0, NotSerialized)
            {
                If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Scope (\_SB)
            {
                Scope (PCI0)
                {
                    Device (MCH)
                    {
                        Name (_HID, EisaId ("PNP0C01"))
                        Name (_UID, 0x03B1)
                        Name (_STA, 0x0F)
                        Name (MCHR, ResourceTemplate ()
                        {
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y00)
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y01)
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y02)
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y03)
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            CreateDWordField (MCHR, \_SB.PCI0.MCH._Y00._LEN, ML)
                            CreateDWordField (MCHR, \_SB.PCI0.MCH._Y00._BAS, MB)
                            Store (MCHB, MB)
                            Store (MCHL, ML)
                            CreateDWordField (MCHR, \_SB.PCI0.MCH._Y01._LEN, EL)
                            CreateDWordField (MCHR, \_SB.PCI0.MCH._Y01._BAS, EB)
                            Store (EGPB, EB)
                            Store (EGPL, EL)
                            CreateDWordField (MCHR, \_SB.PCI0.MCH._Y02._LEN, DL)
                            CreateDWordField (MCHR, \_SB.PCI0.MCH._Y02._BAS, DB)
                            Store (DMIB, DB)
                            Store (DMIL, DL)
                            CreateDWordField (MCHR, \_SB.PCI0.MCH._Y03._LEN, PL)
                            CreateDWordField (MCHR, \_SB.PCI0.MCH._Y03._BAS, PB)
                            Store (PEBS, PB)
                            Store (PELN, PL)
                            Return (MCHR)
                        }
                    }
                }
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (P0P2)
            {
                Name (_ADR, 0x00010000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }

                Device (PEGP)
                {
                    Name (_ADR, 0xFFFF)
                    Method (_PRW, 0, NotSerialized)
                    {
                        Return (GPRW (0x09, 0x04))
                    }
                }
            }

            Device (IDE0)
            {
                Name (_ADR, 0x001F0001)
                Name (^NATA, Package (0x01)
                {
                    0x001F0001
                })
                Name (REGF, One)
                Method (_REG, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, REGF)
                    }
                }

                Name (TIM0, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x78, 
                        0xB4, 
                        0xF0, 
                        0x0384
                    }, 

                    Package (0x04)
                    {
                        0x23, 
                        0x21, 
                        0x10, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0B, 
                        0x09, 
                        0x04, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        0x70, 
                        0x49, 
                        0x36, 
                        0x27, 
                        0x19, 
                        0x0F
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        One, 
                        0x02, 
                        One, 
                        0x02, 
                        One
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        One
                    }, 

                    Package (0x04)
                    {
                        0x04, 
                        0x03, 
                        0x02, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x02, 
                        One, 
                        Zero, 
                        Zero
                    }
                })
                Name (TMD0, Buffer (0x14) {})
                CreateDWordField (TMD0, Zero, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, CHNF)
                OperationRegion (CFG2, PCI_Config, 0x40, 0x20)
                Field (CFG2, DWordAcc, NoLock, Preserve)
                {
                    PMPT,   4, 
                    PSPT,   4, 
                    PMRI,   6, 
                            Offset (0x02), 
                    SMPT,   4, 
                    SSPT,   4, 
                    SMRI,   6, 
                            Offset (0x04), 
                    PSRI,   4, 
                    SSRI,   4, 
                            Offset (0x08), 
                    PM3E,   1, 
                    PS3E,   1, 
                    SM3E,   1, 
                    SS3E,   1, 
                            Offset (0x0A), 
                    PMUT,   2, 
                        ,   2, 
                    PSUT,   2, 
                            Offset (0x0B), 
                    SMUT,   2, 
                        ,   2, 
                    SSUT,   2, 
                            Offset (0x0C), 
                            Offset (0x14), 
                    PM6E,   1, 
                    PS6E,   1, 
                    SM6E,   1, 
                    SS6E,   1, 
                    PMCR,   1, 
                    PSCR,   1, 
                    SMCR,   1, 
                    SSCR,   1, 
                        ,   4, 
                    PMAE,   1, 
                    PSAE,   1, 
                    SMAE,   1, 
                    SSAE,   1
                }

                Name (GMPT, Zero)
                Name (GMUE, Zero)
                Name (GMUT, Zero)
                Name (GMCR, Zero)
                Name (GSPT, Zero)
                Name (GSUE, Zero)
                Name (GSUT, Zero)
                Name (GSCR, Zero)
                Device (CHN0)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        ShiftLeft (PSCR, One, Local1)
                        Or (PMCR, Local1, Local0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local1)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local2)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (PMRI, Local1, PMUT, PSRI, Local2, PSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (PMAE, 0x02, Local3)
                        ShiftLeft (PM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PM3E, Local3, Local0)
                        ShiftLeft (PMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (PSAE, 0x02, Local3)
                        ShiftLeft (PS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (PS3E, Local3, Local1)
                        ShiftLeft (PSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (PMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (PMUT, GMUT)
                        Store (PMCR, GMCR)
                        Store (PSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (PSUT, GSUT)
                        Store (PSCR, GSCR)
                        STM ()
                        Store (GMPT, PMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, PMUT)
                        Store (GMCR, PMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, PSUT)
                        Store (GSCR, PSCR)
                        If (And (Local0, One))
                        {
                            Store (One, PM3E)
                        }
                        Else
                        {
                            Store (Zero, PM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, PM6E)
                        }
                        Else
                        {
                            Store (Zero, PM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, PMAE)
                        }
                        Else
                        {
                            Store (Zero, PMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, PS3E)
                        }
                        Else
                        {
                            Store (Zero, PS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, PS6E)
                        }
                        Else
                        {
                            Store (Zero, PS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, PSAE)
                        }
                        Else
                        {
                            Store (Zero, PSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA0)
                        Store (GTF (One, Arg2), ATA1)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA0))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA1))
                        }
                    }
                }

                Device (CHN1)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        ShiftLeft (SSCR, One, Local1)
                        Or (SMCR, Local1, Local0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local1)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local2)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local2, Local3, Local2)
                        Return (GTM (SMRI, Local1, SMUT, SSRI, Local2, SSUT, Local0))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, Debug)
                        Store (Arg0, TMD0)
                        ShiftLeft (SMAE, 0x02, Local3)
                        ShiftLeft (SM6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SM3E, Local3, Local0)
                        ShiftLeft (SMPT, 0x04, Local3)
                        Or (Local0, Local3, Local0)
                        ShiftLeft (SSAE, 0x02, Local3)
                        ShiftLeft (SS6E, One, Local4)
                        Or (Local3, Local4, Local3)
                        Or (SS3E, Local3, Local1)
                        ShiftLeft (SSPT, 0x04, Local3)
                        Or (Local1, Local3, Local1)
                        Store (SMRI, GMPT)
                        Store (Local0, GMUE)
                        Store (SMUT, GMUT)
                        Store (SMCR, GMCR)
                        Store (SSRI, GSPT)
                        Store (Local1, GSUE)
                        Store (SSUT, GSUT)
                        Store (SSCR, GSCR)
                        STM ()
                        Store (GMPT, SMRI)
                        Store (GMUE, Local0)
                        Store (GMUT, SMUT)
                        Store (GMCR, SMCR)
                        Store (GSUE, Local1)
                        Store (GSUT, SSUT)
                        Store (GSCR, SSCR)
                        If (And (Local0, One))
                        {
                            Store (One, SM3E)
                        }
                        Else
                        {
                            Store (Zero, SM3E)
                        }

                        If (And (Local0, 0x02))
                        {
                            Store (One, SM6E)
                        }
                        Else
                        {
                            Store (Zero, SM6E)
                        }

                        If (And (Local0, 0x04))
                        {
                            Store (One, SMAE)
                        }
                        Else
                        {
                            Store (Zero, SMAE)
                        }

                        If (And (Local1, One))
                        {
                            Store (One, SS3E)
                        }
                        Else
                        {
                            Store (Zero, SS3E)
                        }

                        If (And (Local1, 0x02))
                        {
                            Store (One, SS6E)
                        }
                        Else
                        {
                            Store (Zero, SS6E)
                        }

                        If (And (Local1, 0x04))
                        {
                            Store (One, SSAE)
                        }
                        Else
                        {
                            Store (Zero, SSAE)
                        }

                        Store (GTF (Zero, Arg1), ATA2)
                        Store (GTF (One, Arg2), ATA3)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA2))
                        }
                    }

                    Device (DRV1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (RATA (ATA3))
                        }
                    }
                }

                Method (GTM, 7, Serialized)
                {
                    Store (Ones, PIO0)
                    Store (Ones, PIO1)
                    Store (Ones, DMA0)
                    Store (Ones, DMA1)
                    Store (0x10, CHNF)
                    If (REGF) {}
                    Else
                    {
                        Return (TMD0)
                    }

                    If (And (Arg1, 0x20))
                    {
                        Or (CHNF, 0x02, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, One)), MEQ, Arg0, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA0)
                    Store (Local7, PIO0)
                    If (And (Arg4, 0x20))
                    {
                        Or (CHNF, 0x08, CHNF)
                    }

                    Store (Match (DerefOf (Index (TIM0, 0x02)), MEQ, Arg3, MTR, 
                        Zero, Zero), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, Zero)), Local6)), 
                        Local7)
                    Store (Local7, DMA1)
                    Store (Local7, PIO1)
                    If (And (Arg1, 0x07))
                    {
                        Store (Arg2, Local5)
                        If (And (Arg1, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg1, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA0)
                        Or (CHNF, One, CHNF)
                    }

                    If (And (Arg4, 0x07))
                    {
                        Store (Arg5, Local5)
                        If (And (Arg4, 0x02))
                        {
                            Add (Local5, 0x02, Local5)
                        }

                        If (And (Arg4, 0x04))
                        {
                            Add (Local5, 0x04, Local5)
                        }

                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA1)
                        Or (CHNF, 0x04, CHNF)
                    }

                    Store (TMD0, Debug)
                    Return (TMD0)
                }

                Method (STM, 0, Serialized)
                {
                    If (REGF) {}
                    Else
                    {
                        Store (Zero, GMUE)
                        Store (Zero, GMUT)
                        Store (Zero, GSUE)
                        Store (Zero, GSUT)
                        If (And (CHNF, One))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GMUT)
                            Or (GMUE, One, GMUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GMUE, 0x02, GMUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GMUE, 0xFD, GMUE)
                                Or (GMUE, 0x04, GMUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO0, Ones), LEqual (PIO0, Zero)))
                            {
                                If (And (LLess (DMA0, Ones), LGreater (DMA0, Zero)))
                                {
                                    Store (DMA0, PIO0)
                                    Or (GMUE, 0x80, GMUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x04))
                        {
                            Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA1, MTR, 
                                Zero, Zero), Local0)
                            If (LGreater (Local0, 0x05))
                            {
                                Store (0x05, Local0)
                            }

                            Store (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0)), 
                                GSUT)
                            Or (GSUE, One, GSUE)
                            If (LGreater (Local0, 0x02))
                            {
                                Or (GSUE, 0x02, GSUE)
                            }

                            If (LGreater (Local0, 0x04))
                            {
                                And (GSUE, 0xFD, GSUE)
                                Or (GSUE, 0x04, GSUE)
                            }
                        }
                        Else
                        {
                            If (Or (LEqual (PIO1, Ones), LEqual (PIO1, Zero)))
                            {
                                If (And (LLess (DMA1, Ones), LGreater (DMA1, Zero)))
                                {
                                    Store (DMA1, PIO1)
                                    Or (GSUE, 0x80, GSUE)
                                }
                            }
                        }

                        If (And (CHNF, 0x02))
                        {
                            Or (GMUE, 0x20, GMUE)
                        }

                        If (And (CHNF, 0x08))
                        {
                            Or (GSUE, 0x20, GSUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO0, MTR, 
                            Zero, Zero), 0x07, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, One)), Local0)), 
                            Local1)
                        Store (Local1, GMPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GMUE, 0x50, GMUE)
                        }

                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO1, MTR, 
                            Zero, Zero), 0x07, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0)), 
                            Local1)
                        Store (Local1, GSPT)
                        If (LLess (Local0, 0x03))
                        {
                            Or (GSUE, 0x50, GSUE)
                        }
                    }
                }

                Name (AT01, Buffer (0x07)
                {
                    0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT02, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90
                })
                Name (AT03, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC6
                })
                Name (AT04, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91
                })
                Name (ATA0, Buffer (0x1D) {})
                Name (ATA1, Buffer (0x1D) {})
                Name (ATA2, Buffer (0x1D) {})
                Name (ATA3, Buffer (0x1D) {})
                Name (ATAB, Buffer (0x1D) {})
                CreateByteField (ATAB, Zero, CMDC)
                Method (GTFB, 3, Serialized)
                {
                    Multiply (CMDC, 0x38, Local0)
                    Add (Local0, 0x08, Local1)
                    CreateField (ATAB, Local1, 0x38, CMDX)
                    Multiply (CMDC, 0x07, Local0)
                    CreateByteField (ATAB, Add (Local0, 0x02), A001)
                    CreateByteField (ATAB, Add (Local0, 0x06), A005)
                    Store (Arg0, CMDX)
                    Store (Arg1, A001)
                    Store (Arg2, A005)
                    Increment (CMDC)
                }

                Method (GTF, 2, Serialized)
                {
                    Store (Arg1, Debug)
                    Store (Zero, CMDC)
                    Name (ID49, 0x0C00)
                    Name (ID59, Zero)
                    Name (ID53, 0x04)
                    Name (ID63, 0x0F00)
                    Name (ID88, 0x0F00)
                    Name (IRDY, One)
                    Name (PIOT, Zero)
                    Name (DMAT, Zero)
                    If (LEqual (SizeOf (Arg1), 0x0200))
                    {
                        CreateWordField (Arg1, 0x62, IW49)
                        Store (IW49, ID49)
                        CreateWordField (Arg1, 0x6A, IW53)
                        Store (IW53, ID53)
                        CreateWordField (Arg1, 0x7E, IW63)
                        Store (IW63, ID63)
                        CreateWordField (Arg1, 0x76, IW59)
                        Store (IW59, ID59)
                        CreateWordField (Arg1, 0xB0, IW88)
                        Store (IW88, ID88)
                    }

                    Store (0xA0, Local7)
                    If (Arg0)
                    {
                        Store (0xB0, Local7)
                        And (CHNF, 0x08, IRDY)
                        If (And (CHNF, 0x10))
                        {
                            Store (PIO1, PIOT)
                        }
                        Else
                        {
                            Store (PIO0, PIOT)
                        }

                        If (And (CHNF, 0x04))
                        {
                            If (And (CHNF, 0x10))
                            {
                                Store (DMA1, DMAT)
                            }
                            Else
                            {
                                Store (DMA0, DMAT)
                            }
                        }
                    }
                    Else
                    {
                        And (CHNF, 0x02, IRDY)
                        Store (PIO0, PIOT)
                        If (And (CHNF, One))
                        {
                            Store (DMA0, DMAT)
                        }
                    }

                    If (LAnd (LAnd (And (ID53, 0x04), And (ID88, 0xFF00
                        )), DMAT))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMAT, MTR, 
                            Zero, Zero), Local1)
                        If (LGreater (Local1, 0x05))
                        {
                            Store (0x05, Local1)
                        }

                        GTFB (AT01, Or (0x40, Local1), Local7)
                    }
                    Else
                    {
                        If (LAnd (And (ID63, 0xFF00), PIOT))
                        {
                            And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                                Zero, Zero), 0x03, Local0)
                            Or (0x20, DerefOf (Index (DerefOf (Index (TIM0, 0x07)), Local0
                                )), Local1)
                            GTFB (AT01, Local1, Local7)
                        }
                    }

                    If (IRDY)
                    {
                        And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIOT, MTR, 
                            Zero, Zero), 0x07, Local0)
                        Or (0x08, DerefOf (Index (DerefOf (Index (TIM0, 0x06)), Local0
                            )), Local1)
                        GTFB (AT01, Local1, Local7)
                    }
                    Else
                    {
                        If (And (ID49, 0x0400))
                        {
                            GTFB (AT01, One, Local7)
                        }
                    }

                    If (LAnd (And (ID59, 0x0100), And (ID59, 0xFF)))
                    {
                        GTFB (AT03, And (ID59, 0xFF), Local7)
                    }

                    Store (ATAB, Debug)
                    Return (ATAB)
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Multiply (CMDN, 0x38, Local0)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Store (RETB, Debug)
                    Return (RETB)
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                            Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW)
                    }
                    Else
                    {
                        Store (Zero, USBW)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x03, One))
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                            Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW)
                    }
                    Else
                    {
                        Store (Zero, USBW)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x04, One))
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                            Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW)
                    }
                    Else
                    {
                        Store (Zero, USBW)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0C, One))
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0003)
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                            Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW)
                    }
                    Else
                    {
                        Store (Zero, USBW)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0E, One))
                }
            }

            Device (EHCI)
            {
                Name (_ADR, 0x001D0007)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0D, One))
                }
            }

            Device (MC97)
            {
                Name (_ADR, 0x001E0003)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x05, 0x04))
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x001E0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x001F0000)
                Method (SPTS, 1, NotSerialized)
                {
                    Store (One, PS1S)
                    Store (One, PS1S)
                    Store (One, PS1E)
                }

                Method (SWAK, 1, NotSerialized)
                {
                    Store (Zero, PS1E)
                    If (LEqual (Arg0, 0x04))
                    {
                        Notify (PWRB, 0x02)
                    }
                }

                OperationRegion (APMP, SystemIO, SMIP, 0x02)
                Field (APMP, ByteAcc, NoLock, Preserve)
                {
                    APMC,   8, 
                    APMS,   8
                }

                Field (APMP, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x01), 
                        ,   1, 
                    BRTC,   1
                }

                OperationRegion (PMS0, SystemIO, PMBS, 0x04)
                Field (PMS0, ByteAcc, NoLock, Preserve)
                {
                        ,   10, 
                    RTCS,   1, 
                        ,   4, 
                    WAKS,   1, 
                            Offset (0x03), 
                    PWBT,   1, 
                            Offset (0x04)
                }

                OperationRegion (SMIE, SystemIO, PM30, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    PS1E,   1, 
                        ,   31, 
                    PS1S,   1, 
                            Offset (0x08)
                }

                Scope (\_SB)
                {
                    Name (PWRS, Zero)
                    Device (PWRB)
                    {
                        Name (_HID, EisaId ("PNP0C0C"))
                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0B)
                        }
                    }
                }

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                    Device (SLPB)
                    {
                        Name (_HID, EisaId ("PNP0C0E"))
                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0F)
                        }
                    }
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Device (ICH7)
                        {
                            Name (_HID, EisaId ("PNP0C01"))
                            Name (_UID, 0x01C7)
                            Name (_STA, 0x0F)
                            Name (ICHR, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y04)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y05)
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x00,               // Alignment
                                    0x00,               // Length
                                    _Y06)
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y07)
                                Memory32Fixed (ReadWrite,
                                    0xFEE00000,         // Address Base
                                    0x00001000,         // Address Length
                                    )
                                Memory32Fixed (ReadWrite,
                                    0x00000000,         // Address Base
                                    0x00000000,         // Address Length
                                    _Y08)
                                Memory32Fixed (ReadWrite,
                                    0xFFB00000,         // Address Base
                                    0x00100000,         // Address Length
                                    )
                                Memory32Fixed (ReadWrite,
                                    0xFC800400,         // Address Base
                                    0x00000C00,         // Address Length
                                    )
                            })
                            Method (_CRS, 0, NotSerialized)
                            {
                                CreateWordField (ICHR, \_SB.PCI0.ICH7._Y04._MIN, PBB)
                                CreateWordField (ICHR, \_SB.PCI0.ICH7._Y04._MAX, PBH)
                                CreateByteField (ICHR, \_SB.PCI0.ICH7._Y04._LEN, PML)
                                Store (PMBS, PBB)
                                Store (PMBS, PBH)
                                Store (PMLN, PML)
                                If (SMBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.ICH7._Y05._MIN, SMB)
                                    CreateWordField (ICHR, \_SB.PCI0.ICH7._Y05._MAX, SMH)
                                    CreateByteField (ICHR, \_SB.PCI0.ICH7._Y05._LEN, SML)
                                    Store (SMBS, SMB)
                                    Store (SMBS, SMH)
                                    Store (SMBL, SML)
                                }

                                If (GPBS)
                                {
                                    CreateWordField (ICHR, \_SB.PCI0.ICH7._Y06._MIN, IGB)
                                    CreateWordField (ICHR, \_SB.PCI0.ICH7._Y06._MAX, IGH)
                                    CreateByteField (ICHR, \_SB.PCI0.ICH7._Y06._LEN, IGL)
                                    Store (GPBS, IGB)
                                    Store (GPBS, IGH)
                                    Store (GPLN, IGL)
                                }

                                If (APCB)
                                {
                                    CreateDWordField (ICHR, \_SB.PCI0.ICH7._Y07._BAS, APB)
                                    CreateDWordField (ICHR, \_SB.PCI0.ICH7._Y07._LEN, APL)
                                    Store (APCB, APB)
                                    Store (APCL, APL)
                                }

                                CreateDWordField (ICHR, \_SB.PCI0.ICH7._Y08._BAS, RCB)
                                CreateDWordField (ICHR, \_SB.PCI0.ICH7._Y08._LEN, RCL)
                                Store (SRCB, RCB)
                                Store (SRCL, RCL)
                                Return (ICHR)
                            }
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
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
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
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x10)
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x00,               // Alignment
                            0x09,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (CRS)
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CID, EisaId ("PNP030B"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03"))
                    Name (_CID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                }
            }

            Device (P0P4)
            {
                Name (_ADR, 0x001C0000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }

                Device (LAN0)
                {
                    Name (_ADR, Zero)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package (0x0A)
                            {
                                "AAPL,slot-name", 
                                Buffer (0x09)
                                {
                                    "Built in"
                                }, 

                                "model", 
                                Buffer (0x38)
                                {
                                    "Realtek RTL8101E/RTL8102E PCIe Fast Ethernet controller"
                                }, 

                                "built-in", 
                                Buffer (One)
                                {
                                    0x01
                                }, 

                                "name", 
                                Buffer (0x14)
                                {
                                    "Ethernet controller"
                                }, 

                                "device_type", 
                                Buffer (0x09)
                                {
                                    "Ethernet"
                                }
                            }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }
            }

            Device (P0P5)
            {
                Name (_ADR, 0x001C0001)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }

                Device (ARPT)
                {
                    Name (_ADR, 0xFFFF)
                    Method (_DSM, 4, NotSerialized)
                    {
                        Store (Package (0x08)
                            {
                                "AAPL,slot-name", 
                                Buffer (0x0B)
                                {
                                    "PCI Slot 1"
                                }, 

                                "name", 
                                Buffer (0x13)
                                {
                                    "Network controller"
                                }, 

                                "model", 
                                Buffer (0x2B)
                                {
                                    "Broadcom Corporation BCM4328 802.11a/b/g/n"
                                }, 

                                "device_type", 
                                Buffer (0x08)
                                {
                                    "AirPort"
                                }
                            }, Local0)
                        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                        Return (Local0)
                    }
                }
            }

            Device (P0P6)
            {
                Name (_ADR, 0x001C0002)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }
            }

            Device (P0P7)
            {
                Name (_ADR, 0x001C0003)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR07)
                    }

                    Return (PR07)
                }
            }

            Device (P0P8)
            {
                Name (_ADR, 0x001C0004)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR08)
                    }

                    Return (PR08)
                }
            }

            Device (P0P9)
            {
                Name (_ADR, 0x001C0005)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR09)
                    }

                    Return (PR09)
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x08)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x09)
                            {
                                "Built in"
                            }, 

                            "device_type", 
                            Buffer (0x06)
                            {
                                "Audio"
                            }, 

                            "name", 
                            Buffer (0x21)
                            {
                                "High Definition Audio Controller"
                            }, 

                            "model", 
                            Buffer (0x1E)
                            {
                                "Realtek ALC888 HDA Controller"
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Method (_DSM, 4, NotSerialized)
                {
                    Store (Package (0x0C)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x09)
                            {
                                "Built in"
                            }, 

                            "AAPL,HasPanel", 
                            Buffer (0x04)
                            {
                                0x01, 0x00, 0x00, 0x00
                            }, 

                            "device_type", 
                            Buffer (0x08)
                            {
                                "Display"
                            }, 

                            "model", 
                            Buffer (0x34)
                            {
                                "Intel 945GME Express Integrated Graphics Controller"
                            }, 

                            "name", 
                            Buffer (0x1A)
                            {
                                "VGA compatible controller"
                            }, 

                            "built-in", 
                            Buffer (One)
                            {
                                0x01
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }

                Method (_DOS, 1, NotSerialized)
                {
                    Store (Arg0, SWIT)
                }

                Name (_DOD, Package (0x02)
                {
                    0x00010100, 
                    0x00010410
                })
                Device (CRT)
                {
                    Name (_ADR, 0x0100)
                    Name (_DCS, 0x1F)
                    Name (_DGS, Zero)
                    Method (_DSS, 1, NotSerialized)
                    {
                    }
                }

                Device (LCD)
                {
                    Name (_ADR, 0x0410)
                    Name (_DCS, 0x1F)
                    Name (_DGS, One)
                    Method (_DSS, 1, NotSerialized)
                    {
                    }

                    Name (LCFG, Zero)
                    Name (LCBF, Zero)
                    Method (_BCM, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x14))
                        {
                            Store (Zero, Local0)
                        }

                        If (LEqual (Arg0, 0x1E))
                        {
                            Store (One, Local0)
                        }

                        If (LEqual (Arg0, 0x28))
                        {
                            Store (0x02, Local0)
                        }

                        If (LEqual (Arg0, 0x32))
                        {
                            Store (0x03, Local0)
                        }

                        If (LEqual (Arg0, 0x3C))
                        {
                            Store (0x04, Local0)
                        }

                        If (LEqual (Arg0, 0x46))
                        {
                            Store (0x05, Local0)
                        }

                        If (LEqual (Arg0, 0x50))
                        {
                            Store (0x06, Local0)
                        }

                        If (LEqual (Arg0, 0x5A))
                        {
                            Store (0x07, Local0)
                        }

                        If (LEqual (Arg0, 0x64))
                        {
                            Store (0x08, Local0)
                        }

                        Store (Local0, LCBF)
                        Store (Local0, ^^^SBRG.EC.BRLV)
                    }

                    Name (PBCL, Package (0x0B)
                    {
                        0x50, 
                        0x14, 
                        0x14, 
                        0x1E, 
                        0x28, 
                        0x32, 
                        0x3C, 
                        0x46, 
                        0x50, 
                        0x5A, 
                        0x64
                    })
                    Method (_BCL, 0, NotSerialized)
                    {
                        Return (PBCL)
                    }

                    Method (_BQC, 0, NotSerialized)
                    {
                        If (LCFG)
                        {
                            Store (LCBF, Local0)
                        }
                        Else
                        {
                            Store (^^^SBRG.EC.BRLV, Local0)
                            Store (Local0, LCBF)
                            Store (One, LCFG)
                        }

                        Add (Local0, 0x02, Local0)
                        Store (DerefOf (Index (PBCL, Local0)), Local1)
                        Return (Local1)
                    }
                }

                Name (SWIT, Zero)
                Name (GDCS, 0x02)
                Name (GDGS, One)
                Name (GDTS, Zero)
                Name (GDFG, One)
            }
        }

        Scope (\_GPE)
        {
            Method (_L09, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.P0P2, 0x02)
                Notify (\_SB.PCI0.P0P2.PEGP, 0x02)
                Notify (\_SB.PCI0.P0P4, 0x02)
                Notify (\_SB.PCI0.P0P5, 0x02)
                Notify (\_SB.PCI0.P0P6, 0x02)
                Notify (\_SB.PCI0.P0P7, 0x02)
                Notify (\_SB.PCI0.P0P8, 0x02)
                Notify (\_SB.PCI0.P0P9, 0x02)
            }

            Method (_L03, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.USB0, 0x02)
            }

            Method (_L04, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.USB1, 0x02)
            }

            Method (_L0C, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.USB2, 0x02)
            }

            Method (_L0E, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.USB3, 0x02)
            }

            Method (_L0D, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.EHCI, 0x02)
            }

            Method (_L05, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.MC97, 0x02)
            }

            Method (_L0B, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.P0P1, 0x02)
            }
        }
    }

    OperationRegion (_SB.PCI0.SBRG.PIX0, PCI_Config, 0x60, 0x0C)
    Field (\_SB.PCI0.SBRG.PIX0, ByteAcc, NoLock, Preserve)
    {
        PIRA,   8, 
        PIRB,   8, 
        PIRC,   8, 
        PIRD,   8, 
                Offset (0x08), 
        PIRE,   8, 
        PIRF,   8, 
        PIRG,   8, 
        PIRH,   8
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, IRA0)
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, One)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRA, 0x80, Local0)
                If (Local0)
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
                Return (PRSA)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRA, 0x80, PIRA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRA, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
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
                If (Local0)
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
                Return (PRSB)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRB, 0x80, PIRB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRB, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
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
                If (Local0)
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
                Return (PRSC)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRC, 0x80, PIRC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRC, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
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
                If (Local0)
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
                Return (PRSD)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRD, 0x80, PIRD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRD, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
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
                If (Local0)
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
                Return (PRSE)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRE, 0x80, PIRE)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRE, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
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
                If (Local0)
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
                Return (PRSF)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRF, 0x80, PIRF)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRF, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x07)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRG, 0x80, Local0)
                If (Local0)
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
                Return (PRSG)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRG, 0x80, PIRG)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRG, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x08)
            Method (_STA, 0, NotSerialized)
            {
                And (PIRH, 0x80, Local0)
                If (Local0)
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
                Return (PRSH)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (PIRH, 0x80, PIRH)
            }

            Method (_CRS, 0, NotSerialized)
            {
                And (PIRH, 0x0F, Local0)
                ShiftLeft (One, Local0, IRA0)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }

        Device (PNLF)
        {
            Name (_HID, EisaId ("APP0002"))
            Name (_CID, "backlight")
            Name (_UID, 0x0A)
            Name (_STA, 0x0B)
        }
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
            }

            Name (CRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
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
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (CRS, \_SB.PCI0._Y09._MIN, MIN5)
            CreateDWordField (CRS, \_SB.PCI0._Y09._MAX, MAX5)
            CreateDWordField (CRS, \_SB.PCI0._Y09._LEN, LEN5)
            CreateDWordField (CRS, \_SB.PCI0._Y0A._MIN, MIN6)
            CreateDWordField (CRS, \_SB.PCI0._Y0A._MAX, MAX6)
            CreateDWordField (CRS, \_SB.PCI0._Y0A._LEN, LEN6)
            Method (_CRS, 0, NotSerialized)
            {
                Store (MG1L, Local0)
                If (Local0)
                {
                    Store (MG1B, MIN5)
                    Store (MG1L, LEN5)
                    Add (MIN5, Decrement (Local0), MAX5)
                }

                Store (MG2B, MIN6)
                Store (MG2L, LEN6)
                Store (MG2L, Local0)
                Add (MIN6, Decrement (Local0), MAX6)
                Return (CRS)
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, DBG8)
        PTS (Arg0)
        Store (Zero, Index (WAKP, Zero))
        Store (Zero, Index (WAKP, One))
        Store (ASSB, WSSB)
        Store (AOTB, WOTB)
        Store (AAXB, WAXB)
        Store (Arg0, ASSB)
        Store (OSFL (), AOTB)
        Store (Zero, AAXB)
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
    }

    Method (_WAK, 1, NotSerialized)
    {
        ShiftLeft (Arg0, 0x04, DBG8)
        WAK (Arg0)
        If (ASSB)
        {
            Store (WSSB, ASSB)
            Store (WOTB, AOTB)
            Store (WAXB, AAXB)
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }

        Return (WAKP)
    }

    OperationRegion (PMS0, SystemIO, PMBS, 0x02)
    Field (PMS0, ByteAcc, NoLock, Preserve)
    {
                Offset (0x01), 
        PWBT,   1, 
            ,   1, 
        RTCS,   1, 
            ,   4, 
        WAKS,   1
    }

    OperationRegion (SMIE, SystemIO, PM30, 0x08)
    Field (SMIE, ByteAcc, NoLock, Preserve)
    {
            ,   4, 
        PS1E,   1, 
            ,   31, 
        PS1S,   1, 
                Offset (0x08)
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103"))
                Name (CRS, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {0}
                    IRQNoFlags ()
                        {8}
                    Memory32Fixed (ReadWrite,
                        0xFED00000,         // Address Base
                        0x00000400,         // Address Length
                        _Y0B)
                })
                OperationRegion (HCNT, SystemMemory, HPTC, 0x04)
                Field (HCNT, DWordAcc, NoLock, Preserve)
                {
                    HPTS,   2, 
                        ,   5, 
                    HPTE,   1
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (OSFL (), Zero))
                    {
                        If (HPTE)
                        {
                            Return (0x0F)
                        }
                    }
                    Else
                    {
                        If (HPTE)
                        {
                            Return (0x0B)
                        }
                    }

                    Return (Zero)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateDWordField (CRS, \_SB.PCI0.HPET._Y0B._BAS, HTBS)
                    Multiply (HPTS, 0x1000, Local0)
                    Add (Local0, 0xFED00000, HTBS)
                    Return (CRS)
                }
            }
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Method (_OSC, 4, NotSerialized)
            {
                Name (SUPP, Zero)
                Name (CTRL, Zero)
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */    0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40, 
                            /* 0008 */    0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    If (LNot (PEHP))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    If (LNot (SHPC))
                    {
                        And (CTRL, 0x1D, CTRL)
                    }

                    If (LNot (PEPM))
                    {
                        And (CTRL, 0x1B, CTRL)
                    }

                    If (LNot (PEER))
                    {
                        And (CTRL, 0x15, CTRL)
                    }

                    If (LNot (PECS))
                    {
                        And (CTRL, 0x0F, CTRL)
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }
        }
    }

    Device (OMSC)
    {
        Name (_HID, EisaId ("PNP0C02"))
        Name (_UID, 0x0E11)
    }

    Device (_SB.RMEM)
    {
        Name (_HID, EisaId ("PNP0C01"))
        Name (_UID, One)
    }

    Scope (_SB.PCI0.SBRG)
    {
        OperationRegion (RTCA, SystemIO, 0x72, 0x02)
        Field (RTCA, ByteAcc, NoLock, Preserve)
        {
            RTCI,   8, 
            RTCD,   8
        }

        Method (_INI, 0, NotSerialized)
        {
            Store (CMOS, RTCI)
            Store (OSFL (), RTCD)
        }
    }

    Scope (_TZ)
    {
        Method (KELV, 1, NotSerialized)
        {
            And (Arg0, 0xFF, Local0)
            Multiply (Local0, 0x0A, Local0)
            Add (Local0, 0x0AAC, Local0)
            Return (Local0)
        }

        ThermalZone (THRM)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\_SB.PCI0.SBRG.EC.MYEC)
                {
                    If (\_SB.PCI0.SBRG.EC.CTSD)
                    {
                        Store (Zero, \_SB.PCI0.SBRG.EC.CTSD)
                        Return (KELV (0x6E))
                    }
                    Else
                    {
                        Store (\_SB.PCI0.SBRG.EC.CPUT, Local0)
                        Add (Local0, 0x02, Local0)
                        Return (KELV (Local0))
                    }
                }
                Else
                {
                    Return (KELV (0x2D))
                }
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (KELV (0x64))
            }
        }
    }

    Scope (_SB.PCI0.SBRG)
    {
        Device (EC)
        {
            Name (_HID, EisaId ("PNP0C09"))
            Name (_GPE, 0x17)
            Name (CTID, Zero)
            Name (MYEC, One)
            Name (CTSD, Zero)
            Name (\PTHR, Zero)
            Method (_REG, 2, NotSerialized)
            {
                If (LEqual (Arg0, 0x03))
                {
                    Store (Arg1, MYEC)
                }

                Store (Zero, CTSD)
            }

            Name (_CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
            })
            OperationRegion (EC, EmbeddedControl, Zero, 0x0100)
            Field (EC, ByteAcc, NoLock, Preserve)
            {
                SMPR,   8, 
                SMST,   8, 
                SMAD,   8, 
                SMCM,   8, 
                SMD0,   264, 
                SMAA,   8, 
                        Offset (0x2C), 
                HSTT,   1, 
                        Offset (0x2D), 
                        Offset (0x30), 
                POWS,   1, 
                LIDS,   1, 
                KBCS,   1, 
                        Offset (0x31), 
                MBTS,   1, 
                MBCS,   1, 
                MBDS,   1, 
                MBFS,   1, 
                MBWS,   1, 
                MBLS,   1, 
                MBCL,   1, 
                MBFL,   1, 
                        Offset (0x34), 
                HSKS,   3, 
                        Offset (0x35), 
                        Offset (0x38), 
                MDCL,   8, 
                MDCH,   8, 
                MDVL,   8, 
                MDVH,   8, 
                MCAL,   8, 
                MCAH,   8, 
                MSTL,   8, 
                MSTH,   8, 
                MCCL,   8, 
                MCCH,   8, 
                MPOL,   8, 
                MPOH,   8, 
                MFCL,   8, 
                MFCH,   8, 
                MCUL,   8, 
                MCUH,   8, 
                MRCL,   8, 
                MRCH,   8, 
                MVOL,   8, 
                MVOH,   8, 
                MTEL,   8, 
                MTEH,   8, 
                RSV1,   8, 
                RSV2,   8, 
                SDCL,   8, 
                SDCH,   8, 
                SDVL,   8, 
                SDVH,   8, 
                SCAL,   8, 
                SCAH,   8, 
                SSTL,   8, 
                SSTH,   8, 
                SCCL,   8, 
                SCCH,   8, 
                SPOL,   8, 
                SPOH,   8, 
                SFCL,   8, 
                SFCH,   8, 
                SCUL,   8, 
                SCUH,   8, 
                SRCL,   8, 
                SRCH,   8, 
                SVOL,   8, 
                SVOH,   8, 
                STEL,   8, 
                STEH,   8, 
                        Offset (0x68), 
                CPUT,   8, 
                        Offset (0x7E), 
                RES1,   3, 
                CHET,   1, 
                        Offset (0x80), 
                SYST,   8, 
                        Offset (0xED), 
                SCIC,   8, 
                        Offset (0xF1), 
                BRLV,   8, 
                        Offset (0xFE), 
                DCBL,   8, 
                ACBL,   8
            }

            Device (ADP1)
            {
                Name (_HID, "ACPI0003")
                Name (BFLG, One)
                Name (ACP, One)
                Method (_PSR, 0, NotSerialized)
                {
                    If (POWS)
                    {
                        Return (One)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Name (_PCL, Package (0x01)
                {
                    _SB
                })
            }

            Name (BIF0, Package (0x0D)
            {
                One, 
                0x1130, 
                0x1130, 
                One, 
                0x39D0, 
                Zero, 
                Zero, 
                One, 
                One, 
                "", 
                "1", 
                "LION", 
                ""
            })
            Name (STAT, Package (0x04)
            {
                0x02, 
                0x0500, 
                0x0800, 
                0x03E8
            })
            Device (BAT1)
            {
                Name (_HID, EisaId ("PNP0C0A"))
                Name (_UID, One)
                Name (_PCL, Package (0x01)
                {
                    _SB
                })
                Method (_STA, 0, NotSerialized)
                {
                    If (MYEC)
                    {
                        If (MBTS)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Method (_BIF, 0, NotSerialized)
                {
                    If (MYEC)
                    {
                        UPBI ()
                    }
                    Else
                    {
                        IVBI ()
                        Store (0x99, DBG8)
                        Sleep (0x03E8)
                    }

                    Return (BIF0)
                }

                Method (_BST, 0, NotSerialized)
                {
                    If (MYEC)
                    {
                        UPBS ()
                    }
                    Else
                    {
                        IVBS ()
                    }

                    Return (STAT)
                }

                Method (IVBI, 0, NotSerialized)
                {
                    Store (Ones, Index (BIF0, One))
                    Store (Ones, Index (BIF0, 0x02))
                    Store (Ones, Index (BIF0, 0x04))
                    Store ("Wrong", Index (BIF0, 0x09))
                    Store (" ", Index (BIF0, 0x0A))
                    Store ("Wrong", Index (BIF0, 0x0B))
                    Store ("Wrong", Index (BIF0, 0x0C))
                }

                Method (IVBS, 0, NotSerialized)
                {
                    Store (Zero, Index (STAT, Zero))
                    Store (Ones, Index (STAT, One))
                    Store (Ones, Index (STAT, 0x02))
                    Store (0x2710, Index (STAT, 0x03))
                }

                Method (UPBI, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    Store (Zero, Local1)
                    Store (Zero, Local2)
                    Store (Zero, Local3)
                    Store (MDCH, Local0)
                    Store (MDCL, Local1)
                    ShiftLeft (Local0, 0x08, Local0)
                    Or (Local0, Local1, Local0)
                    Store (Local0, Index (BIF0, One))
                    Store (MFCH, Local0)
                    Store (MFCL, Local1)
                    ShiftLeft (Local0, 0x08, Local0)
                    Or (Local0, Local1, Local1)
                    Store (Local1, Index (BIF0, 0x02))
                    Store (MDVH, Local0)
                    Store (MDVL, Local2)
                    ShiftLeft (Local0, 0x08, Local0)
                    Or (Local0, Local2, Local2)
                    Store (Local2, Index (BIF0, 0x04))
                    Store ("\n", Index (BIF0, 0x0A))
                    Store ("LION\n", Index (BIF0, 0x0B))
                    Store (CTID, Local0)
                    If (LEqual (Local0, Zero))
                    {
                        Store ("\n", Index (BIF0, 0x09))
                        Store ("\n", Index (BIF0, 0x0C))
                    }
                    Else
                    {
                        Store ("?MODEL\n", Index (BIF0, 0x09))
                        Store ("?CUSTOMER\n", Index (BIF0, 0x0C))
                    }
                }

                Method (UPBS, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    Store (Zero, Local1)
                    Store (Zero, Local2)
                    Store (Zero, Local3)
                    Store (Zero, Local4)
                    Store (Zero, Local7)
                    Store (MBTS, Local0)
                    If (LEqual (Local0, One))
                    {
                        Store (POWS, Local0)
                        If (LEqual (Local0, One))
                        {
                            Store (MBCS, Local1)
                            If (LEqual (Local1, One))
                            {
                                Or (Local4, 0x02, Local4)
                            }
                        }
                        Else
                        {
                            Or (Local4, One, Local4)
                            Store (MBLS, Local0)
                            If (LEqual (Local0, One))
                            {
                                Or (Local4, 0x04, Local4)
                            }
                        }

                        Store (POWS, Local0)
                        If (LEqual (Local0, One))
                        {
                            Store (MBCS, Local0)
                            If (LEqual (Local0, One))
                            {
                                Store (MCUH, Local0)
                                Store (MCUL, Local1)
                                ShiftLeft (Local0, 0x08, Local0)
                                Or (Local0, Local1, Local1)
                                If (LEqual (Local1, 0xFFFF))
                                {
                                    Store (Ones, Local1)
                                }

                                Store (Local1, Index (STAT, One))
                            }
                            Else
                            {
                                Store (Zero, Index (STAT, One))
                            }
                        }
                        Else
                        {
                            Store (MCUH, Local0)
                            Store (MCUL, Local1)
                            ShiftLeft (Local0, 0x08, Local0)
                            Or (Local0, Local1, Local1)
                            XOr (Local1, 0xFFFF, Local1)
                            If (LEqual (Local1, Zero))
                            {
                                Store (Ones, Local1)
                            }

                            Store (Local1, Index (STAT, One))
                        }

                        Store (MRCH, Local0)
                        Store (MRCL, Local2)
                        ShiftLeft (Local0, 0x08, Local0)
                        Or (Local0, Local2, Local2)
                        Store (Local2, Index (STAT, 0x02))
                        Store (MVOH, Local0)
                        Store (MVOL, Local3)
                        ShiftLeft (Local0, 0x08, Local0)
                        Or (Local0, Local3, Local3)
                        Store (Local3, Index (STAT, 0x03))
                        Store (Local4, Index (STAT, Zero))
                        Sleep (0x64)
                    }
                    Else
                    {
                        IVBS ()
                    }
                }
            }

            Device (LID0)
            {
                Name (_HID, EisaId ("PNP0C0D"))
                Method (_LID, 0, NotSerialized)
                {
                    XOr (LIDS, One, Local0)
                    If (Local0)
                    {
                        Notify (SLPB, 0x80)
                    }

                    Return (LIDS)
                }
            }

            Method (_Q80, 0, NotSerialized)
            {
                Store (0x80, SCIC)
                Store (0x80, DBG8)
            }

            Method (_Q81, 0, NotSerialized)
            {
                Store (0x81, SCIC)
                Store (0x81, DBG8)
                Store (One, CHET)
                Or (One, PTHR, PTHR)
                Notify (\_PR.CPU0, 0x80)
                Sleep (0x64)
                Notify (\_PR.CPU1, 0x80)
            }

            Method (_Q82, 0, NotSerialized)
            {
                Store (0x82, SCIC)
                Store (0x82, DBG8)
                Store (One, CHET)
                And (0xFE, PTHR, PTHR)
                Notify (\_PR.CPU0, 0x80)
                Sleep (0x64)
                Notify (\_PR.CPU1, 0x80)
            }

            Method (_Q83, 0, NotSerialized)
            {
                Store (0x83, SCIC)
                Store (0x83, DBG8)
                Store (Zero, Local0)
                Store (POWS, Local0)
                If (LEqual (Local0, One))
                {
                    Store (One, ^ADP1.ACP)
                }
                Else
                {
                    Store (Zero, ^ADP1.ACP)
                }

                Notify (ADP1, 0x80)
                Sleep (0x64)
                If (_OSI ("Windows 2006")) {}
                Else
                {
                    Store (0x8C, APMC)
                }
            }

            Method (_Q84, 0, NotSerialized)
            {
                Store (0x84, SCIC)
                Store (0x84, DBG8)
                Notify (LID0, 0x80)
            }

            Method (_QBD, 0, NotSerialized)
            {
                Store (0xBD, SCIC)
                Store (0xBD, DBG8)
                Notify (SLPB, 0x80)
            }

            Method (_Q85, 0, NotSerialized)
            {
                Store (0x85, SCIC)
                Store (0x85, DBG8)
            }

            Method (_Q86, 0, NotSerialized)
            {
                Store (0x86, SCIC)
                Store (0x86, DBG8)
            }

            Method (_Q87, 0, NotSerialized)
            {
                Store (0x87, SCIC)
                Store (0x87, DBG8)
                Store (Zero, Local0)
                Store (MBTS, Local0)
                If (LEqual (Local0, One))
                {
                    Store (One, ^ADP1.BFLG)
                    Notify (BAT1, 0x80)
                }
                Else
                {
                    Store (Zero, ^ADP1.BFLG)
                    Notify (BAT1, 0x81)
                }

                Notify (ADP1, 0x80)
            }

            Method (_Q77, 0, NotSerialized)
            {
                Store (0x77, SCIC)
                Store (0x77, DBG8)
                Store (Zero, Local0)
                Store (MBTS, Local0)
                If (LEqual (Local0, One))
                {
                    Store (One, ^ADP1.BFLG)
                    Notify (BAT1, 0x80)
                }
                Else
                {
                    Store (Zero, ^ADP1.BFLG)
                    Notify (BAT1, 0x81)
                }

                Notify (ADP1, 0x80)
            }

            Method (_Q88, 0, NotSerialized)
            {
                Store (0x88, SCIC)
                Store (0x88, DBG8)
            }

            Method (_Q89, 0, NotSerialized)
            {
                Store (0x89, SCIC)
                Store (0x89, DBG8)
            }

            Method (_Q8A, 0, NotSerialized)
            {
                Store (0x8A, SCIC)
                Store (0x8A, DBG8)
                Store (One, CTSD)
                Notify (\_TZ.THRM, 0x80)
            }

            Method (_Q8B, 0, NotSerialized)
            {
                Store (0x8B, SCIC)
                Store (0x8B, DBG8)
            }

            Method (_Q8C, 0, NotSerialized)
            {
                Store (0x8C, SCIC)
                Store (0x8C, DBG8)
            }

            Method (_Q90, 0, NotSerialized)
            {
                Store (0x90, SCIC)
                Store (0x90, DBG8)
            }

            Method (_QB4, 0, NotSerialized)
            {
                Store (0xB4, SCIC)
                Store (0xB4, DBG8)
                If (LEqual (^^^GFX0.SWIT, Zero))
                {
                    Store (0xB4, APMC)
                    Store (APMS, Local0)
                    Store (Local0, DBG8)
                    If (LEqual (^^^GFX0.GDTS, Zero))
                    {
                        If (LEqual (Local0, One))
                        {
                            If (LEqual (^^^GFX0.GDGS, One))
                            {
                                Store (Zero, ^^^GFX0.LCD._DGS)
                                Store (One, ^^^GFX0.CRT._DGS)
                            }

                            If (LEqual (^^^GFX0.GDGS, 0x02))
                            {
                                Store (One, ^^^GFX0.LCD._DGS)
                                Store (One, ^^^GFX0.CRT._DGS)
                            }

                            If (LEqual (^^^GFX0.GDGS, 0x03))
                            {
                                Store (One, ^^^GFX0.LCD._DGS)
                                Store (Zero, ^^^GFX0.CRT._DGS)
                            }

                            If (LGreaterEqual (^^^GFX0.GDGS, 0x03))
                            {
                                Store (One, ^^^GFX0.GDGS)
                            }
                            Else
                            {
                                Add (One, ^^^GFX0.GDGS, ^^^GFX0.GDGS)
                            }
                        }

                        Notify (GFX0, 0x80)
                    }
                }
            }

            Method (_QB5, 0, NotSerialized)
            {
                Store (0xB5, SCIC)
                Store (0xB5, DBG8)
            }

            Method (_QB6, 0, NotSerialized)
            {
                Store (0xB6, SCIC)
                Store (0xB6, DBG8)
            }

            Method (_QB7, 0, NotSerialized)
            {
                Store (0xB7, SCIC)
                Store (0xB7, DBG8)
                If (_OSI ("Windows 2006"))
                {
                    Notify (^^^GFX0.LCD, 0x87)
                }
                Else
                {
                    If (LNotEqual (BRLV, Zero))
                    {
                        Store (BRLV, Local0)
                        Decrement (Local0)
                        Store (Local0, BRLV)
                    }
                }
            }

            Method (_QB8, 0, NotSerialized)
            {
                Store (0xB8, SCIC)
                Store (0xB8, DBG8)
                If (_OSI ("Windows 2006"))
                {
                    Notify (^^^GFX0.LCD, 0x86)
                }
                Else
                {
                    If (LNotEqual (BRLV, 0x08))
                    {
                        Store (BRLV, Local0)
                        Increment (Local0)
                        Store (Local0, BRLV)
                    }
                }
            }

            Method (_QB9, 0, NotSerialized)
            {
                Store (0xB9, SCIC)
                Store (0xB9, DBG8)
                Store (Zero, HSTT)
            }

            OperationRegion (LP4D, SystemIO, 0x4D, 0x02)
            Field (LP4D, WordAcc, NoLock, Preserve)
            {
                IO4D,   16
            }

            OperationRegion (LP4F, SystemIO, 0x4F, One)
            Field (LP4F, ByteAcc, NoLock, Preserve)
            {
                IO4F,   8
            }

            OperationRegion (IO, SystemIO, 0x62, 0x05)
            Field (IO, ByteAcc, Lock, Preserve)
            {
                DAT1,   8, 
                        Offset (0x04), 
                CMD1,   8
            }

            Field (IO, ByteAcc, Lock, Preserve)
            {
                        Offset (0x04), 
                OUTS,   1, 
                INPS,   1
            }

            Method (IRDY, 0, Serialized)
            {
                Return (LNot (INPS))
            }

            Method (ORDY, 0, Serialized)
            {
                Return (OUTS)
            }

            Method (WATI, 0, Serialized)
            {
                Store (0x32, Local0)
                While (LAnd (Local0, LNot (IRDY ())))
                {
                    Sleep (One)
                    Decrement (Local0)
                }

                Return (IRDY ())
            }

            Method (WATO, 0, Serialized)
            {
                Store (0x32, Local0)
                While (LAnd (Local0, LNot (ORDY ())))
                {
                    Sleep (One)
                    Decrement (Local0)
                }

                Return (ORDY ())
            }

            Method (CLRB, 0, Serialized)
            {
                While (WATO ())
                {
                    Store (DAT1, Local0)
                }
            }

            Method (RDEC, 1, Serialized)
            {
                If (WATI ())
                {
                    Store (0x80, CMD1)
                    If (WATI ())
                    {
                        Store (Arg0, DAT1)
                        If (WATO ())
                        {
                            Return (DAT1)
                        }
                    }
                }

                Return (Zero)
            }

            Method (WREC, 2, Serialized)
            {
                Noop
            }

            Method (QREC, 0, Serialized)
            {
                Noop
            }

            Method (_QC0, 0, NotSerialized)
            {
                Store (0xC0, ^SCM0.TDED)
                Store (0xC0, DBG8)
                Notify (SCM0, 0xC0)
            }

            Device (SCM0)
            {
                Name (_HID, "pnp0c14")
                Name (_UID, Zero)
                Name (TDVR, 0x10)
                Name (_WDG, Buffer (0xC8)
                {
                    /* 0000 */    0x6A, 0x8D, 0x41, 0x24, 0x79, 0x0A, 0x4C, 0x52, 
                    /* 0008 */    0x9A, 0xB1, 0x18, 0xB7, 0x8C, 0xA6, 0x8C, 0xE7, 
                    /* 0010 */    0x41, 0x41, 0x22, 0x01, 0x6B, 0xD5, 0xFB, 0x4A, 
                    /* 0018 */    0x91, 0x9F, 0x49, 0x8F, 0x81, 0xF5, 0x99, 0x5B, 
                    /* 0020 */    0xA7, 0x38, 0x22, 0xAF, 0x41, 0x42, 0x02, 0x01, 
                    /* 0028 */    0x6C, 0xBA, 0x3C, 0x2D, 0x9C, 0x1C, 0x41, 0x7F, 
                    /* 0030 */    0xB5, 0x4C, 0xF5, 0xD5, 0xD5, 0x80, 0xD4, 0x82, 
                    /* 0038 */    0x41, 0x43, 0x01, 0x01, 0x6D, 0x02, 0xBA, 0x40, 
                    /* 0040 */    0x5D, 0x07, 0x4A, 0xCD, 0x97, 0x10, 0xF7, 0xC5, 
                    /* 0048 */    0x73, 0x47, 0xCA, 0xC9, 0x41, 0x44, 0x0F, 0x01, 
                    /* 0050 */    0x6E, 0xCF, 0xBC, 0x8D, 0xB4, 0x9D, 0x46, 0x0E, 
                    /* 0058 */    0xA3, 0xF2, 0x99, 0xAF, 0xAA, 0xA7, 0x7A, 0x7A, 
                    /* 0060 */    0x41, 0x45, 0x0D, 0x01, 0x6F, 0x21, 0x2A, 0xBD, 
                    /* 0068 */    0xB9, 0x2F, 0x40, 0xA6, 0xB8, 0x07, 0xDD, 0xDB, 
                    /* 0070 */    0xAD, 0x65, 0x68, 0x91, 0x41, 0x46, 0x13, 0x01, 
                    /* 0078 */    0x7A, 0xEC, 0xC3, 0x1E, 0x9B, 0x1E, 0x4A, 0xE7, 
                    /* 0080 */    0x90, 0x26, 0xCF, 0x12, 0x2B, 0x0B, 0xBD, 0x21, 
                    /* 0088 */    0x41, 0x47, 0x12, 0x01, 0x7B, 0x3D, 0x75, 0xA1, 
                    /* 0090 */    0x21, 0xB6, 0x4A, 0xDE, 0xB4, 0x1A, 0x55, 0x71, 
                    /* 0098 */    0x6A, 0x0E, 0xCE, 0x7A, 0x41, 0x48, 0x15, 0x01, 
                    /* 00A0 */    0x7C, 0x3D, 0x75, 0xA1, 0x21, 0xB6, 0x4A, 0xDE, 
                    /* 00A8 */    0xB4, 0x1A, 0x55, 0x71, 0x6A, 0x0E, 0xCE, 0x7A, 
                    /* 00B0 */    0x41, 0x49, 0x08, 0x01, 0x8A, 0xC3, 0x3C, 0x5B, 
                    /* 00B8 */    0xD9, 0x40, 0x45, 0x72, 0x8A, 0xE6, 0x11, 0x45, 
                    /* 00C0 */    0xB7, 0x51, 0xBE, 0x3F, 0xC0, 0x00, 0x01, 0x09
                })
                OperationRegion (EC, EmbeddedControl, Zero, 0x0100)
                Field (EC, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x2D), 
                    T2D0,   1, 
                    T2D1,   4, 
                    T2D5,   3, 
                    TD2E,   8, 
                    TD2F,   8, 
                    TD30,   8, 
                    TD31,   8, 
                    TD32,   8, 
                    TD33,   8, 
                            Offset (0x35), 
                    TD35,   8, 
                    TD36,   8, 
                            Offset (0x38), 
                    TD38,   16, 
                    TD3A,   16, 
                    TD3C,   16, 
                    TD3E,   16, 
                    TD40,   16, 
                    TD42,   16, 
                    TD44,   16, 
                    TD46,   16, 
                    TD48,   16, 
                    TD4A,   16, 
                    TD4C,   16, 
                            Offset (0x50), 
                    TD50,   16, 
                    TD52,   16, 
                    TD54,   16, 
                    TD56,   16, 
                    TD58,   16, 
                    TD5A,   16, 
                    TD5C,   16, 
                    TD5E,   16, 
                    TD60,   16, 
                    TD62,   16, 
                    TD64,   16, 
                            Offset (0x68), 
                    TD68,   8, 
                    TD69,   8, 
                    TD6A,   8, 
                    TD6B,   8, 
                    TD6C,   8, 
                    TD6D,   8, 
                    TD6E,   8, 
                    TD6F,   8, 
                    TD70,   8, 
                    TD71,   8, 
                    TD72,   8, 
                    TD73,   8, 
                    TD74,   8, 
                    TD75,   8, 
                    TD76,   8, 
                    TD77,   8, 
                    TD78,   8, 
                    TD79,   8, 
                            Offset (0x80), 
                    TD80,   8, 
                    TD81,   8, 
                    TD82,   8, 
                    TD83,   8, 
                    TD84,   8, 
                    TD85,   8, 
                    TD86,   8, 
                    TD87,   8, 
                    TD88,   8, 
                    TD89,   8, 
                    TD8A,   8, 
                    TD8B,   8, 
                    TD8C,   8, 
                    TD8D,   8, 
                    TD8E,   8, 
                    TD8F,   8, 
                    TD90,   8, 
                            Offset (0xA0), 
                    TDA0,   8, 
                    TDA1,   8, 
                    TDA2,   8, 
                    TDA3,   8, 
                    TDA4,   8, 
                    TDA5,   8, 
                    TDA6,   8, 
                    TDA7,   8, 
                    TDA8,   8, 
                    TDA9,   8, 
                    TDAA,   8, 
                    TDAB,   8, 
                    TDAC,   8, 
                    TDAD,   8, 
                    TDAE,   8, 
                    TDAF,   8, 
                    TDB0,   8, 
                    TDB1,   8, 
                    TDB2,   8, 
                    TDB3,   8, 
                    TDB4,   8, 
                    TDB5,   8, 
                    TDB6,   8, 
                    TDB7,   8, 
                    TDB8,   8, 
                    TDB9,   8, 
                    TDBA,   8, 
                    TDBB,   8, 
                            Offset (0xC8), 
                    TDC8,   8, 
                    TDC9,   8, 
                    TDCA,   8, 
                    TDCB,   8, 
                    TDCC,   8, 
                    TDCD,   8, 
                    TDCE,   8, 
                    TDCF,   8, 
                            Offset (0xE0), 
                    TDE0,   8, 
                            Offset (0xE3), 
                    TDE3,   8, 
                    TE40,   3, 
                    TE43,   5, 
                    TDE5,   8, 
                    TDE6,   8, 
                    TDE7,   8, 
                    TDE8,   8, 
                    TDE9,   8, 
                            Offset (0xED), 
                    TDED,   8, 
                    TDEE,   8, 
                            Offset (0xF0), 
                    TDF0,   8, 
                    TDF1,   8, 
                    TDF2,   8, 
                    TDF3,   8, 
                    TDF4,   8, 
                    TDF5,   8, 
                    TDF6,   8, 
                    TDF7,   8, 
                    TDF8,   8, 
                    TDF9,   8, 
                    TDFA,   8, 
                    TDFB,   8, 
                    TDFC,   8, 
                    TDFD,   8, 
                    TDFE,   8, 
                    TDFF,   8
                }

                Method (WQAA, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (T2D0, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (T2D1, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (TDEE, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (T2D5, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (TDE5, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (TDE6, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (TDA0, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (TDA1, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (TDA2, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (TDA3, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (TDA4, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (TDA5, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (TDA6, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (TDA7, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (TDA8, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Store (TDA9, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x10))
                    {
                        Store (TDAA, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x11))
                    {
                        Store (TDAB, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x12))
                    {
                        Store (TDAC, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x13))
                    {
                        Store (TDAD, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x14))
                    {
                        Store (TDAE, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x15))
                    {
                        Store (TDAF, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x16))
                    {
                        Store (TDB0, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x17))
                    {
                        Store (TDB1, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x18))
                    {
                        Store (TDB2, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x19))
                    {
                        Store (TDB3, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x1A))
                    {
                        Store (TDB4, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x1B))
                    {
                        Store (TDB5, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x1C))
                    {
                        Store (TDB6, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x1D))
                    {
                        Store (TDB7, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x1E))
                    {
                        Store (TDB8, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x1F))
                    {
                        Store (TDB9, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x20))
                    {
                        Store (TDBA, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x21))
                    {
                        Store (TDBB, Local0)
                        Return (Local0)
                    }
                }

                Method (WQAB, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (TD2E, Local1)
                        Return (Local1)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (TD2F, Local1)
                        Return (Local1)
                    }
                }

                Method (WQAC, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (TD30, Local2)
                        Return (Local2)
                    }
                }

                Method (WQAD, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (TD31, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (TD38, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (TD3A, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (TD3C, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (TD3E, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (TD40, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (TD42, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (TD44, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (TD46, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (TD48, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (TD4A, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (TD4C, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (TDE8, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (TD35, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (TD36, Local0)
                        Return (Local0)
                    }
                }

                Method (WQAE, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (TD32, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (TD50, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (TD52, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (TD54, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (TD56, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (TD58, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (TD5A, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (TD5C, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (TD5E, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (TD60, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (TD62, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (TD64, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (TDE9, Local0)
                        Return (Local0)
                    }
                }

                Method (WQAF, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (TD33, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (TD68, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (TD71, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (TD70, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (TD69, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (TD6A, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (TD6B, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (TD6C, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (TD6D, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (TD6E, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (TD6F, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (TD72, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (TD73, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (TD74, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (TD75, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Store (TD76, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x10))
                    {
                        Store (TD77, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x11))
                    {
                        Store (TD78, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x12))
                    {
                        Store (TD79, Local0)
                        Return (Local0)
                    }
                }

                Method (WQAG, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (TD33, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (TD80, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (TD89, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (TD88, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (TD81, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (TD82, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (TD83, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (TD84, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (TD85, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (TD86, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (TD87, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (TD8A, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (TD8B, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (TD8C, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (TD8D, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Store (TD8E, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x10))
                    {
                        Store (TD8F, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x11))
                    {
                        Store (TD90, Local0)
                        Return (Local0)
                    }
                }

                Method (WQAH, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (TE40, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (TE43, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (TDE7, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (TDF0, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (TDF1, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (TDFE, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (TDFF, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (TDF2, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (TDF3, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (TDF4, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (TDF5, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (TDF6, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (TDF7, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (TDF8, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (TDF9, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Store (TDFA, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x10))
                    {
                        Store (TDFB, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x11))
                    {
                        Store (TDFC, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x12))
                    {
                        Store (TDFD, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x13))
                    {
                        Store (TDE0, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x14))
                    {
                        Store (TDE3, Local0)
                        Return (Local0)
                    }
                }

                Method (WQAI, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (TDCF, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (TDVR, TDCE)
                        Store (TDCE, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (TDCD, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (TDCC, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (TDCB, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (TDCA, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (TDC9, Local0)
                        Return (Local0)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (TDC8, Local0)
                        Return (Local0)
                    }
                }

                Method (WSAA, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, T2D0)
                        Return (T2D0)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, T2D1)
                        Return (T2D1)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, TDEE)
                        Return (TDEE)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, T2D5)
                        Return (T2D5)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, TDE5)
                        Return (TDE5)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, TDE6)
                        Return (TDE6)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (Arg1, TDA0)
                        Return (TDA0)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (Arg1, TDA1)
                        Return (TDA1)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (Arg1, TDA2)
                        Return (TDA2)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (Arg1, TDA3)
                        Return (TDA3)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (Arg1, TDA4)
                        Return (TDA4)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (Arg1, TDA5)
                        Return (TDA5)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (Arg1, TDA6)
                        Return (TDA6)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (Arg1, TDA7)
                        Return (TDA7)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (Arg1, TDA8)
                        Return (TDA8)
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Store (Arg1, TDA9)
                        Return (TDA9)
                    }

                    If (LEqual (Arg0, 0x10))
                    {
                        Store (Arg1, TDAA)
                        Return (TDAA)
                    }

                    If (LEqual (Arg0, 0x11))
                    {
                        Store (Arg1, TDAB)
                        Return (TDAB)
                    }

                    If (LEqual (Arg0, 0x12))
                    {
                        Store (Arg1, TDAC)
                        Return (TDAC)
                    }

                    If (LEqual (Arg0, 0x13))
                    {
                        Store (Arg1, TDAD)
                        Return (TDAD)
                    }

                    If (LEqual (Arg0, 0x14))
                    {
                        Store (Arg1, TDAE)
                        Return (TDAE)
                    }

                    If (LEqual (Arg0, 0x15))
                    {
                        Store (Arg1, TDAF)
                        Return (TDAF)
                    }

                    If (LEqual (Arg0, 0x16))
                    {
                        Store (Arg1, TDB0)
                        Return (TDB0)
                    }

                    If (LEqual (Arg0, 0x17))
                    {
                        Store (Arg1, TDB1)
                        Return (TDB1)
                    }

                    If (LEqual (Arg0, 0x18))
                    {
                        Store (Arg1, TDB2)
                        Return (TDB2)
                    }

                    If (LEqual (Arg0, 0x19))
                    {
                        Store (Arg1, TDB3)
                        Return (TDB3)
                    }

                    If (LEqual (Arg0, 0x1A))
                    {
                        Store (Arg1, TDB4)
                        Return (TDB4)
                    }

                    If (LEqual (Arg0, 0x1B))
                    {
                        Store (Arg1, TDB5)
                        Return (TDB5)
                    }

                    If (LEqual (Arg0, 0x1C))
                    {
                        Store (Arg1, TDB6)
                        Return (TDB6)
                    }

                    If (LEqual (Arg0, 0x1D))
                    {
                        Store (Arg1, TDB7)
                        Return (TDB7)
                    }

                    If (LEqual (Arg0, 0x1E))
                    {
                        Store (Arg1, TDB8)
                        Return (TDB8)
                    }

                    If (LEqual (Arg0, 0x1F))
                    {
                        Store (Arg1, TDB9)
                        Return (TDB9)
                    }

                    If (LEqual (Arg0, 0x20))
                    {
                        Store (Arg1, TDBA)
                        Return (TDBA)
                    }

                    If (LEqual (Arg0, 0x21))
                    {
                        Store (Arg1, TDBB)
                        Return (TDBB)
                    }
                }

                Method (WSAB, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, TD2E)
                        Return (TD2E)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, TD2F)
                        Return (TD2F)
                    }
                }

                Method (WSAC, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, TD30)
                        Return (TD30)
                    }
                }

                Method (WSAD, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, TD31)
                        Return (TD31)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, TD38)
                        Return (TD38)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, TD3A)
                        Return (TD3A)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, TD3C)
                        Return (TD3C)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, TD3E)
                        Return (TD3E)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, TD40)
                        Return (TD40)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (Arg1, TD42)
                        Return (TD42)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (Arg1, TD44)
                        Return (TD44)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (Arg1, TD46)
                        Return (TD46)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (Arg1, TD48)
                        Return (TD48)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (Arg1, TD4A)
                        Return (TD4A)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (Arg1, TD4C)
                        Return (TD4C)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (Arg1, TDE8)
                        Return (TDE8)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (Arg1, TD35)
                        Return (TD35)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (Arg1, TD36)
                        Return (TD36)
                    }
                }

                Method (WSAE, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, TD32)
                        Return (TD32)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, TD50)
                        Return (TD50)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, TD52)
                        Return (TD52)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, TD54)
                        Return (TD54)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, TD56)
                        Return (TD56)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, TD58)
                        Return (TD58)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (Arg1, TD5A)
                        Return (TD5A)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (Arg1, TD5C)
                        Return (TD5C)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (Arg1, TD5E)
                        Return (TD5E)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (Arg1, TD60)
                        Return (TD60)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (Arg1, TD62)
                        Return (TD62)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (Arg1, TD64)
                        Return (TD64)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (Arg1, TDE9)
                        Return (TDE9)
                    }
                }

                Method (WSAF, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, TD33)
                        Return (TD33)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, TD68)
                        Return (TD68)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, TD71)
                        Return (TD71)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, TD70)
                        Return (TD70)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, TD69)
                        Return (TD69)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, TD6A)
                        Return (TD6A)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (Arg1, TD6B)
                        Return (TD6B)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (Arg1, TD6C)
                        Return (TD6C)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (Arg1, TD6D)
                        Return (TD6D)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (Arg1, TD6E)
                        Return (TD6E)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (Arg1, TD6F)
                        Return (TD6F)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (Arg1, TD72)
                        Return (TD72)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (Arg1, TD73)
                        Return (TD73)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (Arg1, TD74)
                        Return (TD74)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (Arg1, TD75)
                        Return (TD75)
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Store (Arg1, TD76)
                        Return (TD76)
                    }

                    If (LEqual (Arg0, 0x10))
                    {
                        Store (Arg1, TD77)
                        Return (TD77)
                    }

                    If (LEqual (Arg0, 0x11))
                    {
                        Store (Arg1, TD78)
                        Return (TD78)
                    }

                    If (LEqual (Arg0, 0x12))
                    {
                        Store (Arg1, TD79)
                        Return (TD79)
                    }
                }

                Method (WSAG, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, TD33)
                        Return (TD33)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, TD80)
                        Return (TD80)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, TD89)
                        Return (TD89)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, TD88)
                        Return (TD88)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, TD81)
                        Return (TD81)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, TD82)
                        Return (TD82)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (Arg1, TD83)
                        Return (TD83)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (Arg1, TD84)
                        Return (TD84)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (Arg1, TD85)
                        Return (TD85)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (Arg1, TD86)
                        Return (TD86)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (Arg1, TD87)
                        Return (TD87)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (Arg1, TD8A)
                        Return (TD8A)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (Arg1, TD8B)
                        Return (TD8B)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (Arg1, TD8C)
                        Return (TD8C)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (Arg1, TD8D)
                        Return (TD8D)
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Store (Arg1, TD8E)
                        Return (TD8E)
                    }

                    If (LEqual (Arg0, 0x10))
                    {
                        Store (Arg1, TD8F)
                        Return (TD8F)
                    }

                    If (LEqual (Arg0, 0x11))
                    {
                        Store (Arg1, TD90)
                        Return (TD90)
                    }
                }

                Method (WSAH, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, TE40)
                        Return (TE40)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, TE43)
                        Return (TE43)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, TDE7)
                        Return (TDE7)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, TDF0)
                        Return (TDF0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, TDF1)
                        Return (TDF1)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, TDFE)
                        Return (TDFE)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (Arg1, TDFF)
                        Return (TDFF)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (Arg1, TDF2)
                        Return (TDF2)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (Arg1, TDF3)
                        Return (TDF3)
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Store (Arg1, TDF4)
                        Return (TDF4)
                    }

                    If (LEqual (Arg0, 0x0A))
                    {
                        Store (Arg1, TDF5)
                        Return (TDF5)
                    }

                    If (LEqual (Arg0, 0x0B))
                    {
                        Store (Arg1, TDF6)
                        Return (TDF6)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (Arg1, TDF7)
                        Return (TDF7)
                    }

                    If (LEqual (Arg0, 0x0D))
                    {
                        Store (Arg1, TDF8)
                        Return (TDF8)
                    }

                    If (LEqual (Arg0, 0x0E))
                    {
                        Store (Arg1, TDF9)
                        Return (TDF9)
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Store (Arg1, TDFA)
                        Return (TDFA)
                    }

                    If (LEqual (Arg0, 0x10))
                    {
                        Store (Arg1, TDFB)
                        Return (TDFB)
                    }

                    If (LEqual (Arg0, 0x11))
                    {
                        Store (Arg1, TDFC)
                        Return (TDFC)
                    }

                    If (LEqual (Arg0, 0x12))
                    {
                        Store (Arg1, TDFD)
                        Return (TDFD)
                    }

                    If (LEqual (Arg0, 0x13))
                    {
                        Store (Arg1, TDE0)
                        Return (TDE0)
                    }

                    If (LEqual (Arg0, 0x14))
                    {
                        Store (Arg1, TDE3)
                        Return (TDE3)
                    }
                }

                Method (WSAI, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, TDCF)
                        Return (TDCF)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, TDCE)
                        Return (TDCE)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (Arg1, TDCD)
                        Return (TDCD)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, TDCC)
                        Return (TDCC)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, TDCB)
                        Return (TDCB)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, TDCA)
                        Return (TDCA)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (Arg1, TDC9)
                        Return (TDC9)
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (Arg1, TDC8)
                        Return (TDC8)
                    }
                }

                Method (_WED, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0xC0))
                    {
                        Store (TDEE, Local1)
                        Store (Local1, DBG8)
                        Store (Zero, TDEE)
                        Return (Local1)
                    }
                }
            }
        }
    }

    Name (_S0, Package (0x04)
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.NPTS (Arg0)
            \_SB.PCI0.SBRG.SPTS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.NWAK (Arg0)
        \_SB.PCI0.SBRG.SWAK (Arg0)
    }
}

