global GetAVX512Capability
global GetAVXCapability
global GetSSECapability
global GetAVX512fp16
global Getfp16c

section .text


; Checks CPUID for AVX capability
GetAVXCapability:
        push rbx
        
        mov eax, 1
        cpuid

        mov eax, ecx
        shr eax, 28             ; Read bit 28
        and eax, 1

        pop rbx
        ret


; Checks CPUID for SSE capability
GetSSECapability:
        push rbx

        mov eax, 1
        cpuid

        mov eax, edx
        shr eax, 25             ; Read bit 25
        and eax, 1

        pop rbx
        ret

; Checks CPUID for AVX512 capability
GetAVX512Capability:
        push rbx

        mov eax, 7
	xor ecx, ecx
        cpuid

        mov eax, ebx
        shr eax, 16             ; Read bit 16
        and eax, 1

        pop rbx
        ret

; Checks CPUID for AVX512-fp16 capability
GetAVX512fp16:
        push rbx

        mov eax, 7
        xor ecx, ecx
        cpuid

        mov eax, edx
        shr eax, 23             ; Read bit 23 of register edx
        and eax, 1

        pop rbx
        ret

Getfp16c:
        push rbx

        mov eax, 1
        xor ecx, ecx
        cpuid

        mov eax, ecx
        shr eax, 29             ; Read bit 29 of register ecx
        and eax, 1

        pop rbx
        ret

