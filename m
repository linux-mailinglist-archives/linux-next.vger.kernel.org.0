Return-Path: <linux-next+bounces-7597-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06BB082EB
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 04:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8FC16DA01
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 02:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F313A1DF75B;
	Thu, 17 Jul 2025 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="weg5ZE1q"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757431B4244;
	Thu, 17 Jul 2025 02:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752719119; cv=none; b=V52r0ohicXkAeIeUc1Sd84dBjHRojYKr4H1wuDds3uNeXwZYBWS064ogVLEQEvPGcKfbjBEwQtVbN/1x3LHCAABAuzM4AJxvvg0AevtHXQ/SMDEP/L07Qi5n8YiciGWcPG2SQEprgSmY7IPpKinkzGqzFqm1m6bGvuXns7MshT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752719119; c=relaxed/simple;
	bh=vv+Cqbvr7HfAyusuaOU2+FrarOBMCBIvGj52bTuzAI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agqA3TXDmTpZh04372sPeg1QCSSD6cZHQUOD9xY7cxVeA9E1v7nNy/3fUm7kHkr7Sndjrit35OnK95AFsFsHmVqCx13eTAhiumlrKcS/e3w/e7NJqyN5plLRMoeNcrPnu+I7PUb60S4aDEA62BzgjAj9lhwh05v+uP0dOOizf44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=weg5ZE1q; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xH0yrxEgzwReNBxUX+JBK0TIb6DmFHPTRuYHSXL8jOM=; b=weg5ZE1qTvXlH9bmQoWMDchFjt
	KUewd2NuxEnn1NlgdlY4iUW7iU4iNMHD8ywqnGH7ZEmC+ZjiqJ3t+tyFPjs8qb041H2e2UXxowuxk
	HZ2Ap8xiB2aXx+HXCIEpkTJPJ3wKETrIhRte9n2iCuXLSF2mCG7xhLQVFdydAhYXH43QH+iflTS1/
	zodvJzSsEA4vXN3h9riRNqzYjdvsSo0by7pRFj1G9MamJJTlr5CS1qh/3PKE0mpSNEXubaR6G0LMQ
	DAGO3NaiVtr6ZnyaN0hlmtmc5z2HVdIV5ynMkXNI23VccwtvmxwcPgtpNCFAdtebaBM+89Wt29LKN
	ASFrVTlQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucEJB-000000093h4-02W0;
	Thu, 17 Jul 2025 02:25:17 +0000
Message-ID: <438f96a2-10dc-4665-b5de-bbd8b190a09c@infradead.org>
Date: Wed, 16 Jul 2025 19:25:16 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the block tree
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250716203748.5a4ad396@canb.auug.org.au>
 <dafa8dc8-c51e-4b0c-9383-c19d80f7bf0f@wdc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <dafa8dc8-c51e-4b0c-9383-c19d80f7bf0f@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/16/25 3:58 AM, Johannes Thumshirn wrote:
> On 16.07.25 12:37, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> include/trace/events/block.h:416: warning: Function parameter or struct member 'rq' not described in 'trace_blk_zone_append_update_request_bio'
>> include/trace/events/block.h:416: warning: expecting prototype for trace_block_zone_update_request_bio(). Prototype was for trace_blk_zone_append_update_request_bio() instead
>>
>> Introduced by commit
>>
>>    4cc21a00762b ("block: add tracepoint for blk_zone_update_request_bio")
>>
> 
> Hi Stephen,
> 
> Does this fix it for you:
> 
> diff --git a/include/trace/events/block.h b/include/trace/events/block.h
> index 3e582d5e3a57..6aa79e2d799c 100644
> --- a/include/trace/events/block.h
> +++ b/include/trace/events/block.h
> @@ -405,8 +405,8 @@ DEFINE_EVENT(block_bio, block_getrq,
>   );
> 
>   /**
> - * block_zone_update_request_bio - update the bio sector after a zone append
> - * @bio: the completed block IO operation
> + * blk_zone_append_update_request_bio - update bio sector after zone append
> + * @rq: the completed request that sets the bio sector
>    *
>    * Update the bio's bi_sector after a zone append command has been completed.
>    */
> 
> 
> I'll submit a proper patch ASAP.

LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

