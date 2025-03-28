Return-Path: <linux-next+bounces-6061-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8591EA74602
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 10:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFF223A7DB3
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 09:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEDD21146F;
	Fri, 28 Mar 2025 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="cW5MKlNV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FoTlAOFw"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B281017A316;
	Fri, 28 Mar 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152961; cv=none; b=hQULlZFFvZtjjfZq/GtAAiN7+Getayi8bBuwmCRzS0VW6y4a5xFYKeuokOofvBLo/y42vcG6JQJjMUhsd+kTIl/x57iFAfE10+gLLtHb0qUaOXYzW6IjbYNvm9oLHuLfjPkGLJPFhXh93ucKCuk306XYSMCazWhrJ7UtRoJ3R6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152961; c=relaxed/simple;
	bh=BR7g0ASu/yNnK7nf2Wmiz/XplJmovql7aejjne0v12E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDVKkSyOOum6KsWUd1tr1FIXv82w+cSROeC3/Kmx+z/kOyu7+jYDZybgkXIiRUPWW/BMWgcLcmJf1QMdvf3GBDZgvlqXtlswHl2SQ7u/Ada5GBaL7s9aLd4xy8KMpb/s36VJRtvpvtgtF6nf8t8oi54Gtpu6KlwPuka5ykHqgV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=cW5MKlNV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FoTlAOFw; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 8F5CB11401E9;
	Fri, 28 Mar 2025 05:09:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 28 Mar 2025 05:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1743152957; x=
	1743239357; bh=Xu/X6uaYeOMXkYkFaH0iBKWJnV5EiwN6Wkgd8vdiNeM=; b=c
	W5MKlNVy6JqekUAI+22RaQDlWbPdqtZEry8CaAaf6f4o8B3LFwxuO+biaIE+Mj1c
	vuXhuyKKeB8YJ9ccRYat+CVBAH7Z1TWDY/anevQ+YzKrkznIx3wvnSWH7vx7Uqjp
	EWaNpgKVc0L04sjHfVdvFID67S09f8SeBqpqgGSiQYTjf7++Ydrv8amLy+AG6cKl
	J4Ksr0Rekx5guOVwS26TTjSYVVUp2G3B9TMio6b4YA0Kx799OCy41FOh1tPUytEe
	Y1S2W2eoQtwjpJNRfsKafYzxrpTsTAV2fhx/TmK8FPN6BVH07S8KDU3+C+vEo8M0
	Fa73ARrA/LPelm8nDR00w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743152957; x=1743239357; bh=Xu/X6uaYeOMXkYkFaH0iBKWJnV5EiwN6Wkg
	d8vdiNeM=; b=FoTlAOFwgGPfZ1agdSR4KgEBTmRQz5DjOya8zA9bu0+5O+V+RKF
	4hd+ZicJGjB4S02gbN9vQCUSY4bZ6fwidgkmwD3WHGSvOyF0ZLwTx+C9vGeikm4T
	F6LssuAAYjO8aispMxxxQyFZeqsvcYR4Xw5IrKiScKNjVwS8DC9raRHqliAfKkEP
	RwSf78svX+PcGq3AiekaAZXUqrDREHWxv3DWAG6Tv6mCJL1/6qJ5IOXFoBNQTQEo
	XNuFeCas9uoYzeOoeGESz+KR8yOFFAyCvrkzi0SnE5PznIEVwh6fmTCJCQiVK0Q7
	eCQjCOvzPXDBShVRce1pF5r8Lmu6T5bgciw==
X-ME-Sender: <xms:PGfmZ8sJnBJ8tMCj-8Y5xDkSGRJg0pvZ8LKFMeygCclWAHNmGd2yUA>
    <xme:PGfmZ5epVnYtKtOXqEBURG1scGYVF2hgbfLJhrCjDi2FReeMi23r0oI_zJo5nH1wi
    Q3So7KNqAsNZ0P12o8>
X-ME-Received: <xmr:PGfmZ3w32H_0GrU1jj7pAYyDXNtkgn4tTjncoONZwBAG7hiHOQ7R3JJXUoLZdoyyWS9HOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeffvdevueetudfh
    hfffveelhfetfeevveekleevjeduudevvdduvdelteduvefhkeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghm
    ohhvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepkhhi
    rhhilhhlrdhshhhuthgvmhhovheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtth
    hopehthhhomhgrshdrlhgvnhgurggtkhihsegrmhgurdgtohhmpdhrtghpthhtohepshhr
    rghithhhrghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrih
    drtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehjphhoihhmsghovgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrug
    gssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PGfmZ_NzHKQn73jmOFCtriczZAMEEsIQ1_m118UDFIOnkVUosiysPg>
    <xmx:PGfmZ890kUpGQWcUWj3MF4eDUOed_ldFlFeVly77CRmfrdELCgf6ww>
    <xmx:PGfmZ3VSmyAvwQ1WwD0ffAxFo33_KmfCWQwMZyIq72GvMrU3dup4HQ>
    <xmx:PGfmZ1fLsFrc5KJxaZdQ5Q3ckrt3PPV4BJJspvq-k9v4JORHULGEIA>
    <xmx:PWfmZ3XsrvlOMCxtaw14ZgGWeshDa2p8nHeHtVS9IIYT2RToyfnLw9gO>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Mar 2025 05:09:12 -0400 (EDT)
Date: Fri, 28 Mar 2025 11:09:08 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Aithal, Srikanth" <sraithal@amd.com>, 
	Jason Baron <jbaron@akamai.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
 <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home>
 <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>

On Fri, Mar 28, 2025 at 10:28:19AM +0200, Kirill A. Shutemov wrote:
> On Thu, Mar 27, 2025 at 07:39:22PM +0200, Kirill A. Shutemov wrote:
> > On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
> > > On Thu, 27 Mar 2025 16:43:43 +0200
> > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> > > 
> > > > > > The only option I see so far is to drop static branch from this path.
> > > > > > 
> > > > > > But I am not sure if it the only case were we use static branch from CPU
> > > > > > hotplug callbacks.
> > > > > > 
> > > > > > Any other ideas?  
> > > > > 
> > > > > 
> > > > > Hmmm, didn't take too close a look here, but there is the
> > > > > static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> > > > > the caller may or may not have the cpu_hotplug lock?  
> > > > 
> > > > Yes. This is generic page alloc path and it can be called with and without
> > > > the lock.
> > > 
> > > Note, it's not the static_branch that is an issue, it's enabling/disabling
> > > the static branch that is. Changing a static branch takes a bit of work as
> > > it does modify the kernel text.
> > > 
> > > Is it possible to delay the update via a workqueue?
> > 
> > Ah. Good point. Should work. I'll give it try.
> 
> The patch below fixes problem for me.

Ah. No, it won't work. We can get there before workqueues are initialized:
mm_core_init() is called before workqueue_init_early().

We cannot queue a work. :/

Steven, any other ideas?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

