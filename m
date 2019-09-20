Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF328B97FD
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2019 21:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729727AbfITTsb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 15:48:31 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34482 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbfITTsa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2019 15:48:30 -0400
Received: by mail-ot1-f67.google.com with SMTP id m19so5347555otp.1
        for <linux-next@vger.kernel.org>; Fri, 20 Sep 2019 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=og0SAcAm7by0+Sipwwl3x57plCu0D9hNfYqiov7BLF0=;
        b=MAokO+F7QJ5KdpSZxObaJZcfEYx0JWPb9WvK1R5Dx1gyFih9QeDkWu5vUdPaBC7eio
         Y0JA8993yUiNQUS/VWmaZVNYBXIDoieg0EfYtt46hdjzk17OwtEA43YPVCXfXOGuWaKE
         AbidOb1IaFGvoRrJesR0L2fr9cEYzvRBVcMWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=og0SAcAm7by0+Sipwwl3x57plCu0D9hNfYqiov7BLF0=;
        b=Hk69lA6eaXob/bTAhDwlS37FNm9lwtomitS1rBwuAAViR/v/1XRzI3P+griFjqsRw7
         I8tVPLkdLDv+BdeRjMvDHKVyDjkI7NpkHHtV0HYt1iCoBDAgKQ/r2H18fHzhQuy9LO/T
         PdjmI+beGtAD2r9+AGX/+L5sf+Og9Qr/MbRz52vAII112BeVQmfKCc672lG72IOBJ21O
         0kh4JrGBrDfauYhRObpvQU0DF1qO4ELhX7JiWVE3bGuj6qGxZb4WeiwqzGRb/qr78VTr
         h5kW0HYmFpbQu444mYKWJgirFMul15u6ceQlWm6bd+XQaAyrVihuZ1UPIcnUh3epFCTt
         kspQ==
X-Gm-Message-State: APjAAAVAgXSsZuz0W/MiHb35S9VnzpGNYxBlHHV8S6sNGXU+hXwzvNRW
        KV3bn6/qSdGc3I3pvfi1gvPLblS5cSG/awiPYiRDow==
X-Google-Smtp-Source: APXvYqwxffRv9UmwZs5ES6A5fSIrPOquucfzTxpta1SD+bk+5ahundKXgUxCxS2af1D/8e0KKrX6QjUVwTnDgpoWaLw=
X-Received: by 2002:a9d:404:: with SMTP id 4mr13355623otc.204.1569008907823;
 Fri, 20 Sep 2019 12:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190907090534.GB1712@pc-sasha.localdomain> <20190920194450.GA3970@pc-sasha.localdomain>
In-Reply-To: <20190920194450.GA3970@pc-sasha.localdomain>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 20 Sep 2019 21:48:17 +0200
Message-ID: <CAKMK7uECOW2YigBe7aeCDPYXoXJ8TVh65xvKBjJXXRt5Y7HngA@mail.gmail.com>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
To:     Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-next <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Adding Gerd and Christian.
-Daniel

On Fri, Sep 20, 2019 at 9:44 PM Alexander Kapshuk
<alexander.kapshuk@gmail.com> wrote:
>
> On Sat, Sep 07, 2019 at 12:05:34PM +0300, Alexander Kapshuk wrote:
> > To Whom It May Concern
> >
> > Every kernel I have built since 5.3.0-rc2-next-20190730 and up to
> > 5.3.0-rc7-next-20190903 has resulted in the kernel panic described belo=
w.
> >
> > The panic occurs early on in the boot process, so no records of it get
> > written on disk. I resourted to taking photos and videos to get the inf=
o
> > for debugging.
> >
> > [Kernel panic]
> > Code: 00 48 83 bb f0 00 00 00 00 74 16 48 83 c3 18 b9 17 00 00 00 31 c0=
 48 89 df f3 48 ab 5b 41 5c 5d c3 4c 89 a3 f0 00 00 00 eb e1 <0f> 0b 0f 1f =
