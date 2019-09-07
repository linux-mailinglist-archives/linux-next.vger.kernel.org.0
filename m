Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67576AC616
	for <lists+linux-next@lfdr.de>; Sat,  7 Sep 2019 12:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732058AbfIGKcy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 Sep 2019 06:32:54 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42560 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731676AbfIGKcy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 7 Sep 2019 06:32:54 -0400
Received: by mail-ot1-f66.google.com with SMTP id c10so8140261otd.9
        for <linux-next@vger.kernel.org>; Sat, 07 Sep 2019 03:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b/cX7xITRlwawwj8ZZAOJ/YBqGb0dFQASFM/0pTz2tk=;
        b=IAcvYCxB9Y3lVd1dPhXunwMoEDwpz4gg8XVqE56TpNAUSsOCUeuEFcSpt6hKnNhR1R
         yNLrn5ZooPklEbP+DfaHCUNl9mMiqyV/EKvJEhC2SCwXESng+X82fWXjAnPLtWRtgtUn
         IRASeKFCB/qyD3FWtmQtDzUpKZzjzuCrADoV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b/cX7xITRlwawwj8ZZAOJ/YBqGb0dFQASFM/0pTz2tk=;
        b=izZyYQrOdpPYegSh5Cf92sB72hMrj/tx3FCrS+aCifyJTrKgO/1YbW3fecueAEMNAa
         LEQLk+LL1LKAeRSs47SyxDGEfs6V3M0Z1lgs4AZ/4o+CTvs220pPcXD5NAgFazOASog7
         bGvXetnDueV6npGe+JKSmWoMJABGcmoaablEfBPvt526iChRM7pqmIxJ9nbh82kf1IOK
         UA5tZfZwPBangycFYLPJ0Sd0/RrJKDHTWnqaZASAzNth3IrNX66mL4gKZVDawOcZ6dK+
         TU23BYA3IpjucUxRqxPymetmXyFviIWetB9YUqCtpoEECpJ8kToHeYQaxl9aEDIROd7P
         lzjg==
X-Gm-Message-State: APjAAAUfBzcU7EKM4o7FMNOXaOWZ6ZuhRQ1IrCyzmmR/sRABR9cxmCId
        GvPE5JUelOP+HVm9cB57v9vccVOaA1Ho7s2PLEKW+g==
X-Google-Smtp-Source: APXvYqyVoNQgJNSVxxO4W3K/xguX20n0h0ihJY8BhZ+1HPnwkcskYodYDNcREPZNQLxNM7GZkCySZwZwTYcEzEqbzMc=
X-Received: by 2002:a05:6830:10d8:: with SMTP id z24mr218837oto.281.1567852372299;
 Sat, 07 Sep 2019 03:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190907090534.GB1712@pc-sasha.localdomain>
