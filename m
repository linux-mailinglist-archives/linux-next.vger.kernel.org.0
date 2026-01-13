Return-Path: <linux-next+bounces-9642-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71985D1A319
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 17:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12E25300F690
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 16:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B0E2EBBB0;
	Tue, 13 Jan 2026 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsJ9rgBW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F872EA169
	for <linux-next@vger.kernel.org>; Tue, 13 Jan 2026 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321349; cv=none; b=IzCc/NRJEqqMzK8SSOFkozyNlBb1XhBEGJjPiuSlxxb8IugynoXIShaUfu2lsNBdUvLMDmGtm0Mt80n3VnwCPbLIBaRPLhce4ahA/b5IHiakD1CFlFzW33QDAqwnIlUpp5Kq/Nw4JuUWSwnTlSd3znZfyQakFEeaByOPWWue2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321349; c=relaxed/simple;
	bh=iqLbJUskSKL4N9IDtD++X0NNSt+LYTZ6yAIiJzJtIKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lT+ntGcBcWSpOC2vViU4uYwMeMpzcPUKbTa3m/X5I+xG8of+StiPAOVuRGpq7knEaCQCScmvOhePdaXkIzyOiT93ykSj22c/iloTEH872Kt5b1VQihsiDlvc6q2hY5+NcDDOFROQNNJjPcEJmdbWEfDp1t1mU9U+3SWRBRfeEsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsJ9rgBW; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81f5381d168so2096933b3a.2
        for <linux-next@vger.kernel.org>; Tue, 13 Jan 2026 08:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768321348; x=1768926148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bLrLTIifRNqu5HnU5w9pTdgCpPu1ucQ1Ea9E1Sqzz/M=;
        b=NsJ9rgBW1/u8irXJPvf907HjKyZ6yDq01fd947JvLeUWJHNH8LvJLONBu8p9WHvL+b
         4O3FAzDhodsjepp28dyRhef9HSkJpdsMaqq5PN/Biy1ZZHRELqNmGv4ETsh9KpwmK29G
         II/KSbG97tz4B5piyvwdOwLfPhsV0JD+jgv3pZUtSpo8HVbI2DII9+d8O3GzTcuyfSKH
         cWBfDhO/zHq7dKFSIZXIMwcvWHFQ+ijYbspOB4EbrCLMafj0eNFA7SQ/APNgv2j0Cf83
         OUxBOcJ6YH4EwxUrKJORDWku+jGN/JSuUYZ+ZGm+pby4JwPuuGMpRKXnoGWmnLu6Nxdd
         LgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768321348; x=1768926148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLrLTIifRNqu5HnU5w9pTdgCpPu1ucQ1Ea9E1Sqzz/M=;
        b=bqzDs4xxmsUcLcIi9Blv2VYct9zR2OjMAa0sQ+EpwooHChdMaeUJ4TCmGtb6pOLd1d
         D2cJeGkpyemaUnDAhdS2BvAcptr0FaxCOy+LXo3Q01lVXgLnuZFWcr4+fP6hEqZTbXax
         AD7O2V90EdpUHZG7GmcWRhD2wBvLMRIEbYMimqpX9ySnRgwQ/EMBaKHYPaAxlVVPsvlf
         QQUngiFQdSxZvfv/FiZo0N/gWyZP0VUExhbERE1sJe656iUfuqHlmk4gA2YR45pLMa/I
         tnaWdUt0cvPt5BmIglOiREZEhV2fjwbLxWU+dW8YYGRVmuvl/OMCyJyfBPRYcth0mIEx
         61GA==
X-Forwarded-Encrypted: i=1; AJvYcCXn3EqtUG3wEnTrNjtihXYIQi2lMyqoJptSXAE/sorB5xJjK7y/vDbs8rew2/n8zw72dC0s8jtowUpa@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxlIEqEzrDgGKSWGQlchzG59oTxZSGUlBWrU4zSbbL5sjz79u
	yKmXj0SH1naVA16nAg8pFCgK56pGDC6mhYPxmKSqM79WEyJG5mgkzetYQzgOYHp3
