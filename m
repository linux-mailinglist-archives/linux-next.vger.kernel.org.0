Return-Path: <linux-next+bounces-7602-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCFB08579
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 08:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE44C1C24D69
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 06:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF03219313;
	Thu, 17 Jul 2025 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsY+I9Ub"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798E219315
	for <linux-next@vger.kernel.org>; Thu, 17 Jul 2025 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735130; cv=none; b=lUHy9+4c0tYtzEgjWMomiRJQGGwMx0BoLxftryMWDx84AoC6wRgovLTjwElyt3ad0CMhhpzJpHQRH3iEDHofKuOlsQD3L5rPuaJ31rUNhigx+vvBVOF2lO0RNq0X3gOrBWfWWwKNkL2Nb5TAl34Wby//XiWESu+hq0PYDgaoDgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735130; c=relaxed/simple;
	bh=4aprBz8glMknobxqf/4Df+ZFPpRBLytda12HfBEjLtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pi5/Ws4c7gXZxJOwE9OUchnfVOQqKCWwlAEm5z3lqSqR2zVZmotgFuzJKziZaC7pfhbN9kmpbMiOrY5QpGWpTy3DKMeNx5dYcz3ieX8iePuqcUEOwNJgofqVvCRY0gNl3+FZZbYO3DgB/vH6fCT2fQ4I/8I5k4zDktKtl7Yvmfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsY+I9Ub; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60e5396e101so87863a12.1
        for <linux-next@vger.kernel.org>; Wed, 16 Jul 2025 23:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752735126; x=1753339926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GAKiwOJ1iHtP7/BKK42T12euA+Mx9VznVRPmGcAF52s=;
        b=JsY+I9Ubb+7G+jwgA3gmx1+YtM8u1xHPj2Wtv/T1x1xlnxIPSZ1XZQlY7l8Nla4Zmk
         lReVj96gsVYA8uyFta4S9lBPfc+c0jJMc891JoIbS0rYVpy2Vj5GuAw6rhDQrPjETkv4
         9scOA6e/WOcV0c8RKUczOKiVntWQPt2SOJph6vpVuW4uaLwfmjKbyjTNsseFGxm1sfRx
         dnCcXS5cGnFZtqZSJri2u8r2jJv3c+L36u0FGeWjiSIGRpUBmlVADs1Pahrnz603o3Ao
         Cs4c/6z03nwk3cjobj1JVDDhT3njzAg4vduE+Z2lmvWItT3BsMBUD+K+el83bVqCpGt+
         3dPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735126; x=1753339926;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAKiwOJ1iHtP7/BKK42T12euA+Mx9VznVRPmGcAF52s=;
        b=QrFtwTx4vXfckvJbUy7bCYaKI/YHbwLWU5S/yVqGtOAZtCz2qFZ5VioezHJYc6NuRU
         SZPJzvS50SA8mj9mqOkziTidD9fYAwys9AK0Sda5L0EY9Qcu2u3AH/KTffElAZrkr2+/
         qRvK8vGWbqajdsH3m1KsJzV276y2ttBKpxfojE+oQMLdE/YizLsYMobWhlAANPcFJWKs
         l5SxQbD5vMe1BjJZc0+2w8TcHgYgeGRZxS4svbu5rXjPi9kQfQugDIJ/KEf0VcGW4KNG
         Q+knRDOO+lqECgptWWJbRgVAh3OMIUBuTW3+Bi48WCbzcG7odz3/r9NFh9Q8SrSV/Zah
         ne9g==
X-Forwarded-Encrypted: i=1; AJvYcCXsLv7KovD3oq892cBmd3l/1kS5Ej1zSfVrIDXS4RHUw14rwkpGcrLOuN/ju6Cj6Od+9JoeLbDOzEAm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzagrrg+Hk90lSEAl0lLl2q1ksg/tbA/khaE0yyluxp+vIqp0eU
	HFSu3ld7NYRecM2KZ0KxOgD1sbtVHHCsqeDudNYbInroIVIoYpG7UyDHQhqpDyN1guM=
