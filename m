Return-Path: <linux-next+bounces-6067-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4030A748BD
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 11:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC25C189849F
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 10:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6DD212FAB;
	Fri, 28 Mar 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtObYDV+"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E9C1F583D;
	Fri, 28 Mar 2025 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159288; cv=none; b=Rfc7nzvQz7+/k/1ztaYPhxxIQRzFSxVFAMMjoaktPNdReOBRZhL7l+wdOCUotTeYMBGTxNkYyGwQ1YWkP7GjaIvru9K3ebs5fVjOP4Q1UIz2h4XP/8dOOpTSiyWfpIzzlEXOjHdiFSzuYXEmMWas8OtU8Yx7vuj/DheBWJI9GUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159288; c=relaxed/simple;
	bh=kU6DWx+82oFtnWGqqA7HoW7UiG9956mcYw9QOvim9ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlyLzArfUum27OpUSIRNHqfvQO35eZuttXvs0pKrLOZsIFtHM8PR9UWq5arCap1tuEIgdNJRf+k0Zrk3DzvNGWydQW5wx6MhDtyS2OqKQ93OzFz8yMzcXMXERYW7oKcATgnqRqj9Gq5dFifT29jWGkWN3+Inix+zx9xfQnsTlTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtObYDV+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743159287; x=1774695287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kU6DWx+82oFtnWGqqA7HoW7UiG9956mcYw9QOvim9ak=;
  b=WtObYDV+4JBuYDhGVOPftGwvEHl08ZlfIOQr438tAkOn6YXro1tEXEKS
   2WNIa5Isb2Z7qKmLUvy3aHkAPHovMNlXRKkZT+5hzwnjNgi2o8ikiWNeh
   CoQ1gIakiP+1RK7LQg87le/P0vUarlTDVdgV9WIxlS7e7F2ny37tetu95
   lzbB6riZ5lyfRG25LBSMRDtTWgiU/4JAzpA0K/cXghzcMUt37pDcxTgpN
   qUATaJVnE24KU4BfZfgt2PU7BJjkSMoGThFnk/9qaurcmu5Y9Q6jPBl68
   IdM8038wd3oiW1lWUy7a0SVciCo6oHvpcvN0X9ZwsiMrNTR9DO48LrdLo
   Q==;
X-CSE-ConnectionGUID: KUGsTZNjRHqHqJB8tdWh4Q==
X-CSE-MsgGUID: EX+nBxDMTq64ongRq96a/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44409816"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44409816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 03:54:46 -0700
X-CSE-ConnectionGUID: C2f8czbVSKWvxp1vSuS/Pw==
X-CSE-MsgGUID: 7zf8xngoS224O/FV4DlS6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125927094"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 28 Mar 2025 03:54:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 681BC162; Fri, 28 Mar 2025 12:54:42 +0200 (EET)
Date: Fri, 28 Mar 2025 12:54:42 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Aithal, Srikanth" <sraithal@amd.com>, Jason Baron <jbaron@akamai.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <el52wvltm2ptkyjhiajeo564sa6kcwqihdttvutem2qoegj5rg@wnqe7flapgbf>
References: <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
 <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home>
 <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
 <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
 <CAMj1kXGLWYrfEzdDXy1wriBycx0DPQ_kL==Jkw_sDW5f0KxEHw@mail.gmail.com>
 <wl7m7xtqg6ftqmkyaabtzsk7lkhxnpkinyehwy6eokvwkfklzi@m6chqm3rht2u>
 <CAMj1kXF68ibzc0_5tPmC7bLBHC0F6w_S7HeYMZeDr8PHo9jzDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXF68ibzc0_5tPmC7bLBHC0F6w_S7HeYMZeDr8PHo9jzDg@mail.gmail.com>

On Fri, Mar 28, 2025 at 10:33:31AM +0100, Ard Biesheuvel wrote:
> Can you quantify the speedup?

Test is below. I run it 10 times on a VM without unaccepted memory. With
and without has_unaccepted_memory() check in cond_accept_memory().

The difference is not huge, but it is there:

Without static branch:	Mean: 35559993 us, StdDev: 167264
With static branch:	Mean: 35286227 us, StdDev: 207595
Diff:			-273766 us / -0.77%

static int __init alloc_test(void)
{
	ktime_t start_time, end_time;
	s64 delta, total = 0;
	struct page *page;
	int i, j;

	for (i = 0; i < 10; i++) {
		start_time = ktime_get();
		for (j = 0; j < 100000; j++) {
			page = alloc_pages(GFP_KERNEL, PMD_ORDER);
			__free_pages(page, PMD_ORDER);
		}
		end_time = ktime_get();
		printk("%d: %lld us\n", i, ktime_us_delta(end_time, start_time));
	}

	for (i = 0; i < 100; i++) {
		start_time = ktime_get();
		for (j = 0; j < 100000; j++) {
			page = alloc_pages(GFP_KERNEL, PMD_ORDER);
			__free_pages(page, PMD_ORDER);
		}
		end_time = ktime_get();
		delta = ktime_us_delta(end_time, start_time);
		total += delta;
		printk("%d: %lld us\n", i, delta);
	}

	printk("total: %lld us\n", total);

	return 0;
}
late_initcall(alloc_test);
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

