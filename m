Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EC03B57F4
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 05:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbhF1Dyd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Jun 2021 23:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbhF1Dyc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Jun 2021 23:54:32 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2FCC061574
        for <linux-next@vger.kernel.org>; Sun, 27 Jun 2021 20:52:07 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id c8so13007849pfp.5
        for <linux-next@vger.kernel.org>; Sun, 27 Jun 2021 20:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=gYNivo5OTIKZLkN+JJLDm3OpbastedsS2IoApOjq5cI=;
        b=J230cK7PBd1weXTQ+PHLUpHGguUVqC5aJLBM6AqRjMnSajTHCanUJR4Idn4CwI2t9a
         +TZAMSReaTEAXrvByuAcpflHbWIddKyYPomyDGMC20P46jzJ0FHoLBUo8zX+95kL77y2
         iagdIXtmNhGjeBv9a3NFLdF+4tUdgPt/GS5ntRrE5ylOqrpZEnvbs0yd59m/zwH2BTCQ
         u4dSisvHS6b5kkv2VmcJbCAOyWYuPTEANY1ZWbrKmAfEc/+XKa7rgJStspoY27CJ3WQF
         f4EsoEQ5TfQk63tckXDCdiSrO9SYlfZ2JCrhINclBfzmh66nO4cW7njzw8cBI1Qy26h7
         Ltjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=gYNivo5OTIKZLkN+JJLDm3OpbastedsS2IoApOjq5cI=;
        b=JpdSSQV32x+HeAgC8P/y5GLQpzhe7mNxDSGZEL47/xKNkN615BfKhFKQ+sw7tm/sP2
         R+4+4siCqEvFKGHas5lWJyeMYm+p/rY7yHP4hIzRvf03TuKUj82OkbtZFzfO+FcZSKW8
         MN6QOseKml+89XlRPFIBbGTAOrvo6IzwPbf0aP2Xms/5PIMt86UAGZodoI6MTB2FevAF
         740z4jkqmXAufImlvrkU3oxWDsBtDuM+StbQVW+umUDT9/U7Svpys/v/d+h82suwPusi
         EGnnNac8m1YvvrbZW+Hs9MqPOHcBWOgS6XDAz+UJFCYm0yJoAgDD51wRgonJvHC1lPRm
         Bu4w==
X-Gm-Message-State: AOAM531WAXFcT7zgNJQeVxNjiTlJCHa8taEWlSVwH5CuJ7cHcwHNj3Am
        Wq3QgzkJKsYq9dFaTrnDrxk=
X-Google-Smtp-Source: ABdhPJz4DihxvRnXAoPYFnKmrTqXk1mwta6/3uutfeUb0/blt+XuCqPEwhfhy4FyGbztbJSbGG5PeQ==
X-Received: by 2002:a62:768c:0:b029:2ff:2002:d3d0 with SMTP id r134-20020a62768c0000b02902ff2002d3d0mr22596990pfc.70.1624852326571;
        Sun, 27 Jun 2021 20:52:06 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
        by smtp.gmail.com with ESMTPSA id o14sm12683246pjj.6.2021.06.27.20.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 20:52:06 -0700 (PDT)
Date:   Mon, 28 Jun 2021 13:52:00 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [powerpc][next-20210625] Kernel
 warning(arch/powerpc/kernel/interrupt.c:518) during boot
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>
References: <478A3DE4-159E-4FF8-92B4-6550F72951E6@linux.vnet.ibm.com>
        <1624733491.pxug6c02ws.astroid@bobo.none>
        <1624788248.0kxmv878xd.astroid@bobo.none>
        <0C513B10-78DE-48F3-AD50-3A89225E20AF@linux.vnet.ibm.com>
In-Reply-To: <0C513B10-78DE-48F3-AD50-3A89225E20AF@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1624851796.z5shw7nhxf.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Sachin Sant's message of June 27, 2021 9:23 pm:
>=20
>> On 27-Jun-2021, at 3:36 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>>=20
>>> So there's definitely IRQMASK=3D0 and no MSR[EE]=3D0 in this frame, whi=
ch is=20
>>> what the warning was.
>>>=20
>>> I'd say either something hasn't set PACA_IRQ_HARD_DIS properly, so EE=20
>>> doesn't get enabled when irqs are restored, or maybe the  change to
>>> arch_local_irq_restore(). Less likely that the stack got messed up.
>>>=20
>>> Can you try run with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy ?
>>=20
>> Nevermind, I think I've found the problem. Some code runs in the
>> implicit soft-mask region without expecting to be masked. Working
>> on a fix=E2=80=A6
>=20
> :-) . I was able to recreate this after few attempts. It seem the warning=
 isn=E2=80=99t
> always triggered during boot. I had to run a kernel compile operation aft=
er
> boot to trigger this warning again.
>=20
> In case its helpful here is the additional trace with PPC_IRQ_SOFT_MASK_D=
EBUG.

Thanks. I ended up being able to reproduce as well, quite frequently=20
with some extra debug checks that specifically catch more cases.

I've got a few patches under test right now, very stable so far. I'll=20
post them out if they survive a nother hour or two stress testing.

The problem is some code (e.g., ret_from_fork) now gets implicitly=20
soft-masked where that was not expecting to be. A masked interrupt might=20
hit, and then when it moves out of the implicit soft-mask region it
does not re-enable interrupts. Some types of pending interrupts will=20
clear MSR[EE], and that ends up causing this bug on the next interrupt
that happens.

