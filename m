Return-Path: <linux-next+bounces-9084-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00836C6CCD6
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 06:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5524835A117
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 05:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C61B30DECC;
	Wed, 19 Nov 2025 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGkS3rLi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E87A30DEC6
	for <linux-next@vger.kernel.org>; Wed, 19 Nov 2025 05:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763529932; cv=none; b=JY20wIAxC/Sn2Dbajb/YK4zLiVmQXt4Vv/KMuxqPzRzxzsLnUMgqvQc715MUuidwdlVPhh3xTKIKfh7usOyMgffbw03JyaNW9wCYoH5h2YosJ1+TyKAB2p0SoNy8Ipd6Df7m0AL5gad9/Ua7xTRQ4rf+70NigqU+6jrxBhR5Zss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763529932; c=relaxed/simple;
	bh=0G+XEkNy75OrtQNA1libFMiK/PV5DUY48b7DhZQLRh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5RAMJPavTAK+MNAlMu7Rxqy3yBsOLjrnfb/5zK/ujyDlYWPtsbv3VV7oVQf1E7upODu4tNyZ6hIOBDbCKdIKCKjj8SwetN21FceCwujipJAtiA8nN6M1h8z1/4qQeA7Tzxdei4dlubJ7jjpZYEG7UOmPm/Yfy5OvpgpFAsSIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGkS3rLi; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b8c0c0cdd61so5773068a12.2
        for <linux-next@vger.kernel.org>; Tue, 18 Nov 2025 21:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763529930; x=1764134730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mzXIUd00mPFPcIEKcWHNNbEuiiIoBEJN/pfQmnjdJYk=;
        b=lGkS3rLibLqCH3gTgvwboPYW7ozuApHWNH8sCeeJ8+nj9tc1yk77e3GMljgyeRIRl0
         qBxe4LPf/tdL5IaIrUM/Qpyw+faZPhpdOw0hghSk9ll2OuAw/6t/xwpvHh1ZJe5OC0kj
         xiHk4cy8MM8Z42GHhGPU40JLvfZMNxppoZIRMnHTYJbsSqrKzuX2xbKUUVbgXiBy0a73
         +hhdmfqI6cTQ1r4AEGEk3eAFqehupRz+u1FUBks2TeMM1kNeC+eKcTChaYv+exw8HCU/
         J7qlEwVTqV22oaS2Kp8Y6ANaIRfUpk6bz1MGxRUtxvOoazx6KvdFpi03WClID5hAn+jT
         Y9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763529930; x=1764134730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzXIUd00mPFPcIEKcWHNNbEuiiIoBEJN/pfQmnjdJYk=;
        b=Y7jEcLw7MW1Mtr+MHgOTXWwCf5DN/budHFtpr0oLThn4Vjb8vpUqRWOEknmf9slrNE
         M7rF6/eaxFwoOOzT6fNaRl7p+aNnetwineJpgO6BDmlPV2PItiqtcnlb32OQsjA5Aumf
         WlnjvD8yKFPrNXP52I4wumw9BABjBlq5o+m26l763fiH1/S+4tIH2BdK+hxGHkVoHY7a
         5dWtGEHGlJM03fOvQ6xQGYjRuvqQlHZSr3PlpBFk9IXy0SoEf0Y++ZyTqPiZlIs/99Qe
         wI/hUmtEiEjn8srIL15o13qfmYz8EoM4dVynUwSlgsfd8BA3a79PAhlxgT5DEwHk2pXc
         xJRg==
X-Forwarded-Encrypted: i=1; AJvYcCU6s/ue4bcnpkbgdUYcLA86Jk3YJHViPcrkspKwqnrb98z7Q20nRoMeQNbFKAXtZtRYz1uMlDOQriPL@vger.kernel.org
X-Gm-Message-State: AOJu0YwcbGWBKqcXKQN579LYJkQbou8F6zX+oJKe05CUkrZ+ZahaHLmf
	it0cobci5MKCtf7hhFQhXQ72kSGVp+HFUYOfq/KMQrY0uRR6zmINPO0t
X-Gm-Gg: ASbGncvsrJWS2lwjaWBMQ9SD52+2wcI/KvQwTdxDkQ7B8P4C3/1qBxnE3sYbnM6S+/X
	EZ1p2pHg4HQLGxED//rWLZufBoGrh45MpxMSjwnW3hDSaA0qMyWXoN1/Fijxc7ORd71bcNDVYXl
	n2YwTJekYVu9Uf+4Yc/SLK2FvSMgMIJUgywYWIomsP5QDIfyNtCEfm+SgMDJTcnbkiItlDSWmZq
	h79o9MnOIyII87sVkE6udKpivXTnuaUGnF9hsSswI1PKlR2NL7WkdxqewC2v9cmcVf+dAD3B9VU
	qBY2bYgGl6zH1BwBI8yl/Uw6YiAlb4rCxQgm9f2ldfGXOn8r9z//KR8Mux54Mfk0bGtQP/fl1Oo
	y8R9O2u/Psh9LjZFcQO23dnlgyVUhFzkFyGyXJxIOdyUGSh/zcS8FhUDc37P1WPs4KtrhV3A9BY
	0MDhI3VDO8i4N83yFRebtjf0W24sFQFcpqsSRv/EoHnaDwYicdJnVaAvdBDB3s475HB8khZVRqr
	gtPR7gz
X-Google-Smtp-Source: AGHT+IFrbZWX3tYGHhXrXb+AcBaT7TBwV326xTKT7g/szudbVZv68pA2lEPhLdYdzmJYeJHQv0FLOQ==
X-Received: by 2002:a05:7022:4289:b0:11a:126f:ee7d with SMTP id a92af1059eb24-11b4120dc1fmr7590935c88.35.1763529929725;
        Tue, 18 Nov 2025 21:25:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885d8sm77149164c88.2.2025.11.18.21.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 21:25:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3d78b2e4-05e1-4483-a624-cb768ff06940@roeck-us.net>
Date: Tue, 18 Nov 2025 21:25:28 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Calligeros <jcalligeros99@gmail.com>, Janne Grunau <j@jannau.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251118134446.52d90706@canb.auug.org.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251118134446.52d90706@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/25 18:44, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hwmon-staging tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/hwmon/macsmc-hwmon.rst: WARNING: document isn't included in any toctree [toc.not_included]
> 
> Introduced by commit
> 
>    a5f6ffe5fced ("hwmon: Add Apple Silicon SMC hwmon driver")
> 

I fixed this up. No need to send a patch.

Guenter


