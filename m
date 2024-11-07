Return-Path: <linux-next+bounces-4674-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5289C088D
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 15:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D185E1F23F1B
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAD7212646;
	Thu,  7 Nov 2024 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhBlxp3z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA2628F1;
	Thu,  7 Nov 2024 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730988692; cv=none; b=ccdMy9XQMC1Ru0OllLWKgOFT/8uQhXPucB4MasTqoRDCaqAfo8+RV5vD8jV850+wiNdN02Z5zIoQyxThG4AFbOA5XylmqGKxDvwE2SwIa6pjJS4giSfxHjykX+RCCYucMzwGEy3zTkMf6LdTmfhtDt2TdeEy1Vrsf/BTbEg8fq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730988692; c=relaxed/simple;
	bh=DQvNYBPDrF9zdfQGvOqqM1T55eYJFzxh6idHo9oN8Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhATnW4gKWGm1qxE+jiuE2cjjtFRJsfnTZY1R3UFG3D22RE0FJYjmqtd9JyJApDxg6g/ZCH/eSGCMJFSWiA809USbq/yNceGNMmA9f5pXCRB8CR4XALqk3z+vdpOjJxRKbIu8PbfJV2gkcd7V4QHUw7qpg/4lzZVoB3HJvkC/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhBlxp3z; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so770790a91.2;
        Thu, 07 Nov 2024 06:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730988690; x=1731593490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Np9rAnpo+wLXqYdIc6SkhnkNZ7pqUHkroQjcRczYA=;
        b=lhBlxp3zT4JJefSpJvyaDC7ctRg+SlQdVJ7At/rGOw94qTVzgv4o1wCVhMNSi4ruVD
         Nc6iKim85lnZDjzIVyVZkWZvz3NOVOGjtxHBHNKhTyjnahJhgf1au0SjUedK1fhDRBWD
         VAg0YAtCJPuVOyutfOuKc8aveTu+CdMJ/Uu9OZoO2zDDHjTiI8XT5yAA9w+5tN0RqFar
         MxTXZ4+JQdtgiR8/ActaVg3Mle/haqknxntIbB+XKiKVjjqaWYf2xC9etlS4xUJrvTpU
         yUWi1qX77Uq/5BlJZhsEyu5xqCV2DIKSpTctz7LKHcsGbmfkSUgw6nzA5auEhVWNw6Qs
         JNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730988690; x=1731593490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1Np9rAnpo+wLXqYdIc6SkhnkNZ7pqUHkroQjcRczYA=;
        b=ExLLNN0JWOvQa83oAwip1NQLW7B29rzCaFxPrZTTae628fHVJFY5vx4wW7Tr6VmSXh
         oZs4FuKKH63Pi5tjfHZIpbok3lciymPOsvq3/nzvdeMYg4qQXqdSn+ycYilhmQid/bQV
         ElR2x7b7s8T0cNx2Fo+Wx/ornpnxj5acVaDl2PCBHHyJHhc6viNndw56Db8IthXmfEZe
         qARamGeYNLhd+qF4BsmmgX3hWqefkh2r+5jOlxSnmeeojGFaMN57SR5sEDU4YOkr8yDU
         k+oGZJyFMSIK940yBz7Og74kgXqqm7zMlkbw1sfqLEWR1sTlPxvsNY9HGZCk+k11P9hS
         xquQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbFafPHR0w2eQ2FXdEULbxLiTelggJ0uBghSINnpkpZc4bHVtTqv7j6XPzp+HlzIAYHLhbXUN60ke0WA==@vger.kernel.org, AJvYcCX9ebLc9QJjmjSFmGKC0MdwGdIYNIr+hXESLiMERWWPFPMUAKntTyedeye1LpqahHWknMLKZNrQjt1miso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyupzLfHmd+YWpC8WMu19WgfWGAOOhqFnGQ4Wst7hWU+5bq1yDl
	AzvUGjUl4gYBt5LWgiL9DzFpbKIA1h5i0RLgdEDMNvyH6wv8NiZ8
X-Google-Smtp-Source: AGHT+IFig7sc1n7Ej5nmNb4r0VARuVrHd/J4aBY0Fsq+yXBuK61x0uAVFV0UjMzYZKue4afgnmVCbQ==
X-Received: by 2002:a17:90b:2811:b0:2e0:f81c:731f with SMTP id 98e67ed59e1d1-2e9afa91af4mr157124a91.24.1730988688695;
        Thu, 07 Nov 2024 06:11:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1a9fsm1470744a91.37.2024.11.07.06.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 06:11:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e56525c4-0e71-4c5d-9af2-b697e6b86d61@roeck-us.net>
Date: Thu, 7 Nov 2024 06:11:26 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the watchdog tree with the
 samsung-krzk tree
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck
 <wim@iguana.be>, Byoungtae Cho <bt.cho@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sunyeal Hong <sunyeal.hong@samsung.com>, Taewan Kim <trunixs.kim@samsung.com>
References: <20241107165933.3e8b5af5@canb.auug.org.au>
 <a0e3d45f-d982-4961-9945-3c81c0380806@kernel.org>
 <20241107103708.GB4818@www.linux-watchdog.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241107103708.GB4818@www.linux-watchdog.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/24 02:37, Wim Van Sebroeck wrote:
> Hi Krzysztof,
> 
>> On 07/11/2024 06:59, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the watchdog tree got a conflict in:
>>>
>>>    arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>>>
>>> between commit:
>>>
>>>    ef1c2a54cbc7 ("arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes")
>>>
>>> from the samsung-krzk tree and commit:
>>>
>>>    3595a523d043 ("arm64: dts: exynosautov920: add watchdog DT node")
>>
>> The main problem is above patch should have never been taken to watchdog
>> tree. I never agreed on that. I never acked it. It is against SoC
>> policies which are always requesting entire DTS to go through SoC tree.
>>
>> Please drop the patch from watchdog. Or revert it.
>>
>> Best regards,
>> Krzysztof
>>
> 
> See my other e-mail. Since the 3 patches were about adding a new watchdog driver, I indeed took them in.
> This was reverted and I can only presume that you will take the 3 patches and do the necessary via the SoC tree.
> 

I think the idea was that the watchdog tree would take the driver and
its devicetree property description, and the SoC tree would take the
actual devicetree changes. At least that is what I do in hwmon.

Guenter


