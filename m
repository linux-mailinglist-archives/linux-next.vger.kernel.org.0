Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2AE2CA0D3
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbgLALDc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 06:03:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729808AbgLALDc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 06:03:32 -0500
Received: from localhost (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 27EAC2084C;
        Tue,  1 Dec 2020 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606820571;
        bh=6ZkXbccJTBEOJD0HUHote1XwYarFlwXDn8PLAiMLWwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rc1G5BYuOw6C/3nbfU7SqI/dkp3Bhxl+7ArJA/lQ+AxU54V5XoqlD3DHFw50UHk4P
         fc0LvPvTQ9Ru67PR4rIoIXsZ8ol2YGGHncUX6ZHD/G5vwhFjGznpQbRkhDZu17xDwZ
         oWHwH5EfDl0eXRHSlQJF4oNXkKiDuqTrTZItKJPA=
Date:   Tue, 1 Dec 2020 16:32:45 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH 1/3] phy: ralink: phy-mt7621-pci: add include search path
 in Makefile
Message-ID: <20201201110245.GB8403@vkoul-mobl>
References: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
 <20201201101612.28458-2-sergio.paracuellos@gmail.com>
 <20201201104246.GA8403@vkoul-mobl>
 <CAMhs-H_9MTZvC+NkFm28MuiRQ0tpNw7gd97sN9dBgsqYD7_1LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H_9MTZvC+NkFm28MuiRQ0tpNw7gd97sN9dBgsqYD7_1LA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 01-12-20, 11:47, Sergio Paracuellos wrote:
> Hi Vinod,
> 
> On Tue, Dec 1, 2020 at 11:42 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 01-12-20, 11:16, Sergio Paracuellos wrote:
> > > This driver includes the following two files directly:
> > > - mt7621.h
> > > - ralink_regs.h
> > >
> > > Compilation for its related platform properly works because
> > > its real path is included in 'arch/mips/ralink/Platform' as
> > > cflags.
> > >
> > > This driver depends on RALINK but also is enabled for COMPILE_TEST
> > > where nothing about its platform is known and this directly
> > > included files are not found at all breaking compilation.
> > >
> > > Fix this problem adding include search path for ralink in
> > > ralink phy directory Makefile.
> > >
> > > Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
> >
> > Pls add reported-by sfr..
> 
> Ok, Will change this and send v2.
> 
> >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >  drivers/phy/ralink/Makefile | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/phy/ralink/Makefile b/drivers/phy/ralink/Makefile
> > > index cda2a4a7ca5e..c8f9adba0d82 100644
> > > --- a/drivers/phy/ralink/Makefile
> > > +++ b/drivers/phy/ralink/Makefile
> > > @@ -1,3 +1,6 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +ccflags-y    += -I$(srctree)/arch/mips/include/asm/mach-ralink
> >
> > Can we include <asm/mips/...> instead of using this?
> 
> Doing that also fails because path for 'arch/mips/include' is not
> added also because we are compiling in x86_64.
> Looking into other drivers I see the way to avoid this kind of
> platform specific stuff is adding related paths in
> cflags. So I don't really know if there is another way.

Right, ideally these headers should have been in include/linux, but.. I
dont like this way, can we drop compile test..?

-- 
~Vinod
