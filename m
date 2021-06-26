Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70FB3B4FE7
	for <lists+linux-next@lfdr.de>; Sat, 26 Jun 2021 20:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFZS76 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 26 Jun 2021 14:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhFZS76 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 26 Jun 2021 14:59:58 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70466C061574
        for <linux-next@vger.kernel.org>; Sat, 26 Jun 2021 11:57:33 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id h23so7369036pjv.2
        for <linux-next@vger.kernel.org>; Sat, 26 Jun 2021 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=r46dsB59cAdilC1UtkJEF5sql6vBCSDoDiSAwQmLqO8=;
        b=Iq9/xscpZh8fOrYEZrQcbkPw65c/fzuh0VTOnmGqKSnQs0losScWv2vvJDpbb0MY7j
         d+OTWFLMAWiEOnbfPLiWk3cE+Q6NNMLClH4kvFoMpvisMwiemqkLLDkCR0/pB0rXALtj
         sc2tDHb1QMP3lKRsCTmgMZ8n0tZE8wkoQCvIRsBv+qFPxKS1Ax/r3TkGhptwIiaxzEoh
         /8VSAPGaJ8jWHE2UVjgO5RksBKXOz3lmW1WkXltJCQZ0i8debOU9CN0tLriC5CLZQDHj
         7rIUfYj38Vm6aP36nWbsb3Pla3pllrCxhVJf8I6wMtDX9Mgs2ns4WNfNYpCeJhYBWqUp
         go2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=r46dsB59cAdilC1UtkJEF5sql6vBCSDoDiSAwQmLqO8=;
        b=RyqNLXGlDTi8M8zmGPlt9PIRBEDwKmM0v/QpMPEi87bWGF4O8QewQ1PnYFokkuPLqA
         DEtokMvuv+5QIoMxK2UoLG/ObP43ZZQwiojUNDa+72eAkmnzf+qUSq+n1j+As1OTPD9V
         /FbEQZ2V+Az9sppXrNdq4fcol8HnBAjMEq5jDUWX3FStGqZIu5dPv3ySCDcIHEHX4GM/
         P+S6w5qgeiHqNKiVCbFDnYx3/Bqauf0BE/lPw+iDge0uHqBloJg6DN+2eE4xA8TJD85I
         +XdpF1sDSzzhg8TuIfJXTqS6pNfO4+s4NYC5RwxLGtNC5izCNcc6/q4OX7HshYNyqTpF
         RMag==
X-Gm-Message-State: AOAM532IYeKLUUxucG2CZV7+UAHGf6hnoOdlMgdTEwjXYaihzniTnlIl
        wDTYMSKGnmLk90ldqM+BU0A=
X-Google-Smtp-Source: ABdhPJxtrhdR/GmHrgB8S01/B5Z5P0hUGvigr62/mnw6KKYAe9j4pJBMtTLqPf7FMCgV+ZY9szF2gg==
X-Received: by 2002:a17:902:7c92:b029:111:2ca8:3d8e with SMTP id y18-20020a1709027c92b02901112ca83d8emr14431624pll.77.1624733853018;
        Sat, 26 Jun 2021 11:57:33 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
        by smtp.gmail.com with ESMTPSA id c5sm14565988pjq.38.2021.06.26.11.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 11:57:32 -0700 (PDT)
Date:   Sun, 27 Jun 2021 04:57:27 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [powerpc][next-20210625] Kernel
 warning(arch/powerpc/kernel/interrupt.c:518) during boot
To:     linuxppc-dev@lists.ozlabs.org,
        Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     linux-next@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
