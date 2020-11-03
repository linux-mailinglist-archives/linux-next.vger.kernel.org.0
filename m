Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA042A3F2A
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 09:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgKCInL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 03:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgKCInK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 03:43:10 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2405C0613D1;
        Tue,  3 Nov 2020 00:43:10 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id d1so6792801qvl.6;
        Tue, 03 Nov 2020 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z0mO+fR43zuY/JcDUH+zcK6mTwVOdRn/VTkzy7OxOxc=;
        b=bDBGVNqiZ4hfl0pxKQoMYGQB+TN38zDxMh4/6H7udQXhNkSnE4vzQuyxF0Api3W8Lf
         TmKDgU0xInAAaLKtBgzGglJ6dyc1NwDXqrczSJvFEDYNOX+6BXznGV35yaCi9xvHAUgm
         O53NMILA+auRcvBSPn8f96Ci2twCw+mUuE4XocA1WJlHAqauoz5IpSrtyHgpdY3nFTyW
         9HrlUW3hjbZzsJF1K2b1z0f9qv6wAzzvhxfhOw/krVWKZ/mKvIglDlN+L24B9v4FBREc
         zSzLFZsXPlU6cOxg39mAtUFY0vZY8pVOMS13SG16exSUibxqwLbTTV0oF3N/xcDPmxx4
         mkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z0mO+fR43zuY/JcDUH+zcK6mTwVOdRn/VTkzy7OxOxc=;
        b=COlSqNUbmbqPmPD641Rb+W8yiNpwZPqWNyZ9Tz3NI/e09AuauqESzsinY5TPSZWiOf
         E9jahfz35SZYas7/CDG5NQgvesMqIQ4GaI/62s58KT0qKmCD4jc9uTtWsF+u3bNF/EmH
         yw/pIqK43VCqMMDFTv/sj2ZmL77YTz8Si+Pcb5L483zdvZ0uno7X04AYG+qZAdQjYKNT
         qIymjhIS+A5WUqhlG9FXNEnNJX1PxSK8wxSJVlZz97JqCHGKh9ZU1a6q5HZCL00ywUgd
         LAlIvTmUM5x6E/P+tZd47sBHlmOO0O6+lOnFM6R0SbhMnz3pHnInET7GXsYgNzsapNtd
         pgEw==
X-Gm-Message-State: AOAM531h4PlAFX2bokGHPXrsI/oi188N5mUMEaec9+4lt1sXPZpKeqj5
        9PZtZWjC2NyTEUk+jKi0+DXXZ8/98e8f52rJcDjr9tKeRGc=
X-Google-Smtp-Source: ABdhPJyBATWNmN5SIQHZ0f2xrCgfxFjMAr3RKi3Q+RRdg71ltSdhD6ZyPWi569WiZoGR0hChV73l+dbS6g9fH64Eli4=
X-Received: by 2002:ad4:560d:: with SMTP id ca13mr26865990qvb.2.1604392989457;
 Tue, 03 Nov 2020 00:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20201013124725.2394-1-alexander.kapshuk@gmail.com>
