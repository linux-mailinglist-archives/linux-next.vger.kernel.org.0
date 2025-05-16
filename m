Return-Path: <linux-next+bounces-6809-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872C4AB9862
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 11:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ECEB9E59EB
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 09:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13358227EBE;
	Fri, 16 May 2025 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AnMboYw+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB22224223
	for <linux-next@vger.kernel.org>; Fri, 16 May 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386713; cv=none; b=QLDKhcX/w34bw3rbm5rqwPIg8hgy2lnF0JZz7yMEH5ZmWA12+T1lhatvuRiUwGGfKM7tNVm7tiYJoGWGeM4PvPQy0rOoRQfbGHKiQtiFfs4hF49T70G413GGTaTXeXe/m0AGuZSl8TAkXF03bWTWRXSzz5a6xMetLXdQHpj2Y00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386713; c=relaxed/simple;
	bh=scJc5ntLqs5pH3aPhx3ppFySMhN3SIrwwumf18q+O8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mp3Xwy3vZ2ev7iKQaFOULGOCGYDxL6HBinqB3mgOLSnMUkTAAagbRNKmFr/8NOAJ2JuGqPoe2SQE28QuyGzjm4IRdP/PyHO5mBIMb7UZqRDh2m4P4Z0n6hWTbqiYrL5SM8TWS5jOLkqX8biXH7SkquWv7JLSWSgKhT94v7B+2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AnMboYw+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso1178781f8f.1
        for <linux-next@vger.kernel.org>; Fri, 16 May 2025 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747386709; x=1747991509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjEZ5Ge0QfE2Uu3iAKcOD88CCG1vBxpHSQayKs9W9g0=;
        b=AnMboYw+yPMJhp5Y3bn0sov38mnShcAjsMbU7oxeeT270mQFuUO2y0CHc6COzj5qhb
         cXWn/7w6YHRu2j7p/Q2t8ItwDzJafm080sv6pcTp+mNJALrP+RoDMRpZWDp27lzrUpT0
         kcV4nG7WfDmGFHLsp5Z7tf3fCVZ/bG7LQzgnTYO8828Jd3uOAaRPWrzJGIE6VFI+fpYG
         UpBhSWxvkX9xpJYuWJYR4Xs/BcmobDtNyODr7Ry3vPIuPm8h1SmKnETQXOwhnLL+UF1n
         P2JDx5AqO5XbddAniHfDKurxH/KKwmQ54JkUHyHVi4uzzCSUkmwS/0mjU2W0v96n2Zsi
         PC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386709; x=1747991509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjEZ5Ge0QfE2Uu3iAKcOD88CCG1vBxpHSQayKs9W9g0=;
        b=HGW+6jelLqjCJuhWZ6D7qGls/pfuECCw2UYQ8MTIkR5D7/E0kvNfTXl4I1TljPe2c3
         l0PFHUmzY00mK9CGp4hDQw/cZwdHny3hnhFfoPJ4tL4W7lMhxvp1+fY0OiVbfgE7kDUU
         D1eL8fxpYhL28DbbVUzKziNN9auT4kdp8woNIFiocTIqbU9I34T8FCCCpxUFuKjn79WD
         rM36kFgsIRN/OcJ0ipR9opvHg2eaxG8T3WqKWH7FiSULXmOYwAUgQ5JlQXeZBADOFGXS
         uxOuZpnSZYQDfWR7wAVhkEAiOdvWKQhdbb38Zh9wfURlNcPBeeN7h/nhEAKP4/Zfq/3h
         TeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu35JyzEgbp2GFcQCHZyXrr1j1fFLZq5ejBGcuroHUrT7d5R6NUZZRza/22qb/D7K5DvYklF2ByB7I@vger.kernel.org
X-Gm-Message-State: AOJu0YwHiRYHLlVVi4ERXWG5CQtF+xlWTg0APuuXbkuGDW+FWSoMQdrg
	5VkihuCtDdbggLHXGuyJYHc1jFiVy7YkZ5C2bIVmRMQ/0ZYl9g2RTIhEGgvo66ShDVI=
X-Gm-Gg: ASbGnctsLGTNtnLFAO3QirbUELWSGqQoHLy6sPiKR20jNlf5sGRP4On0RJSLF+x4ySR
	XGr5DX1wiOGJ70DOhPwKOLYBi1DGy7+06LtkE8VnxZYb1Kr/C/tn67bOcHyF26tXb3wI8cI2SQK
	nu3LPcJyFqm9+MQl44PC53jkwJ3ji84oRTV8Wf+DQGVtrR28IO9qgdJUfW6poSZtiVNs1vbLSko
	4+MD+AqHPiuYdKYd3XcJQrwjp8uGzF46l5WKUdZiOfSwHnBqaS3J7K1pBCFfI+buwqBxCsN7dgR
	LX291aJJ1uG5eZFYC2/m3D7+RNT5xi8FB2hp+2XZXNLYbvqzZ+AE2m/wvyp9xoj0Od+XhEEAHhV
	eaR5XF5hDNk/s
X-Google-Smtp-Source: AGHT+IFNUTuIstQezL6MQaChP/LsR57dqefIl+e5tbhmk79x9d9G3qMwbPat+AN49vK7UttUY9Y0Kg==
X-Received: by 2002:a05:6000:400f:b0:39c:1f04:bb4a with SMTP id ffacd0b85a97d-3a35c808b27mr2666079f8f.10.1747386709362;
        Fri, 16 May 2025 02:11:49 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca62910sm2246831f8f.50.2025.05.16.02.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:11:48 -0700 (PDT)
Message-ID: <de1e4c74-2ee6-46fb-b058-db3bb72bc346@linaro.org>
Date: Fri, 16 May 2025 11:11:46 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250516164342.74fd3f15@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250516164342.74fd3f15@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/25 08:43, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the tip tree as a different commit
> (but the same patch):
> 
>    1732e45b79bb ("genirq: Fix typo in IRQ_NOTCONNECTED comment")
> 
> This is commit
> 
>    0128816c42b5 ("genirq: Fix typo in IRQ_NOTCONNECTED comment")
> 
> in the tip tree.

Fixed, thanks!

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

