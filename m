Return-Path: <linux-next+bounces-8349-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D2B7E6E8
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 642D7169070
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 07:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194AB290DBB;
	Wed, 17 Sep 2025 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsAQKhmy"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492C2773F0;
	Wed, 17 Sep 2025 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095192; cv=none; b=KY6LIglalcRiVEZyU+zx5K0tOTyJTe4oVrtb0xYbYkL+d4/BgN1bFAiJM3YpWI3KVU6z5Lpu3QLwmB9YEz44ho4eLb+1lsK3JoFsqqHu/RPzZqlb1wxSIP6NNOKJNC9EKSWP8zlUVsrbTcAHlbvuVEvMNfclXY2iv+mxJ7DR1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095192; c=relaxed/simple;
	bh=qulyf2x3ovCrkpojNcqaI9BFWYLuH6KOYPY/FS9U6yw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KFHhJpb0HEF89A2Men0alI7//nEJRYGGLj7zVRnRMy1KYrJEMiLvsihwGJi0dzyozrJ+1Yb3F/RzQ1GkGjZQGRr/r1t/q1izbfh7xCf/72WHin1nAC7Yt1fYG0rDpz7KOLsQA9rGnQCU/ncWB22yYPXEHvewGbuQolggths+fmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsAQKhmy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05DCC4CEF0;
	Wed, 17 Sep 2025 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758095191;
	bh=qulyf2x3ovCrkpojNcqaI9BFWYLuH6KOYPY/FS9U6yw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OsAQKhmyIKAJfluHy6bw8MkIehm5IEb/9ZDvupSKiRahviiMrX8drdB/x1qh06R3X
	 L34E7v4n2D3JbhBz/J5ux+3vOM9McCHqwqpf/qMhw1oaCFvxXM1/k+hhsG5lFiLXsq
	 hnmrPpZabulipxRgCtC0DU3z1X+xncIHsc8k6ocgy8PGgyp9MB01m2OZDye5WunExo
	 LBQ3iH/AmUQqYWmVfGIUt8qa1klPDqm3OZXteejfZVk+3FAHZoclHM6eTCCY0Wk49I
	 KGtl6O4ZjCVbfXS3HtN7rpKB+Bpc8CBDABs06mnRdLJefuU+jAyq7fs2TW9VAUHWxQ
	 ofiGuCcM/RS7g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Jens
 Axboe <axboe@kernel.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the block tree
In-Reply-To: <aMiScHEWoOABPgt9@sirena.org.uk>
References: <1Vn5Pr0rEN5VNr1V-oUtQYs_wVms3VZ7jsttDqMtVv3XxoMEIBc7Yf3FJhEanCMsvJe9z8HjzX7cEMedSJX68A==@protonmail.internalid>
 <aMiScHEWoOABPgt9@sirena.org.uk>
Date: Wed, 17 Sep 2025 09:46:09 +0200
Message-ID: <87tt11wmgu.fsf@t14s.mail-host-address-is-not-set>
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
> Today's linux-next merge of the tip tree got a conflict in:
>
>   rust/kernel/block/mq/operations.rs
>
> between commit:
>
>   90d952fac8ac1 ("rust: block: add `GenDisk` private data support")
>
> from the block tree and commit:
>
>   b6dd7b75496c5 ("rust: block: convert `block::mq` to use `Refcount`")
>
> from the tip tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc rust/kernel/block/mq/operations.rs
> index d098a8a3e4340,c0f95a9419c4e..0000000000000
> --- a/rust/kernel/block/mq/operations.rs
> +++ b/rust/kernel/block/mq/operations.rs
> @@@ -6,15 -6,15 +6,16 @@@
>   
>   use crate::{
>       bindings,
>  -    block::mq::request::RequestDataWrapper,
>  -    block::mq::Request,
>  +    block::mq::{request::RequestDataWrapper, Request},
>       error::{from_result, Result},
>       prelude::*,
> +     sync::Refcount,
>  -    types::ARef,
>  +    types::{ARef, ForeignOwnable},
>   };
> - use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Ordering};
> + use core::marker::PhantomData;
>   
>  +type ForeignBorrowed<'a, T> = <T as ForeignOwnable>::Borrowed<'a>;
>  +
>   /// Implement this trait to interface blk-mq as block devices.
>   ///
>   /// To implement a block device driver, implement this trait as described in the

Looks good to me, thanks!


Best regards,
Andreas Hindborg



