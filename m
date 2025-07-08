Return-Path: <linux-next+bounces-7412-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E791CAFDA64
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 00:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A056B7A3A75
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 22:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5AF227B94;
	Tue,  8 Jul 2025 22:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RexGCZPp"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6AC14883F;
	Tue,  8 Jul 2025 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752012232; cv=none; b=FhFWQRT18DvSkW1cUBA5Cgzl4ckqF0qznNMm54JpkJyx2kgzNeDbNgerQ1S5BDGXTwWirVL9mnWBn+cCaixSZ0JWiQqYpqyPOdu8ZhrBztqFP7VcaYQRFAMqNNYVitZhnrJjnr1F3tqNA6lpJv2WnXI91qsMrpVcyz8Y1JVw1Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752012232; c=relaxed/simple;
	bh=tXVDsd7NOD6A2M7p7qUaNCd/pRPGJ1t7jA8NgRtoCgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwECrHDr1POllsxG1jtsH70+N9MwK8hSJQDrOtJUyTEDWZF0jXPVCQ9Jjf6mUvQ0bWQ5vU8VbauT5gopu9bBGAQ+ujn5sADlyvPcfbl5Puu9sUWUAq9c9xLr0k1LxNsm5IpO0fVKdN9rZ6f4yRvBe7/svjTa39aHOri3kIeZO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RexGCZPp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=E2QTMLNz+wpmxWaHkhuqHev5xzFIG4QbvWSVsi2ak1c=; b=RexGCZPp/ke/j+v4PkBiS63YoY
	wyrgKh7N5DPhqdkWpzOnWYaoasivhm5J6cvzz/Q2eeK+15y1WJDufUyjHAKVEvD41jT1emXukejQf
	uXAPB9EP01x5fEAJsEntL0Xj2YwL2vM+ie+EIFvqsIthNNhqSlF+QmJjeRM2c1xMM3lKAwTnNqwYc
	xRytEdYF6JrPzALeeUKpl/O2yyKKLRGQ0SWZnuiTFkM03b+LFmIY4DkkVURubaLyFlfqW4n4A24kJ
	xAI8XnX4IfVJlUaWTItvQPhBGT9S0EHe56RoI8Ia0GEXtYWGnyXuksyUEH0ROHFWo1IsITGgb9x6s
	DKnIR5CQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGPh-00000001Jge-2j3k;
	Tue, 08 Jul 2025 22:03:45 +0000
Message-ID: <6c1056da-8cbe-477f-be95-10a395c60443@infradead.org>
Date: Tue, 8 Jul 2025 15:03:41 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_next/master=3A_=28build=29_format_?=
 =?UTF-8?B?4oCYJWxk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIGludA==?=
 =?UTF-8?B?4oCZLCBidXQgYXJndW1lbnQgMiBoLi4u?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org, david.e.box@linux.intel.com,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <CACo-S-29Degjym-azsJNSd1yofLOB2_Rf5xpa9b7L-14OPn7wQ@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CACo-S-29Degjym-azsJNSd1yofLOB2_Rf5xpa9b7L-14OPn7wQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/8/25 4:59 AM, KernelCI bot wrote:
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  format ‘%ld’ expects argument of type ‘long int’, but argument 2 has
> type ‘size_t’ {aka ‘unsigned int’} [-Werror=format=] in
> drivers/platform/x86/intel/pmt/discovery.o
> (drivers/platform/x86/intel/pmt/discovery.c)
> [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:8fa7949e2280282be6a5756d890d8a9cc1472e21
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  58ba80c4740212c29a1cf9b48f588e60a7612209
> 
> 
> Log excerpt:
> =====================================================
> drivers/platform/x86/intel/pmt/discovery.c:427:35: error: format ‘%ld’
> expects argument of type ‘long int’, but argument 2 has type ‘size_t’
> {aka ‘unsigned int’} [-Werror=format=]
>   427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
> size, &res_size))
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~
>       |                                                               |
>       |
> size_t {aka unsigned int}
> ./include/asm-generic/bug.h:112:31: note: in definition of macro ‘__WARN_printf’
>   112 |                 __warn_printk(arg);
>          \
>       |                               ^~~
> drivers/platform/x86/intel/pmt/discovery.c:427:13: note: in expansion
> of macro ‘WARN’
>   427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
> size, &res_size))
>       |             ^~~~
> drivers/platform/x86/intel/pmt/discovery.c:427:53: note: format string
> is defined here
>   427 |         if (WARN(size > res_size, "Bad table size %ld > %pa",
> size, &res_size))
>       |                                                   ~~^
>       |                                                     |
>       |                                                     long int
>       |                                                   %d
>   CC [M]  drivers/platform/chrome/wilco_ec/telemetry.o
> cc1: all warnings being treated as errors
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## defconfig+kcidebug+x86-board on (i386):
> - compiler: gcc-12
> - dashboard: https://d.kernelci.org/build/maestro:686cf98934612746bbb465bb
> 
> 
> #kernelci issue maestro:8fa7949e2280282be6a5756d890d8a9cc1472e21
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 


This is from commit d9a0788093565:
platform/x86/intel/pmt: Add PMT Discovery driver

Cc:ing David Box.

-- 
~Randy


