Return-Path: <linux-next+bounces-5093-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C71A05A60
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 12:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDDEC1881901
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 11:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7451F8EEC;
	Wed,  8 Jan 2025 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="MwcmcYtk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NkYfxFpR"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761F1F8F16;
	Wed,  8 Jan 2025 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336907; cv=none; b=nMWLyaQuz1capMzxrJ7EfefD9ez9OmJsHUnoJk3qncMBgPea+dvwSsmhPUKsOdvqg8S/eCjjbx2Gc/1nefcuyFDz3rpbI2mgC9vRPalAzhqSyyl0GBOlOc5lRDC7aVFpI961MMu7ZJ/Ib/ABEuiM2cTrgPgSJi6wKqucxuFiVQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336907; c=relaxed/simple;
	bh=qJ3akyqbl4xv7sRJFgiJOpDT1+pXANZCriCNtUGFUNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsUPlFDK4eHGBRmsz4v7M8ng+jwuDeyXCES3onk0vB3974AK09pWkCq32QJIxQf39CPjQ9NvWR5RHqlxTRifPEVjZkdaxC/Rb8DDMdl4hIk8J+yExLCgDKjodu/oYqiS/VeaOLACKAp/oq+FCRUQ0tsfDpvNhR3rZLYMA4GKQjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=MwcmcYtk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NkYfxFpR; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0CCAA13801D1;
	Wed,  8 Jan 2025 06:48:24 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 08 Jan 2025 06:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736336904; x=1736423304; bh=VPaM/TegmB
	2lGX3S/sAG2ox0NoZl7xR4KccuRqW1hPY=; b=MwcmcYtk935K462Z2zAUPx/pS9
	3QTjc3cn6rVkDB6rwcYI4Zc1gv8sDd6wQYMksqHf292AxiSFYiSEOPcFY010/xaP
	px03cpAm8hustz9z7+6azvaKPC2A5QYpCTsEx+ckY1IpqC/jWSRVM+CtaSDtyjQ+
	+JvPb8XJglSgv7UPZzrdH5oU67y6Q5gfza+zXeao6F5rSal/HdJwmesAKQKFLzXA
	kIGLDjDMS6VMK9KJuwP6pMhUrnvhwMWyqcwn9CWyQR8Fh0TwKcswvhose2ZDq3mo
	KEFdA2lsfEl6Nz/cTRRj0793jta5U28wWasUt/UPxNqc2tA7M6ErLBBARCqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736336904; x=1736423304; bh=VPaM/TegmB2lGX3S/sAG2ox0NoZl7xR4Kcc
	uRqW1hPY=; b=NkYfxFpRgC+q0KzGvjCJd6ucUhCGh+Y3vGd1YLjxJV1HlJTGp33
	CdAyxBfl5i/13ilnCiL/qWx0zw3x4ZRDYN3QycXuQRsUnGEc/TMDsjWlG3qhL3Ej
	84aYbvpK4BjlPKml14zCh6JdCCu9Sc0MRQtqQW/QtzSxw4J8aqdPd4mT54nBReP+
	0jUQWtmZV+EQFoEj8bAZMXrVoy54OBFIThAiqXsBo0X2xTO6BInP9bgfOwz/GeBJ
	0FPIbYj017Xm/Z4X6uc3YrTjHxUy2snZDC4bOCDB9TjUHM11yZkjy8JW5yH1iUUT
	cUtBKb2xNkPFoweCqemt2iqoNhmakTTnpeA==
X-ME-Sender: <xms:B2Z-Z2lt0nrzHD_NYqOo1xVIz9VMQLi8fM-d9gOxCeKx-nHwc9rkmA>
    <xme:B2Z-Z90Hp4wQtlXmZD0BqfTFWkgWx0BM6ax72pfYEQSjNaHoJvAaV78r3uHuUKtck
    lprFnyw4OFr7Q>
