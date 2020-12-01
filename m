Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7882B2CA017
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgLAKkd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:40:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:41206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730152AbgLAKkd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 05:40:33 -0500
Received: from localhost (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67E9520644;
        Tue,  1 Dec 2020 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606819192;
        bh=t9r/K8kwhfWwjzpxV+Ixn5Vw8J6Duzp+cUWGXl1k5Bc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gt1ozuGhI8oXKKmEPpk/w0W4Qhc2IHzBfhgX+M84OjnpA6ED8QOCc8gYJnNslB4gz
         fIxTj1IvxlWR7G/9Vo2voaY3auzSsDU13J9Iwx4ZcABJXVmn6CJPDAwCgKTO1jLeFS
         NH0Od1JBElYxi+ilqBbT3IUF4SRZfv4ONXsHsSBE=
Date:   Tue, 1 Dec 2020 16:09:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the phy-next tree
Message-ID: <20201201103947.GZ8403@vkoul-mobl>
References: <20201201170731.4c93b812@canb.auug.org.au>
 <CAMhs-H83LKBgSQ6qGxFFtM2zm4d1KCXzGHrZ8J7w=JGGx=Q3wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H83LKBgSQ6qGxFFtM2zm4d1KCXzGHrZ8J7w=JGGx=Q3wQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 01-12-20, 07:45, Sergio Paracuellos wrote:
> Hi Stephen,
> 
> On Tue, Dec 1, 2020 at 7:07 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the phy-next tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/phy/ralink/phy-mt7621-pci.c:17:10: fatal error: mt7621.h: No such file or directory
> >    17 | #include <mt7621.h>
> >       |          ^~~~~~~~~~
> >
> > Caused by commit
> >
> >   d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
> 
> This driver has two includes which are in
> "arch/mips/include/asm/mach-ralink" and are directly included in the
> driver:
> * mt7621.h
> * ralink_regs.h
> 
> This is because this path is directly included in
> arch/mips/ralink/Platform for "ralink":
> 
> #
> # Ralink SoC common stuff
> #
> cflags-$(CONFIG_RALINK)     += -I$(srctree)/arch/mips/include/asm/mach-ralink
> 
> and this driver directly depends on RALINK or COMPILE_TEST (which
> might be the problem here):
> 
> 
> and this driver directly depends
> on RALINK or COMPILE_TEST:
> 
> config PHY_MT7621_PCI
>     tristate "MediaTek MT7621 PCI PHY Driver"
>     depends on (RALINK || COMPILE_TEST) && OF
>     select GENERIC_PHY
>     select REGMAP_MMIO
>     help
>       Say 'Y' here to add support for MediaTek MT7621 PCI PHY driver
> 
> >
> > I have reverted that commit for today.
> 
> What is the correct way of fixing this? Include complete path for both
> of them like this?
> 
> index db79088d5362..cebd53f5a797 100644
> --- a/drivers/phy/ralink/phy-mt7621-pci.c
> +++ b/drivers/phy/ralink/phy-mt7621-pci.c
> @@ -14,8 +14,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/sys_soc.h>
> -#include <mt7621.h>
> -#include <ralink_regs.h>
> +#include <asm/mach-ralink/mt7621.h>
> +#include <asm/mach-ralink/ralink_regs.h>
> 
> Vinod, please let me know if you want me to send anything for fixing this.

Yes this makes sense. this will ensure it gets picked up and doesn't
depend in arch specific stuff

-- 
~Vinod
