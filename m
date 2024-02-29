Return-Path: <linux-next+bounces-1418-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29786CC5B
	for <lists+linux-next@lfdr.de>; Thu, 29 Feb 2024 16:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E455D284615
	for <lists+linux-next@lfdr.de>; Thu, 29 Feb 2024 15:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C097D137C3A;
	Thu, 29 Feb 2024 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YLcnSk4B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188967C71
	for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709219235; cv=none; b=IaQlZBXxhg3jf4WplzTMYJtJFJ3i1z9EI0V7R00oRngUlnp4PNPGgtZOphONomOfnZgL0ecmo4t8u0jbhB9He3szE65vdF7GBeD9QKTKkZ0Ft52qvudSGbog05o5K3SCwl+2CQyBi93gtS5z5pnRzfnKVs+MpyXt3PS+HNMkv50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709219235; c=relaxed/simple;
	bh=eQoYcoWIrFj7gRUjrrGk3RBO7jWfySCV0Qbg3y5bQck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oF8aVZo7rxMVR6aRx/rcbCrt8yb3LkLz4/jbWyy/R31aF9C+71WgywN6dG+6/pkY/CHUKHj12+9yXyhZyQ31RAkcDbVUD5HmOj/S5GCuNoWk0+rijoioIhl/5syoidNXS0MmI80i+pOd4H4eoyxuVccoXvhG+zgs30G8HG6R5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YLcnSk4B; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3651ee59db4so1056705ab.0
        for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 07:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709219232; x=1709824032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUr9WwPm1bDr07bGVGyHcZBKICuYFoD9+zTSPH1u+LA=;
        b=YLcnSk4Bkqf+xK4M7Z0Fu/4wyMjkRvC+iSXz0JP2E56T1gksz21Vrqwhtr9wdK3xdZ
         jv8bu135TvSwWt8LHo0tZH/lHqWfn52lLGb9LfhXjftKMJo4WkOjsWc6ycTJ3FbyAHN2
         v6MOsGTrUWM7/B32QcbmZNX0+tcxovms/yr2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709219232; x=1709824032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUr9WwPm1bDr07bGVGyHcZBKICuYFoD9+zTSPH1u+LA=;
        b=ClzWx0QpjU3oCvZG8HVuo2Dub51QwmpbLdmkxJmLQRH7EppnhLVGaIMXF/rFvMQYFv
         l1d9kBdmyB7hHQNX++X0BjIPpT83A1mqZ113yATzsYIXB76jD4tVi19cR22TuDi0Hhf4
         sfxD0Uw4xGgI6MIrtU7l3JxGEq8j88EQ+y6G7qElEF12fq+h8XVHbMvzJ/1zsvjwI6RU
         TTDxQ7rrEUKhP2HKFWONhn1cIxbUq/PxSfS0PY+1jKtW/YlOb5AIYDZLYwcolBYEvVx9
         UWB2P1vcAzEmDjIxcb/YiQtKYMG9yIPVkQIYkEGhdy2mwfLTD8l0zaR8ZBQrub8NWEYa
         8GEA==
X-Forwarded-Encrypted: i=1; AJvYcCUAQOuYkzIsqzNTHAifobhnh74MN4aXOmVl++iVwTdznUSBOAigdDWwMfPeujGSiOIfnQL5m0U/EGcRd8iqJxFzBsmh8g2Rnu/KrQ==
X-Gm-Message-State: AOJu0YwxBxoNgEWLBdORlP2SUBhwl4j785GYFVhai2MMFvmgvnKRz2nV
	huf/GzImpkFC04WPG1vAd5S5ltsWNcSMIxxFUQmClvsAYdp24twi7EI3ggyM9w0=
X-Google-Smtp-Source: AGHT+IGnBv7cnuB5+Ygx0Spp8dOixJyI7HqA7kTIXE4S9xFxwubQmYW37F+sI4cGzNH5Sqb9chjpgg==
X-Received: by 2002:a05:6e02:1a27:b0:365:2bd4:2f74 with SMTP id g7-20020a056e021a2700b003652bd42f74mr2811151ile.0.1709219232030;
        Thu, 29 Feb 2024 07:07:12 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id m15-20020a02c88f000000b004745b40ba6fsm346477jao.164.2024.02.29.07.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 07:07:11 -0800 (PST)
Message-ID: <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
Date: Thu, 29 Feb 2024 08:07:10 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, David Gow <davidgow@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240229152653.09ecf771@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240229152653.09ecf771@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen,

On 2/28/24 21:26, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kunit-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/gpu/drm/tests/drm_buddy_test.c:7:
> drivers/gpu/drm/tests/drm_buddy_test.c: In function 'drm_test_buddy_alloc_range_bias':
> drivers/gpu/drm/tests/drm_buddy_test.c:191:40: error: format '%u' expects a matching 'unsigned int' argument [-Werror=format=]
>    191 |                                        "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
>        |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:597:37: note: in definition of macro '_KUNIT_FAILED'
>    597 |                                     fmt,                                       \
>        |                                     ^~~
> include/kunit/test.h:662:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
>    662 |         KUNIT_UNARY_ASSERTION(test,                                            \
>        |         ^~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1233:9: note: in expansion of macro 'KUNIT_FALSE_MSG_ASSERTION'
>   1233 |         KUNIT_FALSE_MSG_ASSERTION(test,                                        \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/tests/drm_buddy_test.c:186:17: note: in expansion of macro 'KUNIT_ASSERT_FALSE_MSG'
>    186 |                 KUNIT_ASSERT_FALSE_MSG(test,
>        |                 ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/tests/drm_buddy_test.c:191:91: note: format string is defined here
>    191 |                                        "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
>        |                                                                                          ~^
>        |                                                                                           |
>        |                                                                                           unsigned int
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>    806cb2270237 ("kunit: Annotate _MSG assertion variants with gnu printf specifiers")
> 

Thank you. I did allmodconfig build on kselftest kunit branch to make
sure all is well, before I pushed the commits.

> interacting with commit
> 
>    c70703320e55 ("drm/tests/drm_buddy: add alloc_range_bias test")
  > 
> from the drm-misc-fixes tree.
> 
> I have applied the following patch for today (this should probably
> actually be fixed in the drm-misc-fixes tree).
> 

Danial, David,

I can carry the fix through kselftest kunit if it works
for all.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 29 Feb 2024 15:18:36 +1100
> Subject: [PATCH] fix up for "drm/tests/drm_buddy: add alloc_range_bias test"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 1e73e3f0d278..369edf587b44 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -188,7 +188,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   							      bias_end, size, ps,
>   							      &allocated,
>   							      DRM_BUDDY_RANGE_ALLOCATION),
> -				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> +				       "buddy_alloc failed with bias(%x-%x), size=%u\n",
>   				       bias_start, bias_end, size);
>   		bias_rem -= size;
>   

thanks,
-- Shuah

