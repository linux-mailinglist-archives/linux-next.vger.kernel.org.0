Return-Path: <linux-next+bounces-8208-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B9EB451AD
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 10:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12AA16357C
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 08:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA34222594;
	Fri,  5 Sep 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qhh7vQ7M"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5360413AA2D;
	Fri,  5 Sep 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061509; cv=none; b=AVBFWjdS9Wc0SrFFfNl/21AftpZchUq3Gm/N66YPNMmRum2U7TXoogn6uonTnzmlVznCKaeeJCIzl6h3j6WYra2XfIOCJesNLcUgDdyIMluTCHW2bQYxUH8WEuEQYTxrpKPaFRIMoBk/9tqdRAryByE9pLqwUt6isADvG45DDgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061509; c=relaxed/simple;
	bh=GfFt0NZ4p1rN6zuathfBgehAphXRvkjy/J3DLHMj5sg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dV646+b8d7AMxTolnfF/B4YZdicldutuk9DDb6/R59EGtIbo3QxakVp4tMbgExHFGe3QFjAxvVjOjBqAaEoyfwxC0iqtDNmeV7OHQ3OoyMbb89el0ZNEb8GZLrDKDW7YaeZZL3t9NjRvk7m5YiPssvZbEBuW8AkSXEG7NooV+Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qhh7vQ7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F25C4CEF1;
	Fri,  5 Sep 2025 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757061508;
	bh=GfFt0NZ4p1rN6zuathfBgehAphXRvkjy/J3DLHMj5sg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Qhh7vQ7M2oiu5S0aayywFct6/WWZRJHYLpPjfZ01qm8uxJCxiWi9kfPP+dQDLH+Ay
	 aCZ8OoN2kTfSPN1tmfe7IaKoyfVTpv+AqzUmh0fSQ3xaw6vUH86ddoHP/IMHm8Bisi
	 8ieMq8AVGF6ktc4Tzb9gTUxt0CStQY/Lp4Uz5loJ+36fipXSnNC8Lhta2NgtodJT0s
	 /yzEpqgcxGIT+44SSS5KoySSKDh0t49EEvGiWz3eABM4qHM+jlG7c0T4FAI83LpX8F
	 pnvsEEWOhnI5BGCn0v5K2DKnFV0h1gGlPARbkV04a8vXM00sma9fWS5+MemSSWQNBh
	 ohlZXtPVedyYg==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Sep 2025 10:38:26 +0200
Message-Id: <DCKQBKR9NYGI.33LVD1OKBQ6OZ@kernel.org>
Subject: Re: linux-next: manual merge of the drm-rust tree with Linus' tree
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250905125653.0ebc7580@canb.auug.org.au>
In-Reply-To: <20250905125653.0ebc7580@canb.auug.org.au>

On Fri Sep 5, 2025 at 4:56 AM CEST, Stephen Rothwell wrote:
> diff --cc rust/kernel/alloc/allocator_test.rs
> index 2e61cdbd2303,f46b4b671389..000000000000
> --- a/rust/kernel/alloc/allocator_test.rs
> +++ b/rust/kernel/alloc/allocator_test.rs
> @@@ -9,11 -9,13 +9,13 @@@
>  =20
>   #![allow(missing_docs)]
>  =20
>  -use super::{flags::*, AllocError, Allocator, Flags};
>  +use super::{flags::*, AllocError, Allocator, Flags, NumaNode};
>   use core::alloc::Layout;
>   use core::cmp;
> + use core::marker::PhantomData;
>   use core::ptr;
>   use core::ptr::NonNull;
> + use kernel::page;
>  =20
>   /// The userspace allocator based on libc.
>   pub struct Cmalloc;
> @@@ -22,17 -24,33 +24,44 @@@ pub type Kmalloc =3D Cmalloc
>   pub type Vmalloc =3D Kmalloc;
>   pub type KVmalloc =3D Kmalloc;
>  =20
>  +impl Cmalloc {
>  +    /// Returns a [`Layout`] that makes [`Kmalloc`] fulfill the request=
ed size and alignment of
>  +    /// `layout`.
>  +    pub fn aligned_layout(layout: Layout) -> Layout {
>  +        // Note that `layout.size()` (after padding) is guaranteed to b=
e a multiple of
>  +        // `layout.align()` which together with the slab guarantees mea=
ns that `Kmalloc` will return
>  +        // a properly aligned object (see comments in `kmalloc()` for m=
ore information).
>  +        layout.pad_to_align()
>  +    }
>  +}
>  +
> + pub struct VmallocPageIter<'a> {
> +     _p: PhantomData<page::BorrowedPage<'a>>,
> + }
> +=20
> + impl<'a> Iterator for VmallocPageIter<'a> {
> +     type Item =3D page::BorrowedPage<'a>;
> +=20
> +     fn next(&mut self) -> Option<Self::Item> {
> +         None
> +     }
> + }
> +=20
> + impl<'a> VmallocPageIter<'a> {
> +     #[allow(clippy::missing_safety_doc)]
> +     pub unsafe fn new(_buf: NonNull<u8>, _size: usize) -> Self {
> +         Self { _p: PhantomData }
> +     }
> +=20
> +     pub fn size(&self) -> usize {
> +         0
> +     }
> +=20
> +     pub fn page_count(&self) -> usize {
> +         0
> +     }
> + }
> +=20
>   extern "C" {
>       #[link_name =3D "aligned_alloc"]
>       fn libc_aligned_alloc(align: usize, size: usize) -> *mut crate::ffi=
::c_void;

Looks good, thanks!

