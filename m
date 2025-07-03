Return-Path: <linux-next+bounces-7335-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DC4AF7410
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 14:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8691886931
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 12:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318FB2E6105;
	Thu,  3 Jul 2025 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0QF0w4f+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50182E0400
	for <linux-next@vger.kernel.org>; Thu,  3 Jul 2025 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545694; cv=none; b=oUPINlHfaHjLEmmm+NH1jEK2cNvHWHpBXGuk8eoulBbJP+4STcoaDHfUIGgsn79l6E+Q7t5mGLa58iJaoi4n+mbSpwgX5ZI/Ld80+bLD/9HBULUb5bMWoH3vKML+eJmp0p7J4Mevm9gQYX7cQ89sNXl/0qyiuMbeT2qbB7R4HAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545694; c=relaxed/simple;
	bh=PtpH5wJVqKYW0rZnDY/be1PL8Rh1jP1zsGBqF++aL/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHQd4xQFQhjs7+HpIMoL+A5cSKCnl7mAW2/H7cR4JDwPN6yz4+GitMmEYPvk8JqKVn/BLEkgMCN2/UYOjYsTqo9XpK4NxRUVV2llTMjECDpXhUnLmIdkgM+NK8MCuzhq3pQXvulMdeR8Z+834Sc2nVEm3P8BHsZYRZUlk/h6kO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0QF0w4f+; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-73b5350980cso547350a34.1
        for <linux-next@vger.kernel.org>; Thu, 03 Jul 2025 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751545690; x=1752150490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQOX2bCYGxP3nqwfchundKWBgCNNg0w16agVTjZVQEI=;
        b=0QF0w4f+fw8UC700Wv7UJ+VBlcMTygaM7mZjBnb58RZFwXrMOSy6xDCQp8oNaevcbj
         4vCXTMMEeLsaEjis2iSS4RaATrQjK6j8sQ25z/xfjzxbRN7fnEHIqNiCXSImjL2oKPvL
         a5BZpAURQHLsQqC68qRP5zGK5CUe8OlL9WY/zLY7VMsRR/mDDjXIWVl3h/Ck+afkH2y/
         WhgZFU2Ju31VnTQl6KHCzffl+wz7ky20huPN+cSb1luwFhfL23WzkrUcHNjey8cArkEr
         k80EfZOVwOarv87EnuEPSeyOAVIJjUPfrL/ea8Wob4T3rygOt4+wsFODSxtPFMhm5htF
         XmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545690; x=1752150490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQOX2bCYGxP3nqwfchundKWBgCNNg0w16agVTjZVQEI=;
        b=NgP+y+pK/uTamkRPm2oblOOtkVgMVj0E6+HacQUM4BciqyixBClycUE6h50KiBGYQ6
         Lwe7XgNw8qnK0iYOqGE6gHwMrVPp2D1ZRQxMrs4ZnE7aRYpXYEyTdrBo0SrfRGR9wCJd
         F0SpowCkwo6RGCIXVhblT3otbpBfmz1YzG9tb++TpkOBO3ZACAXnfakjRNebd3dPimwz
         UMtWjEZIvHazXjcUTHov5kHxNFcGJErHPI+5nFCvOmzEsG4ZYP9JYi1EBfzB5jP7ItOc
         lAgtZxUxhlf0lbinG9LM/OwwhNYeYmGnWI9BnR0XvgRYwmT3T/7VhNI105jZbvp1tBqj
         Mzjg==
X-Forwarded-Encrypted: i=1; AJvYcCXoSUKAxxRn2Td9Pg6MP7zi4XuZnrSmvEyyWcD58JyejfTpsDpII09vX834aqlZs1ETLgVpPoy4HvU0@vger.kernel.org
X-Gm-Message-State: AOJu0YxB/SDC/p0mAvoQZfSad3evgQJEykOV3ylV4/rOa5x78qQLDLWM
	Ih4Ms+c9i8Ew+wvNieqrtwab1Mw6EBYMYUc2u0ZptGrsisXE4Oo2kZo+yNLNfvZxK1M=