Not a wonderful escape :\  thanks for finding it. The fixes aren't too
bad, fortunately.

Thanks,
Nick

>=20
> [   92.106731] ------------[ cut here ]------------
> [   92.106738] WARNING: CPU: 45 PID: 12757 at arch/powerpc/kernel/irq.c:2=
55 arch_local_irq_restore+0x1d0/0x200
> [   92.106753] Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_d=
efrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c nfnetlink sunrp=
c pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables ext=
4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse
> [   92.106828] CPU: 45 PID: 12757 Comm: sh Kdump: loaded Tainted: G      =
  W         5.13.0-rc7-next-20210625 #1
> [   92.106841] NIP:  c0000000000164d0 LR: c000000000cedaa8 CTR: 000000000=
0000000
> [   92.106849] REGS: c00000008dfeb7e0 TRAP: 0700   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
> [   92.106859] MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR:=
 28004222  XER: 00000000
> [   92.106892] CFAR: c00000000001632c IRQMASK: 0=20
>                GPR00: c000000000ceda98 c00000008dfeba80 c000000002921e00 =
0000000000000000=20
>                GPR04: 0000000000000000 0000000000000000 0000000000000000 =
00000000000000ff=20
>                GPR08: 0000000000000001 0000000000000000 0000000000000001 =
0000000000000017=20
>                GPR12: 0000000024004822 c000000007fb9200 000000012efd81d4 =
000000012ee50000=20
>                GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
>                GPR20: 00003fffa93f8000 0000000000000000 00003fffa93f9300 =
000000012efb1988=20
>                GPR24: 000000012ee7fe7c 000000012efccba0 000000012ee50000 =
c00000008d5d7600=20
>                GPR28: c0000000314c0bc0 c000000040d9f100 c0000008beb5861c =
4b72201a3063fe13=20
> [   92.107024] NIP [c0000000000164d0] arch_local_irq_restore+0x1d0/0x200
> [   92.107035] LR [c000000000cedaa8] _raw_spin_unlock_irqrestore+0x88/0xb=
0
> [   92.107047] Call Trace:
> [   92.107052] [c00000008dfeba80] [c00000008dfebb50] 0xc00000008dfebb50 (=
unreliable)
> [   92.107065] [c00000008dfebab0] [238c5bf052df0858] 0x238c5bf052df0858
> [   92.107076] [c00000008dfebae0] [c0000000008178e8] get_random_u64+0x88/=
0x100
> [   92.107090] [c00000008dfebb20] [c000000000020134] arch_randomize_brk+0=
xb4/0xd8
> [   92.107105] [c00000008dfebb50] [c0000000005430b0] load_elf_binary+0xe7=
0/0x1220
> [   92.107119] [c00000008dfebc40] [c00000000047ded0] bprm_execve+0x410/0x=
800
> [   92.107132] [c00000008dfebd10] [c00000000047e8ec] do_execveat_common.i=
sra.44+0x21c/0x240
> [   92.107145] [c00000008dfebd80] [c00000000047e964] sys_execve+0x54/0x70
> [   92.107157] [c00000008dfebdb0] [c000000000032334] system_call_exceptio=
n+0x164/0x2e0
> [   92.107169] [c00000008dfebe10] [c00000000000c464] system_call_common+0=
xf4/0x258
> [   92.107185] --- interrupt: c00 at 0x3fff9bb6b8a8
> [   92.107193] NIP:  00003fff9bb6b8a8 LR: 00003fff9bb6c240 CTR: 000000000=
0000000
> [   92.107202] REGS: c00000008dfebe80 TRAP: 0c00   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
> [   92.107213] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 2=
8004224  XER: 00000000
> [   92.107243] IRQMASK: 0=20
>                GPR00: 000000000000000b 00003fffc36a1440 00003fff9bc87300 =
00000100268a67d0=20
>                GPR04: 0000010026887e50 0000010026882c50 fefefefefefefeff =
7f7f7f7f7f7f7f7f=20
>                GPR08: 00000100268a67d0 0000000000000000 0000000000000000 =
0000000000000000=20
>                GPR12: 0000000000000000 00003fff9bce3780 0000000114200db4 =
0000000000000000=20
>                GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
>                GPR20: 00000001141dd820 0000000000000000 00000001141dd740 =
0000000114204358=20
>                GPR24: 0000000114203948 0000010026876454 0000000000000001 =
0000010026882c50=20
>                GPR28: 0000010026887e50 0000010026882c50 00000100268a67d0 =
00003fffc36a1440=20
> [   92.107369] NIP [00003fff9bb6b8a8] 0x3fff9bb6b8a8
> [   92.107378] LR [00003fff9bb6c240] 0x3fff9bb6c240
> [   92.107386] --- interrupt: c00
> [   92.107393] Instruction dump:
> [   92.107400] 7d2000a6 71298000 40820048 39200000 992d0152 39400000 992d=
0153 614a8002=20
> [   92.107427] 7d410164 4bfffe6c 60000000 60000000 <0fe00000> 4bfffe5c 60=
000000 60000000=20
> [   92.107451] ---[ end trace 5f1d49fb99f3613d ]=E2=80=94
>=20
> Complete dmesg log attached.
>=20
> Thanks
> -Sachin
>=20
>=20
