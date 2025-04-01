Return-Path: <linux-next+bounces-6129-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691D9A77585
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 09:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 662323AB46B
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 07:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610981E9B3B;
	Tue,  1 Apr 2025 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="qzPej9P0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YC7CEe3x"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4FC1E9B32;
	Tue,  1 Apr 2025 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493467; cv=none; b=WYDw/QFaCWwJ0NO9yPvEHXnaubidiD6ZIO/16xlkh5O+cksvCJz9MLg3lqv514wcu2p2yFEqw28DXDtUKElE2irhuBttNcqe6UubxX6mGqX90eQKLfZADdvt+5+Hu6zR8WWHmh6OqbvxEmeFACGb82GCRkWkX8k9G/U/0jwIB8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493467; c=relaxed/simple;
	bh=AmmDVvNi5dUbIT7C5bbti693/xc8nSbVjPiErpkXIaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMDVuWeNSh8btTuohYfdd0vAJ4l1hQkHVRHX0uF/jyzyLoe7eYRec9UJRUorTmJ/LnDbipN+KQfqP5CQnvratEGmVlU+tu6w5WPit9PJ1X5zWzxQjpUBp4GDaS4J4oEQlEwV32liPyYkKS9bQdTCgdG9cq8ynKcQhrPV483cZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=qzPej9P0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YC7CEe3x; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B731F1382D13;
	Tue,  1 Apr 2025 03:44:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 01 Apr 2025 03:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1743493463; x=1743579863; bh=N3XLkCWVDT
	ZLVCH6BsDAQxYTNal1m2sMxq815aRphRI=; b=qzPej9P0Cpjf6qLjB/9fUndGFZ
	F3VNEm3hbSvecuLfg9odO2CLwy/3HbmsIrAodrRIBR+eiREukEZFlFaF4TPhCV+Y
	nQsO1rwP5Bc4fwg7c77T1ZMdCV861HpfN5XzTKW8tsciprl61oWpHmVw2axMjMos
	KcHcKlyEEnf0QDJHbXaZeNHI4t3L/zf5XTj/OTbC/ArG0gyxPmxI5TnUCCz2pqEG
	9TIGvad3bhWCgedZLvOM4zTLJBw9yFInnsJdHiEQLhNRfudIhxWzj8FzdzeYwKWp
	WTAU1Llc+gQUccXYQrECx3fyCmIFovSD7JjVw6rtsmfx+jgFe5vfwlFoT7dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743493463; x=1743579863; bh=N3XLkCWVDTZLVCH6BsDAQxYTNal1m2sMxq8
	15aRphRI=; b=YC7CEe3xYPPfyWxJQGzpE/SeuxkPW7cLjwM8kuQ466RrpXZeIcz
	blqnekVw8yMI7nZZti5UYEANCVyzPbZs4Fi8bFZzGKJtZqSd07Bp5Qzu1Y77eMtb
	ZyYs9JI5dk/wXs1p59CHg9FaJiaQUjLhDCFTTh2QWgp/vA5hV3yW2CXbCeGUtncQ
	iwTILdC88FynRKwf6DWh1u3ytAkZYw80mbD5zGyjZxKHr+xvNa3+8/lobaDkkIaD
	7NP0mBHG2h28ULCeTRqxn3TSw88f10DC41pMfucJhxS5qIDRQIv6NT58VT4kPDbN
	wJaKi2ERBisY/BcEXSEAsS5zfylikWdiwuQ==
X-ME-Sender: <xms:VpnrZ-Q5G0zN6nkPZpwkxhfKnpz38cisloQiG7Ex9shXPcsd7A013Q>
    <xme:VpnrZzyawDvhhWSGIA5REmTgiL51c-iGYytapGFUdjK43anqKuWbyTleBn0S5Vq3K
    OCPfoBcRnF2AQ>
X-ME-Received: <xmr:VpnrZ73rQ6rDy_KJviwtnjF5GGLDTWfoB9dZtmdVoql-0jXf3QyPW80_Y5i5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggs
    ughivghlrdhjrghnuhhlghhuvgesghhmrghilhdrtghomhdprhgtphhtthhopegurghkrh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:VpnrZ6CZ1gE5M17iV3Xe5klEyQmkXBk6Gt5buKD5FTQTCeWwgzh9VA>
    <xmx:VpnrZ3jtKDLZmImLRHBHTc5sjmUR_wNCZqTirgTOWj4FRgmlu4WF6w>
    <xmx:VpnrZ2qITZxwSpCG59LkWy5mbFyffMM_PB0YEct3MHbySen1vu-NJw>
    <xmx:VpnrZ6ji51Vy9Jz8LFjcCngH37v3qW1gqw85U1VIwYyTdB4XCduidg>
    <xmx:V5nrZwbdcfqM5NPRgylc6NdK0ri3GtYuMfegh1lG73xPONpzlf0dLxb8>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Apr 2025 03:44:22 -0400 (EDT)
Date: Tue, 1 Apr 2025 08:42:57 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <2025040140-postage-upchuck-34cd@gregkh>
References: <20250321185630.566dc075@canb.auug.org.au>
 <20250401142159.6f468edf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401142159.6f468edf@canb.auug.org.au>

On Tue, Apr 01, 2025 at 02:21:59PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 21 Mar 2025 18:56:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the rust tree got a semantic conflict in:
> > 
> >   samples/rust/rust_dma.rs
> > 
> > between commit:
> > 
> >   7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")
> > 
> > from the driver-core tree and commit:
> > 
> >   9901addae63b ("samples: rust: add Rust dma test sample driver")
> > 
> > from the rust tree.
> > 
> > I fixed it up (I applied the following supplied resolution, thanks Danilo)
> > and can carry the fix as necessary. This is now fixed as far as linux-next
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 21 Mar 2025 18:21:27 +1100
> > Subject: [PATCH] fix up for "samples: rust: add Rust dma test sample driver"
> > 
> > interacting with commit
> > 
> >   7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")
> > 
> > from the driver-core tree.
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  samples/rust/rust_dma.rs | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
> > index 908acd34b8db..874c2c964afa 100644
> > --- a/samples/rust/rust_dma.rs
> > +++ b/samples/rust/rust_dma.rs
> > @@ -4,10 +4,10 @@
> >  //!
> >  //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
> >  
> > -use kernel::{bindings, dma::CoherentAllocation, pci, prelude::*};
> > +use kernel::{bindings, device::Core, dma::CoherentAllocation, pci, prelude::*, types::ARef};
> >  
> >  struct DmaSampleDriver {
> > -    pdev: pci::Device,
> > +    pdev: ARef<pci::Device>,
> >      ca: CoherentAllocation<MyStruct>,
> >  }
> >  
> > @@ -48,7 +48,7 @@ impl pci::Driver for DmaSampleDriver {
> >      type IdInfo = ();
> >      const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> >  
> > -    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
> > +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
> >          dev_info!(pdev.as_ref(), "Probe DMA test driver.\n");
> >  
> >          let ca: CoherentAllocation<MyStruct> =
> > @@ -64,7 +64,7 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>
> >  
> >          let drvdata = KBox::new(
> >              Self {
> > -                pdev: pdev.clone(),
> > +                pdev: pdev.into(),
> >                  ca,
> >              },
> >              GFP_KERNEL,
> > -- 
> > 2.45.2
> 
> This is now a conflict between the driver-core tree and Linus' tree.

Thanks, I've sent the pull request to Linus right after the rust one,
and warned him about this conflict.

greg k-h