40 00 55 48 89 e5 41 54 49 89 d4 53 48 89 f3 e8 7e ff
> >
> > Kernel panic - Not syncing: Attempted to kill init! exitcode=3D0x000000=
0b.
> >
> > Top of call stack:
> > __drm_fb_helper_initial_config_and_unlock
> > drm_fb_helper_initial_config
> >
> > <scripts/decodecode <~/tmp/panic_code.txt
> > Code: 00 48 83 bb f0 00 00 00 00 74 16 48 83 c3 18 b9 17 00 00 00 31 c0=
 48 89 df f3 48 ab 5b 41 5c 5d c3 4c 89 a3 f0 00 00 00 eb e1 <0f> 0b 0f 1f =
40 00 55 48 89 e5 41 54 49 89 d4 53 48 89 f3 e8 7e ff
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0: 00 48 83                add    %cl,-0x7d(%rax)
> >    3: bb f0 00 00 00          mov    $0xf0,%ebx
> >    8: 00 74 16 48             add    %dh,0x48(%rsi,%rdx,1)
> >    c: 83 c3 18                add    $0x18,%ebx
> >    f: b9 17 00 00 00          mov    $0x17,%ecx
> >   14: 31 c0                   xor    %eax,%eax
> >   16: 48 89 df                mov    %rbx,%rdi
> >   19: f3 48 ab                rep stos %rax,%es:(%rdi)
> >   1c: 5b                      pop    %rbx
> >   1d: 41 5c                   pop    %r12
> >   1f: 5d                      pop    %rbp
> >   20: c3                      retq
> >   21: 4c 89 a3 f0 00 00 00    mov    %r12,0xf0(%rbx)
> >   28: eb e1                   jmp    0xb
> >   2a:*        0f 0b                   ud2             <-- trapping inst=
ruction
> >   2c: 0f 1f 40 00             nopl   0x0(%rax)
> >   30: 55                      push   %rbp
> >   31: 48 89 e5                mov    %rsp,%rbp
> >   34: 41 54                   push   %r12
> >   36: 49 89 d4                mov    %rdx,%r12
> >   39: 53                      push   %rbx
> >   3a: 48 89 f3                mov    %rsi,%rbx
> >   3d: e8                      .byte 0xe8
> >   3e: 7e ff                   jle    0x3f
> >
> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0: 0f 0b                   ud2
> >    2: 0f 1f 40 00             nopl   0x0(%rax)
> >    6: 55                      push   %rbp
> >    7: 48 89 e5                mov    %rsp,%rbp
> >    a: 41 54                   push   %r12
> >    c: 49 89 d4                mov    %rdx,%r12
> >    f: 53                      push   %rbx
> >   10: 48 89 f3                mov    %rsi,%rbx
> >   13: e8                      .byte 0xe8
> >   14: 7e ff                   jle    0x15
> >
> > The panic occurs after the 'Driver supports precise vblank timestamp
> > query.' line gets printed to console:
> > [    2.858970] Linux agpgart interface v0.103
> > [    2.859308] nouveau 0000:01:00.0: NVIDIA G84 (084300a2)
> > [    2.968950] nouveau 0000:01:00.0: bios: version 60.84.68.00.19
> > [    2.989923] nouveau 0000:01:00.0: bios: M0203T not found
> > [    2.990010] nouveau 0000:01:00.0: bios: M0203E not matched!
> > [    2.990096] nouveau 0000:01:00.0: fb: 512 MiB DDR2
> > [    3.062362] [TTM] Zone  kernel: Available graphics memory: 2015014 K=
iB
> > [    3.062494] [TTM] Initializing pool allocator
> > [    3.062581] [TTM] Initializing DMA pool allocator
> > [    3.062683] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
> > [    3.062769] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> > [    3.062859] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> > [    3.062944] nouveau 0000:01:00.0: DRM: DCB version 4.0
> > [    3.063030] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 0000002=
8
> > [    3.063117] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 0000003=
0
> > [    3.063203] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011310 0000002=
8
> > [    3.063290] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011312 00c000b=
0
> > [    3.063377] nouveau 0000:01:00.0: DRM: DCB conn 00: 1030
> > [    3.063462] nouveau 0000:01:00.0: DRM: DCB conn 01: 2130
> > [    3.065982] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer co=
pies
> > [    3.066622] [drm] Supports vblank timestamp caching Rev 2 (21.10.201=
3).
> > [    3.066754] [drm] Driver supports precise vblank timestamp query.
> >
> > I was not able to capture the value of RIP for this crash.
> >
> > With drm_kms_helper.fbdev_emulation=3D0 enabled, as documented in
> > the commentary to function drm_fb_helper_initial_config defined in
> > drivers/gpu/drm/drm_fb_helper.c, I get the following output:
> >
> > RIP: 0010: _raw_spin_lock+0x7/0x20
> > Code: ba ff 00 00 00 f0 0f b1 17 75 01 c3 55 48 89 e5 e8 23 a2 6d ff 5d=
 c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 31 c0 ba 01 00 00 00 <f0> 0f b1 17 =
