Return-Path: <linux-next+bounces-3588-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 093E196B68B
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 11:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AB401F25131
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 09:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5811CC16B;
	Wed,  4 Sep 2024 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4AVUaFf"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740D01CCB24
	for <linux-next@vger.kernel.org>; Wed,  4 Sep 2024 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725441891; cv=none; b=EQH15kxb7Lf8w3thbZ6tg4OJo9jX1IMNeeTesRGm/uamxquML1tVj+WnOiIjqoPvccjmIq/xqB6IKrHsTJxM9AF72ifolrauE415I3V20b2d6ZJv5p/dVss5MqSDuTJIXcWiuhdVsZhLojRdkDN+eNvNViAOU0JP9wYKUNuhGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725441891; c=relaxed/simple;
	bh=4nxcKmU6jajiBD6KoLWSyQ9jwCUxguiTh+f/ZG7gKqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGpuEe9n1+Fdu3nCCggX6Hlfmy9cIkTyvWxrKADpTzzC+lSqyH1A/AdBm1dEcXHxJmI6Ipt0g+VGIWFN0GzlkYzcccPdUSb72XVQCsRExmKfRhztrStdXlyll7B+XixNwnfKZ9HztW2yVENs3adoO9C/RL+fmdaZRvBlSZjyqnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4AVUaFf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725441888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGFQMJUPYsNlq0LAJVuMgJTw6GHx1CtdiS4TMfy5EFE=;
	b=i4AVUaFfOnnLmSzYW84ecgX1CxhjpPDVzXWSIc7ZgQaQK/744Pn4TE+bQJT03s4/joigJZ
	yZYK1ec9xOI10vh5VYRHCBwXmwvP60deOoW84NYbX/uUea02ooV9Jnu54AYgvZovTvsogm
	Q8YEYynPMii3Xg51/4ntJf7YOP65XCI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-8kaftFtHMZixBKi-uv4e2A-1; Wed, 04 Sep 2024 05:24:47 -0400
X-MC-Unique: 8kaftFtHMZixBKi-uv4e2A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a89c91e151dso75114066b.1
        for <linux-next@vger.kernel.org>; Wed, 04 Sep 2024 02:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725441886; x=1726046686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGFQMJUPYsNlq0LAJVuMgJTw6GHx1CtdiS4TMfy5EFE=;
        b=DpLB0JcQWNcz6qFbN3+JmdvO7LA1R+7/Fejy/U1H9f0ewJK8kkeYeBXLwby0qmiakj
         vIMloHGkyVuXZm3CcnTACZlLwxRZWeitu7hPxCn+41LLRU/bGQdmfvnSAhLb4nM39fdr
         AxKfxko9osGjd1RHChqyqg1f/TaQVyDMFMwCXe5lLp96JTtig0ECvKPSOad01ldR91d3
         3sxlYYZxmfQTj3SV9WA9Y2udA+zLuE/FUQ8CkNa6qYBTI1Ig4nGTULZMGo8cNvxq54gd
         7IGxZfkP2vtOy0zqiSLFTdTZAD6ni1aGNpkVw4Fe1hfJLkE2xh4HRFamlpCVmeMc3pUC
         AflQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGlHLhaLFAHbZw46soJHzkbmWkYSUNRYeUwIeDaJMb//mDBRHCEks34rF3h5W0SpImiEpDfNOZiurh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xFuKxvDO6iQS93PA6Z26FqsgwvMFDULGTnQ1SOylNJ+5wJQ8
	bvdMCKWUj5WWq/laX0DItTDv6OhpzL/P2EwSOImmrvzRcAIprUPenH11ypu/OwjtVzgznB8v57E
	YioLTW9D6+YC0FwZWg7nQKA61pu6srFDIMYlMjtmJsasHpLsntlIULH4fjDc=
X-Received: by 2002:a17:906:c146:b0:a80:b016:2525 with SMTP id a640c23a62f3a-a8a4301f534mr128277766b.8.1725441885906;
        Wed, 04 Sep 2024 02:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDsGede9Yc2gEAKLKlEg1/e3/t0ltuY4f8Y/xq3t26rMqJZZIeQL9fQPB76Fol7KljyrNR4A==
X-Received: by 2002:a17:906:c146:b0:a80:b016:2525 with SMTP id a640c23a62f3a-a8a4301f534mr128275866b.8.1725441885392;
        Wed, 04 Sep 2024 02:24:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d7482sm779964266b.165.2024.09.04.02.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:24:45 -0700 (PDT)
