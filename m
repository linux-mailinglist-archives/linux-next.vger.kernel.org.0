Return-Path: <linux-next+bounces-9058-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1953C66459
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 22:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 947344E0301
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 21:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E79323406;
	Mon, 17 Nov 2025 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt3zBlww"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B53325497
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763414959; cv=none; b=BSRlCOAZ+dIcSfkzYuaWlbOPjSDse8SGp6od1GgIBI6O2f5OUOUKCnXCb2MyKFNzqe8cb7JSoNc2OUEU2hQ8jniXjYfjYLNocgMJmnyA/gCyYt5Cc5eO+vPdbSVV85N6qYiaoaZWe6StJGbdiKHXZrX+6wDwbRvjXqKFjR00Ks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763414959; c=relaxed/simple;
	bh=z2VZOGcg8d67uhaosRRbAEo2THNg3lzAack8P7osnQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzgUDc/eiJHJcYPC0I5lqaPLZu7gae2W6POxLDr6iwcjF0HcqmVqKiU+InlMWlrGTpQzIgnREvgH4/5PCwZP3QOsvGzG1S+HBFwoJ8MHJYBocSNLzQa71h4+SxSoGMDEQ7/oF788PtLlatQmwWmZ0ESkg5dfHFtoQUoMhqgl52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt3zBlww; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b2dcdde698so317154185a.3
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 13:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763414956; x=1764019756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+SKBe1nPyJ5j38dZ8uRA14jmAee36Vl7e2SsxSZjjM=;
        b=Vt3zBlwwLFj2XHNiwUroeHs77Dlp0UzfDwqA0tpX4FvCyOw6DKbn2GO0T/azWWSeUR
         WXuDIzkzJt/HaC4WBGoqkiMT/nUiGuxTsmh2QJme+gYlDSB8hwPr6zE3jp/T0FVUjfic
         wjCBl/ZjCjyNce3GvmaPQNs14Bd/C3E5H0deD3m49sVfR+71MMWTDRTl9Oo/RoXATg2b
         3VejZ81t50rQ6MWzEeU6h7L00Yc3SP+CZWCC8N7hfLIhJaYqxDuZatwjkbgUBi/uozuS
         Xe54vp5QRNKErdYc9kI/F5DDZKdTN5P1Fn8fH0/5zY7bEymO9r5TSzDGG61/ZHmL/VcV
         rM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763414956; x=1764019756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+SKBe1nPyJ5j38dZ8uRA14jmAee36Vl7e2SsxSZjjM=;
        b=W38U9Uuvr00/Jl54jo3ASXtixgw+iHQHQfdCNyWr1dkmO5mhNZSVs4M7inVai9QFil
         f4JA1mQNG+N62EcAZGD9PHAZ5OzRuICrvl08xTfsK/3wy04JJFXnJiG5SEoZlTPYXjiP
         wBPkoeK1EMowFtVoAyxoVjzmj0dGrxacxVUNuCPbUJ7nvLt43/CA8ohONIZnCul5QRS9
         LXGlWRt5NhdQbNseUXDRFhVN9F4rZkXwH9N2hDhbsTQJ2G8nHUS5tUO6AlyoqwnxLXND
         JZ0yHccZKJtRUcJVJi1GWeSVKxpPXwYAJd+gV/0wOsL1+N6rqWJ4pUa+QWGqdzGkUOAd
         q39g==
X-Forwarded-Encrypted: i=1; AJvYcCVgHp11VUlnimKsoSfuaCrt5rrqo74mAtYn/YG8TSe2ZdwcNt/Z/UWmVeu8IJqLpRmohDGC13HeS8km@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/B2QeaGoTUS84h+pbFHPyPQ6TTSlpx3l7qPNR1ZGH0HW9067
	gYmiVP+M00cKbkuYfBYRHRsYXndNoU1FZvIoB5poI9cxL6ZMMu0RH7yS