X-Gm-Gg: ASbGncuqwfMQBSP5roochUWwGA5sna25CFhdPE8eNiP7rPAo9CQmFhR7ijfU3XzSg43
	H9uHPDPxPE1loJAC0UOlKgSmhUDBwkNUTxlY99AwM91FjGyl1FEOS9lURqStMITtTL9kUIzAhTV
	im2YazPbVLo7fTLSSEu4+WyNvtA044do7OyMSEbw5Q9N2gIh1Tke/AsqFc3wiofMHbNnl4M2YZP
	N4j0VuXhL4Xma4jpa7FWr3on0KKevrL+A4W9T+vUzqKZNnfRcsWpdC2yqKocwwdTCURkdtrc7Ng
	6o2PwHj5RhFjhapyQp3Y8vYmPSoRuUfkuJP0INh7DKt7qTQQBt7a2l473uED7LCPZgwhTR4+Nts
	+hd48KP0G1fk23ybr2srhvddifH4gJcglMGkIRds=
X-Google-Smtp-Source: AGHT+IGqc5LcxnZGH4pFB8Kic92Bfiq8ngbiGeDjZRrypBSEyQOjixQHs54dBB6M5/TaIr4sv7Kp7A==
X-Received: by 2002:a05:6808:2e47:b0:3fe:aebe:dde7 with SMTP id 5614622812f47-40cf2f297a2mr1385913b6e.2.1751545689623;
        Thu, 03 Jul 2025 05:28:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32421047sm2955454b6e.41.2025.07.03.05.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:28:09 -0700 (PDT)
Message-ID: <b0b0443d-143f-4e41-b8b8-91c6726e838f@baylibre.com>
Date: Thu, 3 Jul 2025 07:28:07 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the iio tree with the spi tree
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
 Jonathan Santos <Jonathan.Santos@analog.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-iio@vger.kernel.org
References: <20250703163824.2f08d866@canb.auug.org.au>
 <20250703093122.00000684@huawei.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250703093122.00000684@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/25 3:31 AM, Jonathan Cameron wrote:
> On Thu, 3 Jul 2025 16:38:24 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi all,
>>
>> Today's linux-next merge of the iio tree got a conflict in:
>>
>>   MAINTAINERS
>>
>> between commit:
>>
>>   e47a324d6f07 ("dt-bindings: trigger-source: add ADI Util Sigma-Delta SPI")
>>
>> from the spi tree and commit:
>>
>>   0dd88eaa7126 ("dt-bindings: trigger-source: add generic GPIO trigger source")
>>
>> from the iio tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
> Thanks Stephen,
> 
> David, do you prefer these merged or kept as separate entries?

Ah, shoot, I forgot that we had added the gpio one and just made
one section like this.

I think it would make sense to also merge the new adi one with
the reset to keep things compact.

> 
> I don't think it matters either way in practice though this is the
> more complex merge (the other being just putting the blocks in order.
> 
> We can put a note in the pull request on preference but ultimately Linus
> will resolve this however he prefers! 
> 
> Jonathan
> 
> 
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc MAINTAINERS
>> index dd764b947dab,d0809d62ff48..000000000000
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@@ -25333,19 -25201,15 +25341,20 @@@ TRADITIONAL CHINESE DOCUMENTATIO
>>   M:	Hu Haowen <2023002089@link.tyut.edu.cn>
>>   S:	Maintained
>>   W:	https://github.com/srcres258/linux-doc
>>  -T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
>>  +T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
>>   F:	Documentation/translations/zh_TW/
>>   
>> + TRIGGER SOURCE
>> + M:	David Lechner <dlechner@baylibre.com>
>> + S:	Maintained
>> + F:	Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
>> + F:	Documentation/devicetree/bindings/trigger-source/pwm-trigger.yaml
>> + 
>>  +TRIGGER SOURCE - ADI UTIL SIGMA DELTA SPI
>>  +M:	David Lechner <dlechner@baylibre.com>
>>  +S:	Maintained
>>  +F:	Documentation/devicetree/bindings/trigger-source/adi,util-sigma-delta-spi.yaml
>>  +
>> - TRIGGER SOURCE - PWM
>> - M:	David Lechner <dlechner@baylibre.com>
>> - S:	Maintained
>> - F:	Documentation/devicetree/bindings/trigger-source/pwm-trigger.yaml
>> - 
>>   TRUSTED SECURITY MODULE (TSM) INFRASTRUCTURE
>>   M:	Dan Williams <dan.j.williams@intel.com>
>>   L:	linux-coco@lists.linux.dev


