Return-Path: <linux-next+bounces-4294-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA99A00EC
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 07:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2606F1F21C84
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 05:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A3418A6D8;
	Wed, 16 Oct 2024 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="ue6qiGZC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z3uDR+0I"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287EB67E;
	Wed, 16 Oct 2024 05:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729057735; cv=none; b=tuS+soEZkIc0FhX2Ek+oRDOqXwWABuXs3vDqqqEVP8Ce8b9FEWuxvUjULIX+rNuqT2U61kwX0n1sA5tEgDZooijr8JiSemez8OQdLWBNJ0WbWH1KbdMSj8NnTzC2+LJHpAaxSLPw+nKzmyYzYJ+IAZj1FRbcDcQ6VB+wVY5dzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729057735; c=relaxed/simple;
	bh=3B62rAVu+mPsTfsLFkGytb1shquhrCCL97KI8Xzma78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8HG78KxXOob4zbEL219onxOMg6ocoPx8egv/0upltnS3rzOQv1rVNthUUD9mKhtm2xN/zfGQZrWBmHJEyrQyMDQPoClsOk/c4Cf77wFuR9+fv+j4a5TsNfVEetcB7SKB8qR7/yNXfrc0I+wAWbmjg8N/5l9Iprdd8bgM5N8HA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=ue6qiGZC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z3uDR+0I; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id DD2A113801C4;
	Wed, 16 Oct 2024 01:48:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 16 Oct 2024 01:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1729057731; x=1729144131; bh=ICFy1U1H0t
	TA7mFx8qkIaso8QFiq5TtE1xVu5v9em00=; b=ue6qiGZCSof7RizWzCt7wg77LQ
	x+b2RBfpdfEx0qozihL2ov/fYS2REB2EvOeLWuxVxqv3lxTnJ+lsQC/YvZpbfw1y
	I1s7kAtBxpbi7+VMEZgF6vXb4aZqnvNCD8jmUIpdEU4lse56xuRp6d0JfysIydke
	mfUT13iHuUzJdUhj1Ekc6l3UVOSPDgH27V39SnMT/9o0A8FIiZJkfgP+Ujwjh9oP
	OtdZg+a/xhsCgKBaiX1NEFnN9agmET58U8GqlbtTwRPc27oox7n89XMBWCKt7arI
	2awJpxUURdzO3xdpHjf/ZLt08sHI5tkGmXmhvyNWjb8AwqVjlo8Xdk8NW7hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729057731; x=1729144131; bh=ICFy1U1H0tTA7mFx8qkIaso8QFiq
	5TtE1xVu5v9em00=; b=Z3uDR+0IB9sKlQCsaY6fq1GNjY3uDSK5DWMRr5BzRD0D
	f1EGqK8ZqSb1xijQbzpSF4uoBbcWFep6isDWaHZYPQUmewYiVEGekz/i4qIX86S/
	1zsZcSoFsvVB30ela7aE37yumOu18n2rbQi34PCfE455a993BtOfxbLnF/mrcYef
	shZ2gzvtvPokbo63YOZrgZ47JaHSRBH+6xZ7JlCqhMuccm5EIvwm7qOYLAlZ5TAt
	AVb/0LD4+0gF20fOzLayb9aHpaigebKiR7827fDklEKGHprEWmTpp5Om7lIEtXpD
	yvsA5KozlS7EyARzDWrb/8PsHupv3YvaJ5gCye1rTA==
X-ME-Sender: <xms:w1MPZzXu17sM7nGmzN70jg0Jf-CXCwpupKJHysO1ENy00nQMItJAkg>
    <xme:w1MPZ7kmxtEyRN7bNgLn8POx_aaVqchyK1CRxyR8comppBrbwOqkLGid3bURQFUhP
    KGrk6sdBPN7TQ>
X-ME-Received: <xmr:w1MPZ_YKFXD8wkrMwv3iveFjVPdXWM7DkXdVkJxvf6vWLM1AJHt2mQmjP33Bv3eK26fRu094AsfwRSr83TXZTiIMXDIzeaEL0Zc93g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegkedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepudegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruh
    dprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehh
    vhgvrhhkuhhilhdqtghishgtohesgihsgegrlhhlrdhnlhdprhgtphhtthhopehhvhgvrh
    hkuhhilhesgihsgegrlhhlrdhnlhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvghrghhiohdrphgrrhgrtghu
    vghllhhoshesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:w1MPZ-UaelT9Ha0bKYnMrU7LS96NdfleLbtmWGH8E7YOKXB0YCw0gA>
    <xmx:w1MPZ9n1hkmY-CyAQZwZbXqACP194G3pVoMQLTDUkxjqgloUs8DdKw>
    <xmx:w1MPZ7c_SuILyfGtsPrDlkQazihiJCBCikkeZwbgd8MtcZn24srQQQ>
    <xmx:w1MPZ3EcLfAwTneU4Ve6GgWnyq2EApcEkOYiWA6oUocu3C7OM8mOqA>
    <xmx:w1MPZy-T8jIdiVhnIuu8KXIGSOwkO5RMcMNwH3z3Kh41JoOVojTWMBO0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 01:48:50 -0400 (EDT)
Date: Wed, 16 Oct 2024 07:48:44 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Message-ID: <2024101637-decibel-passably-af53@gregkh>
References: <20241016141844.1080e1aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016141844.1080e1aa@canb.auug.org.au>

On Wed, Oct 16, 2024 at 02:18:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/media/omap4iss/iss.c
> 
> between commit:
> 
>   95397784be23 ("media: staging: drop omap4iss")
> 
> from the v4l-dvb tree and commit:
> 
>   c1a5060ec800 ("staging: Switch back to struct platform_driver::remove()")
> 
> from the staging tree.
> 
> I fixed it up (I deleted the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

deleting the file is good, thanks!

