Return-Path: <linux-next+bounces-4868-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFB9E2C72
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 20:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB43167A21
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 19:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9B2203704;
	Tue,  3 Dec 2024 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PO7ZwAaS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391E1F76BE;
	Tue,  3 Dec 2024 19:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733255642; cv=none; b=LkruZX96HQkvrTj2TXhzBlarLoyHinvUGfOxxBvmrmzVn3XMI2WscrTEXCSiMxDVXxZUWisY8UAj9gkLdUq2nSgfKULdMg4+n1VjIwfAwPFopveqvxuTutYid12TPqJEiF1SfSVbvR+fxcgA6uULFYrmbFD1KnCXpS0/fiLrKU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733255642; c=relaxed/simple;
	bh=a8/fGOuUJ44pAfvDzDvZ5AWCrtE2NyWJkm8SUeoY1XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4UTdSIVL/1WwzAIxdf6QZaV5E8qyKGh3uE23MD6YJym9AFyzy9wJD6c2vSatOfGLUCACwQ+BVXFGJh5KVj0SVTO+Mat7dMYriQP6p40O8tMiQR9mQBEJiU1gCLpOS35GFcXYKXEkCOh0ORk8jjXN9udUBgZHpeQCEqrMb8PMXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PO7ZwAaS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fcdb53cca6so1672132a12.0;
        Tue, 03 Dec 2024 11:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733255640; x=1733860440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XhX64BkDXW7gJ/FwLL5pSVfPB+JqhnLTUrRfRzg9wbA=;
        b=PO7ZwAaSCb6xK0NSsFOp5VoM616qdMGzzvcnRN6+Nc2e0Zs2Q6xvbaM3tY9/f7ne/R
         /9bkAGwiti4A0QStpQEPTkv9CvTX3TCAnNWWsqSL34ZU4XY918yC/6ohfykUkBcehqg8
         CgVDhpzQ9+iIWmfipiwC6PMPhPZecM57kg9n8fPGPXWzBJA2N3fPYIk2F3539SdIQ5o3
         Vwh8dnusOjASI1G2VH1qx56Fj6vPxiQr8GNao9T14/k5HsO3ie5lKLg2kylfNHMB02TY
         M0ENRvJJT0rOFIZWEkqFrEX4XlJAc7AWSbX2JlTxThYrq4vbIKzu5ezeFEQfmiKZ1HMC
         mViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733255640; x=1733860440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhX64BkDXW7gJ/FwLL5pSVfPB+JqhnLTUrRfRzg9wbA=;
        b=msO6MnSip+sg1z4qr/UL0PxjcI3RUjykgfsck9SksxXf2LSuRJLEvd7H7aSwSER83B
         StuoB7UC1JGPXNWUFZg7lLd/TWJtvIIjswmnbi1A5QUHbEBTB050tLpchO1EV9b3FIU3
         LXcjlzVLDD3WJ4qw3N8h0mqY56KIwUeaOOZfKhEBIN5hC7kOJi+VtpX8WFgQjx/vHzzc
         xxmfgjFlCgXUOekGEWS+8Zg3tamJI92xO3yew8vnnTIEtiiefq/2EWBzcKlnOuyQZ9cQ
         L6tQu4rL3sGSpC2KaxpTziqXISW4fbXNeC1CztYZ86XZ/BkQcLdMCiC+tXo7kxxoaqLO
         3s2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjFVPm9t2Va32D3g4jsa9JzsUysfrLu08nuoQPv/R4bYwSw3LUAAYERrbj3xhftreBVbCyW4YX7AIO@vger.kernel.org
X-Gm-Message-State: AOJu0YyMN+FJeamE64vd/urja9cnZOiIPSXq74LtDSmbU/Mpi7zwVV/E
	Bs6emHbJC05eWKwtbNbaHsdCgxBNzgAZI6I7nl/YCx2ZcEee7jYX91uYJg==
X-Gm-Gg: ASbGnct0tBjvaZ2ZmffvBW5YsvYf3hkWHMhvydrTbVsurQheO9RH+hDq4vSL8T7uqNf
	RjDwC4BCCMsSxxMT0Sx3OiH1p/MCOVNMYCjX1sOm+UvoCsFtXI8VWuriCNigLr1u7Yr1AUgnNBP
	1Siabm2Nz6iGYtWv76ydNtFklNhOOuwVn5wbJUWHJqi/ZK4mZZPjhVgbLVZEK5SUU4NRzDmpPMk
	qIgtinyOlUoQYmjQkNbgOBuawwzuhR7ZPPV9g7h3lYW+Vfx92jv0BpeepGCS6UVCPDAdBZkjZVn
	lmmXUJHqFaECmKmeZHjgkmM=
X-Google-Smtp-Source: AGHT+IHwMu6ryEs6oXWfrMU5ZYK5HQdS7ac1LstTPxZEkdKnXEygmaeaKLiUfgXWM5s4rGbndWwizw==
X-Received: by 2002:a05:6a20:43a9:b0:1e0:d8c1:cfe2 with SMTP id adf61e73a8af0-1e1653f6bb2mr5513926637.34.1733255640195;
        Tue, 03 Dec 2024 11:54:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7258c1e3e20sm84933b3a.145.2024.12.03.11.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 11:53:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d57e049a-9d1b-4229-84ba-0933cc0315d4@roeck-us.net>
Date: Tue, 3 Dec 2024 11:53:58 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
To: Mark Brown <broonie@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <Z09c_U2l8SqLQG-n@sirena.org.uk>
 <cba440fc-88c6-444c-af57-046ebedd60c2@sirena.org.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <cba440fc-88c6-444c-af57-046ebedd60c2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/24 11:40, Mark Brown wrote:
> On Tue, Dec 03, 2024 at 07:33:22PM +0000, Mark Brown wrote:
>> Hi all,
>>
>> After merging the hwmon-staging tree, today's linux-next build
>> (x86 allmodconfig) failed like this:
> 
> Sorry, this was the i2c-host tree rather than the hwmon-staging tree.
> 

I think it is (or should be) the hwmon-next tree.

Guenter

>>
>> In file included from /tmp/next/build/include/linux/module.h:22,
>>                   from /tmp/next/build/include/linux/device/driver.h:21,
>>                   from /tmp/next/build/include/linux/device.h:32,
>>                   from /tmp/next/build/include/linux/hwmon-sysfs.h:10,
>>                   from /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:9:
>> /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:437:18: error: expected ',' or ';' before 'PMBUS'
>>    437 | MODULE_IMPORT_NS(PMBUS);
>>        |                  ^~~~~
>> /tmp/next/build/include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
>>     26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
>>        |                                                             ^~~~
>> /tmp/next/build/include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
>>    299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
>>        |                                 ^~~~~~~~~~~
>> /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:437:1: note: in expansion of macro 'MODULE_IMPORT_NS'
>>    437 | MODULE_IMPORT_NS(PMBUS);
>>        | ^~~~~~~~~~~~~~~~
>>
>> Caused by an interaction with Linus' tree.  I have used the hwmon tree
>> from 20241128 instead.
> 
> 


