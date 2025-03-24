Return-Path: <linux-next+bounces-5960-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1CA6DB87
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 14:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9077018856C7
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 13:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C683418FC80;
	Mon, 24 Mar 2025 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="U3cjqw75";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z1KFDmU0"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBDD54723;
	Mon, 24 Mar 2025 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742823054; cv=none; b=HoXxUg1xEQ9IWCl/DloeZ1NcYvQh5UYCUNWFpqwJLCQcit1BRqpsjYjGqvGIIzn+jqD3ufyN7mDa7FFffm8jEJ82rVm9MqOLv4xgVtj+iUHi3h6qyiyjlZ0qY/fKXfYdM5iTpzQXMwRvXJnph9pus9ka7f5WJAsj6mAvb8Xl7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742823054; c=relaxed/simple;
	bh=iuSZV+3/Cxzb/dDt5Vrh9ma5+GJYGwrRYAa1HCgavn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGQ+iY5xBLQLK41Jrq0+FfOcrW9xsmBBxYcGD2lJP8W/vl4O5A6VkHNW7sROWOi8wkH3uWMEwnz7lXjDmzVyM2wPDPfY79LmG3j3VpOC75CFKBnPWH8CfVCrJSff8koGh1kjF4e/gZ5rN6GPV8/qk4k55hC+eXhogYbD4wPMnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=U3cjqw75; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z1KFDmU0; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B81B81140189;
	Mon, 24 Mar 2025 09:30:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 24 Mar 2025 09:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1742823051; x=1742909451; bh=3DzLXGorUS
	kEIk7G679TtlPAkiBJZtMNji4xXfLEwks=; b=U3cjqw75YDCWVgoOf3dpXuZqtF
	CDShi9BZONd+dLAXhkjoPqRJolrrdHBKBY4SbOxr/G7l24u2XIZM3gHuwMMRzgl1
	8cd/OtfP6viUcnRr/HqaeukdlmMiLj/zP9T6sX3tmyzQWqg71zdYobIcv85kzlJB
	w4oGb99WXN3Jjw66k/h5joOJQjBp791iKFNUtjdxMot/miH/5umSSuJI/alYHO9F
	T6sLKL0TQrNYJH+i0UtuN0fck58+cSK+MyNUZ9SjR+DAKZfcP8MuxCagRG19vCxn
	GBt/x0ekN17W+4cTtfcHg8LJyvywhSXiKRFMYg+tFzqnRt/I7hmosC+PfBLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1742823051; x=1742909451; bh=3DzLXGorUSkEIk7G679TtlPAkiBJZtMNji4
	xXfLEwks=; b=Z1KFDmU07h56toJ2eLcKfdv9yU54X720HCjP3MOvrYsQJWpffQt
	8XqzCtBTPOe30AMGt5al2zftU95pe4C1AOhPz1nZf4KIHI2vi9eGZz67ox9TSgrs
	PGNZ1H0QnfQcNhp+9HX/NeJtPQf6oFvOxABCpi3MUm4QPYKTahGqDFz4Cr6NlMyN
	I8VLNcCpMxH8NeGdJCIvV+OaIwvKfDSAVQjS/W5f02FlBDDPFjQCUg9I2U7BUq9f
	2JPkGHQ9ttkeYhW6tvBVIXXhZdp7jVqp1fyPhpF3WQ7roD9LTD12vTTcUbNXo4GL
	3c58QEg4vVuBG2FuE3gnz5aCwJY9v2D2GdQ==
X-ME-Sender: <xms:i17hZxcK5MeCnUMRDy_UtkcTfnaiRUhlVcSEiSTLhAyzSyODho0peg>
    <xme:i17hZ_MRU4Tmqc4xIUT6frTaCntq3gHsbVuySm-7azGN-W9zY76mvzPu4edr1o6lX
    RCKrA9mb3Db3Q>
