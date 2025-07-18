Return-Path: <linux-next+bounces-7637-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E4B0A8CB
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 18:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC9115A7BEE
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 16:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540FF2E7624;
	Fri, 18 Jul 2025 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsD5jBzU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7812E719D;
	Fri, 18 Jul 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752857017; cv=none; b=rxlY3NY0dsJX47LOYSFrQ+ATl99tofRNLiA7ZjYeui9QfGJFLOqofKPmFFXn0gYe0+vzV1+90ft915YKcic9V51QmIb0DCZPKJYJQPXDyNszXC8y4HBE1muTu2p93wlts2JMCW+d9PV7C1S1VFfZRKVsrgqKMpokOnAVle+/Nfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752857017; c=relaxed/simple;
	bh=rtqU4NlziGVRj7aA6CN/HV27FZmfQ40RjbAFCqxNcG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsn7qAm7CDybKvixNiDDmhWCKnJBwaQbdGGhwMt+LtUYwYd2PUHceFVyD08pv76u80tsqIHqNZBZLnkNfVctm95QYSt+NZm6CJ1Aw5Qs80mZZvnvYEsZKOq/QlgVzt35j865B5BMsOYRQbkvjVgOtA3Q0u7mHfffO9BMChqNx88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsD5jBzU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B02C4CEEB;
	Fri, 18 Jul 2025 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752857016;
	bh=rtqU4NlziGVRj7aA6CN/HV27FZmfQ40RjbAFCqxNcG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsD5jBzUOba6pTg8ggxJD7owZjx+yZgs/nHHTUFV66EeayDqzkDiJ2ZiNWVvD4+Dl
	 Dc+u0qBz2NgrEJ0x5vppLPZIAam69ozBDGGCEvGZycCJi/w5u41EGPUcXQCOFpCsBh
	 1nceOW0qwWccW6JNzZd0g9l8buxFSIv/lXYJ9HqYt0++DNEQsPOh7TT406ZxkoAlSH
	 tvsWz3lr3wuEyRDzhFewdOpVUYPN6T7BZMB//6ZJJeXYJ4+yYJ5hNnyk/+JJg8kn8C
	 waYV9apMWBPadwfw1m1AiqEsOKxIGgAIXC1DKksb+kssvtA3rbWEkPT9C9tfBwcx8p
	 Huymk0EhYMgpA==
Date: Fri, 18 Jul 2025 18:43:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <aHp5tFVOhioQz7ba@pollux>
References: <20250718204653.1289b26f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718204653.1289b26f@canb.auug.org.au>

On Fri, Jul 18, 2025 at 08:46:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rust tree got a conflict in:
> 
>   rust/kernel/device_id.rs
> 
> between commit:
> 
>   8d84b32075fb ("rust: device_id: split out index support into a separate trait")
> 
> from the driver-core tree and commit:
> 
>   5e30550558b1 ("rust: enable `clippy::as_underscore` lint")
> 
> from the rust tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the diff looks good!

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc rust/kernel/device_id.rs
> index 8ed2c946144c,3dc72ca8cfc2..000000000000
> --- a/rust/kernel/device_id.rs
> +++ b/rust/kernel/device_id.rs
> @@@ -94,16 -77,14 +94,16 @@@ impl<T: RawDeviceId, U, const N: usize
>               // SAFETY: by the safety requirement of `RawDeviceId`, we're guaranteed that `T` is
>               // layout-wise compatible with `RawType`.
>               raw_ids[i] = unsafe { core::mem::transmute_copy(&ids[i].0) };
>  -            // SAFETY: by the safety requirement of `RawDeviceId`, this would be effectively
>  -            // `raw_ids[i].driver_data = i;`.
>  -            unsafe {
>  -                raw_ids[i]
>  -                    .as_mut_ptr()
>  -                    .byte_add(T::DRIVER_DATA_OFFSET)
>  -                    .cast::<usize>()
>  -                    .write(i);
>  +            if let Some(data_offset) = data_offset {
>  +                // SAFETY: by the safety requirement of this function, this would be effectively
>  +                // `raw_ids[i].driver_data = i;`.
>  +                unsafe {
>  +                    raw_ids[i]
>  +                        .as_mut_ptr()
> -                         .byte_offset(data_offset as _)
> ++                        .byte_add(data_offset)
>  +                        .cast::<usize>()
>  +                        .write(i);
>  +                }
>               }
>   
>               // SAFETY: this is effectively a move: `infos[i] = ids[i].1`. We make a copy here but



