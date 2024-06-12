Return-Path: <linux-next+bounces-2518-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91E904818
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 02:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65976283BFD
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 00:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16262A34;
	Wed, 12 Jun 2024 00:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="skja4WA1"
X-Original-To: linux-next@vger.kernel.org
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506EB10E3;
	Wed, 12 Jun 2024 00:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718153271; cv=none; b=Hc/VvQIqvfMQAtk4qPLmOG/wsF6Fx8P7zOIHbIPkAe2DDwnDMBDFs5d4Cbo5WTncL1d7x2RYBedUDFZHh8OBip7S0S+ysLo+Vd5CU5Lg15/OHLQWXUzO9qsPHjDfLaayg1tfKoob7UHR9mev0j5/RVH5djJ+K5faKH1+c1Nxxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718153271; c=relaxed/simple;
	bh=D0CNokrDQLILKMv8a9U7P1TOQggbiUILleuN+hDr0Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rM0u0Me06rIPR8F291e6r4vRfwYlgWx4ud8N4Noxop9Nx9iHytjC+kQKHXy1li89oNTnY3DLRRgpIp49kjQgXhjXqt626hrdrWypD7uOtnQeOZxQ/Basi2u2CH1ENUQQwYW+Yqk+lnTOvIQqdJbr/osSol45QibEO2SQaSpQr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=skja4WA1; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718153264; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JRI2sHqJDr7lQAmwy5jlV8xeTX/UwjErMUDEtI1kyP8=;
	b=skja4WA1QAktJNPK6h7FkMmeR6x8JKYgNevgYv7ZKoItqk1bj2KfVTqC3YtpTAgS0SHX4cL1mVjQXQ+41MauReNs35sD+6k+E9aT9szKr4WPqMTUHamkryFcuIQkdvjLysy+cHQVh+AmdtrtjF5YWP8+J0pV8CBvbGw5i5IpzPQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067111;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0W8HvuIh_1718153263;
Received: from 30.97.56.60(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W8HvuIh_1718153263)
          by smtp.aliyun-inc.com;
          Wed, 12 Jun 2024 08:47:44 +0800
Message-ID: <e9535f80-ba84-4f9f-9148-17d560e086a4@linux.alibaba.com>
Date: Wed, 12 Jun 2024 08:47:43 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240606132353.0db5479d@canb.auug.org.au>
 <b189d815-998b-4dfd-ba89-218ff51313f8@linux.alibaba.com>
 <20240611145812.6eb6e9936388c862c168d349@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240611145812.6eb6e9936388c862c168d349@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/6/12 05:58, Andrew Morton wrote:
> On Thu, 6 Jun 2024 13:01:50 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>>
>>
>> On 2024/6/6 11:23, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the mm tree, today's linux-next build (htmldocs) produced
>>> this warning:
>>>
>>> Documentation/admin-guide/mm/transhuge.rst:342: ERROR: Unexpected indentation.
>>>
>>> Introduced by commit
>>>
>>>     716119bee914 ("mm: shmem: add multi-size THP sysfs interface for anonymous shmem")
>>>
>>> from the mm-unstable branch of the mm tree.
>>>
>>
>> Thanks for reporting.
>>
>> Andrew, could you help to fold below changes into this serires, which
>> can fix the htmldocs building error? Thanks.
>>
>> ...
>>
>> --- a/Documentation/admin-guide/mm/transhuge.rst
>> +++ b/Documentation/admin-guide/mm/transhuge.rst
>> @@ -338,6 +338,7 @@ and its value for each mTHP is essentially
>> consistent with the global setting.
>>    An 'inherit' option is added to ensure compatibility with these global
>> settings.
>>    Conversely, the options 'force' and 'deny' are dropped, which are
>> rather testing
>>    artifacts from the old ages.
>> +
>>    always
>>        Attempt to allocate <size> huge pages every time we need a new page;
> 
> That's rather whitespace mangled, but I fixed it.  I also added
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-shmem-add-multi-size-thp-sysfs-interface-for-anonymous-shmem-fix-fix
> Date: Tue Jun 11 02:56:34 PM PDT 2024
> 
> reflow transhuge.rst addition to 80 cols
> 
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

LGTM.

Thanks Andrew :)

> ---
> 
>   Documentation/admin-guide/mm/transhuge.rst |   13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> --- a/Documentation/admin-guide/mm/transhuge.rst~mm-shmem-add-multi-size-thp-sysfs-interface-for-anonymous-shmem-fix-fix
> +++ a/Documentation/admin-guide/mm/transhuge.rst
> @@ -332,12 +332,13 @@ deny
>   force
>       Force the huge option on for all - very useful for testing;
>   
> -Shmem can also use "multi-size THP" (mTHP) by adding a new sysfs knob to control
> -mTHP allocation: '/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/shmem_enabled',
> -and its value for each mTHP is essentially consistent with the global setting.
> -An 'inherit' option is added to ensure compatibility with these global settings.
> -Conversely, the options 'force' and 'deny' are dropped, which are rather testing
> -artifacts from the old ages.
> +Shmem can also use "multi-size THP" (mTHP) by adding a new sysfs knob to
> +control mTHP allocation:
> +'/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/shmem_enabled',
> +and its value for each mTHP is essentially consistent with the global
> +setting.  An 'inherit' option is added to ensure compatibility with these
> +global settings.  Conversely, the options 'force' and 'deny' are dropped,
> +which are rather testing artifacts from the old ages.
>   
>   always
>       Attempt to allocate <size> huge pages every time we need a new page;
> _

