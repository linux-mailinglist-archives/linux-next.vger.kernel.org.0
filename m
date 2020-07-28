Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C705C2304B9
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 09:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgG1Hxq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 03:53:46 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47597 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728068AbgG1Hxp (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jul 2020 03:53:45 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 0D7045C00F7;
        Tue, 28 Jul 2020 03:53:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 Jul 2020 03:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=YVyq+EYfCfBVpaHdh0TgyJqybwJ
        x+qzHK/1v5m/aiWE=; b=X2JzHMz+20O4VNpoLk+a/AIhVVY8bcx0sSIPuWDEfwV
        XXtfvRRGrQpYQtnlI6S7fXf3RWds4yPlacsSXolf80bDnxF/pt4SbMSXJl23VhKp
        IcVDIREMWKyhtZM8v3b/2XqpEv/MsC+ARo6D2k7lix7lB4rXGYTIU6p/m82kUO4e
        hGoCd8C4KjmbWhTqaPOgw2+Q7dKhqCm0gOvuloeVOxN+LvcSLvIgjMymxbgPWEuA
        s76fSZULCld64hyF2oLNSUL8bR3MS/j4IoRHSnMHq3PeMjgng9njjBSIC/un1qoI
        dIdPmSoeOnKjxZDvNmcGVBF3h/BKPF/BwvfhPXJQsyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YVyq+E
        YfCfBVpaHdh0TgyJqybwJx+qzHK/1v5m/aiWE=; b=Wi0GpzlHNQAMd55knTEU0t
        jYVZui30wC7PiRo2eY0CROAkCecrqjAE85UXklFhHzT+0zM7b69fmcI0ELWNGtTs
        GQqhBY3eMEkgQKJLG6TKLDKhTI44rWKwvguM/gK9XczxXVBsAajS8CuX+sRukb/b
        8lEE52ter/PpwRIHM8gY6/6AQOqHSqzivsWn0ra4W1TGLSqPH3gCyZXjUXALFMvG
        6Q0RIeyCyPaSHOyahtPqpKkBKTysMYfshqcMj2syUzWny09v8MVvqfGmTIRIYwxS
        N1u+s2zEGRiPeHkj3dpgcKW913OBLx+ODLJnXLtU9Pxbc23haNmTnwj4XxUtg4ag
        ==
X-ME-Sender: <xms:htkfX2xuHOJZ90mkKQ_Qtn17faccczWJYra56XIq0_snO4c9yPTXPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedugdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:htkfXyQo1ozQW5P6MoZgV2XxmpAZKsYA69BB9xeNEkEQWUPicu-Ksw>
    <xmx:htkfX4XHz48M-1_wh5g8bl9IlLmiE_mAcdHHC_UtGZxRt3qVAKpDtQ>
    <xmx:htkfX8jdOHL5hmWk4Bg1DsV-sFptwr20g56pFLMYPnn3zvIoqB66WQ>
    <xmx:iNkfX7O_kGjR3JcyLlSmkyrBhtUWKkmrm_M3OSCrS_u-ExxPqdelvQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 54521328005E;
        Tue, 28 Jul 2020 03:53:42 -0400 (EDT)
Date:   Tue, 28 Jul 2020 09:53:36 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200728075336.GB351768@kroah.com>
References: <20200727180831.6c356fc1@canb.auug.org.au>
 <20200727092448.GB1764157@kroah.com>
 <20200728173331.5bf1f438@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728173331.5bf1f438@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 28, 2020 at 05:33:31PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 27 Jul 2020 11:24:48 +0200 Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the char-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > In file included from drivers/misc/habanalabs/goya/goya.c:8:
> > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > >    12 | #include "habanalabs.h"
> > >       |          ^~~~~~~~~~~~~~
> > > In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
> > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > >    12 | #include "habanalabs.h"
> > >       |          ^~~~~~~~~~~~~~
> > > 
> > > Presumably caused by commit
> > > 
> > >   70b2f993ea4a ("habanalabs: create common folder")
> > > 
> > > I have used the char-misc tree from next-20200724 for today.  
> > 
> > Ugh, this is a mess of a merge with this driver.
> > 
> > Oded, I'll take Stephen's merge resolutions here and push out a new
> > version, and try to resolve this error, but if you could verify I got it
> > correct, that would be great.
> 
> The conflicts are gone, but I still get these errors.

Very odd, I can not duplicate this at all here.  I just did a clean
checkout of the char-misc-next branch and a full 'make allmodconfig' for
x86_64, and it worked just fine.

Are you sure it's not coming from some other tree?

thanks,

greg k-h
