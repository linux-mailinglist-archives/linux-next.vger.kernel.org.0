Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7E63D9C7B
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 06:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhG2EJD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 00:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhG2EJB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jul 2021 00:09:01 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B368C061757
        for <linux-next@vger.kernel.org>; Wed, 28 Jul 2021 21:08:58 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso13537741pjq.2
        for <linux-next@vger.kernel.org>; Wed, 28 Jul 2021 21:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=G1a4z6t0YH/1+lopR4XgZUjwrxuMtoSPgiMGhqemeMw=;
        b=tnkbUP5Ud2dYb+GWlpuqjNiphBSTejuF1omZYayoFYB7lteJVXkzOVRd0oZG97q+0h
         noxryBFC9UaX/iDbNjmc4gjckh3BM1D+YAR+a2NMaF77iJ0gjStoImhLwSNtZ6GajDGu
         v/yJqgeUfxD0QRfdsifx5KLL/5bBWBy3OshaDe6rgQC27T9TGtE5aGUhWuZZJQ3mAAXn
         ldTyDh+Ipf6aAN2E4Lx1wy+bYbxWKNf91awCfs5mRJDYXUacS8eXEJcwJW70e1EycN73
         y71gQF3BBhZzUx6VVKnHLuRwwBGUKZGf1SDuoM7ADz/TodEeIOixEzC9Ryv944exUCUz
         +sgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=G1a4z6t0YH/1+lopR4XgZUjwrxuMtoSPgiMGhqemeMw=;
        b=QXuFQiKVZHZ8BmrYP7fC521xET10GuaZD2St40DLpWfSOmPb6BJLNbBkJJMTgrX/kT
         jpv8IkM3Ocd4PhPa+AhUDLgP6xsR6f6f6cCAeNrTY1OXCE4YNjFK9v5vPKelSXK5oZ3p
         WRt4wIXH7tBPDbBr/OuYF/RKJ9MSU2Ja0xPGj+wvdsrT/HWASWo6to0VylAEB9SkzR8f
         RyBIm5MvxCePIQCZcFX2NSkuXB/aZMwuvFArOnm3guFobcoQXeiqXWErUqnAKEntOnec
         L8i2oIOJ+WW4AIJ4sO/Mbxpoqh2fsnMjucus7PIcOYFxBFR8SKto8VVjr9ijlruS/S1P
         PXDQ==
X-Gm-Message-State: AOAM533shhkg7vXQnkuq9BaO9jP4/k1nVVpl24AmZOIXRgd1tjmko4CC
        2RgHz4oylBDPXKGHwOYGl5o=
X-Google-Smtp-Source: ABdhPJw4KzLL5+SwyRMRry6vDFuKnWhRIHabIsYLolMkrCj75FCTCCaJFX9D7Aq5Qka1rBTdo5X1DQ==
X-Received: by 2002:a62:3045:0:b029:32b:880f:c03a with SMTP id w66-20020a6230450000b029032b880fc03amr2939932pfw.22.1627531737556;
        Wed, 28 Jul 2021 21:08:57 -0700 (PDT)
Received: from localhost (60-242-181-102.static.tpgi.com.au. [60.242.181.102])
        by smtp.gmail.com with ESMTPSA id x65sm7715402pjj.57.2021.07.28.21.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:08:57 -0700 (PDT)
Date:   Thu, 29 Jul 2021 14:08:52 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Will Deacon <will@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
        linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Robin Murphy <robin.murphy@arm.com>,
        Claire Chang <tientzu@chromium.org>,
        Anshuman Khandual <khandual@linux.vnet.ibm.com>
References: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
        <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
