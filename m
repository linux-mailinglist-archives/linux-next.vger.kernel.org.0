Return-Path: <linux-next+bounces-5151-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A28A092E7
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 15:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FB693AA701
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 14:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D94020E021;
	Fri, 10 Jan 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="bZX13poM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KM8PR7dE"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6470C20C00C;
	Fri, 10 Jan 2025 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736517897; cv=none; b=hAxNWrENVM6rux81zXCA1cg7yeD+zUp4XiUAO7IlDciSt8N3ZwJrZXJa3EgpWnr1fzWi+hgT+BTBSKGfCS0Ywn5qipeqW5SfeiBwLt4y3v2efXnUdaJAVEDHUA4uPsiAaj4Icjn+6fD0JpyQyyAs2KhJ7Hcg2e6pwCPz7WYtexE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736517897; c=relaxed/simple;
	bh=5PewVANvc4BuXUPegjTasyFr0lI9JcjImzbDM4hHFgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieqIwEl41efmKBFoTjVB+4SCZ/gXibL+dg+vWIgFYf6OGq/PenIJgW6776KXIVmjdr94wVkCJmdKeBf6AMB9QF+99SejxhLlLPAPVerFaXbDSsxdN/G5xV7dit/WEN0d+wPo5kUu6JKxgOzF2bWhvROwnkuBo9p2WmDBpOFRjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=bZX13poM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KM8PR7dE; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E3D052540108;
	Fri, 10 Jan 2025 09:04:52 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 10 Jan 2025 09:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736517892; x=1736604292; bh=+zvtqouiLy
	dB8N9pHc1adsCSBXdmi06axmChaquFH4I=; b=bZX13poM6zFquX+68X9qpmNjq+
	Ek4OumcJIz6z1aH91Jb06vw7FBAYaVN3J3e5Hg1cL2EfbP3gMgwSq0BdaYAiOUMI
	0H6x7Rn8QrH8I7k7LTdBd9MM5MH2bTdCqjAx+stEmsqwLqktOYzmvR9PUJyvWdj5
	SRlD2dxbz//4MTKoc7NeKO4ubvzoH7s2IKe9lKGLER2AArUi0ic41QXVW5d1cwTu
	BiTb1OYFvBPO2Rgwgf7034RRk1DeOz4G1EHsDIyPo8mgZLR3N2OfxWCXR4Sxw9Sp
	vRhRfTIMvcYgRHXc+ut3JFbkYxKBn9QMxxVpLnpwwJWxe56G67fPtlOez5cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736517892; x=1736604292; bh=+zvtqouiLydB8N9pHc1adsCSBXdmi06axmC
	haquFH4I=; b=KM8PR7dE/kTnhfFanS/zfgCP0a0k+czM9godiwyzDK9hsbCnctV
	ED3mKDNHjIxsM1GEDtNow433fpjd6Mo1FNe5wZbdcYk+pf9XeIMFNipFPUX5eTr2
	gg0W61tv9m8rru1j28pKKSzQJwGbBLOMRWeHiMAbLKU/G46pmKU982y9ldMsjbzj
	vVFwFmp3uo+OZ8SmNvAj5dILc4oyzHvB8nSs6CfcZ0EL2OJB9bnquEZWoIYhFhx0
	S4UASwmL0T68FOeFahG0EjqaAXaV45uVVNf10L3NxZqQ6zqma5nVNRtfIGo2KX2i
	5DJPUPbf4K9hbUKT62Gbu/GK3hwCj8PLTeg==
X-ME-Sender: <xms:AymBZxMCfBgbWPH96bRN048y05G88AG5qLGDdC5TR6umBA93zGQwYg>
    <xme:AymBZz8QJII-A5W1ezuz9KvaazZkiSpghKeymaqCQ3EYrwdYftOvAT-UcFaNDpxPY
    czM7KyrMH5XtQ>
X-ME-Received: <xmr:AymBZwTdZ2OJ8osfsmgaRq3Dug75tFaM_blueeqTWmzLXP2rZ1BDAaUUveoOqmqfohO8_JRYX6pZUfAu2BqrBgeD_8PgdFh8IJ6qlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegkedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtohepmhgtghhrohhfsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvght
    rhdrphgrvhhluhesshhushgvrdgtohhmpdhrtghpthhtohepshgrmhhithholhhvrghnvg
    hnsehgohhoghhlvgdrtghomhdprhgtphhtthhopegurgdrghhomhgviiesshgrmhhsuhhn
    ghdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigseifvghishhsshgthhhuhhdrnhgvth
X-ME-Proxy: <xmx:BCmBZ9seXiA9lIaU8eIGu1taYiiu1rUYmBo_0iNeZBNCub0ywlJ0sg>
    <xmx:BCmBZ5ep8--rVD-tFoQa9jgCwV1ArSkh0i9LtxfhbVGVWVn2UEux6w>
    <xmx:BCmBZ517N9---jkIC0Zr5lThHEUvdgUwBxwo2Li05PL9NnMMBFp9Dw>
    <xmx:BCmBZ19BCHELLBMt-ypqnULGriRSrjPXlt7iDzZiuJAqUQjQrwMHWg>
    <xmx:BCmBZ0s-hR6fjLM0a84JYFaIKTd-JJ-hLaZpdeF1JjVsKGMMhBHaokkz>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jan 2025 09:04:51 -0500 (EST)
Date: Fri, 10 Jan 2025 15:04:43 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 modules tree
Message-ID: <2025011030-attempt-overkill-c0ae@gregkh>
References: <20250110144051.36796c49@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110144051.36796c49@canb.auug.org.au>

On Fri, Jan 10, 2025 at 02:40:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   kernel/module/sysfs.c
> 
> between commit:
> 
>   9953f4227850 ("module: sysfs: Add notes attributes through attribute_group")
> 
> from the modules tree and commit:
> 
>   3675a926feef ("sysfs: constify bin_attribute argument of sysfs_bin_attr_simple_read()")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/module/sysfs.c
> index f99616499e2e,254017b58b64..000000000000
> --- a/kernel/module/sysfs.c
> +++ b/kernel/module/sysfs.c
> @@@ -190,8 -196,8 +190,8 @@@ static int add_notes_attrs(struct modul
>   			nattr->attr.mode = 0444;
>   			nattr->size = info->sechdrs[i].sh_size;
>   			nattr->private = (void *)info->sechdrs[i].sh_addr;
> - 			nattr->read = sysfs_bin_attr_simple_read;
> + 			nattr->read_new = sysfs_bin_attr_simple_read;
>  -			++nattr;
>  +			*(gattr++) = nattr++;
>   		}
>   		++loaded;
>   	}

Looks good to me, thanks.

greg k-h