X-Gm-Gg: AY/fxX5/GNIv5y0vNO2NKCeOOEn0kO++RbPCFJ3cHz92KIvsHxIYs/mTxEq1nlX5fHr
	muQ5nqOtt7I2njuE/rw/WNlh9H3fIGy9y4kojg8GG+Ke4lgFyglpkvbTXjy6DlCS0cKyEQgAS3e
	5b8CuF4+feff9b6Mv6rQaTPuddUE52dBlIFzxJ7+6s0yCV40cjEmwcI9UAYzMoMxhswIMBi9Cdq
	WCp/VNgL51C5ZjJcjO9z3xFb9f1Gj/R/hFNFouQxSR1x1QZo79V02woxRKx+va5IFKGplmiVIpn
	a23aesRzoincfx544OcAw8WAOlFxrFkgZDl0Irx08ed/mQeCK0mmBvz5VFBVSD4tT4OyCN0fMjE
	0rygXW93Q3G5isvphlTExeAJtbGcgaP0x9d9x9D2Dk/Hx4hUp6uEZQJCBD5/lyLB4wZFbM0soao
	KQAoHnwWchfYb0RQ1YqMDa1IDwTF844i937VW1KfYgS1tirSrN8arDHLaFyETd
X-Google-Smtp-Source: AGHT+IHKSKZQgADOl4Pfjd3+mTQKk94xUzc05noeHLNnu6YOzYzqI6HhXwvi4DcrMT5Jb//EbsxJjA==
X-Received: by 2002:a05:7301:1124:b0:2ae:5dc2:3b08 with SMTP id 5a478bee46e88-2b17d208e7fmr20636867eec.18.1768315941203;
        Tue, 13 Jan 2026 06:52:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b175bee31dsm15888653eec.32.2026.01.13.06.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:52:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e7b367a2-bcb7-4ac9-83ee-ef55d4c2e303@roeck-us.net>
Date: Tue, 13 Jan 2026 06:52:18 -0800
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
Cc: corbet@lwn.net, rdunlap@infradead.org, sfr@canb.auug.org.au,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <20260113075322.978737-1-laveeshb@laveeshbansal.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260113075322.978737-1-laveeshb@laveeshbansal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/26 23:53, Laveesh Bansal wrote:
> Shorten the Celeron/Pentium processor entries in the TjMax table to fit
> within the 47-character column width, fixing the RST table parsing error.
> 
> The following entries exceeded the column width:
>    - "Celeron/Pentium Processors (Goldmont/Apollo Lake)" (49 chars)
>    - "Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)" (54 chars)
>    - "Celeron/Pentium Processors (Tremont/Jasper Lake)" (48 chars)
> 
> Drop "Processors" from these entries as this preserves all searchable
> technical keywords (Celeron, Pentium, Goldmont, Gemini Lake, etc.) while
> "Processors" is implied by the chip names and adds no search value.
> 
> Fixes: 099cc1051df7 ("Documentation: hwmon: coretemp: Update supported CPUs and TjMax values")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20260113155444.57c7775b@canb.auug.org.au/
> Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>
> ---
> v2:
>    - Shorten text instead of widening columns (widening would require
>      adjusting 101 data rows to realign TjMax values)
> 
> Tested with:
>    - python3 -m docutils Documentation/hwmon/coretemp.rst /dev/null
>    - make htmldocs
> 
> Open to alternative approaches if anyone has a better solution.
> ---
>   Documentation/hwmon/coretemp.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
> index 3afb179e0ced..3ba44b57d028 100644
> --- a/Documentation/hwmon/coretemp.rst
> +++ b/Documentation/hwmon/coretemp.rst
> @@ -120,12 +120,12 @@ Process		Processor					TjMax(C)
>   		x5-E3940/E3930					105
>   		x7-E3950					105
>   
> -14nm		Celeron/Pentium Processors (Goldmont/Apollo Lake)
> +14nm		Celeron/Pentium (Goldmont/Apollo Lake)

I updated the patch to split the affected lines.

		Celeron/Pentium Processors
		(Goldmont/Apollo Lake)

Guenter


