Return-Path: <linux-next+bounces-7772-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 107ACB1603A
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 14:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 412B61884B38
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 12:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49C042A82;
	Wed, 30 Jul 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIxdnV8k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC2D2E36F9
	for <linux-next@vger.kernel.org>; Wed, 30 Jul 2025 12:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753878152; cv=none; b=E2d3y4Zv/2O6X//gZw6NgZlmTl+fEcJkeXTrk5f5SzU4VAb++rVJAESZ3N0VCaaZH+sgF6PIeAxQRD1OJnzhK7dIiRBAqTaWoSVqZxnLwfRqUndMVYcUj6if4kjL1+CsF3PR1Jg8SEZyW9iVNaH0iCJDp/wGFQHay+prb8NtcWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753878152; c=relaxed/simple;
	bh=EM2SeeEDeL1kFD6kgQfv5p7+jZ0ToNtVz+ZdTeIR22g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxQJ0YeyV5S6MgZOzddX+ab2Vcb0+u+2gKhBeVfe/+e37Z1DC9y4QLFTX2E/Ztt3KvC70wV19w61Na+EApPHUT9St6BXQD+ORh9F1a8sGn4v56AUMCrru8SqQ9/vbV6fQSeRKx9rYHL5TBDJljJQQiIsLidJ3RM16TbxCpw5ibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIxdnV8k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so63135095e9.0
        for <linux-next@vger.kernel.org>; Wed, 30 Jul 2025 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753878149; x=1754482949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUEKxJ5rgjXe1YyHgv4NRENeR2LO4lvKY16JCFZwTMM=;
        b=LIxdnV8kCrMKGgqQ5Bv/xbqFtCQzWjjwm/QU5/ONatS7oxPEubepeB+84Q8x7o+Pve
         LRRgyJLZogPyRFOnnjte3+ofVIWrzVGNWYFMNeHrsYf0rJl3CM/GwZ1LBuSHFAe+d/nO
         LohKWbka6nTwCGhpQhac0CzQthPfwJe4SdZmhxEBEuC5JBu405uvS8SzMFD5o4O0vuop
         8T+hMhD6VK3vodtT2CmTbfjTRA57kfJbRrLQOhBZc85ZAWlyiv2IrgMCHrUxUa0yCVyY
         RDfpzCpzDlFj2P+BjJL5ND4Cxh04piLFzjTrpMrc7IDoaWfUalUvgS4qjpJnqWs603a7
         QJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753878149; x=1754482949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUEKxJ5rgjXe1YyHgv4NRENeR2LO4lvKY16JCFZwTMM=;
        b=o5zxXMgp3PU+iiUA9ihTuturlKOse67gBPUBfAiJyH871k/5UtYc+e9qqCFq0Y2jYK
         laS6+kshzoZuzjdTwfVShSdp3lxnkYS+Wo+iAUqelJH59wSf+cqpPlAC9L2WuCeuySlW
         T9p8QneCC3YFYduzxyaAfKoDQ81DVm/8cQVQTBf8mCTMeFGPUBCJVdpr2rUt/jUdSUvH
         scql3lIDP+Z8mog579V09mZPb8AI+8fi2tSWW367mSGdNObG5tT7voHzeuymffUERcjI
         5+FSa3Tz5esdbvSC1TY/QpKZGWs9rK31kucoS5rRIfjX7O3gN14/OHRDW42B1TIr7gYd
         zGNA==
X-Forwarded-Encrypted: i=1; AJvYcCWUCpdOtWxk0ZiHQhgelUhAE8rI75H3MZvP2WG5pytSwEWGNmnQcdrWMrYBnsfWKwi9t7onxY3I5y7p@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kfLcdXlmpy7YxZ5hkv8/+1st7VKg10212xz8GV4MRQCqjxjo
	ekRpPLc9i3yx/ed25Ttq3OK2elNPSIXlm/UklhBOJGB9yRaYF3jUg0hHuT0L/Sm6tcI=
X-Gm-Gg: ASbGncuV6mKV47tEI8VknQIdO+gzW1ybh35nSBeqXaeeZ7QKlYOmFVPGLFUWS6KOnZ9
	piCtuOMFMqCRmbpHPhdnvROMHjVzWEdijOe6QX3uWGzrOqdl4At/t5n2Zo5w/vhu5NThJTYIAVT
	GpNBBOa6UmcaaKnmJXNbVudaCwKQF0sxMI9/48LYUZpbaF+goiLqolnbxsYqHP/R0NKVlZsf3v7
	5YZX8B2Azfl5GlQC8S0xCyDtxr5gAA+tGhRgXO6nVBOrKY7pP5PLjK+ktvuxiJEHfa702bctvDA
	r3UrV4tC6vH91WOkZVQgCudKh3C1hVW53esG5p7RcciCxUHskapXGf2XOMRCnuzaw0VhoC6IsM+
	O0qWgiZcjzEbGGU/rnmnQkUjhFZC0F7mVB0c5kXxti9css2MjtXTvAncEb8x5ZA==
X-Google-Smtp-Source: AGHT+IFHgIPDAvCDwsGBDdTU9OFJARdnfPOtF5aFPjgRrA/x3zrrr25gAt3sbRb8qonK3Xud+Sbecw==
X-Received: by 2002:a05:600c:1da6:b0:458:6733:fb43 with SMTP id 5b1f17b1804b1-45892bbf7f3mr28149845e9.19.1753878149097;
        Wed, 30 Jul 2025 05:22:29 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4588dd375e0sm45991465e9.2.2025.07.30.05.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:22:28 -0700 (PDT)
Message-ID: <e8e2bc93-1639-433d-9689-d1ce9f28b877@linaro.org>
Date: Wed, 30 Jul 2025 14:22:27 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Donghoon Yu <hoony.yu@samsung.com>,
 Will McVicker <willmcvicker@google.com>,
 Youngmin Nam <youngmin.nam@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
References: <20250716160809.30045a56@canb.auug.org.au>
 <20250729114037.03a2d884@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250729114037.03a2d884@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/07/2025 03:40, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 16 Jul 2025 16:08:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the clockevents tree, today's linux-next build (arm
>> multi_v7_defconfig) produced this warning:
>>
>> WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x324 (section: .text) -> register_current_timer_delay (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x4c4 (section: .text) -> register_current_timer_delay (section: .init.text)
>>
>> Introduced by commit
>>
>>    5d86e479193b ("clocksource/drivers/exynos_mct: Add module support")
>>
>> and possibly
>>
>>    7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section mismatch from the module conversion")
>>
>> For this build,
>>
>> CONFIG_CLKSRC_EXYNOS_MCT=y
> 
> I am still seeing these warnings.  The above commit is now also commit
> 
>    338007c44c7f ("clocksource/drivers/exynos_mct: Add module support")
> 
> in the tip tree.

This should be fixed now.

Also the clockevent branch has been reset.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

