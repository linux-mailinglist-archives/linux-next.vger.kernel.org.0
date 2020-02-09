Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B8D156CF6
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2020 23:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgBIW5k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Feb 2020 17:57:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:56908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbgBIW5j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Feb 2020 17:57:39 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFA99207FF;
        Sun,  9 Feb 2020 22:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581289058;
        bh=DxHH/6KEUU3zTOXsaCU8t2IAUpHzhTqiEU3ywqLZ4xQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=txaPllr+Kl78scBUBbbEr/WoRS0VdruoEROS2B5NJZ5BkGeMrUI0eLWO7A01plfcl
         RO8L1nGrVaxykC0WSaYEafR6hAeiDMdj5GE5JCubdl5YVpT+Nacv0s8PrefpwrvYSA
         CKoR2gH9w484u4ppnEByYZRc0JnvH1FTUy/HfLwE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1j0vWC-003wRy-P8; Sun, 09 Feb 2020 22:57:36 +0000
Date:   Sun, 9 Feb 2020 22:57:35 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure in Linus' tree
Message-ID: <20200209225735.3c2eacb6@why>
In-Reply-To: <CAHk-=wiM9gSf=EifmenHZOccd16xvFgQyV=V=9jEHR7_h3b0JA@mail.gmail.com>
References: <20200210080821.691261a8@canb.auug.org.au>
        <CAHk-=wiM9gSf=EifmenHZOccd16xvFgQyV=V=9jEHR7_h3b0JA@mail.gmail.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: torvalds@linux-foundation.org, sfr@canb.auug.org.au, yuzenghui@huawei.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, 9 Feb 2020 13:24:18 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

Stephen, Linus,

> On Sun, Feb 9, 2020 at 1:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > Just building Linus' tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > arm-linux-gnueabi-ld: drivers/irqchip/irq-gic-v3-its.o: in function `it=
s_vpe_irq_domain_alloc':
> > irq-gic-v3-its.c:(.text+0x3d50): undefined reference to `__aeabi_uldivm=
od'
> >
> > Caused by commit
> >
> >   4e6437f12d6e ("irqchip/gic-v4.1: Ensure L2 vPE table is allocated at =
RD level") =20

Gniii... Sorry for the breakage.

>=20
> Ahh. 64-bit divides without using do_div() and friends.
>=20
> Is GICv4 even relevant for 32-bit ARM?

Only should someone boot a large 64bit server in 32bit mode and run VMs
with direct injection of interrupts. And definitely not once we get rid
of 32bit KVM.

Do you mind applying the following patch on top? It fixes the breakage
here.

Thanks,

	M.

=46rom d06ab34c3491d3cd191e024bf2da1eb9b8caccdd Mon Sep 17 00:00:00 2001
From: Marc Zyngier <maz@kernel.org>
Date: Sun, 9 Feb 2020 22:48:50 +0000
Subject: [PATCH] irqchip/gic-v4.1: Avoid 64bit division for the sake of 32b=
it
 ARM

In order to allow the GICv4 code to link properly on 32bit ARM,
make sure we don't use 64bit divisions when it isn't strictly
necessary.

Fixes: 4e6437f12d6e ("irqchip/gic-v4.1: Ensure L2 vPE table is allocated at=
 RD level")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-=
its.c
index 1ee95f546cb0..83b1186ffcad 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2444,8 +2444,8 @@ static u64 inherit_vpe_l1_table_from_rd(cpumask_t **m=
ask)
 static bool allocate_vpe_l2_table(int cpu, u32 id)
 {
 	void __iomem *base =3D gic_data_rdist_cpu(cpu)->rd_base;
-	u64 val, gpsz, npg;
-	unsigned int psz, esz, idx;
+	unsigned int psz, esz, idx, npg, gpsz;
+	u64 val;
 	struct page *page;
 	__le64 *table;
=20
--=20
2.20.1


--=20
Jazz is not dead. It just smells funny...
