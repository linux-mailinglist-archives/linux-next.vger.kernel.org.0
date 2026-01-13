Return-Path: <linux-next+bounces-9628-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB93D16E88
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 07:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FEFF3026BF9
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 06:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E1D368293;
	Tue, 13 Jan 2026 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="ZcQkIPrJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ezxv/6CV"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7FD21D5AA;
	Tue, 13 Jan 2026 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287216; cv=none; b=Y1S76IdMlrRb27rSeD5qorQtZs7S+igvRqrtCiS3yxAcVxPcnQlGOipjO4WI/zQmSSZM+X3593NiFDeM9e7Wtk1IWXQzea9vwcGU+rcn6+zz6ssu9WC9VK3cV9pOEUIXhlppUT+nyN8k8rKqeiXoZ10vVlyYqs4TH4Xf9MTblnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287216; c=relaxed/simple;
	bh=+obunNCIe1GF3nLtYjisFmO4n2mnfsLI9qmM+IE97cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1iRgfjWfvcz0OfhbCO9TCIIltpRh5pR++wAhjc7GGFKtpg3frLWT6vgQ0BxvqDuYy4ttxd+BIbOg1LJynRqJ2T9pa6khamntk66BUwSKUv4eeSUzvpwAngQz71pt73NwiWXaa9fBlBD/K3JtpYAZD6Q+ZLbxDl3G9+UsoRX3n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=ZcQkIPrJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ezxv/6CV; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 426B21400180;
	Tue, 13 Jan 2026 01:53:34 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 13 Jan 2026 01:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1768287214; x=1768373614; bh=VVfsSGH8lP
	q/Vw1AIRuDkvkaTTNBp50pFwH7lmY8zXM=; b=ZcQkIPrJ9H72/Egfiu0oA6nHjP
	jRV07sX9XTlgsC9zLV0Ewf2XyMAInvlGvRNv/Vh2jZyfeRg9Xe6YT29EHAOqAF/V
	hZZfUmlmKxuixhuY0IK8YKFdP78i4mz58M1TLVQSvO0czc52w9/61OmB/nnChq4P
	MZ+Ja36Zd4QuHbEXQr8/coJ2oVqB6aC+sg1S9tKDFt0A3HDuM/bUwVdfnL4G5+z9
	eIqj+tMk1GyMMjIcdt4QMxGKuDraqLFDdELJSHzBH2nZZz9xfe0Vob8gQ8KmXYr8
	QYUvkI70fwY06T+e0icCytsUPTCUyroVZA7V78yZxelKOsa7k4+dCcB04IPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768287214; x=1768373614; bh=VVfsSGH8lPq/Vw1AIRuDkvkaTTNBp50pFwH
	7lmY8zXM=; b=Ezxv/6CVyil7staREjwjtgDobWIjjbWAyFOG9NtmZ9IDisXRgq5
	490VEtuN1cC68QWRXN2LcAQtcd559OfGIObvxD/YYSahiVEXZuh3AdyQMBr7yeLi
	c903+hG8sCrCAc1L5au8UljV976gqAEpNlKVrxCP4GlcN350AsMvFFDTxZSeJD3G
	3EwsU4pKVXLlszUsAn3QMa7RvDOI4dFrthQ7BcYaRd8rK6buewY9htS/qIdcmsU/
	A+BGWqd/h/P1/l0SAOn2vP2JuaMQlGYW7kzJMF4L/kEg9SeKT7EntlVSjH7ZO/BE
	twTCMlld+a8CEnyxux2hb8dYwZdIgeFiacA==
X-ME-Sender: <xms:7etlaYh0M0IbnYZ_4ZV94ThJvYMLnoazI6z-Eo8te_CLPgP6pGTdjg>
    <xme:7etlaWMVe_jY17_ThMUEdsed22hDztCt2InqSxbaYCAwIIl3IhLlYMVg2QL3aSuB0
    b8eWN0EqcNK0QI9mOZ5Jpp6on28Ucl5tuNzT9SRbvNfxhvAow>
