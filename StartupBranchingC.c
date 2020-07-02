void main() {
    if ((Checksum_Complete == TRUE) && (StartUpTmr == EXPIRED))
        {
            if ((*ResetVector != 0xFFFF)    &&          // Does app reset vector exist?
            (Status != 'B')                 &&          // EEPROM status set?
            (Bool_ToolPresent != TRUE)      &&          // Tool present?
            (Checksum_Valid != FALSE))                  // Checksum valid?
            {
                App_LoadImage();
            }
            else
            {
                Boot_LoadImage();
            }
        }
        return 0;
}