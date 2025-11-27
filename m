Return-Path: <linux-next+bounces-9250-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B1C8FEFB
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 19:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631EF3AB29C
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 18:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CB726F28A;
	Thu, 27 Nov 2025 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PHazvEgC"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16F679C8;
	Thu, 27 Nov 2025 18:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764269356; cv=none; b=XZE8L+GGO4YFcoo7UDbMbzfqDcwIlZuB/ICAVN0flelTeGgr4capa1X0gVtOykKf6PoZ5xZYxFACbMmV4O/8lUYASDcojqkvzFpeowCeVBolGkZByX7kfzPCqabzrCFWbe7RHthaZQlZqNrg+39d0FQABFWFBm5+2Yco8bsClnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764269356; c=relaxed/simple;
	bh=kzEemIfQ3cvUahWnSU0ljGgjQlinIzFPxu1JQbGudrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTGQfzAAa/1x556JVZWOHI44+QxeMfqpmdRs/1dNQmq5/YDP/T7R/G4rYbDjlicszyVJnagqJvqJIk3WIs1Wev9dELAqiDU+TvZTwF7DLHiygawBr1FJ8bEERkzup5j3yf5/dgJ1E5c1jeglZ4NqI21VOpxmzLs9nRmKrltFeJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PHazvEgC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=avycBK90zKEcZ6WwYl9Pfj66Dt73DAZ0zunbfmZg9Ws=; b=PHazvEgCUzcVKWDj34L4JcRMJD
	BQbelAJnZNYgsvpysVY/WZz8bnEStP1JIVWyue4yCuFCXY+DoU17f0QjtB3i/2zE7wjSouNfDsCas
	qyiLMhSXJXUFMGDp+IyxmPzl9vyYMiGXEgmwV+2Bn6DA3MOtSFoad3BSrYNhsz62zt/RDSppdXel8
	yjS//Q9U1FXq1c8yw7Tr46u48kZWS3GvMPzzefwHvYU6M059usVqELoTKUwMunX7UAO87Co+ODw9s
	fk5ELCy0Pu/JgNa8qj549oSMXmGJuixKTdDj4SllLrWz7fJaDMi/lMZN+2g2AdbZnSbehPSIGr9D6
	qCPSWh+w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOh3H-0000000H5No-0TDw;
	Thu, 27 Nov 2025 18:49:11 +0000
Message-ID: <1fb3a54d-acae-4ca7-a803-4de04bc04ee3@infradead.org>
Date: Thu, 27 Nov 2025 10:49:10 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning in Linus' tree
To: Andrew Morton <akpm@linux-foundation.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Alexey Skidanov <alexey.skidanov@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251127130624.563597e3@canb.auug.org.au>
 <20251127104257.862f0bb753226111ff09acbc@linux-foundation.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251127104257.862f0bb753226111ff09acbc@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/27/25 10:42 AM, Andrew Morton wrote:
> On Thu, 27 Nov 2025 13:06:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi all,
>>
>> In Linus' tree, today's linux-next build (htmldocs) produced this
>> warning:
>>
>> WARNING: /home/sfr/kernels/next/next/include/linux/genalloc.h:52 function parameter 'start_addr' not described in 'genpool_algo_t'
>>
>> Introduced by commit
>>
>>   52fbf1134d47 ("lib/genalloc.c: fix allocation of aligned buffer from non-aligned chunk")
>>
>> This has been exposed recently after a bug was fixed that caused some
>> warnings to not be reported.
> 
> Thanks.  I think I can handle this one.  Just.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> --- a/include/linux/genalloc.h~genalloch-fix-htmldocs-warning
> +++ a/include/linux/genalloc.h
> @@ -44,6 +44,7 @@ struct gen_pool;
>   * @nr: The number of zeroed bits we're looking for
>   * @data: optional additional data used by the callback
>   * @pool: the pool being allocated from
> + * @start_addr: start address of memory chunk
>   */
>  typedef unsigned long (*genpool_algo_t)(unsigned long *map,
>  			unsigned long size,
> _
> 
> 

-- 
~Randy

