;**************************************************************************
; Subroutines
;**************************************************************************
	
Initialise_values 
	clrf	x_k
	clrf	x_klow
	clrf	x_khigh
	return
	
;Step 1	
PROCESS_INPUT ;Sign extension
	movf	x_k,W		    ; Loading the 8 bit value
	movwf	x_k_low
	
	;sign extension
	btfsc	x_k_low,7
	goto	NEGATIVE_INPUT
	goto	POSITIVE_INPUT
	
NEGATIVE_INPUT
	movlw	0xFF
	movwf	x_k_high
	return
	
POSITIVE_INPUT
	clrf	x_k_high
	return
	
;Step 2
SCALE_INPUT ;Input scaling  
	bcf	STATUS,C	   ; Clear carry (x2)
	rlf	x_k_low,1
	rlf	x_k_high,1
	
	bcf	STATUS,C	   ; Clear carry (x2)
	rlf	x_k_low,1
	rlf	x_k_high,1
	return
