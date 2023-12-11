Return-Path: <linux-next+bounces-329-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D04C680C7B5
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 12:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87A852816C5
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 11:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94202D606;
	Mon, 11 Dec 2023 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u3F2IcUa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99702BC
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 03:10:21 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1d93da3eb7so502139466b.0
        for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 03:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702293020; x=1702897820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91RxGGTnrJ5WuG9IRZA1XtPRYSS4yFIRTROkLcfHYJ8=;
        b=u3F2IcUa0D9W0Obf2XVN8ONmN9ciO5ZkzAu4AuqDWLefTSLBAZdJJL8deOmGGhWZ30
         IUst/1Sf6eKIk0FS78lk1CM0cfzMWXYPCH3DGTFmqZo2a634C2paMVO0Jde/kB8sWydP
         4XohkVjLjrq3qA/eHDylyedFOH73qw5XkEMUlZW1gQO5ls5k2zLDJygS0O7dMcNHgwLG
         AlN9xa7e8n08Osr3wK2LGxYJUhgkWULQo5+x/lfNfy7i7qs3JZDsbg5Zv6iW9VRZpxff
         4BQSXS//QnjpaxG0GjKKqZHNhayfYvGuGTSJVPaF7Ue4cUuyd2vsN598LHtz00WL0gFw
         zHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702293020; x=1702897820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91RxGGTnrJ5WuG9IRZA1XtPRYSS4yFIRTROkLcfHYJ8=;
        b=oJY2FIbZqXUwjMr9Gf12gTHIJ+Wg1faBMJS+W31MtZLAyPZOpblBbYUEhwuQBV7tLB
         YR/h0jaPSxA3oW5wToPSmR9Q7rLdjsq2XZLaPlYE69244whcYGEk5tEVJFUM1NkCpq8Q
         mFbrBar8FVmdMgqLSNq/VcrWEeS2RaQUOtn5yZL6QglY2WMSt2yzBOGBarG8GLD+iv2H
         hpgEqSh1I8Pr4R20DPsA7KVG3NZBydQz0kws3CZn07L+i0ZASa/PshU7+c0Xm+TzL0y8
         a5q2J6QPhIWeJ/AWdedorLzduAMQYTtBmarTQuF7ipovQqPW7me4FqTuGlxvIBme7fnP
         A7TQ==
X-Gm-Message-State: AOJu0YyEw9RhJJm4wE8CMqtr1nmZj3ihdw9MqXCelyaADdhEftYFq3lc
	STzXmDrMpIrgwuPS4kyKWV5hFw==
X-Google-Smtp-Source: AGHT+IGZA4vMfpYYJuMGy3YH/2kalo54jdDgRC5CF5WKMmndNcMCZvw2bWV8TUDavosYKEoZvTIPmw==
X-Received: by 2002:a17:906:51d0:b0:a1a:5838:aec2 with SMTP id v16-20020a17090651d000b00a1a5838aec2mr2290537ejk.2.1702293020172;
        Mon, 11 Dec 2023 03:10:20 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id tr6-20020a170907c58600b00a1f73d6f079sm4028469ejc.84.2023.12.11.03.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 03:10:19 -0800 (PST)
Message-ID: <ad69788c-468e-403e-85fc-a3d82add5041@linaro.org>
Date: Mon, 11 Dec 2023 11:10:19 +0000
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the nvmem tree
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231211164916.6f0d2357@canb.auug.org.au>
 <730b71e2-9c3c-4b40-86a6-0794615222fd@linaro.org>
 <20231211113059.094f4226@xps-13>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231211113059.094f4226@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miquel,

On 11/12/2023 10:30, Miquel Raynal wrote:
> Hi Srinivas,
> 
> srinivas.kandagatla@linaro.org wrote on Mon, 11 Dec 2023 10:23:40 +0000:
> 
>> Thankyou Stephen for the patch.
>>
>> On 11/12/2023 05:49, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the nvmem tree, today's linux-next build (i386 defconfig)
>>> failed like this:
>>>
>>> /home/sfr/next/next/drivers/nvmem/core.c: In function 'nvmem_cell_put':
>>> /home/sfr/next/next/drivers/nvmem/core.c:1603:9: error: implicit declaration of function 'nvmem_layout_module_put' [-Werror=implicit-function-declaration]
>>>    1603 |         nvmem_layout_module_put(nvmem);
>>>         |         ^~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Caused by commit
>>>
>>>     ed7778e43271 ("nvmem: core: Rework layouts to become regular devices")
>>>
>>> I have applied the following patch for today.
>>>
>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Date: Mon, 11 Dec 2023 16:34:34 +1100
>>> Subject: [PATCH] fix up for "nvmem: core: Rework layouts to become regular devices"
>>>
>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> ---
>>>    drivers/nvmem/core.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
>>> index 9fc452e8ada8..784b61eb4d8e 100644
>>> --- a/drivers/nvmem/core.c
>>> +++ b/drivers/nvmem/core.c
>>> @@ -1491,6 +1491,11 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
>>>    	return cell;
>>>    }
>>>    EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
>>> +
>>> +#else /* IS_ENABLED(CONFIG_OF) */
>>> +
>>> +static inline void nvmem_layout_module_put(struct nvmem_device *nvmem) { }
>>> +
>>
>> I see no reason why nvmem_layout_module_put() should be even under IS_ENABLED(CONFIG_OF).
>>
>> Updated the patch with this fixed.
> 
> Ok, works for me. I will send a fixup with the doc change (see the
> other kernel test robot report) so you can squash it as well with the
> original patch.
> 
if you have fix up ready, can you send it.

--srini

> I am surprised we get these now, I actually pushed the branch on my
> Github 0-day repository and got no negative report within 3 days.
> Anyway, I guess they have to prioritize the requests.
> 
> Thanks,
> Miquèl

