Return-Path: <linux-next+bounces-6789-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A4AB8262
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 11:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D12C81B64571
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 09:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B3A295DB5;
	Thu, 15 May 2025 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjYhesQM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1B329673D
	for <linux-next@vger.kernel.org>; Thu, 15 May 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300808; cv=none; b=SvOaKGjefWwkz5TL8rr9+u7v+LJ+X2Q7rIjpydTO41M8y5ZvRJpqR4vfORr4picCcFRuz/vO3yrRKD90MpJbKk9RKZibnD0aU+bCUkAlb1mWz4tErxMfr2U/LKsORzY3Vk7RPEFLZL/YbE/rAOKltK9CcvmfR8OKXT6w3HjuTnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300808; c=relaxed/simple;
	bh=AMvDqQYGnDnGb/sl2sVntr4FQ/Pvxle3go/Gh6vbtZo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JUv5+5YgtFf7Rrx+g4g7aWbON0YTZ88Ph8p+ZYWC1U8mlbzLYbnfPbh/1E/VH9ElH+r0F0qX5HcR0Xgl3NeTYeE2EZ+BVq7R+XmAuv1bDlKnE1OIelh8gk9DtfWq3xkv2Kr98S/3KE8CjL2U82Czn+tf6zbKH3VzQKiK16/mvFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjYhesQM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442f9043f56so2584135e9.0
        for <linux-next@vger.kernel.org>; Thu, 15 May 2025 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747300804; x=1747905604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x2lMP2sWq3+4XRD9R5jQk8nu8eG7GVwKsI/4ygBP9qA=;
        b=FjYhesQMn/Z5Y7c8sL8r3NBxstvMIZyWfs8aP1qg631WOd7Ch/wulDb0roLXsNVzuB
         olisVbJXVbHwCZ3551FuPUonlFAu4WosMAc71RFUWvynIDMiYiOqHgMQhYqIzd94f5vD
         3OZbpA0h5louGMNsvOypikHWVzNeXcg0joLYw/5LBE6vsVGp586b8Uu+YDoj3n94743f
         1zDVrIf21hwhz7BoYQ2lTF4a/hz5OIldrZ11Q07BZ2y3X1sU82atzTbmUvuM5e6i83TX
         Y9dDY0R8V2006gTUQeyvZuxgcyVyGCuq8wia6OtizAPABYMnrU++brtIPxmg0FrtEvFw
         HWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300804; x=1747905604;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x2lMP2sWq3+4XRD9R5jQk8nu8eG7GVwKsI/4ygBP9qA=;
        b=E1cIKAlJ9jB9iA+Qk6cSw751lQbAShUTx0JdfaMHGUV7m4JABtCrNy5PbXDhFjQuOv
         9vgp7a0/oFJcS+zRzQBdDJM1kuz2bOB1yR+NRSMEk9DfNhUMy0zD9cUz8hoclOUx0ETC
         Gxp5bI1OMzHVYdUOOV+XjcKDrcenI3p9Ypj1bBPGL5dUFW0b+6q8vdhPoKGtTheOAZIt
         cNugi9Sj6roMqOCtynyDf/f2LDU5VXtjgrw59qACQa9oBXjDrouXpGl49ciWXsxAIShc
         gTKAoxFUmd9Wwmp8s6k8pAZzOGrpAqcL/RyUDqv6T/bnSxl3dGLvtLkHKqSemAGoFbew
         NvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH/YrLTeoGp7YivNb7ZOnenEvoFxHKc5iaL8IJp4wCzy8sQQWhJH3rNyYxTGwaRgXIKpVY+qlyTAnP@vger.kernel.org
X-Gm-Message-State: AOJu0YxAb3CmtOsdzQ1N3bprmvdMNzwa/N/MGR8VYdeiFguNDGlbv9+Q
	mNmc9zzAElshI6M1AVr+rx3MzmvMLE60QqbQy3v5k8dHlnvqroojI+aC4nR0Fm8=
X-Gm-Gg: ASbGnctZaP2SHRMAtJotJiSvyTHg82gk5vX8J6ByQncaWLolnErCYnOAp6fvXENpT1M
	kn87tTbFnZLjZSa6mfZ4x9X7ef3VHXfjBizlwYZJCIAU5YegyGcGNpy3psYCVkJT+5wOkwVZoUd
	CBmd5M3zPEU98LpgjKREyKPbtCRTbNiTkZjFjrd7lxXbwXGdrghkPmhRNnIXbn/n9wbxmAck0AP
	3FZAvkD4J2rpdV9oh/JSC4AbD6dnvB3fjbrXHXyTpcMLI8iGK22TkABaN8OQjz5fINr3r30blvT
	HLGAgGRZargXyo+46F/MfQVZT/Daj3UL3Gs2o2kZrxGWTISXIRdhp0OLCHS9y1hiUXtZZ497fEX
	mwrY6NTxpkFiv
X-Google-Smtp-Source: AGHT+IEROeBcQLXaeEtKAeBz3Fs2jZereQNJ6BQ+vtNCHT5Y13IsuxKCN1ufBhmMDuFZWcOb5S2qTA==
X-Received: by 2002:a5d:584c:0:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-3a3496a66cfmr5384359f8f.19.1747300803712;
        Thu, 15 May 2025 02:20:03 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde6bsm22420509f8f.13.2025.05.15.02.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:20:03 -0700 (PDT)
Message-ID: <ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
Date: Thu, 15 May 2025 11:20:01 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: error trying to fetch the clockevents tree
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250429082047.4af75695@canb.auug.org.au>
 <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
Content-Language: en-US
In-Reply-To: <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Stephen,


On 4/29/25 00:35, Daniel Lezcano wrote:
> On 29/04/2025 00:20, Stephen Rothwell wrote:
>> Hi all,
>>
>> Fetching the clockevents tree produces this error:
>>
>> fatal: unable to access 'https://git.linaro.org/people/daniel.lezcano/ 
>> linux.git/': The requested URL returned error: 503
> 
> Seems like there is some issues with the servers recently.
> 
> Could you please disable the tree while I migrate it to kernel.org ?

I had no time yet to migrate the git tree to kernel.org but the servers 
seem to work correctly now.

Is it possible to enable back the tree so its content gets some round in 
linux-next before the PR ?

Thanks

   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

