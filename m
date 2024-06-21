Return-Path: <linux-next+bounces-2626-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0E0912ABF
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 17:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B6A4B25972
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 15:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A4D15AACD;
	Fri, 21 Jun 2024 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Vq2mQA1/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124D155740
	for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718985515; cv=none; b=NdZAfRTTRjBe3bl/3+CMR53I5QeEmls1Pl3ECK73go/h0p9WctlxL9HpyEMoHLgFTnVvLSet+6AWbHFkdFsVl7xtMK0UhBra+iurq/dZRHNZ5xlD2gszzd6yAUomjM/+up6nY5EgHwihIP1tDHS4xuZCBlFSavBqtccr5x0PN84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718985515; c=relaxed/simple;
	bh=3UIMAYr0GTp2I66AHFUjwMyTq9B2vZn8DbyR5JzRAN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhezoCT5beoC3ApNGqkZ7sqTtQNXFdAKbdUYnosq1qcDlIvg87rbA4oEcnrbRhFbSSG1KEckg99bgrpom4+dRsfNd8AJqJPsZ8PROLymIrT409+1xnefNi+E9VY2cqCjtzse0nLCw/+5A9Lgr8VbRbSlhjKhbkAFWWlMxIy24gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Vq2mQA1/; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5c1b75d6bebso159890eaf.2
        for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 08:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718985512; x=1719590312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zI5gho4SWI3tLX2PaKtRVIXf0XZ8P9P7DFyRR6lK/8o=;
        b=Vq2mQA1/4sibyU3HX5irzwwxXD3S+4uCfw/16g8tS0tscEaOn6lr5TONB4WVADym75
         Yep9E5E6jIYxc5knz+LGz08n2DsJgbLeUNw6oLV6YR6Rfzv6iJSsTdBDT2cOZTQkFMts
         o5v9DUXfIQJDFKbc1ynFoZMOiHcirr2qRvmKI1hrf3AyvfJ7jYM1GF0EEmZpV8KrWtWh
         xLhYNXfTz21Uzo8Ye4SmWro679yDRB8M3OI2qOqyZk/JXnD6o+XIshaaYmvTqNSJS8fl
         9S1hyrsbmfwgcmSxzmoHKaZMuqF0eo+VhzVo/Mahyr8a3slQP2l3sE+6lL8S/cyCIIrH
         zqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718985512; x=1719590312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zI5gho4SWI3tLX2PaKtRVIXf0XZ8P9P7DFyRR6lK/8o=;
        b=h36Ld7JBZiBakjAs4nvLh+w4obd2idDY7hx1xJd/EJHLc1sR67hakOzjshviYDJ7aT
         XTHheABGfdlZLjn7X1+oP2Vi9p4dPC/ap350GMzO9CDYkK6ADkdsQsZ3YkVscp7XV2Y6
         8zbXnLEy6iyN1NnvKGLzmAbfQl/ZC/R5bRFwF4GSB/zwvLA+pPc/OOl36nxWglcAYNya
         srNvaZ2oE+XJKumnezcsQHcaTjoIBxojlWYSdJuZOUG4qAuCLdjTASCKa4ChzCDfQXpi
         nocMN6pP8sSR6ZC7D0csJEXf8PNmjDljkWLkVnmEley8jbDUPbabR6OOaeWz/anMbwjT
         QLhw==
X-Forwarded-Encrypted: i=1; AJvYcCUsBOwUqaqPCbnPX/UL2onjMZCqlzbk0BYBljnzeO3xlNyMrDdp8T9HXlwgBFdjtLifMo/0tQ5VywoYqRkAlqC4KugNMQicnWkHbA==
X-Gm-Message-State: AOJu0YzvBZB7tI/wV6zTqktQXFy5txlRbvsz7WariSsS+1mtS6RT2dWs
	gcSGMyia9lUtKL0whcaIr6riMBIyEih8GR7lxofdUxTX4fKfUVuyL/g69uG6sF0=