Message-ID: <f31f8bea-95da-4d32-afe0-9c2abc69d833@redhat.com>
Date: Wed, 4 Sep 2024 11:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the extcon tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240904152421.4e0ad2b7@canb.auug.org.au>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240904152421.4e0ad2b7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 9/4/24 7:24 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the extcon tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/extcon/extcon-lc824206xa.c:413:22: error: initialization of 'unsigned int' from 'const enum power_supply_usb_type *' makes integer from pointer without a cast [-Wint-conversion]
>   413 |         .usb_types = lc824206xa_psy_usb_types,
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/extcon/extcon-lc824206xa.c:413:22: note: (near initialization for 'lc824206xa_psy_desc.usb_types')
> drivers/extcon/extcon-lc824206xa.c:413:22: error: initializer element is not computable at load time
> drivers/extcon/extcon-lc824206xa.c:413:22: note: (near initialization for 'lc824206xa_psy_desc.usb_types')
> drivers/extcon/extcon-lc824206xa.c:414:10: error: 'const struct power_supply_desc' has no member named 'num_usb_types'; did you mean 'usb_types'?
>   414 |         .num_usb_types = ARRAY_SIZE(lc824206xa_psy_usb_types),
>       |          ^~~~~~~~~~~~~
>       |          usb_types
> In file included from include/linux/kernel.h:16,
>                  from include/linux/cpumask.h:11,
>                  from arch/x86/include/asm/paravirt.h:21,
>                  from arch/x86/include/asm/cpuid.h:62,
>                  from arch/x86/include/asm/processor.h:19,
>                  from include/linux/sched.h:13,
>                  from include/linux/delay.h:23,
>                  from drivers/extcon/extcon-lc824206xa.c:20:
> include/linux/array_size.h:11:25: error: initialization of 'const enum power_supply_property *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
>    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>       |                         ^
> drivers/extcon/extcon-lc824206xa.c:414:26: note: in expansion of macro 'ARRAY_SIZE'
>   414 |         .num_usb_types = ARRAY_SIZE(lc824206xa_psy_usb_types),
>       |                          ^~~~~~~~~~
> include/linux/array_size.h:11:25: note: (near initialization for 'lc824206xa_psy_desc.properties')
>    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>       |                         ^
> drivers/extcon/extcon-lc824206xa.c:414:26: note: in expansion of macro 'ARRAY_SIZE'
>   414 |         .num_usb_types = ARRAY_SIZE(lc824206xa_psy_usb_types),
>       |                          ^~~~~~~~~~
> 
> Caused by commit
> 
>   e508f2606c0b ("extcon: Add LC824206XA microUSB switch driver")
> 
> interatcing with commit
> 
>   364ea7ccaef9 ("power: supply: Change usb_types from an array into a bitmask")
> 
> from the battery tree.

Since I'm the author of both commits this is my bad, sorry.

Stephen, thank you for fixing this in -next.

Chanwoo, Sebastian send a pull-request for an immutable branch with
these changes:

https://lore.kernel.org/linux-pm/ez5ja55dl7w7ynq2wv4efsvvqtk4xyalf4k6agtsuhpgrtlpg3@d6ghlle4cu2q/

Can you please merge the ib-psy-usb-types-signed tag into
extcon.git/extcon-next and then apply Stephen's fix so that Linus
does not get hit by this build error when he merges the extcon
changes for 6.12 ?

Regards,

Hans




> I have applied the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 4 Sep 2024 15:19:19 +1000
> Subject: [PATCH] fix up for "extcon: Add LC824206XA microUSB switch driver"
> 
> interacting with "power: supply: Change usb_types from an array into a
> bitmask" from het battery tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/extcon/extcon-lc824206xa.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-lc824206xa.c b/drivers/extcon/extcon-lc824206xa.c
> index d58a2c369018..56938748aea8 100644
> --- a/drivers/extcon/extcon-lc824206xa.c
> +++ b/drivers/extcon/extcon-lc824206xa.c
> @@ -393,14 +393,6 @@ static int lc824206xa_psy_get_prop(struct power_supply *psy,
>  	return 0;
>  }
>  
> -static const enum power_supply_usb_type lc824206xa_psy_usb_types[] = {
> -	POWER_SUPPLY_USB_TYPE_SDP,
> -	POWER_SUPPLY_USB_TYPE_CDP,
> -	POWER_SUPPLY_USB_TYPE_DCP,
> -	POWER_SUPPLY_USB_TYPE_ACA,
> -	POWER_SUPPLY_USB_TYPE_UNKNOWN,
> -};
> -

>  static const enum power_supply_property lc824206xa_psy_props[] = {
>  	POWER_SUPPLY_PROP_ONLINE,
>  	POWER_SUPPLY_PROP_USB_TYPE,
> @@ -410,8 +402,11 @@ static const enum power_supply_property lc824206xa_psy_props[] = {
>  static const struct power_supply_desc lc824206xa_psy_desc = {
>  	.name = "lc824206xa-charger-detect",
>  	.type = POWER_SUPPLY_TYPE_USB,
> -	.usb_types = lc824206xa_psy_usb_types,
> -	.num_usb_types = ARRAY_SIZE(lc824206xa_psy_usb_types),
> +	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_SDP) |
> +		     BIT(POWER_SUPPLY_USB_TYPE_CDP) |
> +		     BIT(POWER_SUPPLY_USB_TYPE_DCP) |
> +		     BIT(POWER_SUPPLY_USB_TYPE_ACA) |
> +		     BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN),
>  	.properties = lc824206xa_psy_props,
>  	.num_properties = ARRAY_SIZE(lc824206xa_psy_props),
>  	.get_property = lc824206xa_psy_get_prop,