X-Gm-Gg: ASbGncsqmuGU+N6PJIZPVwc4E6nEhsNdlKc4Rap1xHVch3k51K4TAiza90qW9RVphsn
	mmMmcaZajS/yfplzBMTcsdqXtanF2xeuXwEi3psXSymNTr2w5AWVOAzFr/8IXSmsBIakbhqnCY+
	6L0YYc0cvQKs3fNjmrCMTNLuBAR1bnUHYZCJ30zFmbriBhjhqE8sOaZmQ1+y/lV7USXxyGQrOmz
	88UherpB0Q41agzVnj1O6rTcn1XdBZGIJgq7vJ1S7piuHgkBjNsfwtLE2K8Le7nVxT0VmG7x7v+
	POuLQSLVoRYzO98n0yyCS5K8k9zrDOrPPtDGKUrXuB7BVO2aJ/zNsv9bN5wjHp1daaSUAAowf4z
	wIq8iddUxP8RsdIVH4kvBYVX5aQHOG/e7qeXZljWJKBDkvCtEHfo2IWVoP0niZ2kvwMtd44y+nX
	OlNgGevKWdYBAn20uGwt10+Vn864sRdjySRYoVgfBnlklyRrMHqLPZtZ4a2kF3cwqZ3YFVUbJ84
	gN+8mLgNxJB0jxd+G7fKL2THg==
X-Google-Smtp-Source: AGHT+IHOnuy9MVwlJRs2Un98wkORJyndXcXch7pfehx+W+HewqE6Q9oTdU+U53aGat7ReV7Dysc73g==
X-Received: by 2002:a05:620a:4624:b0:89f:27dc:6536 with SMTP id af79cd13be357-8b2c31b472fmr1723789485a.54.1763414956079;
        Mon, 17 Nov 2025 13:29:16 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aee9e1c4sm1069560585a.2.2025.11.17.13.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 13:29:15 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1E0A7F40068;
	Mon, 17 Nov 2025 16:29:15 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 17 Nov 2025 16:29:15 -0500
X-ME-Sender: <xms:q5MbaVRzNVEyP8DKDfb_hHtzFlPSv8U7Z33gEtrQ3nDdx5gO3wAPhA>
    <xme:q5Mbaan9AIBixiq_6HiqlBGyqBvtYAEXi08jYetfjcAta511By9NEyKyDAUkrcNoz
    i7j6bA1VGGlTtEiwsVfbKJD7g-Js45vkB6SvqfqoYatXmJAzDYC>
X-ME-Received: <xmr:q5MbaWMQb5JXviRDmEtFC2Jq5PN_JFEGutUZBGFCNoG62QN-YQkWTkAn--grP2OaW14uUjKph6abQ957AKBZTmFbOe_8m7sd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudelheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeeltedtvdfgueelteelteehledvieffheetieeuhfffhedvjedvieetheehiedu
    tdenucffohhmrghinhepuggvrhgvfhgpmhhuthdrrhgvrggupdguvghrvghfrdhrvggrug
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhq
    uhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqud
    ejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgv
    rdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehgrhgv
    gheskhhrohgrhhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhl
    gieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmihhnghhosehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehhphgrseiihihtohhrrdgtohhmpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:q5MbaWgp9UkgNx1kI9mmicuiNZfMReniJXw6jzUm3szYf-EbXpdvIg>
    <xmx:q5MbacinAGNCe2gL3IIeTjAmW6PN57sOJe-O1Nk2ylARw2cIhEvQIw>
    <xmx:q5MbadLxYwWQYVCtaX7-jEGEsgiy7EEmdvWYrxGD-lxwieIn0hEQMw>
    <xmx:q5MbaTmwAeo7caOpPJWBXZCvYfoxRzL9vq3CI_dsZ1pFCyvYlWC74w>
    <xmx:q5MbadO8AVzNb78PP0tw5s5rvXF3shdv3HKU7T4Xi54rT-Bfesu8yjaX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Nov 2025 16:29:14 -0500 (EST)
Date: Mon, 17 Nov 2025 13:29:13 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the tip
 tree
Message-ID: <aRuTqf0bD5VP1IQy@tardis.local>
References: <20251117162154.193e1e9e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117162154.193e1e9e@canb.auug.org.au>

On Mon, Nov 17, 2025 at 04:21:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 

Hi Stephen,

> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   rust/kernel/debugfs/traits.rs
> 
> between commit:
> 
>   f74cf399e02e ("rust: debugfs: Replace the usage of Rust native atomics")
> 
> from the tip tree and commits:
> 
>   9c804d9cf2db ("rust: debugfs: support for binary large objects")
>   a9fca8a7b2c5 ("rust: debugfs: support blobs from smart pointers")
> 
> from the driver-core tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary. This
> complex conflicts.

Thank you for reporting this, the fix looks good to me and I also did a
rust doc test on next-20251117, and confirm it works. Thank you!

> conflicts should be mentioned to your upstream maintainer when your tree
> is now fixed as far as linux-next is concerned, but any non trivial
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> 

Greg and Peter, any concern about this conflict? It's not very trivial,
but I believe it's not too much work to resolve then (just removing the
Atomic* usage and use the LKMM atomic).

Regards,
Boqun

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc rust/kernel/debugfs/traits.rs
> index 92054fed2136,82441ac8adaa..000000000000
> --- a/rust/kernel/debugfs/traits.rs
> +++ b/rust/kernel/debugfs/traits.rs
> @@@ -3,12 -3,20 +3,17 @@@
>   
>   //! Traits for rendering or updating values exported to DebugFS.
>   
> + use crate::alloc::Allocator;
> + use crate::fs::file;
>   use crate::prelude::*;
> + use crate::sync::Arc;
>  +use crate::sync::atomic::{Atomic, AtomicBasicOps, AtomicType, Relaxed};
>   use crate::sync::Mutex;
> - use crate::uaccess::UserSliceReader;
> + use crate::transmute::{AsBytes, FromBytes};
> + use crate::uaccess::{UserSliceReader, UserSliceWriter};
>   use core::fmt::{self, Debug, Formatter};
> + use core::ops::{Deref, DerefMut};
>   use core::str::FromStr;
>  -use core::sync::atomic::{
>  -    AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, AtomicU32, AtomicU64,
>  -    AtomicU8, AtomicUsize, Ordering,
>  -};
>   
>   /// A trait for types that can be written into a string.
>   ///
> @@@ -63,21 -175,164 +172,148 @@@ impl<T: FromStr + Unpin> Reader for Mut
>       }
>   }
>   
>  +impl<T: AtomicType + FromStr> Reader for Atomic<T>
>  +where
>  +    T::Repr: AtomicBasicOps,
>  +{
>  +    fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
>  +        let mut buf = [0u8; 21]; // Enough for a 64-bit number.
>  +        if reader.len() > buf.len() {
>  +            return Err(EINVAL);
>  +        }
>  +        let n = reader.len();
>  +        reader.read_slice(&mut buf[..n])?;
>  +
>  +        let s = core::str::from_utf8(&buf[..n]).map_err(|_| EINVAL)?;
>  +        let val = s.trim().parse::<T>().map_err(|_| EINVAL)?;
>  +        self.store(val, Relaxed);
>  +        Ok(())
>  +    }
>  +}
> ++
> + /// Trait for types that can be constructed from a binary representation.
> + ///
> + /// See also [`BinaryReader`] for interior mutability.
> + pub trait BinaryReaderMut {
> +     /// Reads the binary form of `self` from `reader`.
> +     ///
> +     /// Same as [`BinaryReader::read_from_slice`], but takes a mutable reference.
> +     ///
> +     /// `offset` is the requested offset into the binary representation of `self`.
> +     ///
> +     /// On success, returns the number of bytes read from `reader`.
> +     fn read_from_slice_mut(
> +         &mut self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize>;
> + }
> + 
> + // Base implementation for any `T: AsBytes + FromBytes`.
> + impl<T: AsBytes + FromBytes> BinaryReaderMut for T {
> +     fn read_from_slice_mut(
> +         &mut self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize> {
> +         reader.read_slice_file(self.as_bytes_mut(), offset)
> +     }
> + }
> + 
> + // Delegate for `Box<T, A>`: Support a `Box<T, A>` with an outer lock.
> + impl<T: ?Sized + BinaryReaderMut, A: Allocator> BinaryReaderMut for Box<T, A> {
> +     fn read_from_slice_mut(
> +         &mut self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize> {
> +         self.deref_mut().read_from_slice_mut(reader, offset)
> +     }
> + }
> + 
> + // Delegate for `Vec<T, A>`: Support a `Vec<T, A>` with an outer lock.
> + impl<T, A> BinaryReaderMut for Vec<T, A>
> + where
> +     T: AsBytes + FromBytes,
> +     A: Allocator,
> + {
> +     fn read_from_slice_mut(
> +         &mut self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize> {
> +         let slice = self.as_mut_slice();
> + 
> +         // SAFETY: `T: AsBytes + FromBytes` allows us to treat `&mut [T]` as `&mut [u8]`.
> +         let buffer = unsafe {
> +             core::slice::from_raw_parts_mut(
> +                 slice.as_mut_ptr().cast(),
> +                 core::mem::size_of_val(slice),
> +             )
> +         };
> + 
> +         reader.read_slice_file(buffer, offset)
> +     }
> + }
> + 
> + /// Trait for types that can be constructed from a binary representation.
> + ///
> + /// See also [`BinaryReaderMut`] for the mutable version.
> + pub trait BinaryReader {
> +     /// Reads the binary form of `self` from `reader`.
> +     ///
> +     /// `offset` is the requested offset into the binary representation of `self`.
> +     ///
> +     /// On success, returns the number of bytes read from `reader`.
> +     fn read_from_slice(
> +         &self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize>;
> + }
> + 
> + // Delegate for `Mutex<T>`: Support a `T` with an outer `Mutex`.
> + impl<T: BinaryReaderMut + Unpin> BinaryReader for Mutex<T> {
> +     fn read_from_slice(
> +         &self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize> {
> +         let mut this = self.lock();
> + 
> +         this.read_from_slice_mut(reader, offset)
> +     }
> + }
> + 
> + // Delegate for `Box<T, A>`: Support a `Box<T, A>` with an inner lock.
> + impl<T: ?Sized + BinaryReader, A: Allocator> BinaryReader for Box<T, A> {
> +     fn read_from_slice(
> +         &self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize> {
> +         self.deref().read_from_slice(reader, offset)
> +     }
> + }
> + 
> + // Delegate for `Pin<Box<T, A>>`: Support a `Pin<Box<T, A>>` with an inner lock.
> + impl<T: ?Sized + BinaryReader, A: Allocator> BinaryReader for Pin<Box<T, A>> {
> +     fn read_from_slice(
> +         &self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize> {
> +         self.deref().read_from_slice(reader, offset)
> +     }
> + }
> + 
> + // Delegate for `Arc<T>`: Support an `Arc<T>` with an inner lock.
> + impl<T: ?Sized + BinaryReader> BinaryReader for Arc<T> {
> +     fn read_from_slice(
> +         &self,
> +         reader: &mut UserSliceReader,
> +         offset: &mut file::Offset,
> +     ) -> Result<usize> {
> +         self.deref().read_from_slice(reader, offset)
> +     }
> + }
>  -
>  -macro_rules! impl_reader_for_atomic {
>  -    ($(($atomic_type:ty, $int_type:ty)),*) => {
>  -        $(
>  -            impl Reader for $atomic_type {
>  -                fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
>  -                    let mut buf = [0u8; 21]; // Enough for a 64-bit number.
>  -                    if reader.len() > buf.len() {
>  -                        return Err(EINVAL);
>  -                    }
>  -                    let n = reader.len();
>  -                    reader.read_slice(&mut buf[..n])?;
>  -
>  -                    let s = core::str::from_utf8(&buf[..n]).map_err(|_| EINVAL)?;
>  -                    let val = s.trim().parse::<$int_type>().map_err(|_| EINVAL)?;
>  -                    self.store(val, Ordering::Relaxed);
>  -                    Ok(())
>  -                }
>  -            }
>  -        )*
>  -    };
>  -}
>  -
>  -impl_reader_for_atomic!(
>  -    (AtomicI16, i16),
>  -    (AtomicI32, i32),
>  -    (AtomicI64, i64),
>  -    (AtomicI8, i8),
>  -    (AtomicIsize, isize),
>  -    (AtomicU16, u16),
>  -    (AtomicU32, u32),
>  -    (AtomicU64, u64),
>  -    (AtomicU8, u8),
>  -    (AtomicUsize, usize)
>  -);



