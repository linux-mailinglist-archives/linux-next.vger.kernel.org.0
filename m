Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253332310B5
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 19:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731805AbgG1RRO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 13:17:14 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54267 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731673AbgG1RRO (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Jul 2020 13:17:14 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 2D2505C0207;
        Tue, 28 Jul 2020 13:17:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 28 Jul 2020 13:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=6r6DbRlrInsg+XtPk2hpOlGwftP
        Rk+NrHtTLEfhmS2I=; b=cJ5j9xhBjaAoEGITfBkTjgZv8xLbCDdZvHka6OuNlvG
        eUf8t0OIC9zN1jLbeFcx6CG8b+yz+C3IqkYGyyQg/jF0bQy9uccEvxE2KzMY+NKJ
        bZXJES2oArPsxcUXyOHfYfHhaiGXZmu91QDGnFpmMCdithpb3wNZDs+2Jtty+bGl
        KvrlUOtxDynk7MmAUc56Ll2F5JByxzElm2mccifp7ExmeZRAZ70KeJWM5g9GZpns
        hrlCQTVfh4goluBztYOlyQZ8H7WykKQyMwKin4QjHF0p08uc899iPB/QnOHtLeor
        A5l/mR4CTdhJu0oSH7FXNnzVFou8MD6hslE9c68w0Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6r6DbR
        lrInsg+XtPk2hpOlGwftPRk+NrHtTLEfhmS2I=; b=N2WT3N8elPxo8RKsHkz2nE
        KYRAJ6Lx5HcRAt8UO5IYkfMik6E6rgenC3Ou+mAi8dJb1T1Zq1V5jgIjwb0ZW7Gq
        enr2HgJsB+71et+Kopng5HANA5LZgVVTBDb+/t9OLEW+PzeD9fh/mHLDWh6NzrYh
        bYAMh6HT2wjEaMKN6p7pI2X9lZC7vRLWPpCWdIOQoEsAhfslzjK02qaVO9mgli34
        lOh8qGGuwM4+h3winN2zMls50zIXJYC1mkHNaHAx2azoHJGd3GKtd+pQ2DbrnCKm
        qRu8jkszoBD6xRvNzcn8Els9rjHKvAed6ySfwSnZGMLk1ax4PB0PKXix12euPZAg
        ==
X-ME-Sender: <xms:l10gX-DUAyV0PlG9v9cYBl6YFTZMAtAftNocKlbhOncC5WocLA-riw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedvgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:l10gX4j_WPpILpWe2XSTQk6ewQaEjbAt1wq6_aJgWTsXbamy0cDegQ>
    <xmx:l10gXxlVOQbEQ8fJzm6ZjZhSSkCG8t_im7Y1-qABzOzi7F1OKtzz3w>
    <xmx:l10gX8wdzY7ZrPLHttJ1qXHfB-4Z1r0BwR5QH9jpxdqj9MouWOy4bA>
    <xmx:mV0gX-ebeQN0iLJ-qRErdbph9ZdLkfoLAIloczN0FPtrGLmZbhfAiw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 852A930600A3;
        Tue, 28 Jul 2020 13:17:11 -0400 (EDT)
Date:   Tue, 28 Jul 2020 19:17:05 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200728171705.GD43359@kroah.com>
References: <20200727180831.6c356fc1@canb.auug.org.au>
 <20200727092448.GB1764157@kroah.com>
 <20200728173331.5bf1f438@canb.auug.org.au>
 <20200728075336.GB351768@kroah.com>
 <20200728182359.2b9b31bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728182359.2b9b31bf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 28, 2020 at 06:23:59PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Tue, 28 Jul 2020 09:53:36 +0200 Greg KH <greg@kroah.com> wrote:
> >
> > On Tue, Jul 28, 2020 at 05:33:31PM +1000, Stephen Rothwell wrote:
> > > Hi Greg,
> > > 
> > > On Mon, 27 Jul 2020 11:24:48 +0200 Greg KH <greg@kroah.com> wrote:  
> > > >
> > > > On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote:  
> > > > > Hi all,
> > > > > 
> > > > > After merging the char-misc tree, today's linux-next build (x86_64
> > > > > allmodconfig) failed like this:
> > > > > 
> > > > > In file included from drivers/misc/habanalabs/goya/goya.c:8:
> > > > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > > > >    12 | #include "habanalabs.h"
> > > > >       |          ^~~~~~~~~~~~~~
> > > > > In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
> > > > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > > > >    12 | #include "habanalabs.h"
> > > > >       |          ^~~~~~~~~~~~~~
> > > > > 
> > > > > Presumably caused by commit
> > > > > 
> > > > >   70b2f993ea4a ("habanalabs: create common folder")
> > > > > 
> > > > > I have used the char-misc tree from next-20200724 for today.    
> > > > 
> > > > Ugh, this is a mess of a merge with this driver.
> > > > 
> > > > Oded, I'll take Stephen's merge resolutions here and push out a new
> > > > version, and try to resolve this error, but if you could verify I got it
> > > > correct, that would be great.  
> > > 
> > > The conflicts are gone, but I still get these errors.  
> > 
> > Very odd, I can not duplicate this at all here.  I just did a clean
> > checkout of the char-misc-next branch and a full 'make allmodconfig' for
> > x86_64, and it worked just fine.
> > 
> > Are you sure it's not coming from some other tree?
> 
> Do you build with a separate object tree?  I always use make O=...
> which makes the difference.  I tested with just your tree.

Ah, no, I do not.  Odd, let me see what kind of crazy they are doing
with include build directives...

thanks for the hint.

greg k-h
