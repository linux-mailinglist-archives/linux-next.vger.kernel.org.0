Return-Path: <linux-next+bounces-4186-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB0996F83
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 17:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD18A1F22CA3
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 15:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0985B1E3DE2;
	Wed,  9 Oct 2024 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XbplJ/kb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1196D1E3DDB
	for <linux-next@vger.kernel.org>; Wed,  9 Oct 2024 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728486683; cv=none; b=An6N3htwhI0NxS/T8Wyz1lhv9ZHEeFUch1QShpe/9sUmtFl+fWOxCk0HmqvnJ7KMpcL3yw2B+xnuu8xdaGYvTH6XQvwjn72PHOjrlTQco/9wvX9kVNDck29Y+biCo7KBcH4bxO7f0haIVSXu6gA5fxLyzJxUxNKl8/9fdzU+KaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728486683; c=relaxed/simple;
	bh=YAyjDXg/x8EITUJ5Pcg/OnP6hSOdHCLesdCNNW49cFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkUa2acFwp82hSiv0cF+ji8jV/7ac2cP+Jqk5sXitiD6PlfE2WhWesBZOIaqGKzKGDDw8Y2sTU8MUBfgnboeibJIP+dNR2cVWiT6XCY3mYPM2xuSafzj1mS/wCd0GEN+Ha8S/rq+tes1nze0QBn+X3Pw2S8j90AptDIvnneHK9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XbplJ/kb; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-831e62bfa98so289723039f.1
        for <linux-next@vger.kernel.org>; Wed, 09 Oct 2024 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728486681; x=1729091481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICvUOk0W3V9cUGd1HaodpXuUIaBC/7ub9mNShcqtKD8=;
        b=XbplJ/kbHPPNIg39GT/mjwmWi6Yi0FWJiwl5TdRVuOobCfTUz6IVeBhiZB9yphmvF9
         uxYsZ3zz7AhC7Iyitmu93Pvsaz0EveTFajMtpQQmPGcDHkpNMWNRWDUyH8F9iS/jKMtj
         Vf/Q53p3HOeiwHvLpnn2uv64OcrltDsx+xaBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728486681; x=1729091481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICvUOk0W3V9cUGd1HaodpXuUIaBC/7ub9mNShcqtKD8=;
        b=CUUspc4hKPrKk6cF2LTrcb12yLRzSI7x5Qf2hrqL5Zxc+x/tUJi7xG79IFg0pRm7y8
         jLB2KhfC8xQ1fuGoHwCnlwvrbOIZUJLB785bTZ+LPOkRuF+sf1+4Ft+5sA2xw+7obDiB
         gvAKay2bivDJrz+ZNn/rOUu2eJHTqyq+vi3hmhIxNO5PTGvKwYd6ovrnh491+4WNe+ua
         AEkQDS7z7jVVbweAOZ9C3z11bl8UacJAMPN6wquHFCMdMi86U8lUPBWXPIUnP4kwgHO3
         i/v1nCLdatzBj7jjUdghvHxd1qKQp/9jXBeBeSrlpoXis+765ZM3FpxXmipqWx2t1Axe
         /tzw==
X-Forwarded-Encrypted: i=1; AJvYcCWx7FxO8GYs+VQt/AO04+YHMVhWAyvljGSMHvi7lUSYksUMmkBvirKJoS4d+r0jmKU2d/x+gr92yjFh@vger.kernel.org
X-Gm-Message-State: AOJu0YwCreTV5U1PO7F3ItBQdoqi3qPgxeSGn8coWr4Bp7iLAcL8vf/7
	UxHdfobtlz0Wt4IaQ1ywyoWVtyjrRowOh7OH8jaxWRfGKgG0g/mtdfr9f/1Vn44=
X-Google-Smtp-Source: AGHT+IHIQd+4JF1Rw+2n1rqjmSLdY5D1Feb6AJJuqJ8U/pxlyZdWcx3DsZ8GtvW2sFwFI79OyN+YFw==
X-Received: by 2002:a05:6602:2dc6:b0:82c:f517:dc9e with SMTP id ca18e2360f4ac-8353d4b7702mr426808539f.8.1728486680884;
        Wed, 09 Oct 2024 08:11:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db8dac7279sm1107567173.33.2024.10.09.08.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 08:11:20 -0700 (PDT)
Message-ID: <51d2cb33-c0d3-4837-a22c-9c42a7a4818e@linuxfoundation.org>
Date: Wed, 9 Oct 2024 09:11:19 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kunit-next tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, David Gow <davidgow@google.com>
Cc: =?UTF-8?Q?Bruno_Sobreira_Fran=C3=A7a?= <brunofrancadevsec@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241004135527.1e2fc747@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241004135527.1e2fc747@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/24 21:55, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kunit-next tree got conflicts in:
> 
>    lib/math/Makefile
>    lib/math/tests/Makefile
> 
> between commit:
> 
>    aa2cc84cfeb0 ("lib/math: add int_log test suite")
> 
> from the mm-nonmm-unstable branch of the mm tree and commit:
> 
>    f099bda563dd ("lib: math: Move kunit tests into tests/ subdir")
> 
> from the kunit-next tree.
> 
> I fixed it up (I used the latter version of lib/math/Makefile and see
> below the signature by the patch immediately below) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Sorry for the delay on this. Thank you for fixing this up.

Andrew,

Looks like we might see more conflicts between mm and kunit trees
with the move from lib/ lib/tests/

I dropped a couple of patches I couldn't apply. Would you like
me to drop this from kunit tree?

Adding David as well for feedback on this.

> 
> rom: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 4 Oct 2024 13:51:56 +1000
> Subject: [PATCH] fix up for "lib: math: Move kunit tests into tests/ subdir"
> 
> interacting with "lib/math: add int_log test suite" from the mm tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   lib/Kconfig.debug       | 2 +-
>   lib/math/tests/Makefile | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9ed36fec4390..d3e44b17876d 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3105,7 +3105,7 @@ config INT_POW_KUNIT_TEST
>   
>   	  If unsure, say N
>   
> -config INT_LOG_TEST
> +config INT_LOG_KUNIT_TEST
>   	tristate "Integer log (int_log) test" if !KUNIT_ALL_TESTS
>   	depends on KUNIT
>   	default KUNIT_ALL_TESTS
> diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
> index 64b9bfe3381d..89a266241e98 100644
> --- a/lib/math/tests/Makefile
> +++ b/lib/math/tests/Makefile
> @@ -2,6 +2,6 @@
>   
>   obj-$(CONFIG_DIV64_KUNIT_TEST)    += div64_kunit.o
>   obj-$(CONFIG_INT_POW_KUNIT_TEST)  += int_pow_kunit.o
> -obj-$(CONFIG_INT_LOG_TEST) += int_log_kunit.o
> +obj-$(CONFIG_INT_LOG_KUNIT_TEST)  += int_log_kunit.o
>   obj-$(CONFIG_MULDIV64_KUNIT_TEST) += mul_u64_u64_div_u64_kunit.o
>   obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational_kunit.o

thanks,
-- Shuah