X-ME-Received: <xmr:B2Z-Z0o_S9HzlkHVNK0LWV0027GaaoAyr8TEI8tOifIkoGuFRDiKLzLkTLKnRaiFkqTwx50nr6-nXhhMQKLha8ecJeluLmjeTjTf6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiffdvudeffeel
    vedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdp
    nhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrh
    estggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheplhhukhgrshdrsghulhif
    rghhnhesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:B2Z-Z6naAYGMDN9-H4-J-ANFbh_NovZcLl6IeQ2hy9uP2DMFaNyYCw>
    <xmx:B2Z-Z020TfZkmJ6Pdsn41rmpPhyZy_kzXJPs9EzkVcuWkefx5Spr3g>
    <xmx:B2Z-ZxuP9Sx1n97FqDN1aZNUZSQ1rFm97S_HCGAcfYC2HNCn7dz-MQ>
    <xmx:B2Z-ZwXCoYyWoI0F4t-SRkx_dD2AgRi4koOpyXFi-0s3yt6_fLLYTw>
    <xmx:CGZ-Z1KO0F8a0rgYhVVbjKHC5DlHDMBTaukI0n-6gTJNguU6tjyQXBqB>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jan 2025 06:48:23 -0500 (EST)
Date: Wed, 8 Jan 2025 12:48:20 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging.current tree
Message-ID: <2025010802-superglue-marshland-1ea4@gregkh>
References: <20250108214240.482e0ca5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108214240.482e0ca5@canb.auug.org.au>

On Wed, Jan 08, 2025 at 09:42:40PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging.current tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> ld: drivers/staging/gpib/tnt4882/mite.o: in function `mite_dma_disarm':
> mite.c:(.text+0x1240): multiple definition of `mite_dma_disarm'; drivers/comedi/drivers/mite.o:mite.c:(.text+0x1ac0): first defined here
> 
> Exposed by commit
> 
>   84b172cea4a2 ("staging: gpib: refer to correct config symbol in tnt4882 Makefile")
> 
> It is not, of course, the real cause of the build failure.  The duplicate
> version of mite_dma_disarm() in drivers/staging/gpib/tnt4882/mite.c is
> not actually used anywhere, so I applied the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 8 Jan 2025 21:07:23 +1100
> Subject: [PATCH] fix for "staging: gpib: refer to correct config symbol in
>  tnt4882 Makefile"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/staging/gpib/tnt4882/mite.c | 9 ---------
>  drivers/staging/gpib/tnt4882/mite.h | 1 -
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/staging/gpib/tnt4882/mite.c b/drivers/staging/gpib/tnt4882/mite.c
> index 90341f8c394e..22035e53ec35 100644
> --- a/drivers/staging/gpib/tnt4882/mite.c
> +++ b/drivers/staging/gpib/tnt4882/mite.c
> @@ -170,15 +170,6 @@ int mite_dma_tcr(struct mite_struct *mite)
>  	return tcr;
>  }
>  
> -void mite_dma_disarm(struct mite_struct *mite)
> -{
> -	int chor;
> -
> -	/* disarm */
> -	chor = CHOR_ABORT;
> -	writel(chor, mite->mite_io_addr + CHAN_OFFSET(0) + MITE_CHOR);
> -}
> -
>  void mite_dump_regs(struct mite_struct *mite)
>  {
>  	void *addr = 0;
> diff --git a/drivers/staging/gpib/tnt4882/mite.h b/drivers/staging/gpib/tnt4882/mite.h
> index 2ecd83379974..dbfc59468228 100644
> --- a/drivers/staging/gpib/tnt4882/mite.h
> +++ b/drivers/staging/gpib/tnt4882/mite.h
> @@ -64,7 +64,6 @@ void mite_list_devices(void);
>  int mite_dma_tcr(struct mite_struct *mite);
>  
>  void mite_dma_arm(struct mite_struct *mite);
> -void mite_dma_disarm(struct mite_struct *mite);
>  
>  void mite_dump_regs(struct mite_struct *mite);
>  void mite_setregs(struct mite_struct *mite, unsigned long ll_start, int chan, int dir);
> -- 
> 2.45.2
> 
> -- 
> Cheers,
> Stephen Rothwell


Ah, I just beat you to it:
	https://lore.kernel.org/r/2025010809-padding-survive-91b3@gregkh

I'll queue this up later today, thanks!

greg k-h