X-Gm-Gg: ASbGncv7gnPeEBeG0lUoas/rg1MLv1XgOzMK7Vp7PEfwmFL2wbQ9rc4txBMh22HDLob
	F/qdKc/MBmcZqGILG5XfJV4DyEyLrgTVC22wSVU8SC+yvGRbGyRcffotcIje8y/L5Fx7AMIWl/o
	10zFPXIX5hika7JubvoK4PLPR4sqOjLAV6aMiOPLXHUkp81J6Z8oj840K6OMdTq77RH89woxgPe
	seXLD8Ij43USKTeHObPfuo7/DjcWAvQIYHuH6As5rNqiXW+MSBxAVJkVt6zc8m66f9R3knyTQdZ
	S3WgygSiqUHCIXRsr05DRORhEFK2z0idOTzCg4xLpVVneSvdSvQtr4vAkL2m/fk+8asqKK9xXgJ
	EVMves9l9BG9czGl8K7/czp5eqZm0E+ccNV5A4EkrChrU/DGo/1+K
X-Google-Smtp-Source: AGHT+IHDmHt87Z4pWyoF707n1KL/8xK3Tw04QOD37t7QY9/Fch26OgA/ABV9exObOWcKcNLXM/hzQQ==
X-Received: by 2002:a17:907:1b03:b0:ade:328a:95d1 with SMTP id a640c23a62f3a-ae9c9b21003mr213021966b.10.1752735126446;
        Wed, 16 Jul 2025 23:52:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec55e1e0dcsm41040566b.65.2025.07.16.23.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 23:52:05 -0700 (PDT)
Message-ID: <135b57cf-76bf-4ed1-8392-eec43711801b@linaro.org>
Date: Thu, 17 Jul 2025 08:52:04 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jul 16 (drivers/vfio/cdx/intr.c)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-um@lists.infradead.org, Linux KVM <kvm@vger.kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>
References: <20250716212558.4dd0502b@canb.auug.org.au>
 <4a6fd102-f8e0-42f3-b789-6e3340897032@infradead.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <4a6fd102-f8e0-42f3-b789-6e3340897032@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 01:07, Randy Dunlap wrote:
> 
> 
> On 7/16/25 4:25 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250715:
>>
> 
> on ARCH=um SUBARCH=x86_64:
> 
> ../drivers/vfio/cdx/intr.c: In function ‘vfio_cdx_msi_enable’:
> ../drivers/vfio/cdx/intr.c:41:15: error: implicit declaration of function ‘msi_domain_alloc_irqs’; did you mean ‘msi_domain_get_virq’? [-Wimplicit-function-declaration]
>    41 |         ret = msi_domain_alloc_irqs(dev, MSI_DEFAULT_DOMAIN, nvec);
>       |               ^~~~~~~~~~~~~~~~~~~~~
>       |               msi_domain_get_virq
> ../drivers/vfio/cdx/intr.c: In function ‘vfio_cdx_msi_disable’:
> ../drivers/vfio/cdx/intr.c:135:9: error: implicit declaration of function ‘msi_domain_free_irqs_all’ [-Wimplicit-function-declaration]
>   135 |         msi_domain_free_irqs_all(dev, MSI_DEFAULT_DOMAIN);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> Those missing functions are provided by CONFIG_GENERIC_MSI_IRQ
> (which is not set).
> 
> Should VFIO_CDX select GENERIC_MSI_IRQ or just not build on ARCH=um?


I think this will be also resolved with my change to select
GENERIC_MSI_IRQ by CDX_BUS, but to be fair, I think that VFIO_CDX should
also select GENERIC_MSI_IRQ. My reasoning is that:
1. GENERIC_MSI_IRQ is non-user selectable, thus it is supposed to be
selected by Kconfig entries
2. Every explicit user of a code should select such symbol, not rely on
someone else selecting it.

I will send a patch proposing this.

Best regards,
Krzysztof