References: <478A3DE4-159E-4FF8-92B4-6550F72951E6@linux.vnet.ibm.com>
In-Reply-To: <478A3DE4-159E-4FF8-92B4-6550F72951E6@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1624733491.pxug6c02ws.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Sachin Sant's message of June 26, 2021 11:52 pm:
> Following kernel warning is seen while booting 5.13.0-rc7-next-20210625
> on POWER9 LPAR.
>=20
> [   40.573592] ------------[ cut here ]------------
> [   40.573604] WARNING: CPU: 6 PID: 4743 at arch/powerpc/kernel/interrupt=
.c:518 interrupt_exit_kernel_prepare+0x280/0x2a0
> [   40.573614] Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_d=
efrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c nfnetlink sunrp=
c pseries_rng xts uio_pdrv_genirq uio vmx_crypto sch_fq_codel ip_tables ext=
4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse
> [   40.573649] CPU: 6 PID: 4743 Comm: dracut-install Not tainted 5.13.0-r=
c7-next-20210625 #1
> [   40.573655] NIP:  c000000000032990 LR: c00000000000c958 CTR: 000000000=
048dd1c
> [   40.573660] REGS: c0000000414db640 TRAP: 0700   Not tainted  (5.13.0-r=
c7-next-20210625)
> [   40.573664] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28044288  =
XER: 00000000
> [   40.573674] CFAR: c0000000000327a4 IRQMASK: 1=20
>                GPR00: c00000000000c958 c0000000414db8e0 c0000000029bbd00 =
c0000000414db9a0=20
>                GPR04: 8000000000001033 0000000000000093 0000000000000048 =
ffffffffffffffbf=20
>                GPR08: 0000000000000008 0000000000000000 0000000000000003 =
0000000000000010=20
>                GPR12: 0000000000004000 c000000005587a00 0000000101dc15a8 =
0000000101dc1590=20
>                GPR16: 0000000101dc05a8 00007fffc7abe353 00007fffb7926740 =
0000000000000000=20
>                GPR20: 00007fffc7ab7ae0 fffffffffffff000 0000000000000006 =
c000000043cbbc00=20
>                GPR24: 0000000000000000 000001003da495d0 0000000000000000 =
0000000000000000=20
>                GPR28: 0000000000000000 fcffffffffffffff 0000000000000000 =
c0000000414db9a0=20
> [   40.573725] NIP [c000000000032990] interrupt_exit_kernel_prepare+0x280=
/0x2a0
> [   40.573730] LR [c00000000000c958] interrupt_return_srr_user_restart+0x=
34/0x118

BTW this isn't a restart but a kernel exit. I'll have to update labels=20
to make this clear.

> [   40.573736] Call Trace:
> [   40.573738] [c0000000414db8e0] [c000000043cbbc00] 0xc000000043cbbc00 (=
unreliable)
> [   40.573744] [c0000000414db930] [c00000000000c958] interrupt_return_srr=
_user_restart+0x34/0x118
> [   40.573751] --- interrupt: 300 at strnlen_user+0x74/0x240
> [   40.573756] NIP:  c00000000070ccf4 LR: c00000000048a460 CTR: 000000000=
003fffe
> [   40.573760] REGS: c0000000414db9a0 TRAP: 0300   Not tainted  (5.13.0-r=
c7-next-20210625)
> [   40.573764] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 48044228  =
XER: 20040000
> [   40.573774] CFAR: c00000000048a45c DAR: 000001003da495d0 DSISR: 400000=
00 IRQMASK: 0=20
>                GPR00: c00000000048a44c c0000000414dbc40 c0000000029bbd00 =
0000000000000000=20
>                GPR04: 0000000000200000 0000000000000030 c000000043cbbc00 =
000001003da495d0=20
>                GPR08: a8aaaaaaaaaaaaaa bcffffffffffffff 000001003da495d0 =
0000000000000000=20
>                GPR12: 0000000000004000 c000000005587a00 0000000101dc15a8 =
0000000101dc1590=20
>                GPR16: 0000000101dc05a8 00007fffc7abe353 00007fffb7926740 =
0000000000000000=20
>                GPR20: 00007fffc7ab7ae0 fffffffffffff000 0000000000000006 =
c000000043cbbc00=20
>                GPR24: 0000000000000000 000001003da495d0 0000000000000000 =
0000000000000000=20
>                GPR28: 0000000000000000 c000000043b6a000 c000000043cbbc00 =
0000000000000000=20
> [   40.573826] NIP [c00000000070ccf4] strnlen_user+0x74/0x240
> [   40.573830] LR [c00000000048a460] copy_strings.isra.42+0xb0/0x350

So there's definitely IRQMASK=3D0 and no MSR[EE]=3D0 in this frame, which i=
s=20
what the warning was.

I'd say either something hasn't set PACA_IRQ_HARD_DIS properly, so EE=20
doesn't get enabled when irqs are restored, or maybe the  change to
arch_local_irq_restore(). Less likely that the stack got messed up.

Can you try run with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy ?

Thanks,
Nick