75 01 c3 55 89 c6 40 89 e5 e8 e7 8f 6d ff 5d c3 0f 1f
> >
> > <scripts/decodecode <~/tmp/panic_code.txt
> > Code: ba ff 00 00 00 f0 0f b1 17 75 01 c3 55 48 89 e5 e8 23 a2 6d ff 5d=
 c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 31 c0 ba 01 00 00 00 <f0> 0f b1 17 =
75 01 c3 55 89 c6 40 89 e5 e8 e7 8f 6d ff 5d c3 0f 1f
> > All code
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >    0: ba ff 00 00 00          mov    $0xff,%edx
> >    5: f0 0f b1 17             lock cmpxchg %edx,(%rdi)
> >    9: 75 01                   jne    0xc
> >    b: c3                      retq
> >    c: 55                      push   %rbp
> >    d: 48 89 e5                mov    %rsp,%rbp
> >   10: e8 23 a2 6d ff          callq  0xffffffffff6da238
> >   15: 5d                      pop    %rbp
> >   16: c3                      retq
> >   17: 66 66 2e 0f 1f 84 00    data16 nopw %cs:0x0(%rax,%rax,1)
> >   1e: 00 00 00 00
> >   22: 90                      nop
> >   23: 31 c0                   xor    %eax,%eax
> >   25: ba 01 00 00 00          mov    $0x1,%edx
> >   2a:*        f0 0f b1 17             lock cmpxchg %edx,(%rdi)         =
       <-- trapping instruction
