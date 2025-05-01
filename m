Return-Path: <linux-next+bounces-6492-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D5EAA5FD2
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 16:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53C594C4F55
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 14:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABED1F1500;
	Thu,  1 May 2025 14:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Ytmw572H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k5Ke2eFl"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE6B1BF37;
	Thu,  1 May 2025 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109253; cv=none; b=NFXfa1t+9cY2SmRMug5TTx9cf+Q5viTe2zQZphOuItrP4bI121Lf6gP+xhIbr7X0pSikklEKIno72t/dH1tIxAwEK15YKefL6dbZLkWQ+crWzjcbv9HhLrcZDfhiqRjZrln0bPbMFxHHtbcwDzr+OZfFIj3rW/FF7btUl9zOK2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109253; c=relaxed/simple;
	bh=KvCQaG6SXcjN51v7sqzkLXuhokWPF1pgINLmHlDkT2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghVrwaqqKJVicgy0FR8eEnzZzazV7KK5vS7cKh4UUS6j1xohtKKHf0l56YsQITQjCUDI0X38nZSbD5F5owi/QE6muZ12Qc6MkcNK6HgxwBCHFUl0+RrdgJudoe4U7FSQmuuKdPpQa7YGCoNsHQRv86ZqBteniYe+o7NBzhUc5Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Ytmw572H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k5Ke2eFl; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 9F0AE1380F0D;
	Thu,  1 May 2025 10:20:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 01 May 2025 10:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1746109248; x=1746195648; bh=sWUpFpV0cU
	jOY0J+pA8Gz2LLb6VfCRxxOB4lV+SwTGo=; b=Ytmw572HxSZeqwFN573xM+FQS0
	xHJLZIUscRytb0/ENI8luv5DYr0x9fA77Zss080QY2iXML39SoBIn79nmGLOQwKR
	YBooj5IAGhQhscdy6cU4nEfFr3DoXp70ArT5TaYrOB99R+upsNunIy5ChaC1x1mr
	9CjiTzjFoD0vlP4qQHs6+3uXnMAPjWDhw1vgGz+6iulk1a8dEs+asioblyxx7U3a
	XwTpjdopUckpIbmU4h3FrIxW93w3MjToa4i3CAirhqhJu9ip49eZ0RYxQw2Oa+6f
	9+mJnZJprFcIi8aH/RTmmpXdztr4Q6KZrvFcWpihdnBv0BgkMrQ1lETDbQsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746109248; x=1746195648; bh=sWUpFpV0cUjOY0J+pA8Gz2LLb6VfCRxxOB4
	lV+SwTGo=; b=k5Ke2eFlhYVcqvH0iCca0h/h6sT0W8OQ+eBYN1jyfJrf0EgM3Bk
	mpOtmnJ8Uu8MVj/DkymJC567s0cKznkphLjUzRwP29Lw1xmT2XFave0BGYJ3RSpf
	p8wqdeqUAgApKy5LRwP6iw+EozE4+xYH8ornCi6sCdfhQTzdZnq6edKn5WVSkJ+Z
	YPtuPK8E/WX96+4RGWtZGlTJKAmTQOqOgLDmpCGdfTs6Tupj/ozdOH+XD1vAfc0e
	nJNMpGaMRWLcETIkTNWkqe9XYDUj3QoXijpr5uAzjO0YRF3KeBTveSItb9cHmkDE
	MM7zPRYLtM9Foom1QL4472nx9DqEfSrkzSA==
X-ME-Sender: <xms:P4MTaEGQgL1REaEYHcjuUSCDkgI3T60xfq7SfjLJpBnUphp0E1gLnQ>
    <xme:P4MTaNXtOdMGVmYMiS4-NFWmiZQyGfmtXqxqn7NRtldnefZrQXBEnBpcgD_KjQZ0r
    UQY63UQKpbFEw>
X-ME-Received: <xmr:P4MTaOL5E-nHpLjIfJIgZOY6v7ru5CDzxwIrIo4kRHhUq1c9wI2PicKcfqRSuVYqUjxbgHLCYzjeSAXZwoKNJy2OBodmsUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheptggrshgtrghrughosehighgrlhhirgdrtghomh
    dprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthho
    pegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:P4MTaGHdPc1MlcoDGX2bwWHiJh0L91Cj4A9RELP6cTylDtNwvkRH9w>
    <xmx:P4MTaKUs7GehgEvLpgykYm9TtfjB5fbx27LOkH3uTLcXsWH1n-skWA>
    <xmx:P4MTaJPcrS7ALkUhjnRhyAodB-Z8TeoBKPRvUMmOXTQm_8WjIGuBRw>
    <xmx:P4MTaB2OVFhB-XjNlDDDGqskrmspCnZzdelb1KEBnsMOSPmvO0C1YA>
    <xmx:QIMTaB2PCzS0GiA1z1vjob1FttY9OnIBJW2doYSOvo29ZPdOjdOQzww0>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 10:20:47 -0400 (EDT)
Date: Thu, 1 May 2025 16:20:45 +0200
From: Greg KH <greg@kroah.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <2025050120-shady-quote-c784@gregkh>
References: <20250501164501.0fc0ab68@canb.auug.org.au>
 <aBNJrYN1ThMwsLYT@quatroqueijos>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBNJrYN1ThMwsLYT@quatroqueijos>