In-Reply-To: <20201013124725.2394-1-alexander.kapshuk@gmail.com>
From:   Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date:   Tue, 3 Nov 2020 10:42:32 +0200
Message-ID: <CAJ1xhMWXMgcLj1_ibdSG7dgh9iaMt33pOhU5Xe4jEjhz6wSGWg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau/kms: Fix NULL pointer dereference in nouveau_connector_detect_depth
To:     Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Cc:     Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        ML nouveau <nouveau@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 13, 2020 at 3:47 PM Alexander Kapshuk
<alexander.kapshuk@gmail.com> wrote:
>
> This oops manifests itself on the following hardware:
> 01:00.0 VGA compatible controller: NVIDIA Corporation G98M [GeForce G 103=
M] (rev a1)
>
> Oct 09 14:17:46 lp-sasha kernel: BUG: kernel NULL pointer dereference, ad=
dress: 0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: #PF: supervisor read access in kernel mo=
de
> Oct 09 14:17:46 lp-sasha kernel: #PF: error_code(0x0000) - not-present pa=
ge
> Oct 09 14:17:46 lp-sasha kernel: PGD 0 P4D 0
> Oct 09 14:17:46 lp-sasha kernel: Oops: 0000 [#1] SMP PTI
> Oct 09 14:17:46 lp-sasha kernel: CPU: 1 PID: 191 Comm: systemd-udevd Not =
tainted 5.9.0-rc8-next-20201009 #38
> Oct 09 14:17:46 lp-sasha kernel: Hardware name: Hewlett-Packard Compaq Pr=
esario CQ61 Notebook PC/306A, BIOS F.03 03/23/2009
> Oct 09 14:17:46 lp-sasha kernel: RIP: 0010:nouveau_connector_detect_depth=
+0x71/0xc0 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel: Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 0=
0 00 06 00 00 00 80 b9 4d 0a 00 00 00 75 1e 83 fa 41 75 05 48 85 c0 75 29 8=
b 81 10 0d 00 00 <39> 06 7c 25 f6 81 14 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00=
 00 00 75
> Oct 09 14:17:46 lp-sasha kernel: RSP: 0018:ffffc9000028f8c0 EFLAGS: 00010=
297
> Oct 09 14:17:46 lp-sasha kernel: RAX: 0000000000014c08 RBX: ffff8880369d4=
000 RCX: ffff8880369d3000
> Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000040 RSI: 0000000000000=
000 RDI: ffff8880369d4000
> Oct 09 14:17:46 lp-sasha kernel: RBP: ffff88800601cc00 R08: ffff8880051da=
298 R09: ffffffff8226201a
> Oct 09 14:17:46 lp-sasha kernel: R10: ffff88800469aa80 R11: ffff888004c84=
ff8 R12: 0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: R13: ffff8880051da000 R14: 0000000000002=
000 R15: 0000000000000003
> Oct 09 14:17:46 lp-sasha kernel: FS:  00007fd0192b3440(0000) GS:ffff8880b=
c900000(0000) knlGS:0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
> Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000 CR3: 0000000004976=
000 CR4: 00000000000006e0
> Oct 09 14:17:46 lp-sasha kernel: Call Trace:
> Oct 09 14:17:46 lp-sasha kernel:  nouveau_connector_get_modes+0x1e6/0x240=
 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  ? kfree+0xb9/0x240
> Oct 09 14:17:46 lp-sasha kernel:  ? drm_connector_list_iter_next+0x7c/0xa=
0
> Oct 09 14:17:46 lp-sasha kernel:  drm_helper_probe_single_connector_modes=
+0x1ba/0x7c0
> Oct 09 14:17:46 lp-sasha kernel:  drm_client_modeset_probe+0x27e/0x1360
> Oct 09 14:17:46 lp-sasha kernel:  ? nvif_object_sclass_put+0xc/0x20 [nouv=
eau]
> Oct 09 14:17:46 lp-sasha kernel:  ? nouveau_cli_init+0x3cc/0x440 [nouveau=
]
> Oct 09 14:17:46 lp-sasha kernel:  ? ktime_get_mono_fast_ns+0x49/0xa0
> Oct 09 14:17:46 lp-sasha kernel:  ? nouveau_drm_open+0x4e/0x180 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  __drm_fb_helper_initial_config_and_unlo=
ck+0x3f/0x4a0
> Oct 09 14:17:46 lp-sasha kernel:  ? drm_file_alloc+0x18f/0x260
> Oct 09 14:17:46 lp-sasha kernel:  ? mutex_lock+0x9/0x40
> Oct 09 14:17:46 lp-sasha kernel:  ? drm_client_init+0x110/0x160
> Oct 09 14:17:46 lp-sasha kernel:  nouveau_fbcon_init+0x14d/0x1c0 [nouveau=
]
> Oct 09 14:17:46 lp-sasha kernel:  nouveau_drm_device_init+0x1c0/0x880 [no=
uveau]
> Oct 09 14:17:46 lp-sasha kernel:  nouveau_drm_probe+0x11a/0x1e0 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel:  pci_device_probe+0xcd/0x140
> Oct 09 14:17:46 lp-sasha kernel:  really_probe+0xd8/0x400
> Oct 09 14:17:46 lp-sasha kernel:  driver_probe_device+0x4a/0xa0
> Oct 09 14:17:46 lp-sasha kernel:  device_driver_attach+0x9c/0xc0
> Oct 09 14:17:46 lp-sasha kernel:  __driver_attach+0x6f/0x100
> Oct 09 14:17:46 lp-sasha kernel:  ? device_driver_attach+0xc0/0xc0
> Oct 09 14:17:46 lp-sasha kernel:  bus_for_each_dev+0x75/0xc0
> Oct 09 14:17:46 lp-sasha kernel:  bus_add_driver+0x106/0x1c0
> Oct 09 14:17:46 lp-sasha kernel:  driver_register+0x86/0xe0
> Oct 09 14:17:46 lp-sasha kernel:  ? 0xffffffffa044e000
> Oct 09 14:17:46 lp-sasha kernel:  do_one_initcall+0x48/0x1e0
> Oct 09 14:17:46 lp-sasha kernel:  ? _cond_resched+0x11/0x60
> Oct 09 14:17:46 lp-sasha kernel:  ? kmem_cache_alloc_trace+0x19c/0x1e0
> Oct 09 14:17:46 lp-sasha kernel:  do_init_module+0x57/0x220
> Oct 09 14:17:46 lp-sasha kernel:  __do_sys_finit_module+0xa0/0xe0
> Oct 09 14:17:46 lp-sasha kernel:  do_syscall_64+0x33/0x40
> Oct 09 14:17:46 lp-sasha kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa=
9
> Oct 09 14:17:46 lp-sasha kernel: RIP: 0033:0x7fd01a060d5d
> Oct 09 14:17:46 lp-sasha kernel: Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 0=
0 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8=
b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 70 0c 00 f7 d8 64=
 89 01 48
> Oct 09 14:17:46 lp-sasha kernel: RSP: 002b:00007ffc8ad38a98 EFLAGS: 00000=
246 ORIG_RAX: 0000000000000139
> Oct 09 14:17:46 lp-sasha kernel: RAX: ffffffffffffffda RBX: 0000563f6e7fd=
530 RCX: 00007fd01a060d5d
> Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000000 RSI: 00007fd01a19f=
95d RDI: 000000000000000f
> Oct 09 14:17:46 lp-sasha kernel: RBP: 0000000000020000 R08: 0000000000000=
000 R09: 0000000000000007
> Oct 09 14:17:46 lp-sasha kernel: R10: 000000000000000f R11: 0000000000000=
246 R12: 00007fd01a19f95d
> Oct 09 14:17:46 lp-sasha kernel: R13: 0000000000000000 R14: 0000563f6e7fb=
c10 R15: 0000563f6e7fd530
> Oct 09 14:17:46 lp-sasha kernel: Modules linked in: nouveau(+) ttm xt_str=
ing xt_mark xt_LOG vgem v4l2_dv_timings uvcvideo ulpi udf ts_kmp ts_fsm ts_=
bm snd_aloop sil164 qat_dh895xccvf nf_nat_sip nf_nat_irc nf_nat_ftp nf_nat =
nf_log_ipv6 nf_log_ipv4 nf_log_common ltc2990 lcd intel_qat input_leds i2c_=
mux gspca_main videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_=
common videodev mc drivetemp cuse fuse crc_itu_t coretemp ch7006 ath5k ath =
algif_hash
> Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: ---[ end trace 0ddafe218ad30017 ]---
> Oct 09 14:17:46 lp-sasha kernel: RIP: 0010:nouveau_connector_detect_depth=
+0x71/0xc0 [nouveau]
> Oct 09 14:17:46 lp-sasha kernel: Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 0=
0 00 06 00 00 00 80 b9 4d 0a 00 00 00 75 1e 83 fa 41 75 05 48 85 c0 75 29 8=
b 81 10 0d 00 00 <39> 06 7c 25 f6 81 14 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00=
 00 00 75
> Oct 09 14:17:46 lp-sasha kernel: RSP: 0018:ffffc9000028f8c0 EFLAGS: 00010=
297
> Oct 09 14:17:46 lp-sasha kernel: RAX: 0000000000014c08 RBX: ffff8880369d4=
000 RCX: ffff8880369d3000
> Oct 09 14:17:46 lp-sasha kernel: RDX: 0000000000000040 RSI: 0000000000000=
000 RDI: ffff8880369d4000
> Oct 09 14:17:46 lp-sasha kernel: RBP: ffff88800601cc00 R08: ffff8880051da=
298 R09: ffffffff8226201a
> Oct 09 14:17:46 lp-sasha kernel: R10: ffff88800469aa80 R11: ffff888004c84=
ff8 R12: 0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: R13: ffff8880051da000 R14: 0000000000002=
000 R15: 0000000000000003
> Oct 09 14:17:46 lp-sasha kernel: FS:  00007fd0192b3440(0000) GS:ffff8880b=
c900000(0000) knlGS:0000000000000000
> Oct 09 14:17:46 lp-sasha kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
> Oct 09 14:17:46 lp-sasha kernel: CR2: 0000000000000000 CR3: 0000000004976=
000 CR4: 00000000000006e0
>
> The disassembly:
> Code: 0a 00 00 48 8b 49 48 c7 87 b8 00 00 00 06 00 00 00 80 b9 4d 0a 00 0=
0 00 75 1e 83 fa 41 75 05 48 85 c0 75 29 8b 81 10 0d 00 00 <39> 06 7c 25 f6=
 81 14 0d 00 00 02 75 b7 c3 80 b9 0c 0d 00 00 00 75
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   0a 00                   or     (%rax),%al
>    2:   00 48 8b                add    %cl,-0x75(%rax)
>    5:   49                      rex.WB
>    6:   48 c7 87 b8 00 00 00    movq   $0x6,0xb8(%rdi)
>    d:   06 00 00 00
>   11:   80 b9 4d 0a 00 00 00    cmpb   $0x0,0xa4d(%rcx)
>   18:   75 1e                   jne    0x38
>   1a:   83 fa 41                cmp    $0x41,%edx
>   1d:   75 05                   jne    0x24
>   1f:   48 85 c0                test   %rax,%rax
>   22:   75 29                   jne    0x4d
>   24:   8b 81 10 0d 00 00       mov    0xd10(%rcx),%eax
>   2a:*  39 06                   cmp    %eax,(%rsi)              <-- trapp=
ing instruction
>   2c:   7c 25                   jl     0x53
>   2e:   f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
>   35:   75 b7                   jne    0xffffffffffffffee
>   37:   c3                      retq
>   38:   80 b9 0c 0d 00 00 00    cmpb   $0x0,0xd0c(%rcx)
>   3f:   75                      .byte 0x75
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   39 06                   cmp    %eax,(%rsi)
>    2:   7c 25                   jl     0x29
>    4:   f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
>    b:   75 b7                   jne    0xffffffffffffffc4
>    d:   c3                      retq
>    e:   80 b9 0c 0d 00 00 00    cmpb   $0x0,0xd0c(%rcx)
>   15:   75                      .byte 0x75
>
> objdump -SF --disassemble=3Dnouveau_connector_detect_depth
> [...]
>         if (nv_connector->edid &&
>    c85e1:       83 fa 41                cmp    $0x41,%edx
>    c85e4:       75 05                   jne    c85eb <nouveau_connector_d=
etect_depth+0x6b> (File Offset: 0xc866b)
>    c85e6:       48 85 c0                test   %rax,%rax
>    c85e9:       75 29                   jne    c8614 <nouveau_connector_d=
etect_depth+0x94> (File Offset: 0xc8694)
>             nv_connector->type =3D=3D DCB_CONNECTOR_LVDS_SPWG)
>                 duallink =3D ((u8 *)nv_connector->edid)[121] =3D=3D 2;
>         else
>                 duallink =3D mode->clock >=3D bios->fp.duallink_transitio=
n_clk;
>
>         if ((!duallink && (bios->fp.strapless_is_24bit & 1)) ||
>    c85eb:       8b 81 10 0d 00 00       mov    0xd10(%rcx),%eax
>    c85f1:       39 06                   cmp    %eax,(%rsi)
>    c85f3:       7c 25                   jl     c861a <nouveau_connector_d=
etect_depth+0x9a> (File Offset: 0xc869a)
>             ( duallink && (bios->fp.strapless_is_24bit & 2)))
>    c85f5:       f6 81 14 0d 00 00 02    testb  $0x2,0xd14(%rcx)
>    c85fc:       75 b7                   jne    c85b5 <nouveau_connector_d=
etect_depth+0x35> (File Offset: 0xc8635)
>                 connector->display_info.bpc =3D 8;
> [...]
>
> % scripts/faddr2line /lib/modules/5.9.0-rc8-next-20201009/kernel/drivers/=
gpu/drm/nouveau/nouveau.ko nouveau_connector_detect_depth+0x71/0xc0
> nouveau_connector_detect_depth+0x71/0xc0:
> nouveau_connector_detect_depth at /home/sasha/linux-next/drivers/gpu/drm/=
nouveau/nouveau_connector.c:891
>
> It is actually line 889. See the disassembly below.
> 889                     duallink =3D mode->clock >=3D bios->fp.duallink_t=
ransition_clk;
>
> The NULL pointer being dereferenced is mode.
>
> Git bisect has identified the following commit as bad:
> f28e32d3906e drm/nouveau/kms: Don't change EDID when it hasn't actually c=
hanged
>
> Here is the chain of events that causes the oops.
> On entry to nouveau_connector_detect_lvds, edid is set to NULL.  The call
> to nouveau_connector_detect sets nv_connector->edid to valid memory,
> with status set to connector_status_connected and the flow of execution
> branching to the out label.
>
> The subsequent call to nouveau_connector_set_edid erronously clears
> nv_connector->edid, via the local edid pointer which remains set to NULL.
>
> Fix this by setting edid to the value of the just acquired
> nv_connector->edid and executing the body of nouveau_connector_set_edid
> only if nv_connector->edid and edid point to different memory addresses
> thus preventing nv_connector->edid from being turned into a dangling
> pointer.
>
> Fixes: f28e32d3906e ("drm/nouveau/kms: Don't change EDID when it hasn't a=
ctually changed")
> Signed-off-by: Alexander Kapshuk <alexander.kapshuk@gmail.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
> v2:
> -----
> - nouveau_connector_set_edid updated to do the (nv_connector->edid
> !=3D edid) check instead of open coding it in nouveau_connector_detect_lv=
ds
> - added Reviewed-by: from Lyude Paul
>
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 49dd0cbc332f..5eb322276be7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -532,11 +532,13 @@ static void
>  nouveau_connector_set_edid(struct nouveau_connector *nv_connector,
>                            struct edid *edid)
>  {
> -       struct edid *old_edid =3D nv_connector->edid;
> +       if (nv_connector->edid !=3D edid) {
> +               struct edid *old_edid =3D nv_connector->edid;
>
> -       drm_connector_update_edid_property(&nv_connector->base, edid);
> -       kfree(old_edid);
> -       nv_connector->edid =3D edid;
> +               drm_connector_update_edid_property(&nv_connector->base, e=
did);
> +               kfree(old_edid);
> +               nv_connector->edid =3D edid;
> +       }
>  }
>
>  static enum drm_connector_status
> @@ -669,8 +671,10 @@ nouveau_connector_detect_lvds(struct drm_connector *=
connector, bool force)
>         /* Try retrieving EDID via DDC */
>         if (!drm->vbios.fp_no_ddc) {
>                 status =3D nouveau_connector_detect(connector, force);
> -               if (status =3D=3D connector_status_connected)
> +               if (status =3D=3D connector_status_connected) {
> +                       edid =3D nv_connector->edid;
>                         goto out;
> +               }
>         }
>
>         /* On some laptops (Sony, i'm looking at you) there appears to
> --
> 2.28.0
>

Thought I'd ask about the status of this patch.
Is there an intention to queue it up for subsequent inclusion at some stage=
?
Thanks.
