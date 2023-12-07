Return-Path: <linux-next+bounces-267-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D3808559
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 11:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A4801C216BD
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 10:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13040358AC;
	Thu,  7 Dec 2023 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="D3E6Zz2i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rrU1M+Dx"
X-Original-To: linux-next@vger.kernel.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8ED8128;
	Thu,  7 Dec 2023 02:23:03 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 2BD5E3200A28;
	Thu,  7 Dec 2023 05:23:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 07 Dec 2023 05:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1701944579; x=1702030979; bh=mD
	2V8g0UR8RLd5sraGPK/zq8abiEOAWHhLadwJjNkwU=; b=D3E6Zz2iZure7isn4k
	R/4kP6MJEkuKrG7WM1IWBIyLBuimHwWZihEdsF/CBUHUNK6UDSfNdPCcNiLiCKrZ
	B82TnOTaSkdwnONYH51PqZXGf4uEYnllgMo5AuDLc5M+4euKF7nW5rEMBsknskk5
	6hnCk3qAC61yKJyD1rk91ZZhe4e0ElyTdbXVyEa6mN0cb2Kf9ouklf/T7wwc/KDh
	TAaeqAJwAk/nic77Iq58g2ZfyPUrLR8iDbza/D/jHFBTp5EgbyvYDlqVum1076RR
	nfmGRSXSRjSPDG8sgJSYOYwZlDQpUExYYusgsA5MbV1VKsUeoP6mJuanI80WBB0t
	0CGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701944579; x=1702030979; bh=mD2V8g0UR8RLd
	5sraGPK/zq8abiEOAWHhLadwJjNkwU=; b=rrU1M+DxSHTzy7Hly4+Fmnju7q9gr
	ScB1ImAtgHfYLDNO8ZYCj+ZYKykUdYQ17AkBAwvglsW/IOWVb16KNx3q3WzsFjbG
	vNcVrqvRvELhQDS5gETOLigCNZr9e2k/el5Py7bAKl7cK040NFLqdQnkqBhK/CWo
	+LmVRyel6TjutaaTJAhMVY0+wzRmyKpktkDtXqAz2879lNpj+UEpCQDMWOtvPf4p
	hnaAT6NHxRphv+biPTbYI6wgOaVUB4Yq2Y2hQVqu5sVzUh6RIwDszwKr03QmnAjQ
	nmsTnIa2RKuVUs17zYlNfBeyN8CJgJqL3VTqdthnpvjZcIZ6QszgFC0AQ==
X-ME-Sender: <xms:Ap1xZcLb-XY1fxmpnOMshfMEBjg14Et4Lwwl9VgzujChVr5s8OsU-Q>
    <xme:Ap1xZcL5oD5WAamNeWa_7_E5EfbB1Jmr73s8mtYrqzC9gtIOA1oNPCX485pK2sYqQ
    juier8YCtlSzw>
X-ME-Received: <xmr:Ap1xZcv7Jr2CbLxXtZQU9NwlMjeCpTN4Om1yvKurptfGq9_cTFWJNTG8trI4KtvBdwFNx_eHbdFHrG7Zjg6ZL10bp-Ru76U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekvddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:Ap1xZZYD2f3ccthpw-NN5czFZti1u_v7_vxZ-AEXcvFdizhZhJ0hDg>
    <xmx:Ap1xZTYPK61WyaQxJiZhE8qjlc44rDSxpDPRSeA2IeZZwsOtg0yASg>
    <xmx:Ap1xZVCarsUvMZK24SmIwZEO4Dq0vnh3ZOpUy0rTCNVzzmKaqyZb2w>
    <xmx:A51xZXS3kVWHTHatsGPKCvBECAhcCSybVKL6OlXTwch1-uwj_brcfQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Dec 2023 05:22:58 -0500 (EST)
Date: Thu, 7 Dec 2023 11:22:54 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Carlos Llamas <cmllamas@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nhat Pham <nphamcs@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the mm tree
Message-ID: <2023120721-footman-falcon-efad@gregkh>
References: <20231207134213.25631ae9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207134213.25631ae9@canb.auug.org.au>

On Thu, Dec 07, 2023 at 01:42:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/android/binder_alloc.c
> 
> between commit:
> 
>   8b59d7857c30 ("list_lru: allow explicit memcg and NUMA node selection")
> 
> from the mm tree and commits:
> 
>   ea9cdbf0c727 ("binder: rename lru shrinker utilities")
>   ea2735ce19c1 ("binder: refactor page range allocation")
> (and maybe others)
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the merge resolution, sorry it's so complex.  I'll keep this
around in case I need it when sending stuff to Linus for 6.8-rc1.

thanks,

greg k-h

