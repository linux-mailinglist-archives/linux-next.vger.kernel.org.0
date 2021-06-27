Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6333B52C2
	for <lists+linux-next@lfdr.de>; Sun, 27 Jun 2021 12:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhF0KIi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Jun 2021 06:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhF0KIi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Jun 2021 06:08:38 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43ED9C061574
        for <linux-next@vger.kernel.org>; Sun, 27 Jun 2021 03:06:14 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id y17so412134pgf.12
        for <linux-next@vger.kernel.org>; Sun, 27 Jun 2021 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=qx7jFbauN+SVdhiKkCVLkyTvwBxJeGfju7ZFqDPsKts=;
        b=p9T5+L2zzXlJKvDsZS2j6nAlG2UgQMuye2bKUPtnfHrT/uo5aRSjglhZHMmQUt6bl4
         0ofni6CHvmydFy1E5e411/tCSymZIdRT9kx+NfcTNq0NencP0qbB4ReGXqrzeeUSR8kU
         2Whjht9MlcZQwt/xuWIp6yoapIOieAEBTH5ng5h8P7x00D6UfVLHMwAJCD0fMvh/P0ri
         kQYKCakAd8zKP3uS+uP9ruzWOaH1+8czT2NNjIa1LgnC5IYQhcuIEOw5aX/UGp+aiIAk
         3t7W7sc26ojO1Xdss2QedB8NE6Y/qhZB2pW+YYa4eJhiYnOBlYrTB2iLt1n6lGmZyVo9
         YXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=qx7jFbauN+SVdhiKkCVLkyTvwBxJeGfju7ZFqDPsKts=;
        b=pjWMwg0twk0F8NYKdtZPPLBUVHr+1Ox7mFDz1xqz9S9bfPo5hI5w1rBM+S95kWTdGk
         DgXdrGhcvLJGS6m34KCwalNUdazKzFODmNCPs5Jq1jBttFrduKNfs7+536u1oUWxkDiL
         g7bYEZ22mjBLsluI4/a4bismVz4Ei3e4KXU2bFe7lvuk23bd+rcBAPZ+1Wzm4CP94Wnf
         G4kGSlxSdqJoecO6H2yT4Hlqescb1a8vB3iJtZpj0uw3OgQyxxvxYyiYCcUZzVoUpCnG
         wewewn6HCUCcuB/ZH2lO5N2h6SPAb+28SMPBfmXKHTxzmjthyHpbaW80T54M3pUhC3yf
         cSWA==
X-Gm-Message-State: AOAM533tqBYajPXkoEuxyNk/CJQ0HWQpkpgP/5CU0CExvMax2D8Uli+G
        V6WJccNiPVShKpYYg1RMZECDlSCJ19Q=
X-Google-Smtp-Source: ABdhPJxSy35/NSnHHqCnWoEb/m93S6KOMyo63xHR2jf7m2dy8Ezuc1gtlnxtZ2QTi1wFsf1nM1moKg==
X-Received: by 2002:aa7:8605:0:b029:30a:30f:af5e with SMTP id p5-20020aa786050000b029030a030faf5emr9323980pfn.19.1624788373582;
        Sun, 27 Jun 2021 03:06:13 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
        by smtp.gmail.com with ESMTPSA id s7sm10719163pjr.11.2021.06.27.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 03:06:13 -0700 (PDT)
Date:   Sun, 27 Jun 2021 20:06:07 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [powerpc][next-20210625] Kernel
 warning(arch/powerpc/kernel/interrupt.c:518) during boot
To:     linuxppc-dev@lists.ozlabs.org,
        Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     linux-next@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
References: <478A3DE4-159E-4FF8-92B4-6550F72951E6@linux.vnet.ibm.com>
        <1624733491.pxug6c02ws.astroid@bobo.none>
In-Reply-To: <1624733491.pxug6c02ws.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1624788248.0kxmv878xd.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Nicholas Piggin's message of June 27, 2021 4:57 am:
> Excerpts from Sachin Sant's message of June 26, 2021 11:52 pm:
>> Following kernel warning is seen while booting 5.13.0-rc7-next-20210625
>> on POWER9 LPAR.
>>=20
>> [   40.573592] ------------[ cut here ]------------
>> [   40.573604] WARNING: CPU: 6 PID: 4743 at arch/powerpc/kernel/interrup=
t.c:518 interrupt_exit_kernel_prepare+0x280/0x2a0
>> [   40.573614] Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_=
defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c nfnetlink sunr=
pc pseries_rng xts uio_pdrv_genirq uio vmx_crypto sch_fq_codel ip_tables ex=
t4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse
>> [   40.573649] CPU: 6 PID: 4743 Comm: dracut-install Not tainted 5.13.0-=
rc7-next-20210625 #1
>> [   40.573655] NIP:  c000000000032990 LR: c00000000000c958 CTR: 00000000=
0048dd1c
>> [   40.573660] REGS: c0000000414db640 TRAP: 0700   Not tainted  (5.13.0-=
rc7-next-20210625)
>> [   40.573664] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 28044288 =
 XER: 00000000
