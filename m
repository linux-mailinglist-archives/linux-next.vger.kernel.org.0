Return-Path: <linux-next+bounces-8888-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B03CFC3D449
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 20:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A2BD4E2708
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 19:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC15C2DA776;
	Thu,  6 Nov 2025 19:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NlkpXZAe"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F082137932;
	Thu,  6 Nov 2025 19:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762458164; cv=none; b=SbI/3pfD8JxqUCn1M/12EpifHOhgUCuTHPNFlSnyOVGYZL/paP9uOqbbax70VgsYmRuB4JoYzC/D+sfy3xXYOMmEdWCZpeWJKRLmqfpDEtT3MBcvZfjeCtU85hxLrP6gDPqs6iOmUaRhGuFVKOLfFmhpW0o5L5e8ijvYN1d9eaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762458164; c=relaxed/simple;
	bh=YrGMEqz5WWEr/IC4yKy3uAyKQa4k1EQytwKa+b7Ld6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0nupqzAdXXnvYUpXowEinlGxjkm9v4vqipC6eomr5DRktyWQ2hAqLyZo5nroIABSNwBPFaIMs+X7d/CmZmxbKQIQVxH56/4WHagj+jV85F7FvslS+eBK0ElrLNMqnf5NNdwKqF2IPr9wG3fTg5qENbPralokSGT33YVuhT7GFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NlkpXZAe; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Tcbm+uDdA0PKPcFNRtx2NVaMhbYvrnOaNsAAY9XeQDI=; b=NlkpXZAe6UdItodkJ3O0ieAsxl
	T4+IuTLGrzi5KcxKv6MmBC5SgWGt9c2YsrBiqUIcVdcg1Gul2pByvixTGqTtOLvTo8eMjF6JHVnqW
	u8D/WM2BlKajrI5woSH0vzcg7oLEmxNmTxxIAo965ObOZzVHwpfNe6vyV9s7dECQDnMUN1QKsuMJj
	l+rjOyZtQAxW32Xa94b58tFW16eOgTEqKtEFbSJBkd5yUEh3xSs6UmQ+DuJJFBEoiVSfT9MAb222G
	t9SWX6PqBmcXK9ewpXhwj2cvG8uBHLWfJIH2xLmxhpZnx5urhSIcprasQiuuszyDRckOYhXKKOJ8h
	10sDMQWA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5sS-0000000GAzV-3fLL;
	Thu, 06 Nov 2025 19:42:38 +0000
Message-ID: <b47cc630-b27a-4d62-83c2-c81463b53bee@infradead.org>
Date: Thu, 6 Nov 2025 11:42:36 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Nov 6
To: "Longia, Amandeep Kaur" <amandeepkaur.longia@amd.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vasant Hegde <vasant.hegde@amd.com>
References: <20251106153215.7fb21343@canb.auug.org.au>
 <e641c955-25ad-4eae-b3fe-4392966cf768@amd.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e641c955-25ad-4eae-b3fe-4392966cf768@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[add Jason]


On 11/6/25 11:02 AM, Longia, Amandeep Kaur wrote:
> Hi all,
> 
> There is a build failure with the Linux kernel tag 'next-20251106'. The build process fails with the following errors:
> 
> ...
> In file included from drivers/iommu/generic_pt/fmt/../kunit_generic_pt.h:8,
>                  from drivers/iommu/generic_pt/fmt/iommu_template.h:46,
>                  from drivers/iommu/generic_pt/fmt/iommu_vtdss.c:10:
> drivers/iommu/generic_pt/fmt/../kunit_iommu.h:11:10: fatal error: ../../iommu-pages.h: No such file or directory
>    11 | #include <../../iommu-pages.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> In file included from drivers/iommu/generic_pt/fmt/../kunit_generic_pt.h:8,
>                  from drivers/iommu/generic_pt/fmt/iommu_template.h:46,
>                  from drivers/iommu/generic_pt/fmt/iommu_x86_64.c:11:
> drivers/iommu/generic_pt/fmt/../kunit_iommu.h:11:10: fatal error: ../../iommu-pages.h: No such file or directory
>    11 | #include <../../iommu-pages.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> In file included from drivers/iommu/generic_pt/fmt/../kunit_generic_pt.h:8,
>                  from drivers/iommu/generic_pt/fmt/iommu_template.h:46,
>                  from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
> drivers/iommu/generic_pt/fmt/../kunit_iommu.h:11:10: fatal error: ../../iommu-pages.h: No such file or directory
>    11 | #include <../../iommu-pages.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[5]: *** [drivers/iommu/generic_pt/fmt/Makefile:26: drivers/iommu/generic_pt/fmt/kunit_iommu_vtdss.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[5]: *** [drivers/iommu/generic_pt/fmt/Makefile:26: drivers/iommu/generic_pt/fmt/kunit_iommu_x86_64.o] Error 1
> make[5]: *** [drivers/iommu/generic_pt/fmt/Makefile:26: drivers/iommu/generic_pt/fmt/kunit_iommu_amdv1.o] Error 1
> make[4]: *** [scripts/Makefile.build:556: drivers/iommu/generic_pt/fmt] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:556: drivers/iommu] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/home/amd/iommu_test/linux/Makefile:2035: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> Failed while building, exiting...
> 
> Currently, I am bisecting between kernel tags 'next-20251106' and 'next-20251105' to identify the culprit commit causing this issue.

Pretty sure that your beginning "good" should be Linux v6.18-rc4 and
not linux-next. "bad" should be next-20251106.


> Thanks & Regards,
> Amandeep Kaur
> 
> 
> On 11/6/2025 10:02 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20251105:
>>
>> The vfs-brauner tree lost its build failure, but gained another which
>> was resolved when I refetched the tree.
>>
>> The bpf-next tree gained a conflict against the bpf tree.
>>
>> The bluetooth tree gained a conflict against the net-next tree.
>>
>> The ftrace tree gained a build failure so I used the version from
>> next-20251105.
>>
>> The rcu tree gained a conflict against the ftrace tree.
>>
>> Non-merge commits (relative to Linus' tree): 6094
>>   7031 files changed, 271866 insertions(+), 90449 deletions(-)
>>
>> ----------------------------------------------------------------------------


-- 
~Randy


