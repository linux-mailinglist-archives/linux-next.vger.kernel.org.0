Return-Path: <linux-next+bounces-3724-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC9972B31
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 09:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E596B22411
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 07:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B916A5588B;
	Tue, 10 Sep 2024 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjzs+wg2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE452F71
	for <linux-next@vger.kernel.org>; Tue, 10 Sep 2024 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954716; cv=none; b=ETwo+1epgAV/wJ3/o/DARZ33IkdGNFP6lIqbxkn4nti64O2hgZGdpVVfbKdkDw/w7vAmm7d4XI1qybrZ6ol6EBndcyKQuUDQ8ds2+7AaJhbncHLQ5iy/PWFfijekSU7e+ANMr4Trhgsh93AeQXLM4nNayc6WILdlKcbCixr08NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954716; c=relaxed/simple;
	bh=RW3Nw3J87G9SQi27sKAUqzT4P/SC9ccDDz2cFWd7NA8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=nLKxnWaGMqEIpdld/7HE9wvViNXdn7Js8zXgy3A04wXzeuGIEQjGHWyrUYqT1SYPt3z21KqUcD7Xu1WCpAQ7FDRW0A75QCUpcig9da/Z6D4lJfQ3PXhiRDJ7Ky8SQVAqwSUtcz9SWaGenB2s2GyxFnjOyxqwr4LP6ik9s+NrZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjzs+wg2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B32BC4CEC3;
	Tue, 10 Sep 2024 07:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725954716;
	bh=RW3Nw3J87G9SQi27sKAUqzT4P/SC9ccDDz2cFWd7NA8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=jjzs+wg2Cr+iSIfPxr15oIqhwnTGAkJJrJz4PXZe3IYGHUcG0Po4KcnzctXmnih3X
	 IbnYvmV5Bl9OK3OYjhFPmnz6h6wXuqF/vmD70/+TlL/b5apfmi0HR7qMavXPB776ar
	 g/BVCUjgvgxLhwcvN08pmkj1r9ZbbjO9Uqb5DPQRTRBgcZNScqu3ozqJehnJGWbUw/
	 W+VSYKq23awmr7SNMm/VVrHVaKsM3qjoQhuqthIMz4cCHzJvwFzifoHby4FdV1Dioa
	 2mpXWM0vTThA3Ff0mQefjASE/8qAjQ08Zti9GYXlmHe1FkEWViBG6KPeNOH2auUlm1
	 kjovZVYYSTW8w==
References: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
 <20240909-einjagen-meterhoch-45c77ca03164@brauner>
 <CAJqdLrq+pScjJdnrp2jAZMqKEq-SyEjsBdb-=9QAFN6=h1=S5w@mail.gmail.com>
 <20240909-unwillig-irreal-26bd9fa085c6@brauner>
 <CAJqdLrqjD_vXVm48LG-9HM_wRsSFUg46rrWFL+o24n6dLgQJ6g@mail.gmail.com>
 <20240909-arterien-zweit-3502f11b9f50@brauner>
 <CAJqdLrpA4B3rKOWcwYyBA14ofPiSba2qrAggYBE2D_h70zni2A@mail.gmail.com>
 <20240909-zumal-revision-8af9dc0593e5@brauner>
 <CAJqdLrrz-DH0YLbMFt951c4jiZMAiCVcS0YR3Mz-y=O3zNn6Kg@mail.gmail.com>
 <CAJqdLrpwuaPG3PoFwbxPRp8GrbEWooXazrMZgV4Wj=FK=vq=6A@mail.gmail.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Chandan Babu R <chandanbabu@kernel.org>
To: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: linux-next@vger.kernel.org, mszeredi@redhat.com, Christian Brauner
 <brauner@kernel.org>
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
Date: Tue, 10 Sep 2024 13:21:33 +0530
In-reply-to: <CAJqdLrpwuaPG3PoFwbxPRp8GrbEWooXazrMZgV4Wj=FK=vq=6A@mail.gmail.com>
Message-ID: <877cbkaque.fsf@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Sep 09, 2024 at 05:56:11 PM +0200, Alexander Mikhalitsyn wrote:
> Dear Chandan,
>
> Please can you check if the following patch resolves issue for your workload:
>
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 7885f071fa1e..f130b23d6850 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -148,7 +148,7 @@ static struct fuse_req *fuse_get_req(struct
> mnt_idmap *idmap,
>         if (for_background)
>                 __set_bit(FR_BACKGROUND, &req->flags);
>
> -       if ((fm->sb->s_iflags & SB_I_NOIDMAP) || idmap) {
> +       if (!fm->sb || (fm->sb->s_iflags & SB_I_NOIDMAP) || idmap) {
>                 kuid_t idmapped_fsuid;
>                 kgid_t idmapped_fsgid;
>
> From your call stack if looks caused by CUSE case.
> It's my bad that I have not considered this use case for
> fuse_get_req() and there is, obviously,
> no such thing as fm->sb for CUSE scenario.
>

The above patch solves the problem. Thank you!

-- 
Chandan

