Return-Path: <linux-next+bounces-2482-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1028FDE06
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 07:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3DAD1C238E7
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 05:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2198D31A8F;
	Thu,  6 Jun 2024 05:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lUjhNACh"
X-Original-To: linux-next@vger.kernel.org
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565239FEF;
	Thu,  6 Jun 2024 05:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717650124; cv=none; b=P4JLplSN9gsr2JBGzCBTlcCuEBRl8vbscBfJfa/zaBRjeKwKbxIpw+kwOT5VNcLptv5VJzQP28pq3YS183KmmvZBoVybVq4+PWRrcUE9QA4IeXTErQuhUHSmN4N2mqfGtSgy4k1BqaDcL0tP5V0PxXQ4Vfsy69TqlsDJHsFLRXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717650124; c=relaxed/simple;
	bh=x/KaCHSK30aGJCKusuKSNM9ZTfEY6XeK73gltohUONo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IeKRxchjWmRnHvI7evM0Ms8DVM0J1GKOXW3pHl0opAHtCQfqK92+bY8etgTsjfVVOapUx9UQ9gpY1hjK5dIkryqqg25X752Y0QtRHh0ZApgVQxfasjQea5+oZX7p8j0DD3LfBb1PcG7IXMwgnzd5T0WvJ3CcGwKGTRA140r8IZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lUjhNACh; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1717650112; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=I0N2KsS236axdwPhFSNHHlSGJ+YG0lmLzBI3lKVcRfA=;
	b=lUjhNAChpA5NTZvwnVm1pEMvI+mtsmP+JQevDuvZEhN02Uaqk2BqMXnkmdmmP6Q6vtUzCvFHBX3kAkQc/fW0fIeRETvX7RAYkQj29VHzADHcTm9UmWmdksKSYbq/92dYWHDXYc+2N73PsmCnOrc0LL6GoBb3MhNHCpiQCnBPDwU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0W7x3IDj_1717650111;
Received: from 30.97.56.72(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W7x3IDj_1717650111)
          by smtp.aliyun-inc.com;
          Thu, 06 Jun 2024 13:01:52 +0800
Message-ID: <b189d815-998b-4dfd-ba89-218ff51313f8@linux.alibaba.com>
Date: Thu, 6 Jun 2024 13:01:50 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240606132353.0db5479d@canb.auug.org.au>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240606132353.0db5479d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/6/6 11:23, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/admin-guide/mm/transhuge.rst:342: ERROR: Unexpected indentation.
> 
> Introduced by commit
> 
>    716119bee914 ("mm: shmem: add multi-size THP sysfs interface for anonymous shmem")
> 
> from the mm-unstable branch of the mm tree.
> 

Thanks for reporting.

Andrew, could you help to fold below changes into this serires, which 
can fix the htmldocs building error? Thanks.

diff --git a/Documentation/admin-guide/mm/transhuge.rst 
b/Documentation/admin-guide/mm/transhuge.rst
index b76d15e408b3..22005989363f 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -338,6 +338,7 @@ and its value for each mTHP is essentially 
consistent with the global setting.
  An 'inherit' option is added to ensure compatibility with these global 
settings.
  Conversely, the options 'force' and 'deny' are dropped, which are 
rather testing
  artifacts from the old ages.
+
  always
      Attempt to allocate <size> huge pages every time we need a new page;

