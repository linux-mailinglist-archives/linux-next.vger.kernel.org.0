Return-Path: <linux-next+bounces-8685-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA46DBFD840
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 19:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78BDC358643
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 17:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABD3257846;
	Wed, 22 Oct 2025 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="sQnweMMP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5C25E824
	for <linux-next@vger.kernel.org>; Wed, 22 Oct 2025 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153431; cv=none; b=shG2e57agPmpK3LMvlTFpvY5QLlragS60gmKGv/K4WVRQ0QpzA9WpUQwS12AylE6nj9Wnc6dE0qLa2TufFqVq/HUPvmDVEA9g9jSs/2Rxm3QXMi9s3iiDfG1/zOMI5L7+0cirkx2XQGIpRrhAAGoFq0qi9+rRFp5xb/3Sh0POnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153431; c=relaxed/simple;
	bh=cX31mC1L5QeuvgXHfSdRp6tkkzvVsV4FrGOl48ObzNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pB0hAUkIatCpUg6kPa3c6tViBF7vRtTXd9wvfxztE+iQX3lLyXQ3+SVxpwVoMJPJ78KJ5kGif8uZjDNCmy6RhPVVA4sv7yzq9hb9mnH4cVjLraHR8b4TWQHYm0wi4N+arGCS/rZjo8XBzYquP5wTP+eqBsJDMHv9gsmeobSXOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=sQnweMMP; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-938bf212b72so300472239f.1
        for <linux-next@vger.kernel.org>; Wed, 22 Oct 2025 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1761153429; x=1761758229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oM0p7h+Z2nS57Gy1ZwM4EQuA8iN1fOsBzNSYLHluowU=;
        b=sQnweMMP8CHMyL/HofxPazvE2sQZqBbJyLLpS22VnD4YxdW0kOi9lAABioRKBGCUA4
         tKTf1OWgqwDKmOsqvxkHItgzLpjp5cSk9kbOIwVvTVHAKFVv/l39ptgHMID8ikMSqoNO
         LdRECG/pOqp8aAgysKgTmF/iOy5PjFyZ11SnOGR/qv7qkxfkaYc9jJPCOMXxpRl9yRTm
         TE0ZmOwAMezyksZfTncysBTDg+BTxhy2NqnjCxrtNpd8FmFgXd05LuT5tYMvUxSFXSA/
         PNrAtz5LsjBRo/GBnzAWAxIsRxJPgxhPPAnLRht1UikO4p9BvVMnd8fDYCCJWb4qOBLw
         RnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153429; x=1761758229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oM0p7h+Z2nS57Gy1ZwM4EQuA8iN1fOsBzNSYLHluowU=;
        b=qAq6t4/iEp8Mz5SgXP1qCdnKibRWMhG/bWPqky252GLbsyuxRo4UdIeIe+Tty0wOi0
         TxVyDoMmsRT205HYhUp3gD8IDU7koQhXwJ4rnFosisnjPBKTQ79oipkkMRz9dzc8v5Dm
         0OhCiL9Wi3i7Q4OL8rxVf4I2bFLeUzvrpp5Gr66tzdw00APiN7Xf36YZfUUMwASG5SI1
         T/kZblRz8tjjOhoqtU4KjPUH+COv0oDw+5XECZz44rzxexJm8aTyv4AOrlxtAivfQz2R
         Va1oUevBFkXM5u/qKpDOPPYeA2t7CJRW78b//+TzS2JYr9X5AcC+txB4t/cbOXYqmMHk
         BJtA==
X-Forwarded-Encrypted: i=1; AJvYcCVT9bVQXok6LU+paMzcgzuE5RXdf9LOynAHoNhNutcniZEG0H1nXEGZk/N5EfLCRQ/TQpIvh+EIz6es@vger.kernel.org
X-Gm-Message-State: AOJu0YxsMmDbj6q2L9m4d9Sq9rX0YMNBWVgCEVKobt8zmJ/p3oSAdflQ
	00HD+HmrHLXaHr0N0pUyPUH9JLSD5WOzf2YtJmYbt09LiC7sVFB6DBv6EHvi6CKeNQc=
X-Gm-Gg: ASbGncuYCw1XZu7JzhZUIip8eeNoB/ZIil3Kpr3tiwn3sLcuYYNZzz5Ll10uX9okgPB
	STe62qQtMR21h+AFg4ptHUMWRk+8gwJqebcCS+XRTmM6f7tePcOL7aw4Xhcx/XOY/7WlEMazwXY
	pBGeugxplXgpWrB8C8MENRhXnX1vHigXbZekATMIGmy5hl7Z4VA/T7EbEty6ibVAuPL6u5IaUi8
	5HlyGCKPBUjDQQxoSq+is/VlC2KJVE/yR7jCASvMSW8/qUVt6UZIqXZpqtDPQ6A7yX4ByscROSn
	kL3nHoiRXFl8k5KoYh3LL21lxRNlZtQ8eUIDSRgwuwE/nezR8eEJCZJSfRsOMlGDVj2z5Af9T7M
	uN+QXnbApyCO7DASdeHhe2IXM+eSrTZeTXBELpUKkSzPVNatu5c9xFnPi6itZcHWDaYIbuDcLYD
	JsUPfXKq8=
X-Google-Smtp-Source: AGHT+IFUrihliDU05HOaF3fbvtBAn1yJOynaHNfNlRjVB5r/r069hQQXDKG1Iw5Jmp0bDAblcl9BMQ==
X-Received: by 2002:a05:6e02:1565:b0:430:b59b:5f2b with SMTP id e9e14a558f8ab-430c5268fd7mr274791525ab.16.1761153428803;
        Wed, 22 Oct 2025 10:17:08 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9630bf1sm5375401173.17.2025.10.22.10.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:17:08 -0700 (PDT)
Message-ID: <a9074897-4bbc-4b46-8783-0084c5ab5d4d@kernel.dk>
Date: Wed, 22 Oct 2025 11:17:07 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Keith Busch <kbusch@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "kernelci.org bot" <bot@kernelci.org>
References: <20251022162553.5dfb4df9@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251022162553.5dfb4df9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/25 11:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64 defconfig
> clang-17) failed like this:
> 
> io_uring/fdinfo.c:103:22: error: variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized]
>   103 |                 opcode = READ_ONCE(sqe->opcode);
>       |                                    ^~~
> ./include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
>    50 |         __READ_ONCE(x);                                                 \
>         AR      drivers/irqchip/built-in.a
> |                     ^
> ./include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
>    44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
>       |                                                                         ^
> io_uring/fdinfo.c:92:27: note: initialize the variable 'sqe' to silence this warning
>    92 |                 struct io_uring_sqe *sqe;
>       |                                         ^
>       |                                          = NULL
> 1 error generated.
> 
> Introduced by commit
> 
>   31dc41afdef2 ("io_uring: add support for IORING_SETUP_SQE_MIXED")

Yep sorry about that, the current tree should be fine.

-- 
Jens Axboe


