DefinitionBlock ("", "SSDT", 1, "AMD", "GPU", 0x00000000)
{
    External (_SB_.XXXX.XXXX, DeviceObj)    // (from opcode)   
    External (EGPS, IntObj)    // (from opcode)

    Scope (_SB_.XXXX.XXXX)
    {
        Device (GFX0)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (ATIB, Buffer (0x0100){})
            Method (ATIF, 2, Serialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (AF00 ())
                }

                If (LEqual (Arg0, One))
                {
                    Return (AF01 ())
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (AF02 ())
                }
                Else
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateWordField (ATIB, 0x02, VERN)
                    CreateDWordField (ATIB, 0x04, NMSK)
                    CreateDWordField (ATIB, 0x08, SFUN)
                    Store (Zero, SSZE)
                    Store (Zero, VERN)
                    Store (Zero, NMSK)
                    Store (Zero, SFUN)
                    Return (ATIB)
                }
            }

            Method (AF00, 0, NotSerialized)
            {
                CreateWordField (ATIB, Zero, SSZE)
                CreateWordField (ATIB, 0x02, VERN)
                CreateDWordField (ATIB, 0x04, NMSK)
                CreateDWordField (ATIB, 0x08, SFUN)
                Store (0x0C, SSZE)
                Store (One, VERN)
                Store (0x0C, NMSK)
                Store (0x03, SFUN)
                Return (ATIB)
            }

            Method (AF01, 0, NotSerialized)
            {
                CreateWordField (ATIB, Zero, SSZE)
                CreateDWordField (ATIB, 0x02, VMSK)
                CreateDWordField (ATIB, 0x06, FLGS)
                Store (0x0A, SSZE)
                Store (0x03, VMSK)
                Store (One, FLGS)
                Return (ATIB)
            }

            Method (AF02, 0, NotSerialized)
            {
                CreateWordField (ATIB, Zero, SSZE)
                CreateDWordField (ATIB, 0x02, PSBI)
                CreateByteField (ATIB, 0x09, FPWR)
                CreateByteField (ATIB, 0x0A, FPID)
                Store (0x0D, SSZE)
                Store (0x08, PSBI)
                Store (Zero, FPWR)
                Store (EGPS, FPID)
                Return (ATIB)
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x69, 
                    0x03
                })
            }

            OperationRegion (PEGH, PCI_Config, Zero, 0x40)
            Field (PEGH, ByteAcc, NoLock, Preserve)
            {
                VID0,   16, 
                DID0,   16, 
                GCMD,   8, 
                Offset (0x24), 
                BAR4,   32
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package ()
                    {
                        "built-in", 
                        Buffer (One)
                        {
                             0x00                                           
                        }, 

                        "AAPL,slot-name", 
                        Buffer ()
                        {
                            "Internal@0,3,1/0,0" // Get this Value in MacOS
                        }, 

                        "@0,AAPL,boot-display", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                         
                        },

                        "device-id", 
                        Buffer (0x04)
                        {
                             0xFF, 0x67, 0x00, 0x00                         
                        }, 

                        "no-gfx-spoof", 
                        Buffer (0x04)
                        {
                             0x00, 0x01, 0x00, 0x00                         
                        }, 

                        "ATY,DeviceID", 
                        Buffer (0x02)
                        {
                             0xFF, 0x67                         
                        },  

                        "model", 
                        Buffer ()
                        {
                            "AMD Radeon RX 550"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }

            Return (0x80000002)
        }
    }

    Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
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
}