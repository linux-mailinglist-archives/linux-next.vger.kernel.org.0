Return-Path: <linux-next+bounces-4877-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E539E3614
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 10:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35964165D5F
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 09:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948FF1990C4;
	Wed,  4 Dec 2024 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="iiS5S+/s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BCGULphx"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6F19309C;
	Wed,  4 Dec 2024 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733302799; cv=none; b=pLl+dF1jN2YIG93siw8XfZKyG/UqwYAozw37/io6ChKXMRzrjCIGgK5rBhnzTtTDBwa2dXp4XlD3JF3QFRVWpcvgOMe4h0DnriWWM9gijqHEdICJQ0XOdxBdMP+SfKjxiDD3cO0sD4UGkukK/EgCKD6EFvMdKvcTvrooQuh8j+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733302799; c=relaxed/simple;
	bh=ebxNIV2Tj3kzfj5Q6zw8vCI0Fdv/z0kzdBTluBIbnq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6ejB79+VfsgcQUuNOrLCbht/uUS+2wXgguUWJWCHMbJYcPG8jXxFl9ZSMXGJioSMhCiIqYTQv/Jf/rD0KqmrijV3s1gcwqljw68+lsak7uBCI0rI79npEruQpy6A7cn879o2HOMtEyxbGfMH/bl/VlwcGP7m24QZNESyEAhLpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=iiS5S+/s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BCGULphx; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 7C09411401B3;
	Wed,  4 Dec 2024 03:59:55 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 04 Dec 2024 03:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1733302795; x=1733389195; bh=gCarYu1JDj
	CHE4uXXUp0XTcKi2El+D0VQXRh4ay86n8=; b=iiS5S+/saXCWdxW/Ph9jVrZMDx
	3djT+1ZHgoaz6JuwGUEyvalkTWOYdrzDWO9yo33gmnrf05YqNdyyi5RCW1WTD7PG
	XKfkCDOuD3Pd9rTzD+FzAo7/mkd5Nb2A/MzQc7LrGRw3EvE2LRWcdDvfN8b+sm7K
	WIpjiQV7/A8E/jtWI3HUCc1o86GfuKbIM7PAwwb8AA4MUcax3/v7u6PXHLCm4yjo
	0brVJdPQvQTzWYmqwo+Vuz/xjdSOgaeAsQWUb1Zhr2WG2G+/b/J73tadNN6qhnK0
	VbVFsUJOXJ0oTku7PAfMkq/2RUE0YxdmDcSWIlJ4WZOqNtJCSrNfAanny7dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1733302795; x=1733389195; bh=gCarYu1JDjCHE4uXXUp0XTcKi2El+D0VQXR
	h4ay86n8=; b=BCGULphx3P2NVXOlnDiexwBeR3FALqJjQ/QVvqDjyE3X71lkyxj
	sqxL4W3T8TO8bZk27rvjDfA/s14a/OWZ0eydLvi9InUfl//I3pmwnzj2wkwcw2Dz
	L2OagWh3epVAmp8ScqdFW4eeNJjZno5nBHRdaKL6d3LDY0V26sW+QhYnwqcay8Yt
	u4JrlsNhyhMD4NqV6SRj9wiTyZGN0wT9x5xg6nZ/h2JzviDHqX3UZ+A8CHfLYG1o
	uqBZ0KB7AwPwe2nOqA3gYL1KinXEtbrHoJXBcT2eXkfsWf3n7TrGUwiTrd2ZDG3J
	z8L8U0O7eFjl9qVQFV2OoOblPVsQyIet2Qw==
X-ME-Sender: <xms:ChpQZ_Hsob3izFNuDlhhpYWoFksdbGGGIJiv7cTqx7tpOzEwhVkTAQ>
    <xme:ChpQZ8WE9OyPTi8XduzjrJ6v1p7EGvXqYjhRRozhMMkM4Zez0ng7sosiMiVaLzqeM
    epaZL5tpknhjA>
