Return-Path: <linux-next+bounces-6488-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5BAA5D19
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 12:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551431BC5F2E
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 10:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0527121D58F;
	Thu,  1 May 2025 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qgCJERm1"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0BE21CA1E;
	Thu,  1 May 2025 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094532; cv=none; b=E7imRZd9WMKo6INfhkv/nf0aMoCH3bsgpMCTJjcAttF1y1ZroRHj4mjQJfNyB25kbY5tClWT8MrK87UfiJVnfulj62+PGqfnCvBmPh6aZQ7UUpq5ewi08pbOqUYY0M63dLHxQ2hH3kinlNAK79vn4GQfWcuxnx01vLkSq59ufpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094532; c=relaxed/simple;
	bh=6QKF3fB3RX26/3Dk9AwJ8Y4/KCM66LJAXLJCokz4X5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIJLfHJ71cTWnXCjij/9SH4lv3MzEBxN7lOUjOV8fq1Ch2CKqPjaTkWkFupFgmzgQbTWiKkKx3LxBlvANL2YYDNYj2xW1/2unXeMVF4MyRdgt9rcBb3g1ElSErrWRdpC2OsOXbPHavEdUMZ5gA1yQ2agZvNSMeT0NkwYzq8uCCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qgCJERm1; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kZveVjehfrVJREXjRbtBsdkHaE/Ro5K5wi3P3q+ApkQ=; b=qgCJERm12Ev1Bz71+iYUfn2tu8
	Z9yVoxzkoI2P9LyRBfor7+EuFEWf76T/89EnyncHM/FvHwOSf9J/n5gFmYdL/ZWEnQYdeo/uNV5Kr
	kjOfWSri6WczIKCTyO7Ja8GXJRuX+QH4J4np94Y+0qzmr1TeWv4pl7EF1ZVCVFTZOVMCm+WkxGTOJ
	4KDfXjb7gsugzPyTClfebvGXDxsCBWGnpjkuNliqFvro7E/2eNMm/UAMHt0hdBCNRuN5Xj8FlxqDR
	3Tp+mN2h4rg6cJWQ9OQhdUF24G+byjenxUyrwNO0PZ2ANOtXnf/MM/zWAyY75uKy5aAuwhZLelYlw
	YW7KJTVQ==;
Received: from 179-125-79-234-dinamico.pombonet.net.br ([179.125.79.234] helo=quatroqueijos)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uAQvT-001T7e-Rp; Thu, 01 May 2025 12:15:16 +0200
Date: Thu, 1 May 2025 07:15:09 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <aBNJrYN1ThMwsLYT@quatroqueijos>
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
> 
> -- 
> Cheers,
> Stephen Rothwell

This should fix it. I am sorry for still breaking all these builds. I have
tested this with the ppc64_defconfig (though that had required me to "fix" a
couple of warnings-turned-to-errors under arch/powerpc/). As I am trying to fix
this quickly, I haven't checked other configs. Again, I am sorry for the trouble.

Greg, I understand this may have caused you concern about merging this. Let
me know if you want to apply the fix below and have me submit it properly
or if we should wait for another cycle before applying a v5 after further
testing.

Cascardo.


From 9e3150cb663e17b748cce6373c2f2b491a14b1a3 Mon Sep 17 00:00:00 2001
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Wed, 30 Apr 2025 08:30:47 -0300
Subject: [PATCH] char: misc: make miscdevice unit test require CONFIG_KUNIT=y

Otherwise, it allows for CONFIG_KUNIT=m, and that leads to build failures
like:

ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_duplicate_minor':
misc_minor_kunit.c:(.text+0x180): undefined reference to `__kunit_do_failed_assertion'
ld: misc_minor_kunit.c:(.text+0x1e4): undefined reference to `__kunit_do_failed_assertion'
ld: misc_minor_kunit.c:(.text+0x240): undefined reference to `__kunit_do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_test_twice':
misc_minor_kunit.c:(.text+0x3e8): undefined reference to `__kunit_do_failed_assertion'
ld: misc_minor_kunit.c:(.text+0x458): undefined reference to `__kunit_do_failed_assertion'
ld: drivers/misc/misc_minor_kunit.o:misc_minor_kunit.c:(.text+0x4c4): more undefined references to `__kunit_do_failed_assertion' follow
ld: drivers/misc/misc_minor_kunit.o: in function `miscdev_find_minors':
misc_minor_kunit.c:(.text+0xb3c): undefined reference to `kunit_log_append'
ld: misc_minor_kunit.c:(.text+0xbac): undefined reference to `kunit_log_append'
ld: misc_minor_kunit.c:(.text+0xc1c): undefined reference to `kunit_log_append'
ld: misc_minor_kunit.c:(.text+0xc88): undefined reference to `kunit_log_append'

[...]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250501164501.0fc0ab68@canb.auug.org.au/
Fixes: 45f0de4f8dc3 ("char: misc: add test cases")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 0117b852bd13..4049851e5115 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2513,7 +2513,7 @@ config TEST_IDA
 
 config TEST_MISC_MINOR
 	bool "miscdevice KUnit test" if !KUNIT_ALL_TESTS
-	depends on KUNIT
+	depends on KUNIT=y
 	default KUNIT_ALL_TESTS
 	help
 	  Kunit test for miscdevice API, specially its behavior in respect to
-- 
2.47.2


