Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C4C31705E
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 20:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhBJTjG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 14:39:06 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60351 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232085AbhBJTiJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 14:38:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id D3F0D5C0061;
        Wed, 10 Feb 2021 14:36:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 10 Feb 2021 14:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=uuBODOQjdj3KydyKzXRngmmLR59
        dRv7xuQsfYGBd6mI=; b=T8otxWOCmM+ieyHYR0dbiDdRimB03w1kJW+6/XM6pZ2
        r40k68XwJRA6KWGp0UYeEInVZ4ohdKZluZbyhhpGFLgugjnE6bA6owUo8XL7Qglb
        DU+wNnRsJqU7s0Ar2dudilBWGPGkuOr6xJbsyTyVVKsqN9w0DStLlDMPb/kYvSX+
        AdH5QZSa4cdY0S+vYy6m+UTcEjovyBYVSR5/cqpTLhCI8ZX4sTopkJwrwVSGGCi0
        fP69T51RCPM1AFwvepu3cq/N8Z///ZustofNOWX2acYg168mqcccSR80phN+pw22
        Je1Y/axgX0bVmXJ87NUWKu0heWNXfXVIA26fzIQb0Yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uuBODO
        Qjdj3KydyKzXRngmmLR59dRv7xuQsfYGBd6mI=; b=r7aAKCVNwlOSsaaeLVRaXA
        MRbJrcmsfTeDo89jZei2J64mp3rAaA1FMu4FKlwf6AZgR7XddSZh+Xrd0LLRCavF
        iFkSCfJSNY5o2MeT/aXYX3SzKwlI2D7yzRvUhXZeuLrcAFX8zwqYNuYb3CmEGRnl
        EMRhD/WljKwBURy2COiP7r0C/lK0I0BBEMu+pk4mehL3YcHFNbq+2YSBZkP40Mh0
        HtOi2Ggjuc7E2kyTJWElDLdCIH0LRKvjduu0a7QINwmKdP6ThR17b+lBellMfi/V
        Ke1wD9Q2iL1JHk1vc+IHfFkps4MlYQ23WU5QICym6j7RuolLPwolzw+JO7Q/gltg
        ==
X-ME-Sender: <xms:2TUkYEzxiDgdmc3daUa0ZxZS6p-sneBa9eNwb5Sl6SWAc752jPNFEA>
    <xme:2TUkYIQhH73DL7CWG9LW5P4obkKImeNnDwBq6oAzKy4cqV2Li7fHgxHXB0SisB88r
    owCdDgLa80N1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:2TUkYGU1btNfqkVeZzwnHruirm5lLL9BhHq0s3JchbEiKs2HVdyMRg>
    <xmx:2TUkYCjm5B06jU5JpOSzwQOGhtiJoa3v839ihIaAtBpLV-w7OpAdMw>
    <xmx:2TUkYGCzYXqGG15d1_PW7dIKBAP2ppLVB99p1RLgvB4MCNXESN-HQg>
    <xmx:2TUkYJPMq75g51nvgfKdfb1Bmrs6JS7_22zx72ZLwGnuBW51xlODng>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id DCA61108005C;
        Wed, 10 Feb 2021 14:36:56 -0500 (EST)
Date:   Wed, 10 Feb 2021 20:36:54 +0100
From:   Greg KH <greg@kroah.com>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <YCQ11nY4Bg2L2HWo@kroah.com>
References: <20210210214720.02e6a6be@canb.auug.org.au>
 <YCQjfqH415zIhhyz@kroah.com>
 <CAGETcx88Ln2XxuLN7P2BVhzB=OQxPLLsBN7WLL1j2JtR4+Z8ow@mail.gmail.com>
 <CAGETcx9zM2OdbNDcC7pXGtY9yqRgb-wt0YzFv6wfNgQi0gM+8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx9zM2OdbNDcC7pXGtY9yqRgb-wt0YzFv6wfNgQi0gM+8w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 11:17:16AM -0800, Saravana Kannan wrote:
> On Wed, Feb 10, 2021 at 11:06 AM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Wed, Feb 10, 2021 at 10:18 AM Greg KH <greg@kroah.com> wrote:
> > >
> > > On Wed, Feb 10, 2021 at 09:47:20PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > After merging the driver-core tree, today's linux-next build (sparc64
> > > > defconfig) failed like this:
> > > >
> > > > drivers/of/property.o: In function `parse_interrupts':
> > > > property.c:(.text+0x14e0): undefined reference to `of_irq_parse_one'
> > > >
> > > > Caused by commit
> > > >
> > > >   f265f06af194 ("of: property: Fix fw_devlink handling of interrupts/interrupts-extended")
> > > >
> > > > CONFIG_OF_IRQ depends on !SPARC so of_irq_parse_one() needs a stub.
> > > > I have added the following patch for today.
> > > >
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Wed, 10 Feb 2021 21:27:56 +1100
> > > > Subject: [PATCH] of: irq: make a stub for of_irq_parse_one()
> > > >
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  include/linux/of_irq.h | 9 +++++++--
> > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > Thanks Stephen!
> 
> Actually the stub needs to return an error. 0 indicates it found the interrupt.

Can you send a fix-up patch for this?  This is now in my tree :(

thanks,

greg k-h
