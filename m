Return-Path: <linux-next+bounces-9627-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3513ED16E40
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 07:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B8AA3009286
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 06:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D26130CDB1;
	Tue, 13 Jan 2026 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OMWxG0o5"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DAC29B78D;
	Tue, 13 Jan 2026 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768286906; cv=none; b=CrmaIcaBbkz4GocJC77jwamsXRETc+NydezD8NX5AfiXkCY6vUXOhBedsjCY6ltpcyXWVC2/g52irljVMpUUQcVhv5AL5Ismb66haHb4QZICxXBvXfIp2Y5ULJWI9zXAF3Jk4ym2quyVPZD3ZHVB0fyLoyp/abiF8syRSUUwKMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768286906; c=relaxed/simple;
	bh=1Yguu3Gho8fGASKbhSkWsmof8nQfXlMaJnIS1PvdS6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlrVXbeh0miIxvKXHfYVZtR8SusfSt4ri+hQRv/LRyRDbDFzQuDJksecnNdNTAVVG8cR1BMgODi6oLYOTrZLq/1ah+f72imkuAGPea+8+/exgZomuEhh1x+D2iweQRxEWGm4G9KQPbYN0bZUWVPnqs5EqdEheJnySQRIectenbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OMWxG0o5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z2YPkRxl+2FC6VVp+D++HuYXvSCOX9NylT5cPCraFlY=; b=OMWxG0o5BF5MOoJ/ALmZO6S9qu
	uiiXx0PPRbBOs+der2Tkz6sh/AKiWpVqbCvAmN/tVek3EHWyOozD75Fmnee0amb4wGcTXbmsrdhZZ
	MSL+lfRRjxrwnx5fb4Y0+uZTEnBPLfp3GreDHJvUsPRHok6+fPUSTAYh6ft2BPfuAZHpJTV2AMArE
	osjgoxK96165fKOz7KI8M+35U1SptUNa8vwXgFrfLXkAMZbjQLA4y9kOcW0Qbr2rUMHt5LxZ2UDQu
	XDQyDd/Mk4xELjvlYw78uXNB1pCfVHDG0G1MD++nG6zCZKUBlHb95Ks/Zist/Z4I96Bif1VE17d/S
	kVrSb2bQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYCV-00000006cFw-2x3e;
	Tue, 13 Jan 2026 06:48:23 +0000
Message-ID: <516c7da3-2aff-41ad-93c3-44b95f8dd118@infradead.org>
Date: Mon, 12 Jan 2026 22:48:22 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: hwmon: coretemp: Fix malformed RST table
To: Laveesh Bansal <laveeshb@laveeshbansal.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260113155444.57c7775b@canb.auug.org.au>
 <20260113055425.966495-1-laveeshb@laveeshbansal.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260113055425.966495-1-laveeshb@laveeshbansal.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 1/12/26 9:54 PM, Laveesh Bansal wrote:
> Widen the processor column in the TjMax table to accommodate longer
> entries like "Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)"
> which exceed the previous 47-character column width.
> 
> Fixes: 099cc1051df7 ("Documentation: hwmon: coretemp: Update supported CPUs and TjMax values")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20260113155444.57c7775b@canb.auug.org.au/
> Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>
> ---
>  Documentation/hwmon/coretemp.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
> index 3afb179e0ced..a3943656fab6 100644
> --- a/Documentation/hwmon/coretemp.rst
> +++ b/Documentation/hwmon/coretemp.rst
> @@ -69,8 +69,8 @@ for your CPU, you can pass the correct TjMax value as a module parameter
>  Appendix A. Known TjMax lists (TBD):
>  Some information comes from ark.intel.com
>  
> -=============== =============================================== ================
> -Process		Processor					TjMax(C)
> +=============== ======================================================= ================
> +Process		Processor						TjMax(C)
>  
>  22nm		Core i5/i7 Processors
>  		i7 3920XM, 3820QM, 3720QM, 3667U, 3520M		105
> @@ -228,4 +228,4 @@ Process		Processor					TjMax(C)
>  65nm		Celeron Processors
>  		T1700/1600					100
>  		560/550/540/530					100
> -=============== =============================================== ================
> +=============== ======================================================= ================

Did you test this?

Test result:
linux-next/Documentation/hwmon/coretemp.rst:90: ERROR: Malformed table.
Text in column margin in table line 19.

Look the numbers that should be in the TjMax(C) column. They aren't.
Please update and send v2.

Thanks.
-- 
~Randy


