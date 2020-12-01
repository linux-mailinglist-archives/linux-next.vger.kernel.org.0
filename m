Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA832CA045
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgLAKsZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgLAKsY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:48:24 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF44BC0613CF;
        Tue,  1 Dec 2020 02:47:44 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id t143so1266309oif.10;
        Tue, 01 Dec 2020 02:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rleltwVd7BEzYh3PMfrO+N8KvSpIGCnVZoy7Gdu5rn8=;
        b=cZUlMu296+lcYnKEZrIkr/brpRAQJAEklQDc06vsXd3KTjRdOjQtZv5Uvbacf38lQg
         UQrpQRdDg8rmqMSw33lmjNHVgFdvDw1pym54Rbb2znYPv7GP4jvXD5e5rGnlJa5EbDFv
         jPElNesOrqVEoD3eq7stEEhGPK1rXk2yH4h0xHKTzavjK1Q6kbNxqw12XjdsxA+BIU2M
         CM9EEIX7Ls3qUcPszjvhkASNPRifSNW9H8Gdyw1eiAgRfDhDOMSi2pQe5xU/UrzRMiww
         kRI+eI6Bjcm4TJInkTMesTUt5AfQKlTBjj6R4PitMk/afz+xEwIefsBHPP64+0WNcmE3
         N6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rleltwVd7BEzYh3PMfrO+N8KvSpIGCnVZoy7Gdu5rn8=;
        b=QUjoEFuwbuA5ypszyeNNV48gilk8PdCa/Wpui4nturTnGAXWfZ6rHJ/74ZzDWYPVDX
         m21QIdqcAJ+MtMqn/ILJ4yLGmd8SD7SafLq44FkD3Nl9ZYg2Tu3DItUBtdSVHNHdwLZU
         Hz/+xbdkZVDUWaLR4YkPU9la1D2PGPsHm2bZEUBe44hgB2oSy5iSeKDTsvJGt7/nLIMP
         guP6VY3WYOgYhQsR3btoaPUNVLWRuTZKZWvC4jzpLKbG3wXlaFbXvu3W4vYhtSz0RdGs
         wuf49DWx0widg4eomSoicYOyUhCuN7JrG+IEHFT0aPlteFyTZuvjqsgaYKFlNu8tGbox
         jkrQ==
X-Gm-Message-State: AOAM530h4ACL8nRz63FxnmvQcnA9YEEc/eCxw9sZRpC+qcGx0O7mNaqm
        DXFPjr+KTqjiyJ71t2toMD23w5/WBKaI1Cuj9BY=
X-Google-Smtp-Source: ABdhPJzS2yhdyeBA3Z85FwALl+6KhnAcmUSG0lFKIem/RTJZUOmTWgoDWhQRbDh/+6JvWhlG69clLH6yB2h4C+WKIwU=
X-Received: by 2002:aca:3ed5:: with SMTP id l204mr1226427oia.149.1606819664253;
 Tue, 01 Dec 2020 02:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
 <20201201101612.28458-2-sergio.paracuellos@gmail.com> <20201201104246.GA8403@vkoul-mobl>
In-Reply-To: <20201201104246.GA8403@vkoul-mobl>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 1 Dec 2020 11:47:33 +0100
Message-ID: <CAMhs-H_9MTZvC+NkFm28MuiRQ0tpNw7gd97sN9dBgsqYD7_1LA@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: ralink: phy-mt7621-pci: add include search path
 in Makefile
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Vinod,

On Tue, Dec 1, 2020 at 11:42 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 01-12-20, 11:16, Sergio Paracuellos wrote:
> > This driver includes the following two files directly:
> > - mt7621.h
> > - ralink_regs.h
> >
> > Compilation for its related platform properly works because
> > its real path is included in 'arch/mips/ralink/Platform' as
> > cflags.
> >
> > This driver depends on RALINK but also is enabled for COMPILE_TEST
> > where nothing about its platform is known and this directly
> > included files are not found at all breaking compilation.
> >
> > Fix this problem adding include search path for ralink in
> > ralink phy directory Makefile.
> >
> > Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
>
> Pls add reported-by sfr..

Ok, Will change this and send v2.

>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/phy/ralink/Makefile | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/phy/ralink/Makefile b/drivers/phy/ralink/Makefile
> > index cda2a4a7ca5e..c8f9adba0d82 100644
> > --- a/drivers/phy/ralink/Makefile
> > +++ b/drivers/phy/ralink/Makefile
> > @@ -1,3 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +
> > +ccflags-y    += -I$(srctree)/arch/mips/include/asm/mach-ralink
>
> Can we include <asm/mips/...> instead of using this?

Doing that also fails because path for 'arch/mips/include' is not
added also because we are compiling in x86_64.
Looking into other drivers I see the way to avoid this kind of
platform specific stuff is adding related paths in
cflags. So I don't really know if there is another way.

>
> > +
> >  obj-$(CONFIG_PHY_MT7621_PCI) += phy-mt7621-pci.o
> >  obj-$(CONFIG_PHY_RALINK_USB) += phy-ralink-usb.o
> > --
> > 2.25.1
>
> --
> ~Vinod

Best regards,
    Sergio Paracuellos
