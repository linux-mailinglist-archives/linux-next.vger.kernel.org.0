Return-Path: <linux-next+bounces-6483-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 166E9AA5B60
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 09:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ED7A1BA50C6
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 07:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8929264F96;
	Thu,  1 May 2025 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="dbx6B/So";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IqcIlZkN"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF4E1C5F18;
	Thu,  1 May 2025 07:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746084418; cv=none; b=BeTBpmC/wmOj8ancfxmRRMs9l5EX3fYyFW38by8v/yDvguM5YEtjimQQrGuOuApt6w3e4vmeXrqKCFGoIDhC7PltJq2MWqgD/i6C63yp8r++PSkbqtQ+SMNAqu79hWbw8kw7elFIuoiaoIxu4AfX1uZW9sTzNkiJ4hc/aTFk3jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746084418; c=relaxed/simple;
	bh=fcj+/Q5zGgxsksc0D9GAz9SDbZi8WyrwNoMU1x+Xhew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEEEKf9uvBhFMlp5+lafiaIt2/3d+VbjC8vmtIhaQH8uWv2HUC2DI49gK1+MngD6kR7BmKqa82kyxfpjlDQDxt3luNqNvTSn+8niAWJsKsqk8Vn9AlsKF3fubi+UpBDhS71f64EDwE3NvguoIPNqJQjQ4dNL147EenehRqluRMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=dbx6B/So; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IqcIlZkN; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 38D1011400AA;
	Thu,  1 May 2025 03:26:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 01 May 2025 03:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1746084412; x=1746170812; bh=W76LNGNS3h
	vL31AWYD9+djiTqQgfbDOoIsUIrg+PvUA=; b=dbx6B/SoNtQ6qk4nK4dWRH2WMI
	MfRKU5gNCb1ok7jzenNRWOBl5bGiWK8HtRnSkz6inGFQZdSOZlIPwHaT6SAXfcyY
	GFx8d5btzOu44gjH8lkuC3t8Lg21uveB/EnptREd33dWvtyhFtdN+JV1iAHKfePb
	QtRnc41K0yI5cFyuhMnyqJcdqTJGoR5lV70tOd6NKm/rpf5kZ0PmcOY+UIzCJWfd
	MYC3bFPK4NBhg9H8XSbvDjk/IH0QwRnRxYwZf4qlNglXiWP3ySBTNEYR7tCcqfZF
	l0KEGu6gTP+bwz34lw1kdRXxa3uB17JAFtYsVvVay3umrmOX0akk6CqsSc9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746084412; x=1746170812; bh=W76LNGNS3hvL31AWYD9+djiTqQgfbDOoIsU
	Irg+PvUA=; b=IqcIlZkNTWvlGeFUHjIbon5PSZ2vmruLW/jSYFxmKqu0wsEK8UG
	AryQugThg9r9FK/FOWIlZDh95BZ8+20pxyt4qmj4Bn/j3/XTGGS72QszB8kQIeU8
	UWGxvLZ5KwFL/q6M2Pc7Qu6ZJh5BNGhu24ASe9a9qzBxrq5SDXbC3nknmR+c6H5e
	3/+POjLkyp7IlP33iAoJrgGLqPrMXpH8ztwGa4xVyhi2Rw4/PLpwj+nwut45jeTk
	dyn8wcOHNqpLbV4q1jq241VRjfr9x2Uo5wZRHmPvTpbUCC1FWqX8GxWja/S4Udxc
	F6tiDXnmQzBZT3pTymJtvNm4u+cF2pnTi7w==
X-ME-Sender: <xms:OyITaK0ei2r5tnsxSGYklx6i3klQeqD6lRp_dfEUPsbnHUl2zZhBqA>
    <xme:OyITaNGZPfBtW7aabcVieJh0fqM1Vkhn6d_UeqiZmunTQ_fh9DofVA9e3XC2zSCMi
    sdW6YQlVyEtxQ>
X-ME-Received: <xmr:OyITaC6ceKQJ6p553oqxiX1oxdb_4MLd6McEiCoy5dm3hCvGqELNLunRt80xnw0n1c-z9gWlcGDgQ5-jaVZzMEnX7L6NV74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieekleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegtrghstggr
    rhguohesihhgrghlihgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:OyITaL0_94YbBCbOOy9jEwKKLEpSPXn-wolmCFO3jz85l6CilCdkig>
    <xmx:OyITaNG1CX96IN0rYphWPJxiWdEPvvFtKv6Uvsr-ljlCcxSvnKZSJg>
    <xmx:OyITaE_MDizsDCeCeagVIP3SSRZWb2exXEXRUBJLCGW2kAYzKSnxOQ>
    <xmx:OyITaCmJTVsJGbr8zasU8_OcveiK9mhHp0wGmWyjcfIgT19bg_3ngg>
    <xmx:PCITaIlpqF5vcIMjH-Q7ftI05C6tMsmKZgVU3fmogj6N5uPBUhDfkb5f>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 03:26:51 -0400 (EDT)