X-ME-Received: <xmr:7etlaTeVTRLhiZS5txc5TVPGWXavRlksJfn8tiV2ODGfeAETiEsW-VtjtrPdGo3VpCqVenJ_xxe-uxablm0eXdHHy_ld51Hu_gwaig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsfhhrse
    gtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegrkhhpmheslhhinhhugidq
    fhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepkhhhthhsrghisehgohhoghhlvg
    drtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:7etlaYwx6l1uK4UyKkaypbGIkswgLG8GTiK-Mb652RSi1yasD6yLXw>
    <xmx:7etlaQ10xlxAWJZ2gZDwaSpKNoxRRgNYdEpitfIJw_DJzOvqLvZLmQ>
    <xmx:7etlaXeXn09Q475F_dIaFsFj02ax2GZ5HcnA0PTIOvr8EGYpKwwEsA>
    <xmx:7etladX4d18y_K9IYhGdDk4AZvXlBhqGXIwWM9Ae_0UIY7OiO3qNdg>
    <xmx:7utlafKuWHNAumMgPj8V819PoHMGZOqTEHUucqosPf0KaAVCS6mQ2qFl>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jan 2026 01:53:33 -0500 (EST)
Date: Tue, 13 Jan 2026 07:53:31 +0100
From: Greg KH <greg@kroah.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuen-Han Tsai <khtsai@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the
 nn-nonmm-unstable tree
Message-ID: <2026011356-hemstitch-rundown-ca92@gregkh>
References: <20260113150752.2e2238f2@canb.auug.org.au>
 <3ad768b3-6c66-4e23-9bfb-145887313b78@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ad768b3-6c66-4e23-9bfb-145887313b78@infradead.org>

On Mon, Jan 12, 2026 at 10:44:29PM -0800, Randy Dunlap wrote:
> Gi,
> 
> On 1/12/26 8:07 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the usb tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > In file included from drivers/usb/gadget/function/f_ncm.c:27:
> > drivers/usb/gadget/function/f_ncm.c: In function 'ncm_opts_dev_addr_store':
> > drivers/usb/gadget/function/u_ether_configfs.h:243:31: error: implicit declaration of function 'hex_to_bin' [-Wimplicit-function-declaration]
> >   243 |                         num = hex_to_bin(*p++) << 4;                            \
> >       |                               ^~~~~~~~~~
> > drivers/usb/gadget/function/f_ncm.c:1600:1: note: in expansion of macro 'USB_ETHER_OPTS_ATTR_DEV_ADDR'
> >  1600 | USB_ETHER_OPTS_ATTR_DEV_ADDR(ncm);
> >       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")
> > 
> > from the mm-nonmm-unstable tree interacting with commits
> > 
> >   e065c6a7e46c ("usb: gadget: u_ether: add gether_opts for config caching")
> >   56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
> > 
> > from the USB tree.
> > 
> > I have applied the following merge resolution patch for today.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 13 Jan 2026 14:36:59 +1100
> > Subject: [PATCH] fix up for "usb: gadget: u_ether: add gether_opts for config
> >  caching"
> > 
> > interacting with commit
> > 
> >  30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")
> > 
> > from the mm-nonmm-unstable tree.
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/usb/gadget/function/u_ether_configfs.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
> > index 39d3a261496d..c2f8903d1400 100644
> > --- a/drivers/usb/gadget/function/u_ether_configfs.h
> > +++ b/drivers/usb/gadget/function/u_ether_configfs.h
> > @@ -18,6 +18,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/netdevice.h>
> >  #include <linux/rtnetlink.h>
> > +#include <linux/hex.h>
> 
> LGTM. What is the procedure for this? (my first AFAIK)

I can take a patch for this now in my tree, as it would "just work" for
that, right?

thanks,

greg k-h

