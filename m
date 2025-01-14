Return-Path: <linux-next+bounces-5197-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE6A10149
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 08:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D26F1885D48
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 07:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7FE23497C;
	Tue, 14 Jan 2025 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="IcnLd75h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YqiAQBq0"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771F21B4159;
	Tue, 14 Jan 2025 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736839785; cv=none; b=N8vAH37tvZ42NcWrMfFNC88rOhXAn0mks1Vfbulxlwwo7+elsd2H3fIBrW+IjeZ6Kmut3EbdsBUG2oxtrccMbzBn7UuA+o62n3u/dSMlqtqAQRtMkyEzpL/Es+0QpemVXYiQYB3jssTamwDBm+IukcuotRA3VyhcG7ZX4dYJNAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736839785; c=relaxed/simple;
	bh=3MbqXC5olYaC3RtC7bYnHgrh5PhTCyKgfax6CzzqVAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za0uxEFkN6xZpGzcQAHay5xMfmHli4pXRg+y/p1fVvdV6TGI0ztAJEOsu3uXG5ThBRrPmiBK1G2+hXyUaMsPP5ONyYDpD8H7S7G2zh8/qvhu1fHlNSxR1xO5SLLMw6Z+0DftWgtXu7wrvWLKGqDmPUc2YeIYnS4+Ypk+hRTuDDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=IcnLd75h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YqiAQBq0; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 27C5B1140149;
	Tue, 14 Jan 2025 02:29:41 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 14 Jan 2025 02:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736839780; x=1736926180; bh=Y16vyStq4b
	tvpRXKSmBnr2UJgfOZ1o27aQRNACCgt5E=; b=IcnLd75hpDY7xhvi0fJT2uG2/P
	kiYbq+ooz6bziJsikNH6FB7H6U1MmlaAXPsxsVDvyXGvSepAr0HuYFwj3yU5aXgu
	zfSUEqOx6/5J21K79GMEIB0hfOqIMK7WXV3ZkgBJbI6X5Ki19Vriessi3yL72brw
	Qsybs4Js3484WS0ujv46FztlXZASmWqj1YJKQFX5T/aDG7roxWOmorxfj957SGBR
	AgUBTBgc34TRy5jTJFnqD5hQHiErk09XEfcPrIVTMh4bGj5jPyfYdK3xEMHJr79t
	hXVwsgPGRj0Kd20f7ercs+1xUpQrlubHWsplTsNc/XOYokCJphnlVOIAqrFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736839780; x=1736926180; bh=Y16vyStq4btvpRXKSmBnr2UJgfOZ1o27aQR
	NACCgt5E=; b=YqiAQBq0nY5mCVXu5LI7+yvdI4Jp6EBISPUEx7nSbCZ5tks4s7w
	xPEzFFFZB8sJ3ndBbJl4RoHbS8iNvdgPUvdj8BbrMrGtUAJocjloUakGazOaY/JF
	+LfY2FgZYxIkZ6YUJhtcbA0ypyWf3H6q5I8V2d+s5gDJgJKiEPVfbU6LGSKh46bV
	m+FjKhP66TwtvQxS5gQGtGghbUTHpray67Drrtd3alTq0GZXP6lAqSqIur8tafmf
	z5hQACP5MV+xoPkixmLZY/YZTjvzIfaoyjtMij5bpv9y6h0At25EkLz2Md0r6G52
	bt3S0CAcnWGSu61hi3mBLiWvCcPIBlvElZQ==
X-ME-Sender: <xms:YxKGZ1prEpl0EBX_Rk8DrijHIzHaeGlssvXye4FdHIVUz_WBBVZFIQ>
    <xme:YxKGZ3qtOATvTk9FIKCe4p_VemzegTLyKqFsqYyelnPo7NA73jO8dwAfkqV27qAaN
    Az2U2YogGNbpQ>
X-ME-Received: <xmr:YxKGZyPR1WcviEwNMf6URuTcJ1UATmypxp1vNKD2MxGk23Pndx41rsZ0NY-9pvpoj14O_pnOrUXaOP2EqhXfTK88FQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehhedguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhioh
    hnrdhorhhgpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhr
    tghpthhtohepsghrvghnuggrnhhhihhgghhinhhssehgohhoghhlvgdrtghomhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:YxKGZw7qFrvNY9gZZC0boJUdMwCzdo7_tLTHBY_CGwYiDWRGgHgvjA>
    <xmx:YxKGZ04ANmTM39siwJy-H0PTWu98rkbpm4ggCepdG_lp9DLpMlgEkg>
    <xmx:YxKGZ4jREpzXAb93GoSlv8G9_U8AUsKipqvaenPlrDMDqFqBjBxjwA>
    <xmx:YxKGZ274QOjjJLlQrRkAhOrgoGCo2PGc4kVPOBLc5uTnmW2Yo8FKaQ>
    <xmx:ZBKGZxxCddHAJr5ZzhNqNNvYF7WgAh6wTw9d1KK0u2HNBuXw5CrSH0ma>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 02:29:39 -0500 (EST)
Date: Tue, 14 Jan 2025 08:28:46 +0100
From: Greg KH <greg@kroah.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Brendan Higgins <brendanhiggins@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kunit-next tree
Message-ID: <2025011416-kindle-habitant-b367@gregkh>
References: <20250113152511.4f7f382b@canb.auug.org.au>
 <2025011331-chef-unwired-e143@gregkh>
 <5e7eda18-6a1d-4008-bc6c-c3b59c27cc9e@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e7eda18-6a1d-4008-bc6c-c3b59c27cc9e@linuxfoundation.org>

On Mon, Jan 13, 2025 at 03:45:34PM -0700, Shuah Khan wrote:
> On 1/12/25 22:21, Greg KH wrote:
> > On Mon, Jan 13, 2025 at 03:25:11PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > The following commit is also in the driver-core tree as a different commit
> > > (but the same patch):
> > > 
> > >    875aec2357cd ("kunit: platform: Resolve 'struct completion' warning")
> > > 
> > > This is commit
> > > 
> > >    7687c66c18c6 ("kunit: platform: Resolve 'struct completion' warning")
> > > 
> > > in the driver-core tree.
> > 
> > Thanks for letting me know.  Ugh, so many duplicates this development
> > cycle, probably due to delays in the holiday season...
> > 
> > sorry,
> > 
> > greg k-h
> 
> Greg,
> 
> I can drop this patch if it is better for this to go through
> driver-core.

I can't rebase my tree, so if you can drop it, that's ok with me
otherwise it's fine to leave the duplicate in there, your call.

thanks,

greg k-h

