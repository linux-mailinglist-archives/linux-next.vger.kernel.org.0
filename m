Return-Path: <linux-next+bounces-6901-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92100AC046B
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 08:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C769A218F0
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 06:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF9A221558;
	Thu, 22 May 2025 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZYzV3fR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9FF221567
	for <linux-next@vger.kernel.org>; Thu, 22 May 2025 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894514; cv=none; b=NK7/aXSthXXOPaN0hNFRpo3m9mWu/cDAgTufq4Ls2ai1ZfMZxQQgfTY0klqhC6y6V0VR1Nkt67R3KHCxxyBRJzXITeHSsUUg+iv5jPVI+ZhN8LWw/iqX0SeMK4dyw/wf82OYNdwBTnXp8WRQ/rQ7eHApGBa1pTFwlCar0uBz+XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894514; c=relaxed/simple;
	bh=QTnu1Vg9plPSBCYleamIjI0RVzHfQYggAZKE5FDJTdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kubW5RYoBjyJpmFqx9bmipVqMSuZ2Tq3N/PDJopfK6aiv1zEUThqhjPvKgN+vtWuw0YZZr1FtXVtEa4B3ULj1nJQyBYcj4xHnutPve5SFNtFM/Zokl8vGwcVcdZ3Gz9HLcl3eH91Ja7ZOe/Vrdl2zdg4qkTfdrtEpY3xbj04TVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZYzV3fR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ea0f72f4so3821905e9.0
        for <linux-next@vger.kernel.org>; Wed, 21 May 2025 23:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747894511; x=1748499311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uG8OshWifuyuMcwd12q2qjIreQ5QpE1JSphDjs4WrDE=;
        b=KZYzV3fRnj/BksGDgC2DdNlGGa4BoKe44y3I2l/+2ZJO2zZ5AI/grhWDiOjckyH89P
         ZlhcDAf2wQyWjB7A1r5kE1QAuErayiOjsU6G0cMFoiPDppRvoW+g9oDBP05f2X7BsvV+
         1mtE3BcH4TULRJ5U+sIidtGnX1UQQKxhNgEozAg0QmMTDHhVHVrjMe5KNQhrhuIMRg/8
         9QfwLUCfPYitNAtlitq64jS3YATZpbVmwB3SgawcD1ZKnL1H6MBlNrt++eB31M+OsaI3
         WowX+OfnDNwjWd9Sm7SQu6W9k6ICGECzqS/YWHhSppu95eLRxVKLIqv2C1XCdrxQuNFc
         zARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747894511; x=1748499311;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uG8OshWifuyuMcwd12q2qjIreQ5QpE1JSphDjs4WrDE=;
        b=psU14+A4ctZuVlzkzN6ZTg8tm12egjmloWVpOabGFwJM2qdSRNuvIZXkBCDEPbbJFI
         A8xEL4iSA+i5axJrZKxejgZ14tadc48/Jqtq0SbYinBBDf34Npma3YJ/UaEGjNKPFLMp
         SUWWNAIcvTGSyYN0M+UVPU+IdCwBzGR613u+V1ijSBcueHhyiwtzPlP4dlmYCk7fVq0Z
         awKXekmQOBCmYa+xHZFRfXjM6nV0kcDiAaKlJjC3rzJd7Y5N89l2NLINh/L1I3ehXJWL
         Dbm+vplPlWQrOqvHgCGx0uunGOHne/kkWEHUOouUj4kjrL5Z1gCAteiNUjzDvZkqvZZa
         ujXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAAonSzg9lskNRuYG9j6i2FCAhaVXIbvQDfgRdtO/dp1+gQXl/wyUAZUWoT6AWouo4eNf+bkPf8Ob4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoem0WxH18FtXNmyn726uOzgzyCrwExLf86vrB0lkbeCd3E+kb
	fGuuk7C1by4LWmCBRq06H34QImzPUMhBT/Dhz2IK1ypN+zOPdj/7JfB6BEc93tgengo=
X-Gm-Gg: ASbGncsTGilH/5DJa/Te11nffxQwlGZbWye962EZVDkTZRzinYQNDb7g1ejEBQHEnix
	vrAJ8NceNrp2LqbhYzo0ZPfFXXCKE5hbZHORZrIhjUfH2/MHxpcE758Uqclk2GcCnXmvG0rNN5x
	XiccAePV2V2fvr1j9CdaQfWYCi7E/7HTH+KcdcVM+mpiVYlDe6OFeJHO55QnyrIHdKrbxPnoDHz
	eyXWTc1RPrhOaDnd8U6WLdfGddS5u3ayjdOo5bgUhoC+AwGbYcold+NuM9dCKT43WIXbXqTxz3m
	9i2ZX9ZBYzSO9gjCRS8bLF0AtjWNhDpQSzraVVr0P4SbYKmhuON9D0tBFBrez8eH9mB7UEf/N7w
	XYuL5wQ==
X-Google-Smtp-Source: AGHT+IEM9uv1fX2pmqD0YCviR3QYTH7GcWYcWn+mgg1vALiqzepMG4TqCT5yxiQPxW3h/H0yGin7Xg==
X-Received: by 2002:a05:600c:3545:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-442fd67590amr76834135e9.7.1747894510664;
        Wed, 21 May 2025 23:15:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm98459055e9.4.2025.05.21.23.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 23:15:09 -0700 (PDT)
Message-ID: <455ef8b8-dec5-47e0-94db-611ac399903b@linaro.org>
Date: Thu, 22 May 2025 08:15:06 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the i2c-host tree with the arm-soc
 tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexey Charkov <alchark@gmail.com>, Andi Shyti <andi@smida.it>,
 ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250522121726.0a4350fc@canb.auug.org.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250522121726.0a4350fc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 04:17, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the i2c-host tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   47cbd5d8693d ("ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in maintainers entry")
> 
> from the arm-soc tree and commit:
> 
>   3887d3f64260 ("dt-bindings: i2c: i2c-wmt: Convert to YAML")
> 
> from the i2c-host tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.


Arnd,

I forgot to mention that in pull request. There will be a conflict in
MAINTAINERS file in ARM/VT8500 ARM ARCHITECTURE entry:

 3425 ARM/VT8500 ARM ARCHITECTURE
 3426 M:      Alexey Charkov <alchark@gmail.com> 
 3427 M:      Krzysztof Kozlowski <krzk@kernel.org>

between multiple trees - arm-soc, i2c, devicetree and pwm, because
patches went through different trees. This conflict will go to Linus as
well.

Final resolution is like:

 -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 +F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
 +F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
+ F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml



Best regards,
Krzysztof

