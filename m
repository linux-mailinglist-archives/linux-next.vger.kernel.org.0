Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847F42310BC
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 19:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731903AbgG1RTY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 13:19:24 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49429 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731684AbgG1RTX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jul 2020 13:19:23 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 9F37B5C021F;
        Tue, 28 Jul 2020 13:19:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 Jul 2020 13:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=oszPkahzB5L/qIG+jiQHMN5XtZZ
        B1qd183SFEUUaOao=; b=EdeSowAMqhZYj/p7wkqe/ATuJbFPLCBerEiqfnoTmI7
        6zJ7nzjwGu05KLG37zpK3qCyY63f7tPIXhKcOiUn8RAd4x2hSbeEt1rKpk9S5w0e
        BpAmXlzGqjh6dOJDJx0PlD6sjboRP+fz3Yb0tjz2rGQI/TAye+YXN9mmh+0mrqJt
        +lKCfTaEUM0Mydtqku5R2TDlVmkgG4ozUvxY1ymfoNv2NOZbgKQtjB8PXd5JPMnp
        d3vixaa6rW38xzuT7Hnw/9vRx+uKrbTvktzOLwyRBcMoN3phFWAbrYAKubb5i4Xa
        Jc5PCarPpOCEOc/iTCQwpd3sam+e4/MVvptSjaALm+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oszPka
        hzB5L/qIG+jiQHMN5XtZZB1qd183SFEUUaOao=; b=bRjJO0sSf+ObcR90dyLy3z
        4yyC9ZwxCgCWipb8NYLvXWBVN5m9Ys/LV6UQITVmj4ibod+lNkK+lkKWlvlhz/1x
        P2hzeqllb+LHRDY1gMWBcthmYktwBjN3AmYLNffw34n8wsgjz9WeSIDxUO8e/9GY
        CHt3ehuFRQPuBuqvYr0rHqRSkIj2SxqKbFOkfoV4yJ9U7euMFyaF6FVE4Hmk9Tnp
        ob60LbineeIkWwdMukao9dhQ7LsU1rxgnTS3EOO28pK6NGxdDhy9+0Uk+4cUe1Sl
        WUOGfDlPs4jODGy68CGpqQs/SXKOT5wunUvfgXMjW+bQeqyM90Mb5MRR0wv+k6Kw
        ==
X-ME-Sender: <xms:GV4gX5QbmbSdf3rv-iLNBTuvu8eRsdhzAc4U3xyM-EPnPzi19xERGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedvgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:GV4gXyzSXYCFgeRoFmGPstSZYuKzQAk8D3hsG-Em8GyTrB5vtEe_yQ>
    <xmx:GV4gX-1cttLXoWJXtduWB2M7RjmeNdvb4shX42eHhKY8gDCwlOxJOA>
    <xmx:GV4gXxDrgQRxsNrjurv_ad9xZS4UGvEKBBBL3IRnT7m9Kq4_gqZMYw>
    <xmx:Gl4gX1tk3p_mOzIJnCUukvIvfGw7_QaRYEywjJVq-awSPEmEBY005A>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 454013280063;
        Tue, 28 Jul 2020 13:19:21 -0400 (EDT)
Date:   Tue, 28 Jul 2020 19:19:13 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200728171913.GE43359@kroah.com>
References: <20200727180831.6c356fc1@canb.auug.org.au>
 <20200727092448.GB1764157@kroah.com>
 <20200728173331.5bf1f438@canb.auug.org.au>
 <20200728075336.GB351768@kroah.com>
 <20200728182359.2b9b31bf@canb.auug.org.au>
 <20200728171705.GD43359@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728171705.GD43359@kroah.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 28, 2020 at 07:17:05PM +0200, Greg KH wrote:
> On Tue, Jul 28, 2020 at 06:23:59PM +1000, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > On Tue, 28 Jul 2020 09:53:36 +0200 Greg KH <greg@kroah.com> wrote:
> > >
> > > On Tue, Jul 28, 2020 at 05:33:31PM +1000, Stephen Rothwell wrote:
> > > > Hi Greg,
> > > > 
> > > > On Mon, 27 Jul 2020 11:24:48 +0200 Greg KH <greg@kroah.com> wrote:  
> > > > >
> > > > > On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote:  
> > > > > > Hi all,
> > > > > > 
> > > > > > After merging the char-misc tree, today's linux-next build (x86_64
> > > > > > allmodconfig) failed like this:
> > > > > > 
> > > > > > In file included from drivers/misc/habanalabs/goya/goya.c:8:
> > > > > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > > > > >    12 | #include "habanalabs.h"
> > > > > >       |          ^~~~~~~~~~~~~~
> > > > > > In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
> > > > > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > > > > >    12 | #include "habanalabs.h"
> > > > > >       |          ^~~~~~~~~~~~~~
> > > > > > 
> > > > > > Presumably caused by commit
> > > > > > 
> > > > > >   70b2f993ea4a ("habanalabs: create common folder")
> > > > > > 
> > > > > > I have used the char-misc tree from next-20200724 for today.    
> > > > > 
> > > > > Ugh, this is a mess of a merge with this driver.
> > > > > 
> > > > > Oded, I'll take Stephen's merge resolutions here and push out a new
> > > > > version, and try to resolve this error, but if you could verify I got it
> > > > > correct, that would be great.  
> > > > 
> > > > The conflicts are gone, but I still get these errors.  
> > > 
> > > Very odd, I can not duplicate this at all here.  I just did a clean
> > > checkout of the char-misc-next branch and a full 'make allmodconfig' for
> > > x86_64, and it worked just fine.
> > > 
> > > Are you sure it's not coming from some other tree?
> > 
> > Do you build with a separate object tree?  I always use make O=...
> > which makes the difference.  I tested with just your tree.
> 
> Ah, no, I do not.  Odd, let me see what kind of crazy they are doing
> with include build directives...
> 
> thanks for the hint.

Ok, fix sent out, that should resolve this.

thanks,

greg k-h
