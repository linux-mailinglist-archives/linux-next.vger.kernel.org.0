Return-Path: <linux-next+bounces-8348-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37CB7D754
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A771F7AFE26
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 07:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC6B2773F0;
	Wed, 17 Sep 2025 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOk1cUdk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AE274676;
	Wed, 17 Sep 2025 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095185; cv=none; b=AsLQbHF2Viz6+wODyyBfhongEMAlKg7e+ADRgUzrl0tGT0pHL3BJ2WYC2eM2FLo3FdZCmkYMI7VC0FlT9VzJ0XCWk6Of/cCyloXJ5q12i1rA6d4O4/Chmf9DRFXdAy9OzBnvW7UVGtBm1DyCYOizlMKdaoA1nZbEyPSj5Nb+0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095185; c=relaxed/simple;
	bh=zJJGGmTLtlNthk7z8ifWKXVqqpWoIFyPpMoZiGk2Lbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kgMHwEuZVfnKKlzKKXiI/S8rkgBSgBmuY4oRloE/AYIPQwo8jAE/b7LyBkze4oDYXCqzlTYzxWu0aZn7sTV5V7Cbh2LdB6rv5MHJ4xANVJKIXu1Mx05WrNJY/jZeRMAuO0kbvRGuceGU99wuWpD9ad2TrFPBbf1msVCRLnTrZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOk1cUdk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41618C4CEF5;
	Wed, 17 Sep 2025 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758095185;
	bh=zJJGGmTLtlNthk7z8ifWKXVqqpWoIFyPpMoZiGk2Lbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fOk1cUdky/k4Li+kFcEBilXmIDxCDaq54peijS93B5jTP5SGzzPXMNoX5hHE9SDja
	 cE2E3erqRJlPX0jWE5+vI9xDBt0B6uW4pplMG0JiNDcd6XZ9+fLmO4Q+8UvbmVJQJ3
	 Hjoo0NSxLkPKD4cbkVl1BqR6ddbeUsC+uO+c+IuUl7zgHrsjTcmo+lo1fdOG1C/r3k
	 1U4ruDaZdgqH3TotCClwZmSfYmWrFXPydQaOykhueudHHrWzfyFkNHLJOBWLuJtlh3
	 m4d52Ek5U/x8FcA5q5td7wb0pDbzXV19bURCxr7KkwlrclqgLNCkuyeBn8k/QSxnXT
	 VLETzeNvE8ifA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the block tree
In-Reply-To: <aMligBYh0Z4V5Biv@sirena.org.uk>
References: <NPR3YlvOAsbhpBeoDGNoFA19ooiEuqrTmHWORPHaia9baa5oTQT9ZIeOn_U9cvByr0CSZ1L5XlX3UMWdVizKGQ==@protonmail.internalid>
 <aMligBYh0Z4V5Biv@sirena.org.uk>
Date: Wed, 17 Sep 2025 09:35:46 +0200
Message-ID: <87zfatwmy5.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Mark Brown" <broonie@kernel.org> writes:

> Hi all,
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/block/mq.rs
>
> between commit:
>
>   90d952fac8ac1 ("rust: block: add `GenDisk` private data support")
>
> from the block tree and commit:
>
>   e0be3d34f1089 ("rust: block: use `kernel::{fmt,prelude::fmt!}`")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc rust/kernel/block/mq.rs
> index c0ec06b843555,61ea35bba7d50..0000000000000
> --- a/rust/kernel/block/mq.rs
> +++ b/rust/kernel/block/mq.rs
> @@@ -89,7 -82,7 +89,7 @@@
>   //!     Arc::pin_init(TagSet::new(1, 256, 1), flags::GFP_KERNEL)?;
>   //! let mut disk = gen_disk::GenDiskBuilder::new()
>   //!     .capacity_sectors(4096)
> - //!     .build(format_args!("myblk"), tagset, ())?;
>  -//!     .build(fmt!("myblk"), tagset)?;
> ++//!     .build(fmt!("myblk"), tagset, ())?;
>   //!
>   //! # Ok::<(), kernel::error::Error>(())
>   //! ```

Thanks, looks good to me.


Best regards,
Andreas Hindborg



