Return-Path: <linux-next+bounces-7332-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F22FFAF71F7
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 13:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15AE61890ED2
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 11:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFB529B789;
	Thu,  3 Jul 2025 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Bs+7Y32u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iZcR/lW0"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B1B253938;
	Thu,  3 Jul 2025 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541653; cv=none; b=ntaWyD2JsEDB74vkaLYEFqFpUXOeXPAuOtEfJ3H4cVRA8wK6XFROllciWlO0YMa0SDj+/kViFecQTG7cDJB62YRQkDZkLQrkHz4DxxqzuRvoRinssBgrcjDERSXHLw7wAdzsGAYSG9iZGAABre6F5169Vra2rO42PR8yZDQuf9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541653; c=relaxed/simple;
	bh=Hyn+apaCPNgXHRovBRa6fl4UxfB9sLMa2FeNarF1mNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNYep3GE4vgfhst8mhiT+x1br+MXWrxTpUrtB7U5NuOAHclnZHbLumyKVQaVDqmXYb117SSWTcSbRied0vxqdu9zLBcJZfDcUr1WFh3mp1JxUZ5nX0LE3ob65twmD/ol5DTGbEdHJKK6Ojmw0/Z+H9NcOV99yq48wJN5Y31zN28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Bs+7Y32u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iZcR/lW0; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id F0BC9EC044F;
	Thu,  3 Jul 2025 07:20:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 03 Jul 2025 07:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1751541649; x=1751628049; bh=yVzikAbVWq
	+BfrBQ2MDLvaopMclgthHP3lEB7g/Iyfk=; b=Bs+7Y32u9ogzjO5O82xfGkmeIe
	GQLn8cdVHV9zJ5peO91Y7PnQ98dBO/mM2nSL8v+IwPDZl+8Fq23FGlrq31LULEEp
	noNX8rP1zkyaxoLyY6Xo0vufdH9ZQHOF8V8tbRRoheg6jx8UjnsbP7GT+lrlWkoe
	ly70jYk2doLcDteHpLkA8wZsFm0R4VMZGOsW1x9D/iAuze0ydNWR4fRb6UCPPz4q
	G2xIX8PsOAE8VWqLYQYClv+fupTcZUIeFpHJB0PbTQ2r/hFS+cnPkPpLI3RHJYMN
	LM8jb6bvCF1ScYXj+3CQOZqUZ6AfHLGrfe6yT3NvJJ3rbgAKAThvjNIkeGdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751541649; x=1751628049; bh=yVzikAbVWq+BfrBQ2MDLvaopMclgthHP3lE
	B7g/Iyfk=; b=iZcR/lW0CgIO1i5lQdeT/KjN/PsHYw3guJ9xf00aDWDxtOPmEzO
	V1TFx7yvXdnsxTHt5olm1kis8+nUWJfUIuiRNt8eyG7dspbHpNThY54DL61STNBa
	RyB7km5lPe1kmmq4P4hnJOx6lyHw4wBz+2bkG9Dl+ehWjTWjeCoztp8wiZHveC97
	MzwCt+IGyYNo6vZxL4FXOhO0vuENhn3iHyx+6iqsfkvtkQwUarhjUs23b9x2jSqD
	aHDSz43ecAEcY/+FZZOhNmGVvtTnVhJ9yB+179ayYUzwraqNRRQ53KP7XOcdlHds
	oMX7OyGQEeF03jup/JWfx/h/nEd3rXZnezQ==
X-ME-Sender: <xms:kWdmaMCfcyQgwnPx0xbsMx1tdjaN4mKor8cxMNHGGbPEKflUSpOJtQ>
    <xme:kWdmaOigt3NO9PBDpVc57JGZRnI0e_5v-WisofrSNJU-VU58Zyd9tPRoxJ3_AYASC
    Z8h19cVhmI8sg>
X-ME-Received: <xmr:kWdmaPlKAL3GJhGH-SggCY_acaKLX7E52rLroz8KwY_fxE3MWloagqTOOsD6WSA5__uQqJO2NbSymBrYUQKjphVg2xDnx4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehlihiihhhirdiguhesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehsfhhrse
    gtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegrrhhnugesrghrnhgusgdr
    uggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:kWdmaCwO6wzCyHgPKutAfxGMcmXAN4--M3d8z8tpalaS_wscEtA26A>
    <xmx:kWdmaBRVpCOmybhrFAWQjX95v52SvLJcr6ts3lIvu5cOSzwa_Pwfcw>
    <xmx:kWdmaNbNvhjamIebQdWfUzc8lEd8m0fLG2aVWRdwMq0EAYIGlcpr-A>
    <xmx:kWdmaKR5Eb6Eq0psSbB7Ba3GhAvduB2oy0DBySBqyU_H3fBF8ctSLg>
    <xmx:kWdmaItxuceH0XdOZPsBYQMc4BWwMGKk095QwkCPEENhhEzLBJoEols1>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 07:20:48 -0400 (EDT)
Date: Thu, 3 Jul 2025 13:20:47 +0200
From: Greg KH <greg@kroah.com>
To: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbng==?= =?utf-8?B?5aSN?=
 =?utf-8?Q?=3A?= linux-next: build failure after merge of the char-misc tree
Message-ID: <2025070323-unpicked-virtuous-07fa@gregkh>
References: <20250703171021.0aee1482@canb.auug.org.au>
 <2025070335-situated-sloped-bc1c@gregkh>
 <BL1PR11MB5979E06DF496FA3965009DFF8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
 <2025070357-scrambled-exodus-a8a0@gregkh>
 <BL1PR11MB59798DB1C2D7B2B2988BE2DB8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
 <2025070301-albatross-angriness-00c1@gregkh>
 <BL1PR11MB5979690F05AA49123A47C37E8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5979690F05AA49123A47C37E8643A@BL1PR11MB5979.namprd11.prod.outlook.com>

On Thu, Jul 03, 2025 at 11:09:10AM +0000, Xu, Lizhi wrote:
> Please read the context carefully, and you will understand that this is
> where everything starts.

I'm sorry, but I do not understand your quoting style.  Didn't the links
I provided earlier explain this?

> In the code before memset, the ev variable only
> initializes the members of its member hdr.

What code does that?

> Originally, "struct vmci_event_ctx ev = {0};" could be used to solve this
> problem. After careful analysis, I can clearly see that the data after the
> ev member hdr is not fully initialized, so memset() is used to set the
> uninitialized data after the hdr member in ev to 0.

Again, you have a structure that has 2 structures in it, but no
guarantees that there will not be any padding between those structures:

struct vmci_event_ctx {
        struct vmci_event_msg msg;
        struct vmci_event_payld_ctx payload;
};

Nor do you have any guarantee that those structures don't also have
holes in them.  How does any of this work?  Is it just luck?  I walked
things backwards and find it impossible to guess as to any of the fields
here actually being properly aligned or even using the correct data
types to cross the user/kernel boundary.

And then you throw the whole thing on the stack:

> 248                  struct vmci_event_ctx ev;

And attempt to initialize the fields manually.  What could go wrong?
(hint, syzbot showed what went wrong, and the compiler is now telling
you how your proposed fix is not correct in the long-run...)

Please fix this properly.

greg k-h

