Return-Path: <linux-next+bounces-9641-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD7D1A2E9
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 17:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9B423009750
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 16:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA062DA760;
	Tue, 13 Jan 2026 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bSt62rP3"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90822836B1;
	Tue, 13 Jan 2026 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321193; cv=none; b=j1PIHt6X2mvpBaQvuR/NjY4QQaiebG7rt9qOugGR47vauIb6ZcQ8+ijWT2XwL7PnPuPut79BPxY9lux97HLTY/aCWQC+wSm7oqThm5A8Hu7dXMZX1Lg7mNbdiB+n1duqInq7WfPjbC+tlNpV3aCbXyDah66FfNkSLo5m7CWv2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321193; c=relaxed/simple;
	bh=3SBUDUSg032YdNQugE/A6UbCvUL2kWPTmr5jCJFI3SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1WQVPcARVXJz7Y+DJZa0dBVOKKsw5+AASdLk9Xa/aGlYP5OkIGLioyW6qYuNrcTCCO5FyxAdXQKdy36L+u8ichJlkPnWOhDtigdEVAIHjdkbYrbvIc/TEiWcxCIHt5pJ7SU9b2Md2QUEIhbkjVKg7NWXArEaNSfjBJ/j3HLNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bSt62rP3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=WDqoLGxmdtNlpqkgAnKp8A4MMg8bcpe4ZbFlPH09aeA=; b=bSt62rP3j9P9Dne7STT4kRtlhJ
	J2js/GE5z/G3KyBx9J+GJXpuI3cTWfczMSlhyCVB3mZio9Uj0v9Np4VNm+y34Z8CrHXeYy0o4hD+8
	tgeIIENtpaMJ3JGB82WUpO2T45ZK9z05h82H3ZC8CgzCV041lxB6Ernz9xfZe0hDftxXC22hMoWaT
	11NTrRoqSHh3yR97GH6MptgHUWoM/S+TprSyDU+4OKprYLu8ZZH9cQwsGXvxi6BBS2NKY/HxmIXXO
	CVb0YhYpEKYMxjUyZzfQ/Ba+Ch6GViEXA/wlUwXPpug/3aUFhgzY+rrKONVRfc6mNHCOeKcejltI9
	60RSI1Kg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfh7W-00000007SU1-0DEN;
	Tue, 13 Jan 2026 16:19:50 +0000
Message-ID: <4f221696-7a67-4fce-83d9-d5573f16ca6f@infradead.org>
Date: Tue, 13 Jan 2026 08:19:49 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: hwmon: coretemp: Fix malformed RST
 table
To: Laveesh Bansal <laveeshb@laveeshbansal.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: linux@roeck-us.net, corbet@lwn.net, sfr@canb.auug.org.au,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <20260113075322.978737-1-laveeshb@laveeshbansal.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260113075322.978737-1-laveeshb@laveeshbansal.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/26 11:53 PM, Laveesh Bansal wrote:
> Shorten the Celeron/Pentium processor entries in the TjMax table to fit
> within the 47-character column width, fixing the RST table parsing error.
> 
> The following entries exceeded the column width:
>   - "Celeron/Pentium Processors (Goldmont/Apollo Lake)" (49 chars)
>   - "Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)" (54 chars)
>   - "Celeron/Pentium Processors (Tremont/Jasper Lake)" (48 chars)
> 
> Drop "Processors" from these entries as this preserves all searchable
> technical keywords (Celeron, Pentium, Goldmont, Gemini Lake, etc.) while
> "Processors" is implied by the chip names and adds no search value.
> 
> Fixes: 099cc1051df7 ("Documentation: hwmon: coretemp: Update supported CPUs and TjMax values")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20260113155444.57c7775b@canb.auug.org.au/
> Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>

Works for me. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> v2:
>   - Shorten text instead of widening columns (widening would require
>     adjusting 101 data rows to realign TjMax values)
> 
> Tested with:
>   - python3 -m docutils Documentation/hwmon/coretemp.rst /dev/null
>   - make htmldocs
> 
> Open to alternative approaches if anyone has a better solution.
> ---
>  Documentation/hwmon/coretemp.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
> index 3afb179e0ced..3ba44b57d028 100644
> --- a/Documentation/hwmon/coretemp.rst
> +++ b/Documentation/hwmon/coretemp.rst
> @@ -120,12 +120,12 @@ Process		Processor					TjMax(C)
>  		x5-E3940/E3930					105
>  		x7-E3950					105
>  
> -14nm		Celeron/Pentium Processors (Goldmont/Apollo Lake)
> +14nm		Celeron/Pentium (Goldmont/Apollo Lake)
>  		J3455/J3355					105
>  		N3450/N3350					105
>  		N4200						105
>  
> -14nm		Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)
> +14nm		Celeron/Pentium (Goldmont Plus/Gemini Lake)
>  		J4105/J4005					105
>  		N4100/N4000					105
>  		N5000						105
> @@ -133,7 +133,7 @@ Process		Processor					TjMax(C)
>  10nm		Atom Processors (Tremont/Elkhart Lake)
>  		x6000E						105
>  
> -10nm		Celeron/Pentium Processors (Tremont/Jasper Lake)
> +10nm		Celeron/Pentium (Tremont/Jasper Lake)
>  		N4500/N5100/N6000 series			105
>  
>  45nm		Xeon Processors 5400 Quad-Core

-- 
~Randy

