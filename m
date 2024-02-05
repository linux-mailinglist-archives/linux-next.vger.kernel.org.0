Return-Path: <linux-next+bounces-981-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D49068491F5
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 01:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E10B1F2196F
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 00:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C923209;
	Mon,  5 Feb 2024 00:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpGTlSqY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9D29A2;
	Mon,  5 Feb 2024 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707091447; cv=none; b=HN806nFog17L5vVAzN1ga2kf2PmyvvsHhLSyio6fo5Sz/1uYj6KoKAd7qK0ii7GWz3bWJlH9d2Q1P+P90hceS9HPuSyA435wJeNjXhGHnwauMPfcUy9+qJa21swnvHbp3hFw+5dVh6p0BKJNqIXHMq9UgVhf2OaMuO+16FwzSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707091447; c=relaxed/simple;
	bh=bljzIoB+0eh7fl2AAIzkqy3VJFWGe1nvFLEWSlk9XPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo4BoSCodlEv48F5V52gzVhHPaf6kQZHt6sEvLnbXsPtQGYcJFXsDCO5qzc6aoKnrJw9SdEslPUITbbaFwMrNn5b3d502IWltbqjVAFl44LyZPIYnnXOYU3QP9RnEkN75Iv46LvM2aJBULKPqk2gMztE0KNsJEr4/gkJUg8EPzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpGTlSqY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso3466583a12.0;
        Sun, 04 Feb 2024 16:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707091445; x=1707696245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=s7CrAJDsuO7encP9Y7zuXplZgh7eAQq0xyTZBsMEcIA=;
        b=QpGTlSqYtpK2sIauOmLKIor/ZXD8otbsuphbsWxGpDrOX5B8utafzCRLutkEuNkPv0
         YWXfxipXX/0uBqrYkFznBsq0xqvkP1wr6Jpmj+KhETyU91lWbUh4SJz4dnAApOQ/gz1P
         VydnZaCgDfQnmqOHwPvlDsznTpvPY0XXcsydRXHOiAhtgttgDKt1SeYDpyx4d8dZjqav
         FR95rK1OojTMejP3Fn3vFCntSIadacAyaCZxH+xjrFg/UWo4OfZkpMmEbnTQ5qB3OHPx
         SbSBtJsZE/XdGf3QeRAI9+B9fyltnjd3JRQWoZHAsXJFGCMBsGVuDXLt6QZCH3TQg7bZ
         mY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707091445; x=1707696245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7CrAJDsuO7encP9Y7zuXplZgh7eAQq0xyTZBsMEcIA=;
        b=lqW9qgJJgYFAku02g5mOPySkImbgIR3H2RUIzjvXkf9kTsUv2Nncq0WVjEVi5UAcmD
         0jZ7UMgrmmktG5fdE5XQ6PePnhCon0CmphQu1E1Wb6deONNXq0Tpq2hB/SLDWPENlH63
         fSj82Sefw4AZYWJmL0pvJuBOTTMEOddAYFvwVvtKIG9E898aq1BnHux2PyytkeyXomSG
         VD6V++CbmIOZeWwWf0Ju8MyoQRQiQTwRnMpgNCwZpJbxFzmGySic+e2LnnF+VtYKWpkr
         qeLfQ/v9LKLrmrUTkEQXIpa2xwUJ4s4dTdsmlZqXBt+JhN24qrU9uk8vpwRbBpoeW/Ky
         eQgQ==
X-Gm-Message-State: AOJu0YwXXf3yVg4TNGQx/fNGkUZsvARVsJ20P1y2Tv15mipnw3bz5wYI
	lNZfKQi13rEqPivYznlWbCSGImukOIMp2LpVvY2YKQ2XzrJ5YMtA
X-Google-Smtp-Source: AGHT+IGa/eGTOWI7ykxee0lYvsT7q5UdlzM2JX38FlK7MuR19wRMCIXk7uVGU21vqcXUVtdoagN2WA==
X-Received: by 2002:a05:6a21:3515:b0:19c:53e4:e67f with SMTP id zc21-20020a056a21351500b0019c53e4e67fmr5479977pzb.15.1707091445312;
        Sun, 04 Feb 2024 16:04:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX7twi5KCKG0YSVWUf8NyJi26uRdTBqC1HSKu6U0z1adZo2FRXdwjn/ST14Q1KI3FfaCckOapPHkLlEGpa2r/p4q/fPW+HAvLABtKXL/6o9r/woJEtwNLXF8I+g0pHzF9d+hIvMm8IoPg==
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bs10-20020a63280a000000b005bd2b3a03eesm5638937pgb.6.2024.02.04.16.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 16:04:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6712999f-f815-45e9-9e78-e2359db11d72@roeck-us.net>
Date: Sun, 4 Feb 2024 16:04:03 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the hwmon-staging tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Charles Hsu <ythsu0511@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240205104122.0e438076@canb.auug.org.au>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240205104122.0e438076@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/24 15:41, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hwmon-staging tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> WARNING: modpost: module mpq8785 uses symbol pmbus_do_probe from namespace PMBUS, but does not import it.
> WARNING: modpost: module mpq8785 uses symbol pmbus_read_byte_data from namespace PMBUS, but does not import it.
> 
> Introduced by commit
> 
>    7dd62e578cb4 ("hwmon: Add driver for MPS MPQ8785 Synchronous Step-Down Converter")
> 
Now fixed up.

Thanks,
Guenter


