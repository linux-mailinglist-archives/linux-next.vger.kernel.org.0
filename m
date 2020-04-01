Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75ED519A597
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 08:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731868AbgDAGrd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 02:47:33 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40533 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731850AbgDAGrd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 02:47:33 -0400
Received: by mail-pf1-f194.google.com with SMTP id c20so9101131pfi.7;
        Tue, 31 Mar 2020 23:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mMQk64903L6tAck8jm35O7g6g92Bgi88bu7w7mbPreY=;
        b=UiscXnX5l8+lKeHueM4pXQbIyNerEXuTPIhWKDBzq4J6OTms3t1UH1t8clofuh7i0N
         F9gwbrZZx3IAqDNu2DtUaWVwtODmnJIz2VFwou2jSeIYTq5uLVPgRhcR7/H95zwOKw4e
         H8B9EgsX96oX9tcN/i0qTVOePLyLshIzWr8v+M+MVTAyfDbEPNqvzZCdm9kV46WppGcn
         byZev4rjSNX3yEZU1OFrD7C1aIVWnKERtN0VjXHMpq0s4QdA+jYsEP0etyyCnJEfcHsc
         AfUaJ6n8Y43qF1zqUBB+3g0dTalj/KUxa3CphKf3vufnEN7nFJBzZA6L1z7SjKygcDwo
         SUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mMQk64903L6tAck8jm35O7g6g92Bgi88bu7w7mbPreY=;
        b=EJ5Aozpb3m9O0BioZy+wVI+ytAGIe43fwGWuUXXTzt/gVGacU34oi4atr8rzUwbOHs
         wk6wgY1FvXAWx4OYZv1DfOSGADsGbhcG/26v0wynZH0AXDjp4Q8VPGTvX8TrL7eeaaXP
         njaGX+oP1WNE+aTtLFlVwoE4O5BBJF+sajONaExrMTFG9gjn7ZN02k20jDjusPVm/5f6
         GDcnXl7Yg3utHtCZDeFCRR7pqywePQg3oqXtKH2DCOSphfwcwcgXlMue3vMP2AFG9Dob
         Gfmg5Ubt7SmKpC1+pIhi3Fh06HXIA15X1yPUrlmni8cJckJEychTm/xXx9yocWBdUsJJ
         mbsA==
X-Gm-Message-State: AGi0PuZqPdXxa6pVfuVlkBG/C0FZQOMnUB1BtL64+ZByo2uKk4oUSNZQ
        fc9FTrWUgd4CJW8xtRq7OSqc9zUigID/nH5FxFwl+7Ypju0=
X-Google-Smtp-Source: APiQypLYG7FDIzRj/aLjkhU5KlG0qqqrJEap+/dgRs8SECciM8BH7fFrpvPVsrEy/R354lCAVwMcSmLlQ21DVrlW4CU=
X-Received: by 2002:a63:5859:: with SMTP id i25mr7460690pgm.74.1585723652026;
 Tue, 31 Mar 2020 23:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200323143816.345b3d54@canb.auug.org.au> <20200401141113.21014665@canb.auug.org.au>
In-Reply-To: <20200401141113.21014665@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Apr 2020 09:47:20 +0300
Message-ID: <CAHp75VdoMpA4tDg57UND5hnWXV60EGaThPxLnTpKT6wG7bdYYQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Darren Hart <dvhart@infradead.org>, Greg KH <greg@kroah.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 1, 2020 at 6:11 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Mon, 23 Mar 2020 14:38:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the driver-core tree got a conflict in:
> >
> >   drivers/platform/x86/Kconfig
> >
> > between commit:
> >
> >   45a3d578f2ed ("platform/x86: Kconfig: Group modules by companies and functions")
> >
> > from the drivers-x86 tree and commit:
> >
> >   835e1b86ef8c ("platform/x86: touchscreen_dmi: Add EFI embedded firmware info support")
> >
> > from the driver-core tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.

> This is now a conflict between the drivers-x86 tree and Linus' tree.

PDx86 is in Linus tree already with conflict resolutions.

-- 
With Best Regards,
Andy Shevchenko
