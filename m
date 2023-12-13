Return-Path: <linux-next+bounces-380-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77B810E25
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 11:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9261A1C20973
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 10:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5678224DB;
	Wed, 13 Dec 2023 10:15:30 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 45150121;
	Wed, 13 Dec 2023 02:15:27 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2699C15;
	Wed, 13 Dec 2023 02:16:12 -0800 (PST)
Received: from [192.168.1.3] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 246543F738;
	Wed, 13 Dec 2023 02:15:26 -0800 (PST)
Message-ID: <90b43e2e-4bbc-d1f2-dba5-8c9174e7398f@arm.com>
Date: Wed, 13 Dec 2023 10:15:25 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: linux-next: build failure after merge of the arm-perf tree
Content-Language: en-US
To: Will Deacon <will@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231213100931.12d9d85e@canb.auug.org.au>
 <20231213093057.GA31075@willie-the-truck>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20231213093057.GA31075@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13/12/2023 09:30, Will Deacon wrote:
> Hi Stephen, [+James]
> 
> On Wed, Dec 13, 2023 at 10:09:31AM +1100, Stephen Rothwell wrote:
>> After merging the arm-perf tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> In file included from drivers/perf/arm_dmc620_pmu.c:26:
>> include/linux/perf/arm_pmu.h:15:10: fatal error: asm/cputype.h: No such file or directory
>>    15 | #include <asm/cputype.h>
>>       |          ^~~~~~~~~~~~~~~
> 
> Damn, I tested with allnoconfig, defconfig and allmodconfig before I pushed,
> but only for ARCH=arm64. Thanks for reporting this.
> 
>> I can't easily tell what caused this - possibly commit
>>
>>   a5f4ca68f348 ("perf/arm_dmc620: Remove duplicate format attribute #defines")
>>
>> I have used the arm-perf and arm64 trees from next-20231212 for today
>> (since the arm64 tree merged the arm-perf tree).
> 
> That looks likely. I'll try reverting it and see if it resolves the problem
> locally.
> 
> Cheers,
> 
> Will


Oops sorry about that, I didn't expect that change to break the x86
build so I didn't test it there, but it's because of CONFIG_COMPILE_TEST.

a5f4ca68f348 is the offending commit, and reverting it would fix it (it
was just a tidyup). But this change below also works. That include was
to build ARM_PMU_PROBE which is only used in perf_event_v6.c (and v7)
which both already include asm/cputype.h. Although maybe that would be a
bit of a hack.

diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 337f01674b38..a4876b1c481a 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -12,7 +12,6 @@
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
-#include <asm/cputype.h>

 #ifdef CONFIG_ARM_PMU