In-Reply-To: <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Message-Id: <1627531480.yy7fe9l470.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Excerpts from Nathan Chancellor's message of July 29, 2021 3:35 am:
> On Wed, Jul 28, 2021 at 01:31:06PM +0530, Sachin Sant wrote:
>> linux-next fails to boot on Power server (POWER8/POWER9). Following trac=
es
>> are seen during boot
>>=20
>> [    0.010799] software IO TLB: tearing down default memory pool
>> [    0.010805] ------------[ cut here ]------------
>> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
>> [    0.010812] Oops: Exception in kernel mode, sig: 5 [#1]
>> [    0.010816] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSe=
ries
>> [    0.010820] Modules linked in:
>> [    0.010824] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc3-next=
-20210727 #1
>> [    0.010830] NIP:  c000000000032cfc LR: c00000000000c764 CTR: c0000000=
0000c670
>> [    0.010834] REGS: c000000003603b10 TRAP: 0700   Not tainted  (5.14.0-=
rc3-next-20210727)
>> [    0.010838] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 280002=
22  XER: 00000002
>> [    0.010848] CFAR: c00000000000c760 IRQMASK: 3=20
>> [    0.010848] GPR00: c00000000000c764 c000000003603db0 c0000000029bd000=
 0000000000000001=20
>> [    0.010848] GPR04: 0000000000000a68 0000000000000400 c000000003603868=
 ffffffffffffffff=20
>> [    0.010848] GPR08: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000003=20
>> [    0.010848] GPR12: ffffffffffffffff c00000001ec9ee80 c000000000012a28=
 0000000000000000=20
>> [    0.010848] GPR16: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000=20
>> [    0.010848] GPR20: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000=20
>> [    0.010848] GPR24: 000000000000f134 0000000000000000 ffffffffffffffff=
 c000000003603868=20
>> [    0.010848] GPR28: 0000000000000400 0000000000000a68 c00000000202e9c0=
 c000000003603e80=20
>> [    0.010896] NIP [c000000000032cfc] system_call_exception+0x8c/0x2e0
>> [    0.010901] LR [c00000000000c764] system_call_common+0xf4/0x258
>> [    0.010907] Call Trace:
>> [    0.010909] [c000000003603db0] [c00000000016a6dc] calculate_sigpendin=
g+0x4c/0xe0 (unreliable)
>> [    0.010915] [c000000003603e10] [c00000000000c764] system_call_common+=
0xf4/0x258
>> [    0.010921] --- interrupt: c00 at kvm_template_end+0x4/0x8
>> [    0.010926] NIP:  c000000000092dec LR: c000000000114fc8 CTR: 00000000=
00000000
>> [    0.010930] REGS: c000000003603e80 TRAP: 0c00   Not tainted  (5.14.0-=
rc3-next-20210727)
>> [    0.010934] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 280002=
22  XER: 00000000
>> [    0.010943] IRQMASK: 0=20
>> [    0.010943] GPR00: c00000000202e9c0 c000000003603b00 c0000000029bd000=
 000000000000f134=20
>> [    0.010943] GPR04: 0000000000000a68 0000000000000400 c000000003603868=
 ffffffffffffffff=20
>> [    0.010943] GPR08: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000=20
>> [    0.010943] GPR12: 0000000000000000 c00000001ec9ee80 c000000000012a28=
 0000000000000000=20
>> [    0.010943] GPR16: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000=20
>> [    0.010943] GPR20: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000=20
>> [    0.010943] GPR24: c0000000020033c4 c00000000110afc0 c000000002081950=
 c000000003277d40=20
>> [    0.010943] GPR28: 0000000000000000 c00000000a680000 0000000004000000=
 00000000000d0000=20
>> [    0.010989] NIP [c000000000092dec] kvm_template_end+0x4/0x8
>> [    0.010993] LR [c000000000114fc8] set_memory_encrypted+0x38/0x60
>> [    0.010999] --- interrupt: c00
>> [    0.011001] [c000000003603b00] [c00000000000c764] system_call_common+=
0xf4/0x258 (unreliable)
>> [    0.011008] Instruction dump:
>> [    0.011011] 694a0003 312affff 7d495110 0b0a0000 60000000 60000000 e87=
f0108 68690002=20
>> [    0.011019] 7929ffe2 0b090000 68634000 786397e2 <0b030000> e93f0138 7=
92907e0 0b090000=20
>> [    0.011029] ---[ end trace a20ad55589efcb10 ]---
>> [    0.012297]=20
>> [    1.012304] Kernel panic - not syncing: Fatal exception
>>=20
>> next-20210723 was good. The boot failure seems to have been introduced w=
ith next-20210726.
>>=20
>> I have attached the boot log.
>=20
> I noticed this with OpenSUSE's ppc64le config [1] and my bisect landed on
> commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()"). That
> series just keeps on giving... Adding some people from that thread to
> this one. Original thread:
> https://lore.kernel.org/r/1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet=
.ibm.com/

This is because powerpc's set_memory_encrypted makes an ultracall but it=20
does not exist on that processor.

x86's set_memory_encrypted/decrypted have

       /* Nothing to do if memory encryption is not active */
        if (!mem_encrypt_active())
                return 0;

Probably powerpc should just do that too.

Thanks,
Nick
