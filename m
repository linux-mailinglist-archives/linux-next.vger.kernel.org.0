Return-Path: <linux-next+bounces-7076-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6CACF60B
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 19:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5C5189C115
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 17:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED7727A103;
	Thu,  5 Jun 2025 17:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y1bKW9tm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358791E0B62
	for <linux-next@vger.kernel.org>; Thu,  5 Jun 2025 17:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146185; cv=none; b=MKI/1OMfmQgEOTHMy7JBHkLX4//vVu/y2cwQEN8JxSOV1tywIJPnBL1mXyCz6UpT4Z9nSDmSsASk0yG79zJqqmGlL5ICocWiIe5kGIUN4+duS/5pFTlowCHcXeiDr4ojT9M/FynbBQz3AJijVgaJKdB60p+9cQF+c6lgqFD4MEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146185; c=relaxed/simple;
	bh=RukCIS+sJx3VdGKZDRlpBXirAsgXcEVmiyigL9kxbkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMlIEN/lO87hWX5GIIgj5FyMa24xphxsGIOAkK7KuGmMPeMf80xsbPUYx4n48nTpqUHst1ABfsSn2CCNrQ00+Ey/aqnnYzqNbuMVnQxS6N2618PhQlEMOceiNWLZ6XcEJFbTihvsiJyF9UyuTKtXdNrEVuoSOelRwK3ynp9dWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y1bKW9tm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c336fcdaaso11555375ad.3
        for <linux-next@vger.kernel.org>; Thu, 05 Jun 2025 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749146183; x=1749750983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b8jf1lmQO0Pg7Ys10iVizBIdX5M9wTrvSGVjsrJdlFk=;
        b=Y1bKW9tmFK4LcokMNHZ+WsboRxZMWsnXkxcoD1eeLcyH4rGoSc0LD+kNkedhc7Jkko
         jTAG+QipmeTeX7sMOtJVJNtOmM3rhigvn130fR123wKB9ugCz2mkBGrsSQRqjIXy2KKK
         qOCCJWKePtqf30M3sTUVlcfpG5O+HDVay2eC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146183; x=1749750983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8jf1lmQO0Pg7Ys10iVizBIdX5M9wTrvSGVjsrJdlFk=;
        b=fo8w08hjvSurISj/ashVyerGnY/d0lBr0M4MHTd2LS6IuLA8cpjHjcX34nsoFyPCaM
         FKghxDIq7ed/Kxzl4VA8qKwroT5OSHiVQMbcert5LsDB8oezrpvohV1838YiU3j9dFwx
         6OlYxJluHIdJLP9A27iMCd37KSIFaBviXKVzpm3wY+KfFDPmgl9bI5bkGRpdwm24ndod
         MWz3vZC0UqCY9MAPr/YWbtIn0YIeOB/99RDtT5ELUPHvGg79f9BZYXbsTisPq/a7chiP
         CJYfqJ4tkH9M52eqeeNbNDtF3ZztUN3w8YJn4UihiVeiBbbm2RR3hwFTfmGN+NWEZk4r
         PzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwOyHlajhHK29SUyKgVBcRofWA8wY65vpEWrgWhfBbI2N9kPO69tXMWNbLxQJxXZkji+Yl0AdKQmzo@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlMrQR5CBF+6bVx5UJ1bmY/jX4E/Dvsive0B2Q6apTLMZmmvn
	1D5swT4boJ7FYfJalxJRNcl2O4Z4HLIHa9j63sO2CFsRo7eYE0AMn4Ie1W6YkR77GA==
X-Gm-Gg: ASbGncuN7t5z/pRNDwy7UkZWmEARcL9PzeNOUqFhOfCBj/EUFPkyO4dk7czr302TLeA
	Q3m3I6ek3PO6mzSuAP0EPNclWUjSp6ebHILWoTdfDwPNSnDXs3e1xOKvDr7QMtDyaqK1xauY4MV
	OBs7TsXy+jW6wCtLCmWP7mn/iYzxFy/JvSx2SvkOamAe7Dov3FkdoupEAsnKitteyaQlaZmJNgK
	uQXHekQ1R/aFt4dcENqKZX+qNfcioS+oNYFzxItuNKyBY6rSUCQn5F/CxT9mjc2c8BnvhQJyJtg
	Kl5ody8W5hANAQWYT290e2wHNuVRPIK5ADbsyXJ1ShGowmnF73WK17RFOr+8WxLmsVnqerzIQE6
	RtMmFXs6n3xIdo/UWeCaKZbXjwQ==
X-Google-Smtp-Source: AGHT+IHg/Lebx9Vxjm/X2QVgDBjrGiUnrwsQoERVRbwKkJolroxifqh7yUeV+FNoLlX1GBOfS/JanA==
X-Received: by 2002:a17:902:ccd2:b0:234:d399:f948 with SMTP id d9443c01a7336-23601d973bfmr3905535ad.33.1749146181074;
        Thu, 05 Jun 2025 10:56:21 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd34edsm122425045ad.126.2025.06.05.10.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:56:20 -0700 (PDT)
Message-ID: <d642eba3-d7f2-4bf5-93ce-6ea491d4709a@broadcom.com>
Date: Thu, 5 Jun 2025 10:56:19 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
To: Randy Dunlap <rdunlap@infradead.org>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
References: <20250603170058.5e1e1058@canb.auug.org.au>
 <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
 <6e88587d-f426-4841-b370-b46917822212@broadcom.com>
 <aEGhHy7qPyIjG5Xp@apocalypse>
 <44c89b6b-edaa-4b0f-9306-a447ef2d9250@infradead.org>
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
In-Reply-To: <44c89b6b-edaa-4b0f-9306-a447ef2d9250@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/25 10:07, Randy Dunlap wrote:
> 
> 
> On 6/5/25 6:52 AM, Andrea della Porta wrote:
>> On 20:06 Wed 04 Jun     , Florian Fainelli wrote:
>>>
>>>
>>> On 6/3/2025 10:01 AM, Randy Dunlap wrote:
>>>>
>>>>
>>>> On 6/3/25 12:00 AM, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Please do not add any material destined for v6.17 to you rlinux-next
>>>>> included branches until after v6.16-rc1 has been released.
>>>>>
>>>>> Changes since 20250530:
>>>>>
>>>>
>>>> on i386:
>>>>
>>>> ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
>>>> clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'
>>>>
>>>> caused by
>>>> 	/* must sleep 10 pll vco cycles */
>>>> 	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
>>>>
>>>>
>>>
>>> Andrea, do you mind fixing this build error for a 32-bit kernel? Thanks!
>>
>> Sorry for the delay, this should fix it:
>>
>> @@ -754,7 +769,7 @@ static int rp1_pll_divider_set_rate(struct clk_hw *hw,
>>          clockman_write(clockman, data->ctrl_reg, sec);
>>   
>>          /* must sleep 10 pll vco cycles */
>> -       ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
>> +       ndelay(div64_ul(10ULL * div * NSEC_PER_SEC, parent_rate));
>>   
>>          sec &= ~PLL_SEC_RST;
>>          clockman_write(clockman, data->ctrl_reg, sec);
>>
>> should I send a new patch with this fix only (against linux-next or stblinux/next?)
>> or Florian is it better if you make the change in your next branch directly?
> 
> Yes, this fixes the 32-bit build error. Thanks.
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 

Thank you both, amended the original commit with the change and added 
Randy's tag.
-- 
Florian

