Return-Path: <linux-next+bounces-7062-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A7ACE88D
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 05:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA9BB3AA39A
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 03:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5696D1F3BA2;
	Thu,  5 Jun 2025 03:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G/bOzB0/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7A6DCE1
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 03:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749092816; cv=none; b=hx17L4yN3kCytqcYNn2w0NjxZ/TZUGz2rA2xEhdx9pkOIwK1cd1k59imDGwgShlBDWoF3n7seGatBGcJUpVRjEHgwLgTzRc8MALyh/L0qlyLIuEQNpvjKXHXPoF6iP855vFlebHzdijgULxVtIGe6vuYMc/2ugTLDYDuvrq1NF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749092816; c=relaxed/simple;
	bh=O9AwzIwZfHgz6BoydO5kQ/1UHzgPXAQj9YP1fr37OuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pewXicznFKD6Mw7K2jXZDHW+46tHgGMBthVNojiOGLZWBWVZxjHwLCiOuXhAZO5gWQCG85VO7NyKliT2mivjjaCw3odhCogM6dCx6vsUcdWTZKi+yJ8aeIv8AR6U507pOWEzL8RKNl5/yxWupicUkWvEuGRHxAUI/3soGzX3QqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G/bOzB0/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235ea292956so5163615ad.1
        for <linux-next@vger.kernel.org>; Wed, 04 Jun 2025 20:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749092814; x=1749697614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4t2UVDwnAHbzrQWdQ39/KzVljZUdzMmdXbawjYiGCWI=;
        b=G/bOzB0/cqRgxtb5aXuZNvU0w7muNJ6CTa2SKcBYtJcUO1DvdmaFfMLARF3QPHnOH4
         wU1dIgLE7G9E5S22RzE8OqkTYzAfFRimmGeuBAPqveX7IbBtUq68BG6eM57af1fMZNpX
         nnRS7IKSDbRYF/a72iuXb1MVE2xIGkSFAqSKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749092814; x=1749697614;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t2UVDwnAHbzrQWdQ39/KzVljZUdzMmdXbawjYiGCWI=;
        b=KLPkink5KWcqZmvMoDkWcs8Qp6TXUw4BqlwEAgMwqb5nvkVHESsIeOiquvvZHV6HMR
         YdOz3SQBM12eWCagh5PQJEHug3n3tVzMudWx1Xn0x1BbkwY+aBdJiQfAvdnDuhTiGs7l
         BUr6KLe6TO4bSfKY9OJvIt35/DYDvHGkhMeFyxhVGOuwuUWsVojaUP2Zi4WYWJoPH63K
         YHK7z7jmAIe5jJtEhTb9/EOxIN1fEuX5LbHewoeUshNFQ/sGVdL8B9heodLnQUIYD8cG
         6h4jyKhvZ2gcKi3WTau0Nzzb0Zjo4n0jkg6oBCNccpzAJotmnNqFuAvpLP5Ik4Ai8Cv/
         PIBw==
X-Forwarded-Encrypted: i=1; AJvYcCVyzUt04CeGr8lWUedzUPzL9yaciLkSrRwnfsfrkCp9LGi/qWQkf5KoUo4Pwtluoxd6l8N4H3XP3ujU@vger.kernel.org
X-Gm-Message-State: AOJu0YxwQFwgXjtv9gl0JQbqkAppozyARrrB4I9of2HuvRioss7sMog3
	boUIcVo4z26WORe71gweOpQirOlNrJ6MG0LGQ2zt2AqUdflPaPZG1NgXq8mvM3W6+w==
X-Gm-Gg: ASbGncsmUtOptzOFPVGqMf9Tomm3mjqQQC38/jfloR0PtDxAsC+HFeJgPRPguG/1IV8
	pYWixelMSI2FChz2KtbmtJzapSRxffbeFQQ9hYlAILsVtcmkgPf1wLw8Ndv9Zzj36tOWYZOL58f
	7EJA1xtuVbE0lt0EQWQi4Z/LJz7nPn0wXvuHt2TH7X1g30uXxSgMAL+zbCEE5CrBQdmOWO3dsaF
	z0Nd1CULnt1yOji8YvvL0M4bFCj3O/JasXjauFq60xoULYwHaVAQmK63LgW/2Xu/yyF/2NqT/o8
	e4EdxXGheBOZuAxbUepO/QRpuDMW2GmEfgMyqkYto/p4JlsFnFksB+JO5S56iEs8NeEaU5hXWr/
	N9lGBWKw=
X-Google-Smtp-Source: AGHT+IEvMfVhgoBZZa5DxQt1cwYrY4cOQYyjIOrj279acAXaj8f7nQ8gMaAuCflTqI5Z+g2uDeGVeA==
X-Received: by 2002:a17:902:dac3:b0:235:f298:cbb3 with SMTP id d9443c01a7336-235f2a81120mr19047095ad.18.1749092814089;
        Wed, 04 Jun 2025 20:06:54 -0700 (PDT)
Received: from [10.230.4.135] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8af9sm111024445ad.47.2025.06.04.20.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 20:06:53 -0700 (PDT)
Message-ID: <177ca3fc-dc81-41c7-bfbf-556ef64ff7e8@broadcom.com>
Date: Wed, 4 Jun 2025 20:06:51 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the broadcom tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250603122012.4ff9c5ea@canb.auug.org.au>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250603122012.4ff9c5ea@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/2/2025 7:20 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the broadcom tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/pinctrl/pinctrl-rp1.c: In function 'rp1_gpio_irq_handler':
> drivers/pinctrl/pinctrl-rp1.c:385:36: error: implicit declaration of function 'irq_linear_revmap' [-Wimplicit-function-declaration]
>    385 |                 generic_handle_irq(irq_linear_revmap(pc->gpio_chip.irq.domain,
>        |                                    ^~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>    f4b3c1c25d39 ("pinctrl: rp1: Implement RaspberryPi RP1 gpio support")
> 
> interatcing with commit
> 
>    14ebb11ba895 ("irqdomain: Drop irq_linear_revmap()")
> 
> from Linus' tree.
> 
> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 3 Jun 2025 12:07:49 +1000
> Subject: [PATCH] fix up for "pinctrl: rp1: Implement RaspberryPi RP1 gpio
>   support"
> 
> interacting with commit
> 
>    14ebb11ba895 ("irqdomain: Drop irq_linear_revmap()")
> 
> from Linus' tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks, I have applied your resolution and pushed out an updated branch.
-- 
Florian


