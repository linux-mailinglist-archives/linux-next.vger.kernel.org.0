Return-Path: <linux-next+bounces-3212-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EFF9457B6
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 07:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A50A51C23DF0
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 05:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96270219E0;
	Fri,  2 Aug 2024 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y51xctEV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA2D2C9D
	for <linux-next@vger.kernel.org>; Fri,  2 Aug 2024 05:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722577422; cv=none; b=hNGGVgbm0D1T3EO+dYMoTyysIk4nm6F4tmLZvUmecBUtifKZdwe2mpsudaMe5zJPPXu2NtjluTaxxUfu8o+lUsRluH9loON4oxyPQaL0w+ILE9yt5pkpXezl5/A1Y2bZ+t42GEb/Jl0SnrVoKeAo2o98Q/bIzinzvx1NNOX5fd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722577422; c=relaxed/simple;
	bh=kwugU2UFUzr0D34pJ5kn/KtonwtPl3uwg8rExbn4g9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9PGY17N53Ys5FDSY4fKyXHZNm53LifwHy8cvKw/n0h8SF/JlhHGsXQjowJKT82DsMr4/YzfmbSP/xBGQH1hS0ygvYJTjlB2OVJNlYLkMyAstcAwIU9sj8ZYrfBqt2s/VWvL/OkJzexWcDOYWs73Ds0TGf41dHbkPxOlm8UiOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y51xctEV; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so4972449a12.1
        for <linux-next@vger.kernel.org>; Thu, 01 Aug 2024 22:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722577420; x=1723182220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CV96Rrr15/ft2YFeifq6BUH0I2YfHmcQYyT9Zz0Haa4=;
        b=Y51xctEV+CYk7DAtn9ayiQt1vPUgT7Eq077vmsIBlfdCOZJSQvubp2OhRU3TfzKfBJ
         xzrR3l6M/d0UNPR4zZFbZPcyNIAKxUq/IPsoED04KgHIQdnt1Sp+M13dOg0qnbXyCRPl
         oZrRARf7zHV2vbGuwDkujeDYo5OXfz9ALBaFGUmP6tkS01whsInIUaxZMZxg06X+FbT5
         kHFCmZ6VS2t02BYutVHdKZc5KLdYmTRBTCtpamRn2OzlZvsZOVUZMA0W4/McczCRABzB
         NCfb9ESR851+yDaPw99RVTl8vDKPUX8mGRrtkSl2J5+JZLVJqEwaMWEFD/ObQx8TBPZK
         9huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722577420; x=1723182220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV96Rrr15/ft2YFeifq6BUH0I2YfHmcQYyT9Zz0Haa4=;
        b=o3F0qx8WwfmjpbB8vmzUDsSpCTZe77TJywiQma1GFVtb20Fqj3zbknwNhtFgttgH3c
         q3PuuqCpdCjiKSKezuIxN3gQqv+sH7fBVx7ukucv3SiDDBog3J9S/dEhPfSomUvkv2LT
         UbysCTFc+wmaoLXf6r6zTS0wQ0CgP//GSeCbbaJxtctDA3PmCbv9nwnvJDwEhz9Iwpu8
         71g8bbMshRI04RV3EcGiMF3491kPNJJYE7hQEDdmHSfSgKSuIUMUCz5llSMvd6z6VV4P
         MEWqh4w0EezRQ6LCHrSG4Kc9vQncKWFdkfYGsD+8gPNW21zF75riWL6YTYKkhIhIhrej
         4zIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJsiTXe2f8aV2W36JftLkUyy1l5VuOh1M2ZLMJ0TUarhRlMBQkaFQaGIyHESrheYrY4+JHqMX5feXi@vger.kernel.org
X-Gm-Message-State: AOJu0YyC41v+MzMjqz77iyGpewXCG1d9LXi8lkLFrZ2Gr0S96OJ/uNlI
	ejoRaPoHk210BMNifM31kBKxZo7W7yTDDE5a2wsafbaJTS0p2MEf+do0UKLF0gxJI7czRj6rMZG
	y
X-Google-Smtp-Source: AGHT+IG6sw+WJ2qv1fQRZamLam3tbLf5Nh0t8Ucj6Iomk9TBTmtrCG+gPTjyNvgL4gYFnWtiVNT/bg==
X-Received: by 2002:a05:6a21:2986:b0:1be:c3c1:7be8 with SMTP id adf61e73a8af0-1c699585b09mr3351145637.26.1722577420320;
        Thu, 01 Aug 2024 22:43:40 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec1c1d6sm694636b3a.6.2024.08.01.22.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 22:43:39 -0700 (PDT)
Date: Fri, 2 Aug 2024 11:13:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cpufreq-arm tree
Message-ID: <20240802054336.xdhkubya44j5dcfa@vireshk-i7>
References: <20240802105726.6ce93aa8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802105726.6ce93aa8@canb.auug.org.au>

On 02-08-24, 10:57, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cpufreq-arm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from include/linux/cpufreq.h:17,
>                  from drivers/cpufreq/spear-cpufreq.c:17:
> drivers/cpufreq/spear-cpufreq.c: In function 'spear_cpufreq_probe':
> include/linux/of.h:1435:51: error: lvalue required as unary '&' operand
>  1435 |                  of_prop_next_u32(_it.prop, NULL, &u)};                 \
>       |                                                   ^
> drivers/cpufreq/spear-cpufreq.c:201:9: note: in expansion of macro 'of_property_for_each_u32'
>   201 |         of_property_for_each_u32(np, "cpufreq_tbl", &val)
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/of.h:1437:62: error: lvalue required as unary '&' operand
>  1437 |              _it.item = of_prop_next_u32(_it.prop, _it.item, &u))
>       |                                                              ^
> drivers/cpufreq/spear-cpufreq.c:201:9: note: in expansion of macro 'of_property_for_each_u32'
>   201 |         of_property_for_each_u32(np, "cpufreq_tbl", &val)
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   e960bbac0af4 ("cpufreq: spear: Use of_property_for_each_u32() instead of open coding")

Fixed as:

diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index 4d28147c23f1..777f7f5b3671 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -198,7 +198,7 @@ static int spear_cpufreq_probe(struct platform_device *pdev)
                goto out_put_node;
        }

-       of_property_for_each_u32(np, "cpufreq_tbl", &val)
+       of_property_for_each_u32(np, "cpufreq_tbl", val)
                freq_tbl[i].frequency = val;

        freq_tbl[cnt].frequency = CPUFREQ_TABLE_END;

-- 
viresh

