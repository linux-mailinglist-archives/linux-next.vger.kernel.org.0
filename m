Return-Path: <linux-next+bounces-5963-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF6EA6DC2B
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 14:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16931188C717
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEABC14F9FB;
	Mon, 24 Mar 2025 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="kEXltbdT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q9qafpuQ"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D832E338C;
	Mon, 24 Mar 2025 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824443; cv=none; b=EduOs39g6FwYqTVuY2w+DWRA9WD/qzXYT1/ytIehb+mEkNsRi/lXC0CrrQP12xEPGQj+PHq6dHMeNFbs7uRscuihJgKUtTBXoampkrZYUmzTnTZJjdZVpSinZYXBTEiM8M8heVK26oi45cEJ76ltAIFBl6igHOJy/kM8plhddlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824443; c=relaxed/simple;
	bh=Kmp7q7muijy5PDUpTqYUFZH+1Bc9SWa2MmawQDIz7VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWhE0dGpaXclhhWHhr8AonTouLJKikQm0C6HwT8Pkb7LRAv5yAfwAgas5KiTPvF851Ws/NXfT4yn0g9d7S5Jw9y6/Fg4o24p+06dtPkK9/seWuCqNHd3g3LMvR/AZHbGlLNHYzjd4zAETHhMsmqTxFYin5Wu3R/EFwwjWX739bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=kEXltbdT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q9qafpuQ; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id AA49F13833C9;
	Mon, 24 Mar 2025 09:54:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 24 Mar 2025 09:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1742824440; x=1742910840; bh=Bl6gkTxvIB
	0xJ6m+Hxm4tvymVdUpWUDWjHTmY2yGdC0=; b=kEXltbdTavVfT0dMJ7NIzAXaiL
	b0EtMHPJfjq7FdKEcm5Rd6q3MdR5uq6XidOMYByD9PUGXrCZEpZuI3C6L7t9O8N2
	gkH2giBU76gPsgj2biiT3NR/Q6BDr8u3e6NKbeOpUeHmqypvLcM3b1/Mi4Q9efZd
	0g1qXzqb6wnAkWrivwTyUjqHbwKx6haZ3S7vty5l53debxMoLfeEoS9wIgHMiWv7
	9cut1HFvtH1RPmiMfszBQG9baW6W4dutNlOMP8pESrW5QmD0kRoSA3yOzKSLoq0c
	uQrutA/JniVeLJdhikXGiyE0E7zpoeJkC510rCueDrPW1p6p1ByZp5QoVRJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1742824440; x=1742910840; bh=Bl6gkTxvIB0xJ6m+Hxm4tvymVdUpWUDWjHT
	mY2yGdC0=; b=Q9qafpuQ5yXQgxKhWm0GxevoNGkUF3kvNRANShVorPVCxQGPrMD
	lCuFNjM2oYXPgsNoFAPDzLMyqjpt2mMtt9AYFA6J3g3gGmLxqqMUccCOQvQqbTfr
	1okRYcg4GCoPGfOhyh2Vgr5+1LENYVC/cmRoQp1LMyBaAgcsB4lhVF1e3lkBsk9U
	3qRSaL10syYE3PodVBulXwbBs8UnR+0IEsGzwrHtMmZnSx3dzGTHTCBiA+I50B6b
	4iJ8ifkJHtiqkVDCERg8fz7TW6wuTYjmGRolz5rRLkOBUk0RFbPck+uTZyHWnCMX
	8KBRVuhMAbv91GT2caV8jNHk4oIBeary+IA==
X-ME-Sender: <xms:92PhZwNLofVLNhuOOSyRPhDDQEYnQUeIx1HEB9rSjMOpwopFCoQsow>
    <xme:92PhZ2--y4dHMbCLXkR33UsIoCD1pboJG8J7dFHXM0M3UZGAkk_0wWt4BTNSMPSGn
    O44RiC5iXkjow>
X-ME-Received: <xmr:92PhZ3QnjKapyDkSorPVzvw1WhTm0FwzR0VBsh8YBrlNxrHwyKTI5xSGPXON>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:92PhZ4tw8hAYCmJwbo7XnXENuGdMm-N2U_SUtcjAZlvaVmpJc_u6Ew>
    <xmx:92PhZ4eRvo5ZqIwakaP8PQq9gwlNLQQ_RmyWDTcSyepEzw04ROJUdw>
    <xmx:92PhZ83cPblPzzrxRBOFOJaBknYyfgk-BsiFsxbWtt77YGZZhBb04A>
    <xmx:92PhZ8_CUDmlEXae0KYYYBh_SZJwEahNGj3_ouqd_QfHG_D3vnWBKQ>
    <xmx:-GPhZ5WTGN1AK7P8VSlaEZsweMMrcO4waavaK5YRwzH5ol-tnnGSJyGM>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 09:53:59 -0400 (EDT)
Date: Mon, 24 Mar 2025 06:52:38 -0700
From: Greg KH <greg@kroah.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <2025032429-curliness-unblock-7240@gregkh>
References: <20250324215702.1515ba92@canb.auug.org.au>
 <20250324220629.1665236b@canb.auug.org.au>
 <Z-FJH628-j2HCuaE@cassiopeiae>
 <2025032443-recharger-legacy-93bf@gregkh>
 <Z-Fhf3Cn8w2oh1_z@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-Fhf3Cn8w2oh1_z@cassiopeiae>