In-Reply-To: <20190907090534.GB1712@pc-sasha.localdomain>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Sat, 7 Sep 2019 12:32:41 +0200
Message-ID: <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
To:     Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-next <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Sep 7, 2019 at 11:05 AM Alexander Kapshuk
<alexander.kapshuk@gmail.com> wrote:
>
> To Whom It May Concern
>
> Every kernel I have built since 5.3.0-rc2-next-20190730 and up to
> 5.3.0-rc7-next-20190903 has resulted in the kernel panic described below.
>
> The panic occurs early on in the boot process, so no records of it get
> written on disk. I resourted to taking photos and videos to get the info
> for debugging.
>
> [Kernel panic]
> Code: 00 48 83 bb f0 00 00 00 00 74 16 48 83 c3 18 b9 17 00 00 00 31 c0 48 89 df f3 48 ab 5b 41 5c 5d c3 4c 89 a3 f0 00 00 00 eb e1 <0f> 0b 0f 1f 40 00 55 48 89 e5 41 54 49 89 d4 53 48 89 f3 e8 7e ff
>
> Kernel panic - Not syncing: Attempted to kill init! exitcode=0x0000000b.
>
> Top of call stack:
> __drm_fb_helper_initial_config_and_unlock
> drm_fb_helper_initial_config
>
> <scripts/decodecode <~/tmp/panic_code.txt
> Code: 00 48 83 bb f0 00 00 00 00 74 16 48 83 c3 18 b9 17 00 00 00 31 c0 48 89 df f3 48 ab 5b 41 5c 5d c3 4c 89 a3 f0 00 00 00 eb e1 <0f> 0b 0f 1f 40 00 55 48 89 e5 41 54 49 89 d4 53 48 89 f3 e8 7e ff
> All code
> ========
>    0:   00 48 83                add    %cl,-0x7d(%rax)
>    3:   bb f0 00 00 00          mov    $0xf0,%ebx
>    8:   00 74 16 48             add    %dh,0x48(%rsi,%rdx,1)
>    c:   83 c3 18                add    $0x18,%ebx
>    f:   b9 17 00 00 00          mov    $0x17,%ecx
>   14:   31 c0                   xor    %eax,%eax
>   16:   48 89 df                mov    %rbx,%rdi
>   19:   f3 48 ab                rep stos %rax,%es:(%rdi)
>   1c:   5b                      pop    %rbx
>   1d:   41 5c                   pop    %r12
>   1f:   5d                      pop    %rbp
>   20:   c3                      retq
>   21:   4c 89 a3 f0 00 00 00    mov    %r12,0xf0(%rbx)
>   28:   eb e1                   jmp    0xb
>   2a:*  0f 0b                   ud2             <-- trapping instruction
>   2c:   0f 1f 40 00             nopl   0x0(%rax)
>   30:   55                      push   %rbp
>   31:   48 89 e5                mov    %rsp,%rbp
>   34:   41 54                   push   %r12
>   36:   49 89 d4                mov    %rdx,%r12
>   39:   53                      push   %rbx
>   3a:   48 89 f3                mov    %rsi,%rbx
>   3d:   e8                      .byte 0xe8
>   3e:   7e ff                   jle    0x3f
>
> Code starting with the faulting instruction
> ===========================================
>    0:   0f 0b                   ud2
>    2:   0f 1f 40 00             nopl   0x0(%rax)
>    6:   55                      push   %rbp
>    7:   48 89 e5                mov    %rsp,%rbp
>    a:   41 54                   push   %r12
>    c:   49 89 d4                mov    %rdx,%r12
>    f:   53                      push   %rbx
>   10:   48 89 f3                mov    %rsi,%rbx
>   13:   e8                      .byte 0xe8
>   14:   7e ff                   jle    0x15
>
> The panic occurs after the 'Driver supports precise vblank timestamp
> query.' line gets printed to console:
> [    2.858970] Linux agpgart interface v0.103
> [    2.859308] nouveau 0000:01:00.0: NVIDIA G84 (084300a2)
> [    2.968950] nouveau 0000:01:00.0: bios: version 60.84.68.00.19
> [    2.989923] nouveau 0000:01:00.0: bios: M0203T not found
> [    2.990010] nouveau 0000:01:00.0: bios: M0203E not matched!
> [    2.990096] nouveau 0000:01:00.0: fb: 512 MiB DDR2
> [    3.062362] [TTM] Zone  kernel: Available graphics memory: 2015014 KiB
> [    3.062494] [TTM] Initializing pool allocator
> [    3.062581] [TTM] Initializing DMA pool allocator
> [    3.062683] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
> [    3.062769] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> [    3.062859] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [    3.062944] nouveau 0000:01:00.0: DRM: DCB version 4.0
> [    3.063030] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000028
> [    3.063117] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00000030
> [    3.063203] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011310 00000028
> [    3.063290] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011312 00c000b0
> [    3.063377] nouveau 0000:01:00.0: DRM: DCB conn 00: 1030
> [    3.063462] nouveau 0000:01:00.0: DRM: DCB conn 01: 2130
> [    3.065982] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
> [    3.066622] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    3.066754] [drm] Driver supports precise vblank timestamp query.
>
> I was not able to capture the value of RIP for this crash.
>
> With drm_kms_helper.fbdev_emulation=0 enabled, as documented in
> the commentary to function drm_fb_helper_initial_config defined in
> drivers/gpu/drm/drm_fb_helper.c, I get the following output:
>
> RIP: 0010: _raw_spin_lock+0x7/0x20
> Code: ba ff 00 00 00 f0 0f b1 17 75 01 c3 55 48 89 e5 e8 23 a2 6d ff 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 31 c0 ba 01 00 00 00 <f0> 0f b1 17 75 01 c3 55 89 c6 40 89 e5 e8 e7 8f 6d ff 5d c3 0f 1f
>
> <scripts/decodecode <~/tmp/panic_code.txt
> Code: ba ff 00 00 00 f0 0f b1 17 75 01 c3 55 48 89 e5 e8 23 a2 6d ff 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 31 c0 ba 01 00 00 00 <f0> 0f b1 17 75 01 c3 55 89 c6 40 89 e5 e8 e7 8f 6d ff 5d c3 0f 1f
> All code
> ========
>    0:   ba ff 00 00 00          mov    $0xff,%edx
>    5:   f0 0f b1 17             lock cmpxchg %edx,(%rdi)
>    9:   75 01                   jne    0xc
>    b:   c3                      retq
>    c:   55                      push   %rbp
>    d:   48 89 e5                mov    %rsp,%rbp
>   10:   e8 23 a2 6d ff          callq  0xffffffffff6da238
>   15:   5d                      pop    %rbp
>   16:   c3                      retq
>   17:   66 66 2e 0f 1f 84 00    data16 nopw %cs:0x0(%rax,%rax,1)
>   1e:   00 00 00 00
>   22:   90                      nop
>   23:   31 c0                   xor    %eax,%eax
>   25:   ba 01 00 00 00          mov    $0x1,%edx
>   2a:*  f0 0f b1 17             lock cmpxchg %edx,(%rdi)                <-- trapping instruction
>   2e:   75 01                   jne    0x31
>   30:   c3                      retq
>   31:   55                      push   %rbp
>   32:   89 c6                   mov    %eax,%esi
>   34:   40 89 e5                rex mov %esp,%ebp
>   37:   e8 e7 8f 6d ff          callq  0xffffffffff6d9023
>   3c:   5d                      pop    %rbp
>   3d:   c3                      retq
>   3e:   0f                      .byte 0xf
>   3f:   1f                      (bad)
>
> Code starting with the faulting instruction
> ===========================================
>    0:   f0 0f b1 17             lock cmpxchg %edx,(%rdi)
>    4:   75 01                   jne    0x7
>    6:   c3                      retq
>    7:   55                      push   %rbp
>    8:   89 c6                   mov    %eax,%esi
>    a:   40 89 e5                rex mov %esp,%ebp
>    d:   e8 e7 8f 6d ff          callq  0xffffffffff6d8ff9
>   12:   5d                      pop    %rbp
>   13:   c3                      retq
>   14:   0f                      .byte 0xf
>   15:   1f                      (bad)
>
> (gdb) list *(_raw_spin_lock+0x7)
> 0xffffffff81a13b27 is in _raw_spin_lock (./arch/x86/include/asm/atomic.h:200).
> 195     }
> 196
> 197     #define arch_atomic_try_cmpxchg arch_atomic_try_cmpxchg
> 198     static __always_inline bool arch_atomic_try_cmpxchg(atomic_t *v, int *old, int new)
> 199     {
> 200             return try_cmpxchg(&v->counter, old, new);
> 201     }
> 202
> 203     static inline int arch_atomic_xchg(atomic_t *v, int new)
> 204     {
>
> (gdb) disassemble _raw_spin_lock+0x7
> Dump of assembler code for function _raw_spin_lock:
>    0xffffffff81a13b20 <+0>:     xor    %eax,%eax
>    0xffffffff81a13b22 <+2>:     mov    $0x1,%edx
>    0xffffffff81a13b27 <+7>:     lock cmpxchg %edx,(%rdi)
>    0xffffffff81a13b2b <+11>:    jne    0xffffffff81a13b2e <_raw_spin_lock+14>
>    0xffffffff81a13b2d <+13>:    retq
>    0xffffffff81a13b2e <+14>:    push   %rbp
>    0xffffffff81a13b2f <+15>:    mov    %eax,%esi
>    0xffffffff81a13b31 <+17>:    mov    %rsp,%rbp
>    0xffffffff81a13b34 <+20>:    callq  0xffffffff810ecb20 <queued_spin_lock_slowpath>
>    0xffffffff81a13b39 <+25>:    pop    %rbp
>    0xffffffff81a13b3a <+26>:    retq
> End of assembler dump.
>
> Any pointers on how to proceed with this would be appreciated.
> See the files attached for copies of my .config and output of ver_linux.

Lotta people are travelling to plumbers now for next week, so might be
slow responses. One option would be to try to bisect where things
broke. You've collected a lot of data here painstakingly, but from
looking at it I'm not really connecting the docs. Knowing which change
broke your machine can help enormously.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