Date: Thu, 1 May 2025 09:26:50 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <2025050127-finally-unraveled-2402@gregkh>
References: <20250501164501.0fc0ab68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501164501.0fc0ab68@canb.auug.org.au>

On Thu, May 01, 2025 at 04:45:01PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ld: warning: discarding dynamic section .glink
> ld: warning: discarding dynamic section .plt
> ld: linkage table error against `__kunit_do_failed_assertion'
> ld: stubs don't match calculated size
> ld: can not build stubs: bad value
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_minor':
> misc_minor_kunit.c:(.text+0x180): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.text+0x1e4): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.text+0x240): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_twice':
> misc_minor_kunit.c:(.text+0x3e8): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.text+0x458): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.text+0x4c4): more undefined references to `__kunit_do_failed_assertion' follow
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_find_minors':
> misc_minor_kunit.c:(.text+0xb3c): undefined reference to `kunit_log_append'
> ld: misc_minor_kunit.c:(.text+0xbac): undefined reference to `kunit_log_append'
> ld: misc_minor_kunit.c:(.text+0xc1c): undefined reference to `kunit_log_append'
> ld: misc_minor_kunit.c:(.text+0xc88): undefined reference to `kunit_log_append'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_name':
> misc_minor_kunit.c:(.text+0xee4): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.text+0xf40): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.text+0xf90): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_error':
> misc_minor_kunit.c:(.text+0x11b4): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.text+0x1210): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.text+0x1264): more undefined references to `__kunit_do_failed_assertion' follow
> ld: drivers/misc/misc_minor_kunit.o:(.toc+0x0): undefined reference to `kunit_binary_assert_format'
> ld: drivers/misc/misc_minor_kunit.o:(.toc+0x8): undefined reference to `kunit_fail_assert_format'
> ld: drivers/misc/misc_minor_kunit.o:(.toc+0x10): undefined reference to `kunit_unary_assert_format'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_can_open':
> misc_minor_kunit.c:(.init.text+0xc0): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x134): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_static_basic':
> misc_minor_kunit.c:(.init.text+0x25c): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x2b4): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict_reverse':
> misc_minor_kunit.c:(.init.text+0x408): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x414): undefined reference to `__kunit_abort'
> ld: misc_minor_kunit.c:(.init.text+0x46c): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x4d8): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x530): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x590): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x5e4): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.init.text+0x63c): more undefined references to `__kunit_do_failed_assertion' follow
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_conflict':
> misc_minor_kunit.c:(.init.text+0x7a0): undefined reference to `__kunit_abort'
> ld: misc_minor_kunit.c:(.init.text+0x7f8): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x85c): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_basic':
> misc_minor_kunit.c:(.init.text+0x994): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x9ec): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision_reverse':
> misc_minor_kunit.c:(.init.text+0xb20): undefined reference to `kunit_kmalloc_array'
> ld: misc_minor_kunit.c:(.init.text+0xba8): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0xc00): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0xc64): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0xcc0): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_collision':
> misc_minor_kunit.c:(.init.text+0xe30): undefined reference to `kunit_kmalloc_array'
> ld: misc_minor_kunit.c:(.init.text+0xe98): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0xea4): undefined reference to `__kunit_abort'
> ld: misc_minor_kunit.c:(.init.text+0xf04): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0xfac): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x1058): undefined reference to `__kunit_do_failed_assertion'
> ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_dynamic_only_range':
> misc_minor_kunit.c:(.init.text+0x1174): undefined reference to `kunit_kmalloc_array'
> ld: misc_minor_kunit.c:(.init.text+0x1200): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x1248): undefined reference to `__kunit_do_failed_assertion'
> ld: misc_minor_kunit.c:(.init.text+0x12ec): undefined reference to `__kunit_do_failed_assertion'
> 
> Caused by commit
> 
>   20acf4dd46e4 ("char: misc: make miscdevice unit test built-in only")
> 
> $ grep CONFIG_KUNIT .config
> CONFIG_KUNIT=m
> CONFIG_KUNIT_DEBUGFS=y
> CONFIG_KUNIT_FAULT_TEST=y
> CONFIG_KUNIT_TEST=m
> CONFIG_KUNIT_EXAMPLE_TEST=m
> CONFIG_KUNIT_ALL_TESTS=m
> CONFIG_KUNIT_DEFAULT_ENABLED=y
> CONFIG_KUNIT_AUTORUN_ENABLED=y
> $ grep CONFIG_TEST_MINOR .config
> $ 
> 
> I have used the char-misc tree from next-20250428 again.

Ugh, ok, I'm just going to revert these changes from my tree again.
Sorry about this.

greg k-h