On Mon, Mar 24, 2025 at 02:43:27PM +0100, Danilo Krummrich wrote:
> On Mon, Mar 24, 2025 at 06:29:30AM -0700, Greg KH wrote:
> > On Mon, Mar 24, 2025 at 12:59:27PM +0100, Danilo Krummrich wrote:
> > > Hi Stephen,
> > > 
> > > On Mon, Mar 24, 2025 at 10:06:29PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > On Mon, 24 Mar 2025 21:57:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > >
> > > > > After merging the rust tree, today's linux-next build (x86_64
> > > > > allmodconfig) failed like this:
> > > > > 
> > > > > error[E0277]: `*mut MyStruct` cannot be sent between threads safely
> > > > >   --> samples/rust/rust_dma.rs:47:22  
> > > > >    |
> > > > > 47 | impl pci::Driver for DmaSampleDriver {
> > > > >    |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be sent between threads safely
> > > > >    |
> > > > >    = help: within `DmaSampleDriver`, the trait `Send` is not implemented for `*mut MyStruct`, which is required by `DmaSampleDriver: Send`
> > > > > note: required because it appears within the type `CoherentAllocation<MyStruct>`
> > > > >   --> rust/kernel/dma.rs:132:12  
> > > > > note: required because it appears within the type `DmaSampleDriver`
> > > > >   --> samples/rust/rust_dma.rs:9:8  
> > > > >    |
> > > > > 9  | struct DmaSampleDriver {
> > > > >    |        ^^^^^^^^^^^^^^^
> > > > > note: required by a bound in `kernel::pci::Driver`
> > > > >   --> rust/kernel/pci.rs:225:1  
> > > > > 
> > > > > error: aborting due to 1 previous error
> > > > > 
> > > > > For more information about this error, try `rustc --explain E0277`.
> > > > > 
> > > > > I have no idea what caused this - it built in next-20250321, but that
> > > > > no longer builds, so I have reset to the version of the rust tree in
> > > > > next-20250320 (commit 4a47eec07be6).
> > > > 
> > > > Actually, the driver-core tree gained these commits over the weekend:
> > > > 
> > > >   51d0de7596a4 ("rust: platform: require Send for Driver trait implementers")
> > > >   935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
> > > >   455943aa187f ("rust: platform: impl Send + Sync for platform::Device")
> > > >   e2942bb4e629 ("rust: pci: impl Send + Sync for pci::Device")
> > > > 
> > > > A heads up would have been nice ... and maybe even a test merge and
> > > > build against -next (given how late we are in the cycle).
> > > 
> > > Commit 935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
> > > from the driver-core tree fixes a missing concurrency requirement, which commit
> > > 9901addae63b ("samples: rust: add Rust dma test sample driver") from the Rust
> > > tree did not yet consider.
> > > 
> > > Technically, it did what it is supposed to do -- catch a concurrency issue at
> > > compile time. However, since I was involved into both sides, I could have
> > > thought of this, but unfortunately in this case it was too subtle for me to
> > > spot -- sorry.
> > > 
> > > There are two options, 1. simply drop the commit [1] that introduces the
> > > affected sample DMA code, or 2. apply the fix below to [2]. My preference would
> > > be (2).
> > > 
> > > --
> > > 
> > > diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> > > index 9d00f9c49f47..18de693c4924 100644
> > > --- a/rust/kernel/dma.rs
> > > +++ b/rust/kernel/dma.rs
> > > @@ -301,6 +301,10 @@ fn drop(&mut self) {
> > >      }
> > >  }
> > > 
> > > +// SAFETY: It is safe to send a `CoherentAllocation` to another thread if `T`
> > > +// can be send to another thread.
> > > +unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
> > > +
> > >  /// Reads a field of an item from an allocated region of structs.
> > >  ///
> > >  /// # Examples
> > > 
> > 
> > I can't "drop" anything here as that would be a mess.
> 
> It's the DMA commit that has a bug, that was revealed by the fix in the
> driver-core tree. So, the patch to drop is in the rust tree (not sure if Miguel
> changes history at this point though).
> 
> Anyways, I think the fix is simple enough.
> 
> > Maybe we just
> > consider a merge of the driver core and rust trees at this point in time
> > and fix things up and do a combined pull request to Linus so he doesn't
> > have to deal with the fixups?
> 
> I think it's not that bad, the full diff for the conflicts between driver-core
> and rust is:
> 
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 9d00f9c49f47..18de693c4924 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -301,6 +301,10 @@ fn drop(&mut self) {
>      }
>  }
> 
> +// SAFETY: It is safe to send a `CoherentAllocation` to another thread if `T`
> +// can be send to another thread.
> +unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
> +
>  /// Reads a field of an item from an allocated region of structs.
>  ///
>  /// # Examples
> diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
> index 908acd34b8db..874c2c964afa 100644
> --- a/samples/rust/rust_dma.rs
> +++ b/samples/rust/rust_dma.rs
> @@ -4,10 +4,10 @@
>  //!
>  //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
> 
> -use kernel::{bindings, dma::CoherentAllocation, pci, prelude::*};
> +use kernel::{bindings, device::Core, dma::CoherentAllocation, pci, prelude::*, types::ARef};
> 
>  struct DmaSampleDriver {
> -    pdev: pci::Device,
> +    pdev: ARef<pci::Device>,
>      ca: CoherentAllocation<MyStruct>,
>  }
> 
> @@ -48,7 +48,7 @@ impl pci::Driver for DmaSampleDriver {
>      type IdInfo = ();
>      const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> 
> -    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
> +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
>          dev_info!(pdev.as_ref(), "Probe DMA test driver.\n");
> 
>          let ca: CoherentAllocation<MyStruct> =
> @@ -64,7 +64,7 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>
> 
>          let drvdata = KBox::new(
>              Self {
> -                pdev: pdev.clone(),
> +                pdev: pdev.into(),
>                  ca,
>              },
>              GFP_KERNEL,

Ok, let's just leave it as-is for now...

