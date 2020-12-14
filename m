Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8972DA246
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 22:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503651AbgLNVGq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 16:06:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:39944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503637AbgLNVGl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 16:06:41 -0500
Date:   Mon, 14 Dec 2020 22:05:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607979959;
        bh=kYxvt5XZtu8HNBuiKTDtgnZwS6o+QdAyk43mKWgewHs=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=cV75mcLMKa3HOy8fqzFsLZl77OILwX/xz2P1qGMyIJ6cmwhQra5MgCVN+r6qp60ny
         oUSFDG1SPh5soSckVEI6xaFvHJdSKr/CDi0Sq8ll3iHoJkqKDCifSHUZRb7erIHpby
         khiga1bN4KBYuDMfAhCoL8dYq6BLshY65UGA5sfVwLJaWpTFyOBrTuOUf3FfGtSo8M
         wL7dXpLGLnscYC55g9bxT8MHqbrvPQxOTMwkiii1mPA2L3Tfumgr9H7Lti+Pvb8aVy
         OZLxofGZwnE9EzRSDUrbI/kL65Mxi+GnDWy4uf1/FwZ+nMwPEwyog+8RI1/YhNFcxO
         ta/Rolcmigheg==
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     ARM <linux-arm-kernel@lists.infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Cerveny <m.cerveny@computer.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the arm-soc
 tree
Message-ID: <20201214220554.47a3709f@coco.lan>
In-Reply-To: <20201215073037.5bb96437@canb.auug.org.au>
References: <20201208110413.04400395@canb.auug.org.au>
        <20201215073037.5bb96437@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

HI Stephen/Arnd/Olof,

Em Tue, 15 Dec 2020 07:30:37 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> On Tue, 8 Dec 2020 11:04:13 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the v4l-dvb tree got a conflict in:
> > 
> >   drivers/staging/media/sunxi/cedrus/cedrus.c
> > 
> > between commit:
> > 
> >   c6e95daab1cc ("media: cedrus: Remove the MBUS quirks")
> > 
> > from the arm-soc tree and commits:
> > 
> >   503dab0b8a56 ("media: cedrus: Register all codecs as capability")
> >   68b4a01f88af ("media: cedrus: Make VP8 codec as capability")
> > 
> > from the v4l-dvb tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/staging/media/sunxi/cedrus/cedrus.c
> > index d5fca10ea5b4,18d54f9fd715..000000000000
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > @@@ -522,7 -584,11 +584,10 @@@ static const struct cedrus_variant sun5
> >   
> >   static const struct cedrus_variant sun50i_h6_cedrus_variant = {
> >   	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
> > - 			  CEDRUS_CAPABILITY_H265_DEC,
> > + 			  CEDRUS_CAPABILITY_MPEG2_DEC |
> > + 			  CEDRUS_CAPABILITY_H264_DEC |
> > + 			  CEDRUS_CAPABILITY_H265_DEC |
> > + 			  CEDRUS_CAPABILITY_VP8_DEC,
> >  -	.quirks		= CEDRUS_QUIRK_NO_DMA_OFFSET,
> >   	.mod_rate	= 600000000,
> >   };
> >     
> 
> Just a reminder that this conflict still exists.

Thanks for the reminder! I ended forgetting about it.
Last week was hard for me, as I had several things to solve
before taking some vacations, including preparing for a talk on
an user's group that happened last Saturday.

In any case, Linus already pulled from my tree:

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fab0fca1da5cdc48be051715cd9787df04fdce3a

So, I guess the best would be to either let Linus know about that
when he would be pulling from arm-soc, or to solve such conflict 
between upstream and arm-soc.

As I'm in PTO those days, in order to avoid further conflicts with
linux-next, I'll pull from Linus tree today.

Thanks,
Mauro