X-ME-Received: <xmr:i17hZ6hO4zZFlMZQ-IQHZfdIwOR3vVMdRCOT48_tnybXqOmtsJ6jIU65gPvc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelledtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:i17hZ6_ZNg9HAQmND4LbP6636HSnDBMDDgG1ip_eA2UP_TBWs1Gz_g>
    <xmx:i17hZ9uthW2UrmPEgSmWrz3IpztKkKHOt-GxHMSK9RlkoUh7ZuJgGA>
    <xmx:i17hZ5Fk6GyQIom0DaJhgUw5YI4CB38Z8AV2BfTngP9zCZKoFebeNQ>
    <xmx:i17hZ0Oplg-hVnK-NtiDQ-vvun6umxC7OJh6GaNuAA9jTCxm4rk85w>
    <xmx:i17hZ-ls71G57an3UHF767YMKaseCN3S8PB1DWO8epfllI7elUfMB-pS>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 09:30:51 -0400 (EDT)
Date: Mon, 24 Mar 2025 06:29:30 -0700
From: Greg KH <greg@kroah.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <2025032443-recharger-legacy-93bf@gregkh>
References: <20250324215702.1515ba92@canb.auug.org.au>
 <20250324220629.1665236b@canb.auug.org.au>
 <Z-FJH628-j2HCuaE@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-FJH628-j2HCuaE@cassiopeiae>

On Mon, Mar 24, 2025 at 12:59:27PM +0100, Danilo Krummrich wrote:
> Hi Stephen,
> 
> On Mon, Mar 24, 2025 at 10:06:29PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Mon, 24 Mar 2025 21:57:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the rust tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > error[E0277]: `*mut MyStruct` cannot be sent between threads safely
> > >   --> samples/rust/rust_dma.rs:47:22  
> > >    |
> > > 47 | impl pci::Driver for DmaSampleDriver {
> > >    |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be sent between threads safely
> > >    |
> > >    = help: within `DmaSampleDriver`, the trait `Send` is not implemented for `*mut MyStruct`, which is required by `DmaSampleDriver: Send`
> > > note: required because it appears within the type `CoherentAllocation<MyStruct>`
> > >   --> rust/kernel/dma.rs:132:12  
> > > note: required because it appears within the type `DmaSampleDriver`
> > >   --> samples/rust/rust_dma.rs:9:8  
> > >    |
> > > 9  | struct DmaSampleDriver {
> > >    |        ^^^^^^^^^^^^^^^
> > > note: required by a bound in `kernel::pci::Driver`
> > >   --> rust/kernel/pci.rs:225:1  
> > > 
> > > error: aborting due to 1 previous error
> > > 
> > > For more information about this error, try `rustc --explain E0277`.
> > > 
> > > I have no idea what caused this - it built in next-20250321, but that
> > > no longer builds, so I have reset to the version of the rust tree in
> > > next-20250320 (commit 4a47eec07be6).
> > 
> > Actually, the driver-core tree gained these commits over the weekend:
> > 
> >   51d0de7596a4 ("rust: platform: require Send for Driver trait implementers")
> >   935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
> >   455943aa187f ("rust: platform: impl Send + Sync for platform::Device")
> >   e2942bb4e629 ("rust: pci: impl Send + Sync for pci::Device")
> > 
> > A heads up would have been nice ... and maybe even a test merge and
> > build against -next (given how late we are in the cycle).
> 
> Commit 935e1d90bf6f ("rust: pci: require Send for Driver trait implementers")
> from the driver-core tree fixes a missing concurrency requirement, which commit
> 9901addae63b ("samples: rust: add Rust dma test sample driver") from the Rust
> tree did not yet consider.
> 
> Technically, it did what it is supposed to do -- catch a concurrency issue at
> compile time. However, since I was involved into both sides, I could have
> thought of this, but unfortunately in this case it was too subtle for me to
> spot -- sorry.
> 
> There are two options, 1. simply drop the commit [1] that introduces the
> affected sample DMA code, or 2. apply the fix below to [2]. My preference would
> be (2).
> 
> --
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
> 

I can't "drop" anything here as that would be a mess.  Maybe we just
consider a merge of the driver core and rust trees at this point in time
and fix things up and do a combined pull request to Linus so he doesn't
have to deal with the fixups?

thanks,

greg k-h

