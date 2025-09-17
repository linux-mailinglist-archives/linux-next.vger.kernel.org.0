Return-Path: <linux-next+bounces-8350-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C04B7DDA1
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701123B920D
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 07:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0327B2E3AEA;
	Wed, 17 Sep 2025 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih0wrNBh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5D2E2DFE;
	Wed, 17 Sep 2025 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095195; cv=none; b=qEFEd4Cx7AJySQvXBYYxX64qj2S661D/Hp7LEuklocnFpDQAw91Iv2WGhvgIcQXby/XmclUWQrKmONZPx8fnVdy5uExm3IPslF69W1AfQbidTiVTR9nEgltM7NYsLZdBobzbVkIPPZEIkmruxx2BGIVJ1HqZRPtgvZoJVOPsM9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095195; c=relaxed/simple;
	bh=f4QsgvOKY8b95x6FQDUL6uMm5pnw0xlJZP3JlPjGc/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S9ogknH8P0Yl1eCTWqZw1rzsga66IBYrewmNLzX+k9of9Da+clEBiFCeM9B2vXEn+32uhMgPCvDrqPdQjK0w7Q1VIukHOk+4vpZmYnO8euK3YI50+bROn3zQ8p7gjyGt3szacEq3ce/nBXvfbqY5t+R9JXSZhAMuKhBN/DFXvsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih0wrNBh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A40C4CEF0;
	Wed, 17 Sep 2025 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758095195;
	bh=f4QsgvOKY8b95x6FQDUL6uMm5pnw0xlJZP3JlPjGc/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ih0wrNBhunE9a2CzYnt9F+4/I/XOkWbOyq5uV/rPYEOCWklc0WrXzYr8BNcnGfvyx
	 6Nz4lZ6J7YsSOr9mdiVz2JqobWQsXduRBIIdroHPksChBgZhJIMZmEG2pmVrdabDSs
	 RJT6uHiY300rusD2BX8fFIVMi6FLk43VNu0c2fPSY+cHTU1CzozrfU/nF58RKk6j0x
	 5lVj1PDbMU1rzekykNPdexYjXCBqWmBUYYrhSe/x+kZP6ZWelgRoJKZPlOtGn2upG1
	 /g1vNW+fUX+wWJbOeNqw5/aFJe/P1bNxX4C06NsV+ksPvj2bu+Z0letXDXcjRajnEl
	 kDTabtMm3bgbg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the block tree
In-Reply-To: <aMlkUu2MzRYxh96v@sirena.org.uk>
References: <tIE_kvneh6miIKUKHYGGt286j3LmCrKMfENd03aIk-ojsDOR1vkjVpf9RSrCM_ZheU65PMmUalkvqToq_Ttxew==@protonmail.internalid>
 <aMlkUu2MzRYxh96v@sirena.org.uk>
Date: Wed, 17 Sep 2025 09:42:16 +0200
Message-ID: <87wm5xwmnb.fsf@t14s.mail-host-address-is-not-set>
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
>   rust/kernel/block/mq/gen_disk.rs
>
> between commits:
>
>   f4b72f1558be1 ("rust: block: normalize imports for `gen_disk.rs`")
>   c3a54220b54a1 ("rust: block: use `NullTerminatedFormatter`")
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
> diff --cc rust/kernel/block/mq/gen_disk.rs
> index 46ec802699706,be92d0e5f0312..0000000000000
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@@ -3,19 -3,12 +3,19 @@@
>   //! Generic disk abstraction.
>   //!
>   //! C header: [`include/linux/blkdev.h`](srctree/include/linux/blkdev.h)
> - //! C header: [`include/linux/blk_mq.h`](srctree/include/linux/blk_mq.h)
> + //! C header: [`include/linux/blk-mq.h`](srctree/include/linux/blk-mq.h)
>   
>  -use crate::block::mq::{raw_writer::RawWriter, Operations, TagSet};
>  -use crate::fmt::{self, Write};
>  -use crate::{bindings, error::from_err_ptr, error::Result, sync::Arc};
>  -use crate::{error, static_lock_class};
>  +use crate::{
>  +    bindings,
>  +    block::mq::{Operations, TagSet},
>  +    error::{self, from_err_ptr, Result},
> ++    fmt::{self, Write};
>  +    prelude::*,
>  +    static_lock_class,
>  +    str::NullTerminatedFormatter,
>  +    sync::Arc,
>  +    types::{ForeignOwnable, ScopeGuard},
>  +};
> - use core::fmt::{self, Write};
>   
>   /// A builder for [`GenDisk`].
>   ///

This looks good to me, thanks!


Best regards,
Andreas Hindborg



