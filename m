Return-Path: <linux-next+bounces-8655-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF83BEF5B4
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 07:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 512ED4E3F7B
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 05:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B0F1AF0AF;
	Mon, 20 Oct 2025 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="cvzJhaAZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HQo88CYU"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03F813C3CD;
	Mon, 20 Oct 2025 05:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760938222; cv=none; b=uKRDTKoSQ1s/CkV63F+i3OiacvithFUw5qiOYJdDTn40kTgWArEB51vTyOW8hdThz5Xp+gM0ZIBUTe6FbxTuO9mbWX921lr/bnyNLB/tYljwXcJyZuYgY6BtuDF5rlkd46NObpqPmfeNdtgTsWbP0K4gyHnfD768+oERxNVX2FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760938222; c=relaxed/simple;
	bh=NWKUxbwt8HmWD++CKifDPDDHs6RMSDbCXXqtH5FHFqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+yFeOF+O0OxasmOT/wQg3j9GbXBrUlHkQfV3pMfRt1aUczpQI8H56IUHrdg2/T4KOF4Qs+QWy6DBrIlLEq3e3PyFhGRcsE8PFaH5XyEACZhP5wNHdqsnExOv5kemGUqEE43NMc6XBHEMrt3ShwoggOsqz4ryJGNCLV3xJPoGm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=cvzJhaAZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HQo88CYU; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id DE6B71D000AE;
	Mon, 20 Oct 2025 01:30:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 20 Oct 2025 01:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1760938216;
	 x=1761024616; bh=u4Mv/Exk14ZBWX6rI5+kIxm/qxG6nhLlaiPrh8KfoJE=; b=
	cvzJhaAZ6jjZUHMM1qseULeK+1th6SZVW9ZRgmCUKqc8WOXv4ys9sS3E/ftLUb+n
	rKdSIwwZd3hzj/BuDGJP92SIXExYIfonjsP8szNvkd/7lmFeUJxIywpHtEGV2rCZ
	pua2ANvb4H+MsR+qqiDapd2GpNNZdbYnBXIE6J0VyRqsVNOFWTJBi8X8vRzccRGu
	GRVdsFGRNfAuoGVHfWT5qSJizjLFnUA5xd5fhHEP+W24vcXeCgxvGu8jsJhGwz6h
	P1bbfrBc5tDJt/zbqN3vpckF7PSKdxzzUlTSvusY48iNaPZCFP5kwbSUMaNv823I
	X0zhlGg5/PKJdWsXD+gliQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760938216; x=
	1761024616; bh=u4Mv/Exk14ZBWX6rI5+kIxm/qxG6nhLlaiPrh8KfoJE=; b=H
	Qo88CYUkd7YC6amoWFY/k/TvkF5C7fO56fHG42Nc5ieA2xO+TeetKAUz5YW/cDFL
	VIAZC0Db5q+qRpNPAIQaVrpNt8KE08fMLRhPI62mtjJTfv+T8J6vIliNivrhREJO
	GOOZ6HKqURzItx3fFY8CLFDglWrb+6SxtieQ5r6bBB6BbTN4els2kR4sGoOHSUMx
	u81jbXI0dZ4Vk/tzHRFINn38yX9Gu7j0Sg7viwSTWvvKwgbjOcSikosvX86U3dlv
	0pq3wJrXNghhjzsfJhw8fsFnklHtm7uCULiu1OrpGy31C5g2DwgdZzId4D7o9SIJ
	u6ophKE93p/+YN/Fb2vWA==
X-ME-Sender: <xms:58j1aL2__-0sfP6-XF0Cw3x0fjTIQvbJHc9Wx7xEhhymXm-hUDK5Rw>
    <xme:58j1aPS45PQ26tMEC8ZVBP26MRObiz2PW5XHU3rtpooC2VWHVAaT9Jn11-atH9UB4
    tnLRsRP-IK61HKgdiG6q9nAj-HveyyZECYdCched-RKDDQR>
X-ME-Received: <xmr:58j1aPR_6PvI3hHAcsQOr-oHr5TQuswr_VolOHPCleY_pEvZ-anhBXpGMy1fwvCagr-x5EJ2PghufNt-8ujpuWHzOrxe2j2JcQ1uVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddufeeileekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefgkeffie
    efieevkeelteejvdetvddtledugfdvhfetjeejieduledtfefffedvieenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomhdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohep
    ohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrd
    guvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:58j1aAXyAVB4qFIq6VHmYcaMDGpm05_eIWe79MQ9NoGcqq3GAe4eFw>
    <xmx:58j1aJIdXCV8jPQSNuFqQhs_mWkYkFVghv-t7CWVz5lT9TwXKmEp2g>
    <xmx:58j1aBhDQsq-8q85sypxsw23ZdyPDIKw0lFsS7oPY-pii_AQJWb-5A>
    <xmx:58j1aGKyWZPOzW9deS9nzJ8NTO4B8RR7Ub4RYA2P13YFbliEE6RHAg>
    <xmx:6Mj1aKEJoaBF5s4k-nmDCVrQAxocz-2e_Dkbo7RW_g6y_qLFWXskE-p8>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Oct 2025 01:30:15 -0400 (EDT)
Date: Mon, 20 Oct 2025 07:30:13 +0200
From: Greg KH <greg@kroah.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the rust tree
Message-ID: <2025102057-wolverine-morbidly-7f51@gregkh>
References: <20251020123907.13e15922@canb.auug.org.au>
 <CANiq72kHWgsvmxPYSAHpM5HaxCSf73t4NkPsBRXiPMTTe_u51w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kHWgsvmxPYSAHpM5HaxCSf73t4NkPsBRXiPMTTe_u51w@mail.gmail.com>

On Mon, Oct 20, 2025 at 04:14:31AM +0200, Miguel Ojeda wrote:
> On Mon, Oct 20, 2025 at 3:39 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > The following commit is also in the char-misc.curent tree as a different
> > commit (but the same patch):
> >
> >   abae8f3c8374 ("[TEMPORARY] rust_binder: clean `clippy::mem_replace_with_default` warning")
> >
> > This is commit
> >
> >   7e69a24b6b35 ("rust_binder: clean `clippy::mem_replace_with_default` warning")
> >
> > in the char-misc.current tree.
> 
> Yeah, I added it at the top to be able to have the `rust-next`
> Clippy-clean, but I don't plan to submit it.
> 
> Since you detect them, I will remove it to avoid confusion.
> 
> Greg: it would be nice to get that one submitted to Linus during the
> -rcs, rather than the next merge window.

Yes, will send those fixes to Linus for the next -rc release, sorry for
the delay.

greg k-h