> >   2e: 75 01                   jne    0x31
> >   30: c3                      retq
> >   31: 55                      push   %rbp
> >   32: 89 c6                   mov    %eax,%esi
> >   34: 40 89 e5                rex mov %esp,%ebp
> >   37: e8 e7 8f 6d ff          callq  0xffffffffff6d9023
> >   3c: 5d                      pop    %rbp
> >   3d: c3                      retq
> >   3e: 0f                      .byte 0xf
> >   3f: 1f                      (bad)
> >
> > Code starting with the faulting instruction
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >    0: f0 0f b1 17             lock cmpxchg %edx,(%rdi)
> >    4: 75 01                   jne    0x7
> >    6: c3                      retq
> >    7: 55                      push   %rbp
> >    8: 89 c6                   mov    %eax,%esi
> >    a: 40 89 e5                rex mov %esp,%ebp
> >    d: e8 e7 8f 6d ff          callq  0xffffffffff6d8ff9
> >   12: 5d                      pop    %rbp
> >   13: c3                      retq
> >   14: 0f                      .byte 0xf
> >   15: 1f                      (bad)
> >
> > (gdb) list *(_raw_spin_lock+0x7)
> > 0xffffffff81a13b27 is in _raw_spin_lock (./arch/x86/include/asm/atomic.=
h:200).
> > 195   }
> > 196
> > 197   #define arch_atomic_try_cmpxchg arch_atomic_try_cmpxchg
> > 198   static __always_inline bool arch_atomic_try_cmpxchg(atomic_t *v, =
int *old, int new)
> > 199   {
> > 200           return try_cmpxchg(&v->counter, old, new);
> > 201   }
> > 202
> > 203   static inline int arch_atomic_xchg(atomic_t *v, int new)
> > 204   {
> >
> > (gdb) disassemble _raw_spin_lock+0x7
> > Dump of assembler code for function _raw_spin_lock:
> >    0xffffffff81a13b20 <+0>:   xor    %eax,%eax
> >    0xffffffff81a13b22 <+2>:   mov    $0x1,%edx
> >    0xffffffff81a13b27 <+7>:   lock cmpxchg %edx,(%rdi)
> >    0xffffffff81a13b2b <+11>:  jne    0xffffffff81a13b2e <_raw_spin_lock=
+14>
> >    0xffffffff81a13b2d <+13>:  retq
> >    0xffffffff81a13b2e <+14>:  push   %rbp
> >    0xffffffff81a13b2f <+15>:  mov    %eax,%esi
> >    0xffffffff81a13b31 <+17>:  mov    %rsp,%rbp
> >    0xffffffff81a13b34 <+20>:  callq  0xffffffff810ecb20 <queued_spin_lo=
ck_slowpath>
> >    0xffffffff81a13b39 <+25>:  pop    %rbp
> >    0xffffffff81a13b3a <+26>:  retq
> > End of assembler dump.
> >
> > Any pointers on how to proceed with this would be appreciated.
>
> 'Git bisect' has identified the following commits as being 'bad'.
>
> b96f3e7c8069b749a40ca3a33c97835d57dd45d2 is the first bad commit
> commit b96f3e7c8069b749a40ca3a33c97835d57dd45d2
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Mon Aug 5 16:01:10 2019 +0200
>
>     drm/ttm: use gem vma_node
>
>     Drop vma_node from ttm_buffer_object, use the gem struct
>     (base.vma_node) instead.
>
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>     Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>     Link: http://patchwork.freedesktop.org/patch/msgid/20190805140119.733=
7-9-kraxel@redhat.com
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c      | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c  | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c      | 2 +-
>  drivers/gpu/drm/qxl/qxl_object.h           | 2 +-
>  drivers/gpu/drm/radeon/radeon_object.h     | 2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c               | 8 ++++----
>  drivers/gpu/drm/ttm/ttm_bo_util.c          | 2 +-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c            | 9 +++++----
>  drivers/gpu/drm/virtio/virtgpu_drv.h       | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_prime.c     | 3 ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 4 ++--
>  include/drm/ttm/ttm_bo_api.h               | 4 ----
>  14 files changed, 21 insertions(+), 27 deletions(-)
>
> I nominated commit '[1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715] drm/ttm:
> use gem reservation object' as being 'good' initially, based on the
> fact that kernel 5.3.0-rc1-00364-g1e053b10ba60 did boot. But the GUI
> applications displayed black artifacts across the screen.
>
> I then edited the git-bisect log file where I nominated
> commit 1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715 as being
> 'bad' and ran 'git bisect replay' on it. This blamed commit
> 1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715 as the first bad commit.
>
> 1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715 is the first bad commit
> commit 1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Mon Aug 5 16:01:09 2019 +0200
>
>     drm/ttm: use gem reservation object
>
>     Drop ttm_resv from ttm_buffer_object, use the gem reservation object
>     (base._resv) instead.
>
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>     Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>     Link: http://patchwork.freedesktop.org/patch/msgid/20190805140119.733=
7-8-kraxel@redhat.com
>
>  drivers/gpu/drm/ttm/ttm_bo.c      | 39 +++++++++++++++++++++++----------=
------
>  drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +-
>  include/drm/ttm/ttm_bo_api.h      |  1 -
>  3 files changed, 24 insertions(+), 18 deletions(-)
>
>
> In the process of bisection, I nominated the following kernels as being
> 'bad'. They also booted fine, but the xserver would fail to start. I
> have attached the error messages generated by xorg.
>
> # kernel boots; Xorg won't start. See Xorg_err.log attached.
> 5.3.0-rc3-01537-g6a3068065fa4
> 5.3.0-rc3-00782-gb0383c0653c4
> 5.3.0-rc1-00391-g54fc01b775fe
> 5.3.0-rc1-00366-g2e3c9ec4d151
> 5.3.0-rc1-00365-gb96f3e7c8069
>
> Today, I upgraded the kernel to 5.3.0-next-20190919, which booted fine
> with no Xorg regressions to report.
>
> Just wondering if the earlier kernels would not boot for me because of
> the changes introduced by the 'bad' commits being perhaps incomplete?
>
> Thanks to all of you for the tips on how proceed with bisection.



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
