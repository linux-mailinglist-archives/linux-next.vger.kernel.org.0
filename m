Return-Path: <linux-next+bounces-5961-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E689A6DBD8
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 14:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8294188551C
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 13:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FD825E444;
	Mon, 24 Mar 2025 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jz9+9cwh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069DC19C569;
	Mon, 24 Mar 2025 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742823812; cv=none; b=o/mah/+GCB2gkpXt2H0y5mnyHumxLclY8MM892kAEBTB8YlOivi85zlmcWo+iDpaNjsQEzja3YDWJghyUeh/1P8i6+W56Ftqe2A3qbqHcrnM17dqi4N4gVb6ugcHfGXPBQfBzeImsUX//YDDI8qf+cHSAhc2uIXgnV+FT0aNajY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742823812; c=relaxed/simple;
	bh=oMpqXQrrxK7A/shYjvYDKkBZWp4XdicK9zEvqFjtbcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpk3NMW8YUZiVdH4IXVd9eFqRkN7iSg46yASXIYeb1g2cTA9Ny8ebqyoEOBJD2rE6lQng6np4OmopF8puMKD9jkBLKavM40dB5AZfURssiEpAsUIdLIzvjIAw7BrbScyfvHVIsRNAYarIH/jfAHGhSxc+fKzYx0K8eYUNnxxbaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jz9+9cwh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448FCC4CEE9;
	Mon, 24 Mar 2025 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742823811;
	bh=oMpqXQrrxK7A/shYjvYDKkBZWp4XdicK9zEvqFjtbcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jz9+9cwh0Lq/AqNpL9fGxv0zd4pTQiHFfLC5BIE0aH/mCvTNuf4mN4k0eXVq1wtge
	 ske5xnfrGouzxFF2apfZ6HXPRRxlEkXSkk8NQigcH/HOjpbiwdQaLsh8g/QHICUB8+
	 AkMWvWMbDx0CYZB3TpdaJ7Ul96MnLxeOAKzBJHDBCmM/F986vP7jTrrWTIPtCyB2W7
	 hoWXDVlqg5czLC5dup0Iw80UtQc52KtgDKOOAa3HfTaZ2nHDfO6+xXSiOlquhRhNVd
	 SOPaxXNHaxBHIRil6JA27h0DOF1dmUoF83PoClAQzk9ujF68CcqTsaiAxskasqhMQY
	 t0cNjotuhF2Gg==
Date: Mon, 24 Mar 2025 14:43:27 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <Z-Fhf3Cn8w2oh1_z@cassiopeiae>
References: <20250324215702.1515ba92@canb.auug.org.au>
 <20250324220629.1665236b@canb.auug.org.au>
 <Z-FJH628-j2HCuaE@cassiopeiae>
 <2025032443-recharger-legacy-93bf@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025032443-recharger-legacy-93bf@gregkh>

On Mon, Mar 24, 2025 at 06:29:30AM -0700, Greg KH wrote:
> On Mon, Mar 24, 2025 at 12:59:27PM +0100, Danilo Krummrich wrote:
> > Hi Stephen,
> > 
> > On Mon, Mar 24, 2025 at 10:06:29PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > On Mon, 24 Mar 2025 21:57:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the rust tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > > 
> > > > error[E0277]: `*mut MyStruct` cannot be sent between threads safely
> > > >   --> samples/rust/rust_dma.rs:47:22  
> > > >    |
> > > > 47 | impl pci::Driver for DmaSampleDriver {
> > > >    |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be sent between threads safely
> > > >    |
> > > >    = help: within `DmaSampleDriver`, the trait `Send` is not implemented for `*mut MyStruct`, which is required by `DmaSampleDriver: Send`
> > > > note: required because it appears within the type `CoherentAllocation<MyStruct>`
> > > >   --> rust/kernel/dma.rs:132:12  
> > > > note: required because it appears within the type `DmaSampleDriver`
> > > >   --> samples/rust/rust_dma.rs:9:8  
> > > >    |
> > > > 9  | struct DmaSampleDriver {
> > > >    |        ^^^^^^^^^^^^^^^
> > > > note: required by a bound in `kernel::pci::Driver`
> > > >   --> rust/kernel/pci.rs:225:1  
> > > > 
> > > > error: aborting due to 1 previous error
> > > > 
> > > > For more information about this error, try `rustc --explain E0277`.
> > > > 
> > > > I have no idea what caused this - it built in next-20250321, but that
> > > > no longer builds, so I have reset to the version of the rust tree in
> > > > next-20250320 (commit 4a47eec07be6).
> > > 
> > > Actually, the driver-core tree gained these commits over the weekend:
> > > 
> > >   51d0de7596a4 ("rust: platform: require Send for Driver trait implementers")
> > >   935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
> > >   455943aa187f ("rust: platform: impl Send + Sync for platform::Device")
> > >   e2942bb4e629 ("rust: pci: impl Send + Sync for pci::Device")
> > > 
> > > A heads up would have been nice ... and maybe even a test merge and
> > > build against -next (given how late we are in the cycle).
> > 
> > Commit 935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
> > from the driver-core tree fixes a missing concurrency requirement, which commit
> > 9901addae63b ("samples: rust: add Rust dma test sample driver") from the Rust
> > tree did not yet consider.
> > 
> > Technically, it did what it is supposed to do -- catch a concurrency issue at
> > compile time. However, since I was involved into both sides, I could have
> > thought of this, but unfortunately in this case it was too subtle for me to
> > spot -- sorry.
> > 
> > There are two options, 1. simply drop the commit [1] that introduces the
> > affected sample DMA code, or 2. apply the fix below to [2]. My preference would
> > be (2).
> > 
> > --
> > 
> > diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> > index 9d00f9c49f47..18de693c4924 100644
> > --- a/rust/kernel/dma.rs
> > +++ b/rust/kernel/dma.rs
> > @@ -301,6 +301,10 @@ fn drop(&mut self) {
> >      }
> >  }
> > 
> > +// SAFETY: It is safe to send a `CoherentAllocation` to another thread if `T`
> > +// can be send to another thread.
> > +unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
> > +
> >  /// Reads a field of an item from an allocated region of structs.
> >  ///
> >  /// # Examples
> > 
> 
> I can't "drop" anything here as that would be a mess.

It's the DMA commit that has a bug, that was revealed by the fix in the
driver-core tree. So, the patch to drop is in the rust tree (not sure if Miguel
changes history at this point though).

Anyways, I think the fix is simple enough.

> Maybe we just
> consider a merge of the driver core and rust trees at this point in time
> and fix things up and do a combined pull request to Linus so he doesn't
> have to deal with the fixups?

I think it's not that bad, the full diff for the conflicts between driver-core
and rust is:

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
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 908acd34b8db..874c2c964afa 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -4,10 +4,10 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.

-use kernel::{bindings, dma::CoherentAllocation, pci, prelude::*};
+use kernel::{bindings, device::Core, dma::CoherentAllocation, pci, prelude::*, types::ARef};

 struct DmaSampleDriver {
-    pdev: pci::Device,
+    pdev: ARef<pci::Device>,
     ca: CoherentAllocation<MyStruct>,
 }

@@ -48,7 +48,7 @@ impl pci::Driver for DmaSampleDriver {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;

-    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
         dev_info!(pdev.as_ref(), "Probe DMA test driver.\n");

         let ca: CoherentAllocation<MyStruct> =
@@ -64,7 +64,7 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>

         let drvdata = KBox::new(
             Self {
-                pdev: pdev.clone(),
+                pdev: pdev.into(),
                 ca,
             },
             GFP_KERNEL,

