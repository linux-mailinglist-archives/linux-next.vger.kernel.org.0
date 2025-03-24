Return-Path: <linux-next+bounces-5956-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF13A6D9A3
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 12:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31004188A93E
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 11:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC17A1F4295;
	Mon, 24 Mar 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA919EM+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11C8BA53;
	Mon, 24 Mar 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817571; cv=none; b=ONtbjE68pop7miHZZn+JNT/3PbPrQe40bPG9vsaQFtatdaziAuabyFVcT9ZbVochxLEn8pyy2+ozKWnvWKjxO9ZphT2c/8/tjbmJNdKMjsq0PTaVOfd9pnwlW1j61ENf5PgPGOOjxsRqzl/jgDlLjKyRdqqqsrI+rp9TSUN6NWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817571; c=relaxed/simple;
	bh=qblKkQrPOeUivFzXTxrMmFQwwU9yIupX5p1TvwVZnNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d911iHa4p8jDk12BcdAj7fNOLE5geyUpqXrXkqjI3c8YRa8c0rj12bh/yR+tN3aSyLW72JrBMLwARvMWlSmECdicgOZSUyaD0o77cdZiJ26wn8CB+TIMBX4FZ5dQ0LdcBcboksMTosmQMsK3KrrsgxYVmZdxSZiRYWwRp3YB06A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA919EM+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEA0C4CEDD;
	Mon, 24 Mar 2025 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742817571;
	bh=qblKkQrPOeUivFzXTxrMmFQwwU9yIupX5p1TvwVZnNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DA919EM+Ygy/nmlp5ydWUI1nnSsLelOP8Ckq9ggkPgWjLFKDn6Bk99vbknzuqGPZ9
	 s+DM/IBJ6LadJVoJ4kdtA+MVwhJZrvOuKzT9ExqtuuIv4AtIZWC2UMAigSmFB1NeAm
	 rpcn+RAKpEIkCPwwqNo4VX4mhwKOHtrxk2UWKvxLG+5RwKw8RX6+pVg3/iZLo+NNEz
	 mxFIsfSvourZjCZccaYESMwD4mL4h6kh0fQ8xymRHH3f7H4pFS3XDgNohtlpnFjTOB
	 ZkNx1Xjpzqw9MgmtIB0P6bRT1TvO10Pm+12NxXK4qlQPFWr85Rm06zTB/lVRL9Ufjb
	 d/XbFkw4Qp/fQ==
Date: Mon, 24 Mar 2025 12:59:27 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <Z-FJH628-j2HCuaE@cassiopeiae>
References: <20250324215702.1515ba92@canb.auug.org.au>
 <20250324220629.1665236b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324220629.1665236b@canb.auug.org.au>

Hi Stephen,

On Mon, Mar 24, 2025 at 10:06:29PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 24 Mar 2025 21:57:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the rust tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > error[E0277]: `*mut MyStruct` cannot be sent between threads safely
> >   --> samples/rust/rust_dma.rs:47:22  
> >    |
> > 47 | impl pci::Driver for DmaSampleDriver {
> >    |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be sent between threads safely
> >    |
> >    = help: within `DmaSampleDriver`, the trait `Send` is not implemented for `*mut MyStruct`, which is required by `DmaSampleDriver: Send`
> > note: required because it appears within the type `CoherentAllocation<MyStruct>`
> >   --> rust/kernel/dma.rs:132:12  
> > note: required because it appears within the type `DmaSampleDriver`
> >   --> samples/rust/rust_dma.rs:9:8  
> >    |
> > 9  | struct DmaSampleDriver {
> >    |        ^^^^^^^^^^^^^^^
> > note: required by a bound in `kernel::pci::Driver`
> >   --> rust/kernel/pci.rs:225:1  
> > 
> > error: aborting due to 1 previous error
> > 
> > For more information about this error, try `rustc --explain E0277`.
> > 
> > I have no idea what caused this - it built in next-20250321, but that
> > no longer builds, so I have reset to the version of the rust tree in
> > next-20250320 (commit 4a47eec07be6).
> 
> Actually, the driver-core tree gained these commits over the weekend:
> 
>   51d0de7596a4 ("rust: platform: require Send for Driver trait implementers")
>   935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
>   455943aa187f ("rust: platform: impl Send + Sync for platform::Device")
>   e2942bb4e629 ("rust: pci: impl Send + Sync for pci::Device")
> 
> A heads up would have been nice ... and maybe even a test merge and
> build against -next (given how late we are in the cycle).

Commit 935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
from the driver-core tree fixes a missing concurrency requirement, which commit
9901addae63b ("samples: rust: add Rust dma test sample driver") from the Rust
tree did not yet consider.

Technically, it did what it is supposed to do -- catch a concurrency issue at
compile time. However, since I was involved into both sides, I could have
thought of this, but unfortunately in this case it was too subtle for me to
spot -- sorry.

There are two options, 1. simply drop the commit [1] that introduces the
affected sample DMA code, or 2. apply the fix below to [2]. My preference would
be (2).

--

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 9d00f9c49f47..18de693c4924 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -301,6 +301,10 @@ fn drop(&mut self) {
     }
 }

+// SAFETY: It is safe to send a `CoherentAllocation` to another thread if `T`
+// can be send to another thread.
+unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
+
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// # Examples

--

[1] 9901addae63b ("samples: rust: add Rust dma test sample driver")
[2] ad2907b4e308 ("rust: add dma coherent allocator abstraction")