X-Google-Smtp-Source: AGHT+IFSRIaKMyH4YhiGk4aGWXjVi8ieLNZJUsWApX35VL2Ivfcnqmp9Q1f4xA4Rgv0Gvi8B5KHeiQ==
X-Received: by 2002:a4a:a34c:0:b0:5bd:ad72:15d3 with SMTP id 006d021491bc7-5c1adba8ce3mr8163825eaf.1.1718985512480;
        Fri, 21 Jun 2024 08:58:32 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d55da4a0sm308713eaf.21.2024.06.21.08.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:58:32 -0700 (PDT)
Message-ID: <670625c0-a288-4166-9209-2eccc5ee97c3@kernel.dk>
Date: Fri, 21 Jun 2024 09:58:29 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>,
 Himanshu Madhani <himanshu.madhani@oracle.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 John Garry <john.g.garry@oracle.com>, Keith Busch <kbusch@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <ZnWe6sXMxm4RXBcM@sirena.org.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZnWe6sXMxm4RXBcM@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/24 9:40 AM, Mark Brown wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from /tmp/next/build/include/linux/printk.h:10,
>                  from /tmp/next/build/include/linux/kernel.h:31,
>                  from /tmp/next/build/block/blk-settings.c:5:
> /tmp/next/build/block/blk-settings.c: In function 'blk_validate_atomic_write_limits':
> /tmp/next/build/include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
>   222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
>       |                                   ^~
> /tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
>    28 |                 bool __ret_do_once = !!(condition);                     \
>       |                                         ^~~~~~~~~
> /tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
>   200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>       |                     ^~~~~~~~~~~~
> /tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
>   200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>       |                                  ^~~~~~
> /tmp/next/build/include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
>   234 |         } else if (likely(((n) >> 32) == 0)) {          \
>       |                                ^~
> /tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
>    28 |                 bool __ret_do_once = !!(condition);                     \
>       |                                         ^~~~~~~~~
> /tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
>   200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>       |                     ^~~~~~~~~~~~
> /tmp/next/build/include/asm-generic/div64.h:234:20: note: in expansion of macro 'likely'
>   234 |         } else if (likely(((n) >> 32) == 0)) {          \
>       |                    ^~~~~~
> /tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
>   200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>       |                                  ^~~~~~
> /tmp/next/build/include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   238 |                 __rem = __div64_32(&(n), __base);       \
>       |                                    ^~~~
>       |                                    |
>       |                                    unsigned int *
> /tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
>    28 |                 bool __ret_do_once = !!(condition);                     \
>       |                                         ^~~~~~~~~
> /tmp/next/build/block/blk-settings.c:200:21: note: in expansion of macro 'WARN_ON_ONCE'
>   200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>       |                     ^~~~~~~~~~~~
> /tmp/next/build/block/blk-settings.c:200:34: note: in expansion of macro 'do_div'
>   200 |                 if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
>       |                                  ^~~~~~
> In file included from /tmp/next/build/include/linux/math.h:6,
>                  from /tmp/next/build/include/linux/kernel.h:27,
>                  from /tmp/next/build/block/blk-settings.c:5:
> /tmp/next/build/arch/arm/include/asm/div64.h:24:45: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
>    24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
>       |                                   ~~~~~~~~~~^
> cc1: some warnings being treated as errors

We need something ala:

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 37fe4c8f6b6b..cd33eaba4610 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -175,7 +175,7 @@ static void blk_atomic_writes_update_limits(struct queue_limits *lim)
 
 static void blk_validate_atomic_write_limits(struct queue_limits *lim)
 {
-	unsigned int chunk_sectors = lim->chunk_sectors;
+	u64 chunk_sectors = lim->chunk_sectors;
 	unsigned int boundary_sectors;
 
 	if (!lim->atomic_write_hw_max)

-- 
Jens Axboe


