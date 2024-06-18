Return-Path: <linux-next+bounces-2592-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C78D90DB3C
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 20:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85C131F21B20
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 18:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BAB145353;
	Tue, 18 Jun 2024 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUek36vn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710D913C8E5
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 18:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718733833; cv=none; b=fSHcNqgV+R46nmM3Hdv27mP5hizk0KhU7DDk8rcw3MjM18YTlgnd8YDIARAYuMaoWQPYNeTxfBdZ8fFC0CTBWMtkzb5JOxl72r6qTvAfHh+/oWkEZn25uTUnu1pfROP4CboO2WXG043nFSTN/dYhH6uu8N3qkNmKsjwXBtCi/RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718733833; c=relaxed/simple;
	bh=cteTH/+Bdjftv5Vm5ZtkfLchgcehZH4rSiDwGGYTG1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nps7geYhbm3EhiJXTOPPSHxHkj+yxObsMHIDJdaeps9YGI8x4xBzihx65f3lCv08DpzPwBaR83P1XfRd2TF0FyN1Ea7rWvrzRweEYbnLrvtK/kH80fzFkGWl6Vh+8uMKK/lbiXFVLNkxN1qZiv8o4Aw7M+Bi3c+1qOTYSQlKjvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUek36vn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4218008c613so43668105e9.2
        for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 11:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718733830; x=1719338630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZ9YYSQQWvwmoaH1ghiZ/qLOukXf9UGO1HC5xNM8ysY=;
        b=cUek36vnadJQ1z84e/TecXi0Ozi5JOTkjX5BfvEVH5XtkKyyKYXAPr9nS+1P1uGRYo
         9J+FXY+eouW54zNXUZLTalPP7mLbkLGpKmn+E1q5l7AD29lNJ06HT+XZbU28PlzPS/Fm
         v7PXfyHe4hh2Q3G21jwM8cNi8YQ2+XTbZu6r6qo4jAg3cxeyPHdfNHWHVi25hQOzCFEk
         O1H6+IF4NQX0f2SjNOx3F0/higWjwrjNpgFE/9ZoFzj2SU97FV/btyQ3vBUJZJTYHsod
         RXLUw9bWJ+MWEeiGp8nAN/fQ/ZclRE6bgC2+JQNYV9Edl02M2leobgvNgK8UArFaGBU3
         nSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718733830; x=1719338630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ9YYSQQWvwmoaH1ghiZ/qLOukXf9UGO1HC5xNM8ysY=;
        b=o7gVFwfSpRu4iFQ98V0wm/DXZFjNnrmzzOpBP2Fixnu4pSXJJ7d+4Nz8tUBo2bAWtv
         xLefo3EYcE9z5HRfW7lmSs0FhY/IJJMtawPGk2QvS/zrhEz8tWNyuXJOaiZ9er/fhVf8
         r/dA9yytVxWWS1Vfz489iS8qbyrxk379zi10XJAjDIW+LQZ/sYrxZJdO2q5GnwhuyHCY
         vg8btmH/6J33ss2Zs1TxbdweOoN7h4fIt72SMQbCkI22s4OHp7QqCQPazjyq27qS8cYd
         MGt8CEcFBiHQBaOLmTX7MYysT0wFwcXEyoj8Wnid0/B0RC0cAJSVvRJK8c3QnZLpE4kY
         /UjA==
X-Forwarded-Encrypted: i=1; AJvYcCXq+QzjtcsBftUT30DrqVY+hSSmXT2ugN7H3rPZavD2xqy3xOP0xPQzcGUj3U3xCc2X6E4pLH6HPbb+nxoOVpemffXavG1ehelccg==
X-Gm-Message-State: AOJu0Yxeb4bxDnAyhv9FgqzixWlReOVMusJ86NoUbZpudbrfLiF6QD8h
	j/no6+aoUSqkzWkNelFI224ZS9OaCzjIX9HoJARs5cH8wp+3JBrt38q+9P+4FQg=
X-Google-Smtp-Source: AGHT+IFPud61TaWxmlTmjnJcU3WIBd/wEeHIYJpdyyhgLlBMgTMkZz8Qw7MDGfwoDwO82uR3S9Xjgg==
X-Received: by 2002:a05:600c:5590:b0:423:b633:75e8 with SMTP id 5b1f17b1804b1-424751845fcmr1909285e9.20.1718733829564;
        Tue, 18 Jun 2024 11:03:49 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5915:a008:8e03:651e? ([2a05:6e02:1041:c10:5915:a008:8e03:651e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-422874de62fsm234686425e9.38.2024.06.18.11.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 11:03:49 -0700 (PDT)
Message-ID: <9674d79f-83c0-44bf-bcf0-e78f8bdbfbd3@linaro.org>
Date: Tue, 18 Jun 2024 20:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mediatek tree
To: Julien Panis <jpanis@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
 <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
 <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
 <be5a8b12-b042-48cc-9508-759a2a285a8b@kernel.org>
 <99b7f55f-2909-450f-88ce-8cbe8f41c7f8@baylibre.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <99b7f55f-2909-450f-88ce-8cbe8f41c7f8@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/06/2024 18:45, Julien Panis wrote:
> On 6/18/24 12:20, AngeloGioacchino Del Regno wrote:
>> Il 18/06/24 12:03, AngeloGioacchino Del Regno ha scritto:
>>> Il 18/06/24 09:49, Julien Panis ha scritto:
>>>> On 6/17/24 18:44, Mark Brown wrote:
>>>>> Hi all,
>>>>>
>>>>> After merging the mediatek tree, today's linux-next build (arm64
>>>>> defconfig) failed like this:
>>>>>
>>>>> /tmp/next/build/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display.dtsi:113.6-121.3: Warning (graph_port): /fragment@4/__overlay__: graph port node name should be 'port'
>>>>> Error: 
>>>>> /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 
>>>>> syntax error
>>>>> FATAL ERROR: Unable to parse input tree
>>>>> make[4]: *** [/tmp/next/build/scripts/Makefile.lib:431: 
>>>>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb] 
>>>>> Error 1
>>>>>
>>>>> Caused by commit
>>>>>
>>>>>    d7c1bde38bf37a5 ("arm64: dts: mediatek: mt8186: add default 
>>>>> thermal zones")
>>>>>
>>>>> I have used the last version of the mediatek tree from 20240613 
>>>>> instead.
>>>>
>>>> Hello Mark,
>>>>
>>>> Here is the explanation:
>>>> https://lore.kernel.org/all/71d53ff6-fdae-440d-b60d-3ae6f0c881d9@baylibre.com/
>>>> https://lore.kernel.org/all/6d9e0f19-9851-4f23-a8b8-6acc82ae7a3d@baylibre.com/
>>>>
>>>> For some reason, the 2 first commits of the series were not applied
>>>> with the dts. These commits are needed because they contain some
>>>> definitions used by the dts.
>>>>
>>>> Julien
>>>
>>> I'm not sure how should I proceed here.
>>>
>>
>> Reiterating, I'm sure how should I proceed.
>>
>> I'm removing those patches from mediatek for-next until further notice.
>>
>> Regards,
>> Angelo
> 
> Just for my information: Should we just wait for another maintainer
> to pick the 2 missing patches ? Who is in charge of doing it ?

I've picked the 2 first patches but they are going through the 
validation process through our CI. They will be available in a couple of 
days in linux-next.

If you want me to drop them and let them go through the Mediatek tree, 
just let me know.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