On Thu, May 01, 2025 at 07:15:09AM -0300, Thadeu Lima de Souza Cascardo wrote:
> On Thu, May 01, 2025 at 04:45:01PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the char-misc tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > ld: warning: discarding dynamic section .glink
> > ld: warning: discarding dynamic section .plt
> > ld: linkage table error against `__kunit_do_failed_assertion'
> > ld: stubs don't match calculated size
> > ld: can not build stubs: bad value
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_minor':
> > misc_minor_kunit.c:(.text+0x180): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.text+0x1e4): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.text+0x240): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_twice':
> > misc_minor_kunit.c:(.text+0x3e8): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.text+0x458): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.text+0x4c4): more undefined references to `__kunit_do_failed_assertion' follow
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_find_minors':
> > misc_minor_kunit.c:(.text+0xb3c): undefined reference to `kunit_log_append'
> > ld: misc_minor_kunit.c:(.text+0xbac): undefined reference to `kunit_log_append'
> > ld: misc_minor_kunit.c:(.text+0xc1c): undefined reference to `kunit_log_append'
> > ld: misc_minor_kunit.c:(.text+0xc88): undefined reference to `kunit_log_append'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_name':
> > misc_minor_kunit.c:(.text+0xee4): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.text+0xf40): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.text+0xf90): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_error':
> > misc_minor_kunit.c:(.text+0x11b4): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.text+0x1210): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.text+0x1264): more undefined references to `__kunit_do_failed_assertion' follow
> > ld: drivers/misc/misc_minor_kunit.o:(.toc+0x0): undefined reference to `kunit_binary_assert_format'
> > ld: drivers/misc/misc_minor_kunit.o:(.toc+0x8): undefined reference to `kunit_fail_assert_format'
> > ld: drivers/misc/misc_minor_kunit.o:(.toc+0x10): undefined reference to `kunit_unary_assert_format'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_can_open':
> > misc_minor_kunit.c:(.init.text+0xc0): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x134): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_static_basic':
> > misc_minor_kunit.c:(.init.text+0x25c): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x2b4): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict_reverse':
> > misc_minor_kunit.c:(.init.text+0x408): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x414): undefined reference to `__kunit_abort'
> > ld: misc_minor_kunit.c:(.init.text+0x46c): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x4d8): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x530): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x590): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x5e4): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.init.text+0x63c): more undefined references to `__kunit_do_failed_assertion' follow
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict':
> > misc_minor_kunit.c:(.init.text+0x7a0): undefined reference to `__kunit_abort'
> > ld: misc_minor_kunit.c:(.init.text+0x7f8): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x85c): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_basic':
> > misc_minor_kunit.c:(.init.text+0x994): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x9ec): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision_reverse':
> > misc_minor_kunit.c:(.init.text+0xb20): undefined reference to `kunit_kmalloc_array'
> > ld: misc_minor_kunit.c:(.init.text+0xba8): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0xc00): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0xc64): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0xcc0): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision':
> > misc_minor_kunit.c:(.init.text+0xe30): undefined reference to `kunit_kmalloc_array'
> > ld: misc_minor_kunit.c:(.init.text+0xe98): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0xea4): undefined reference to `__kunit_abort'
> > ld: misc_minor_kunit.c:(.init.text+0xf04): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0xfac): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x1058): undefined reference to `__kunit_do_failed_assertion'
> > ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_only_range':
> > misc_minor_kunit.c:(.init.text+0x1174): undefined reference to `kunit_kmalloc_array'
> > ld: misc_minor_kunit.c:(.init.text+0x1200): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x1248): undefined reference to `__kunit_do_failed_assertion'
> > ld: misc_minor_kunit.c:(.init.text+0x12ec): undefined reference to `__kunit_do_failed_assertion'
> > 
> > Caused by commit
> > 
> >   20acf4dd46e4 ("char: misc: make miscdevice unit test built-in only")
> > 
> > $ grep CONFIG_KUNIT .config
> > CONFIG_KUNIT=m
> > CONFIG_KUNIT_DEBUGFS=y
> > CONFIG_KUNIT_FAULT_TEST=y
> > CONFIG_KUNIT_TEST=m
> > CONFIG_KUNIT_EXAMPLE_TEST=m
> > CONFIG_KUNIT_ALL_TESTS=m
> > CONFIG_KUNIT_DEFAULT_ENABLED=y
> > CONFIG_KUNIT_AUTORUN_ENABLED=y
> > $ grep CONFIG_TEST_MINOR .config
> > $ 
> > 
> > I have used the char-misc tree from next-20250428 again.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> This should fix it. I am sorry for still breaking all these builds. I have
> tested this with the ppc64_defconfig (though that had required me to "fix" a
> couple of warnings-turned-to-errors under arch/powerpc/). As I am trying to fix
> this quickly, I haven't checked other configs. Again, I am sorry for the trouble.
> 
> Greg, I understand this may have caused you concern about merging this. Let
> me know if you want to apply the fix below and have me submit it properly
> or if we should wait for another cycle before applying a v5 after further
> testing.

Let me revert for now and please submit after the next -rc1 is out and
more testing can happen.

thanks,

greg k-h