X-ME-Received: <xmr:ChpQZxLeYcYKCV0SV3_XcbrK1HRegJUP2L4ibGjkaGYwwYLXWZsPFw_sEoN6oK-fN8Nz_K7HZiPCQLdpnzvCwdZ9SzJKCgWhNkqfkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieeggdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepgeekgefgjeetveetkefhfeejudejgffgheffkeekfeeggfevgeegleff
    gefgteelnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdp
    nhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughpvg
    hnkhhlvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhu
    ghdrohhrghdrrghupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ChpQZ9Elq_5NjL4MinhZghJ8YBIBAVOezx_5e3ztQYg3xoNR_nFaxw>
    <xmx:ChpQZ1WkyInI3A4Bx42Oq4_1KsVQXAga38E6i6AY57lnvwKHZz4OZA>
    <xmx:ChpQZ4PyVKOPkTRwqRI1crfjScG-UJxb6GjW0SPT4w7WroakkDucgQ>
    <xmx:ChpQZ02Fbnouvmb_92UvyyLANgIHdI5PIDjzVrfym5i8nSoW5WUoKw>
    <xmx:CxpQZxpvbLppzoGY-O8cMzNWGEivxy8Yp31HWOgKceAG7jrDQZG8HSFU>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Dec 2024 03:59:53 -0500 (EST)
Date: Wed, 4 Dec 2024 09:59:51 +0100
From: Greg KH <greg@kroah.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <2024120442-rekindle-snarl-99f7@gregkh>
References: <20241015165538.634707e5@canb.auug.org.au>
 <2024101623-education-buffoon-0988@gregkh>
 <Zw_KjYQ7P2Qd8fDb@egonzo>
 <Z09XO31jzVdZJzuK@egonzo>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z09XO31jzVdZJzuK@egonzo>

On Tue, Dec 03, 2024 at 08:08:43PM +0100, Dave Penkler wrote:
> On Wed, Oct 16, 2024 at 04:15:41PM +0200, Dave Penkler wrote:
> > On Wed, Oct 16, 2024 at 09:40:03AM +0200, Greg KH wrote:
> > > On Tue, Oct 15, 2024 at 04:55:38PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > After merging the staging tree, today's linux-next build (powerpc
> > > > allyesconfig) failed like this:
> > > > 
> > > > ld: warning: discarding dynamic section .glink
> > > > ld: warning: discarding dynamic section .plt
> > > > ld: linkage table error against `nec7210_board_online'
> > > > ld: stubs don't match calculated size
> > > > ld: can not build stubs: bad value
> > [skip]
> > > > 
> > > > Caused by commit
> > > > 
> > > >   8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")
> > > > 
> > > > I have marked that driver as BROKEN for today.
> > > 
> > > Thanks, I'll go take your patch from next and add it to my tree for
> > > this, sorry about the build issues.
> > > 
> > > greg k-h
> > Hi,
> > All declarations and uses of `nec7210_board_online' match.
> > 
> > Could this be a ppc linker problem ?
> > -Dave
> 
> This bug report from Red Hat would indicate that there could be a problem with the ppc linker: 
> Bug 1523457 - ghc-8.2.2 build linking error on rawhide ppc64le with binutils-2.29.1
> https://bugzilla.redhat.com/show_bug.cgi?id=1523457
> 
> Quoting from the bug report:
>   The problem appears to be an instability in the code in the PowerPC 
>   linker's backend that computes the call stubs needed to access the PLT.
>   As the linker moves sections around in memory one stub switches from
>   containing a backwards branch to containing a forwards branch, altering
>   its size and confusing the code which had previously allocated space for
>   the stub.
> 
> This seems to be the same issue we are having:
>  ld: stubs don't match calculated size
> 
> It is reported to be fixed in the 2.30 FSF binutils sources.
> 
> Could we rather make GPIB_FMH depend on !PPC rather than BROKEN for now ?

Sure, please send a patch for that!

thanks,

greg k-h