>> [   40.573674] CFAR: c0000000000327a4 IRQMASK: 1=20
>>                GPR00: c00000000000c958 c0000000414db8e0 c0000000029bbd00=
 c0000000414db9a0=20
>>                GPR04: 8000000000001033 0000000000000093 0000000000000048=
 ffffffffffffffbf=20
>>                GPR08: 0000000000000008 0000000000000000 0000000000000003=
 0000000000000010=20
>>                GPR12: 0000000000004000 c000000005587a00 0000000101dc15a8=
 0000000101dc1590=20
>>                GPR16: 0000000101dc05a8 00007fffc7abe353 00007fffb7926740=
 0000000000000000=20
>>                GPR20: 00007fffc7ab7ae0 fffffffffffff000 0000000000000006=
 c000000043cbbc00=20
>>                GPR24: 0000000000000000 000001003da495d0 0000000000000000=
 0000000000000000=20
>>                GPR28: 0000000000000000 fcffffffffffffff 0000000000000000=
 c0000000414db9a0=20
>> [   40.573725] NIP [c000000000032990] interrupt_exit_kernel_prepare+0x28=
0/0x2a0
>> [   40.573730] LR [c00000000000c958] interrupt_return_srr_user_restart+0=
x34/0x118
>=20
> BTW this isn't a restart but a kernel exit. I'll have to update labels=20
> to make this clear.
>=20
>> [   40.573736] Call Trace:
>> [   40.573738] [c0000000414db8e0] [c000000043cbbc00] 0xc000000043cbbc00 =
(unreliable)
>> [   40.573744] [c0000000414db930] [c00000000000c958] interrupt_return_sr=
r_user_restart+0x34/0x118
>> [   40.573751] --- interrupt: 300 at strnlen_user+0x74/0x240
>> [   40.573756] NIP:  c00000000070ccf4 LR: c00000000048a460 CTR: 00000000=
0003fffe
>> [   40.573760] REGS: c0000000414db9a0 TRAP: 0300   Not tainted  (5.13.0-=
rc7-next-20210625)
>> [   40.573764] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 48044228 =
 XER: 20040000
>> [   40.573774] CFAR: c00000000048a45c DAR: 000001003da495d0 DSISR: 40000=
000 IRQMASK: 0=20
>>                GPR00: c00000000048a44c c0000000414dbc40 c0000000029bbd00=
 0000000000000000=20
>>                GPR04: 0000000000200000 0000000000000030 c000000043cbbc00=
 000001003da495d0=20
>>                GPR08: a8aaaaaaaaaaaaaa bcffffffffffffff 000001003da495d0=
 0000000000000000=20
>>                GPR12: 0000000000004000 c000000005587a00 0000000101dc15a8=
 0000000101dc1590=20
>>                GPR16: 0000000101dc05a8 00007fffc7abe353 00007fffb7926740=
 0000000000000000=20
>>                GPR20: 00007fffc7ab7ae0 fffffffffffff000 0000000000000006=
 c000000043cbbc00=20
>>                GPR24: 0000000000000000 000001003da495d0 0000000000000000=
 0000000000000000=20
>>                GPR28: 0000000000000000 c000000043b6a000 c000000043cbbc00=
 0000000000000000=20
>> [   40.573826] NIP [c00000000070ccf4] strnlen_user+0x74/0x240
>> [   40.573830] LR [c00000000048a460] copy_strings.isra.42+0xb0/0x350
>=20
> So there's definitely IRQMASK=3D0 and no MSR[EE]=3D0 in this frame, which=
 is=20
> what the warning was.
>=20
> I'd say either something hasn't set PACA_IRQ_HARD_DIS properly, so EE=20
> doesn't get enabled when irqs are restored, or maybe the  change to
> arch_local_irq_restore(). Less likely that the stack got messed up.
>=20
> Can you try run with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy ?

Nevermind, I think I've found the problem. Some code runs in the
implicit soft-mask region without expecting to be masked. Working
on a fix...

Thanks,
Nick
