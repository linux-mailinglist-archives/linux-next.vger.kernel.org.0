Return-Path: <linux-next+bounces-7074-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39902ACF4FF
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 19:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C423AD2A2
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 17:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D242A2750E3;
	Thu,  5 Jun 2025 17:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="p+6ndzKD"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6113D521;
	Thu,  5 Jun 2025 17:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143292; cv=none; b=YFD1Em3Oh9fIIvROhTICsrzeEfa1uoJ+3N8mj+N0ptf8PTGbzfAzkUN0AMlNAFYPICeeNmdEjUSBR467neipCAiX7OBhy6OehTMemapfPYY28uMSHWXmRv1Wwzzoa9QJeROKzxhvhfihlVETJ5xuMZLB0F2kHZyPn/WVtCUErew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143292; c=relaxed/simple;
	bh=b4STD/lOfA1i70s8WfGdglRnk8LVxXlWtZI7Ja8pL98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOqmP5gvNTNH1lA6D+BwnvMJfJUEOetFeSL+BEHyU8/ybXXzAOW3TBlOlJExrFwvsZe7giVNspjq7Lu6Uq34M+L6Ne5RFGpnAWqXqfHTs17TeQrdWCLL2GUWWmxxsMf3+H0LtwopzwZcY8OcyI0XUtebuEZGhMxleQ1klJkjOW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=p+6ndzKD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ueMI9i9n30bX3Jb2KX/od2qOmj/m0L2xH9S2mUAYsqU=; b=p+6ndzKDgG9O+gYpEgwvjEOHqH
	bDMYpcsl5livWauj7Jm5e3ujw01G6BEAR7d5xfQIu6xHvk1JWZ/G8QZCriUFaaGZRCVsbNm8kwIjG
	ektBQXo2b4MomHC6H4QFDJFZrJAud8AYFFG+OrVMozV2xnYHZXZnlEhN6eeu5L8zQ4bj+beVsv62O
	zZES7niKKjEfFSxsfXMLX50+25Bp7x9JNHGXqrkrckcXpIMEjfHiQb6j8T7LIggi+Gq1AuUlKROWG
	v+43xecWV9L3CteHDxyWilCDCXAK5oklQPRQF1Ujnf+SeMHyWcYxEF5X0cjt++TAT8Xbc9IqA2rUD
	O9Vfpg/g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNE4U-00000004SQP-0XiO;
	Thu, 05 Jun 2025 17:08:06 +0000
Message-ID: <44c89b6b-edaa-4b0f-9306-a447ef2d9250@infradead.org>
Date: Thu, 5 Jun 2025 10:07:53 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
To: Andrea della Porta <andrea.porta@suse.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
References: <20250603170058.5e1e1058@canb.auug.org.au>
 <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
 <6e88587d-f426-4841-b370-b46917822212@broadcom.com>
 <aEGhHy7qPyIjG5Xp@apocalypse>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aEGhHy7qPyIjG5Xp@apocalypse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/5/25 6:52 AM, Andrea della Porta wrote:
> On 20:06 Wed 04 Jun     , Florian Fainelli wrote:
>>
>>
>> On 6/3/2025 10:01 AM, Randy Dunlap wrote:
>>>
>>>
>>> On 6/3/25 12:00 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Please do not add any material destined for v6.17 to you rlinux-next
>>>> included branches until after v6.16-rc1 has been released.
>>>>
>>>> Changes since 20250530:
>>>>
>>>
>>> on i386:
>>>
>>> ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
>>> clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'
>>>
>>> caused by
>>> 	/* must sleep 10 pll vco cycles */
>>> 	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
>>>
>>>
>>
>> Andrea, do you mind fixing this build error for a 32-bit kernel? Thanks!
> 
> Sorry for the delay, this should fix it:
> 
> @@ -754,7 +769,7 @@ static int rp1_pll_divider_set_rate(struct clk_hw *hw,
>         clockman_write(clockman, data->ctrl_reg, sec);
>  
>         /* must sleep 10 pll vco cycles */
> -       ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
> +       ndelay(div64_ul(10ULL * div * NSEC_PER_SEC, parent_rate));
>  
>         sec &= ~PLL_SEC_RST;
>         clockman_write(clockman, data->ctrl_reg, sec);
> 
> should I send a new patch with this fix only (against linux-next or stblinux/next?)
> or Florian is it better if you make the change in your next branch directly?

Yes, this fixes the 32-bit build error. Thanks.

Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

-- 
~Randy

