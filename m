Return-Path: <linux-next+bounces-2230-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E058BFEAD
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 15:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3DB72852DB
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 13:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A5875803;
	Wed,  8 May 2024 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X33BlpRT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A4B55774;
	Wed,  8 May 2024 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174687; cv=none; b=HRct5BFVWUtSFBmzIBAVHNMrfA+VjTLtdlHphuq5eGlrpxKMVb+QvS5B7AVrg4rF32Ncx7iB02Y4OStDGCjykbn6GfdUyaW22oeYuULquzDqirWBApoHRka+Uo85vSn53uEtHl5OJh2af6hz54sKB4r3LaCDanJi65ZCewKJf/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174687; c=relaxed/simple;
	bh=kAHIIhfIM5V1oSLPMND5CH9K/rA9UAETbP9dW4IiSS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4izCb9JVwGDfjRWbdelG8PPb3D4JODFDj790Di5JEmKJAJ9XwO2ITKrxkqoIeaIGm+52v2ingaaSzrmq+3JWnfXRqimJs1Jf8mHshensxLOqa3trYD75RF0zadGptSc+N4wHMFeFEYIUIHLVNMf6OEqifiSGqHBy/rJy/Eaoao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X33BlpRT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2b4b30702a5so1002541a91.1;
        Wed, 08 May 2024 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715174685; x=1715779485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFYU/ERHgcG3qou9V3wcQY5XN6M0+wb2L+7Lfwo5Dzc=;
        b=X33BlpRTTDqVKBXioifxQMRRFM7lSkuMdYsbJaMfVZwcpDUvbhZ7kxaiiuDLZmwMQ+
         HQoG9wfzE36/DOVgXpJkV59mluwAa4N/GdgcnumpBghp6tKSXMHpoYyvITFJP1rLb+6g
         v60fmvREcsuls9uwi/3gUr3WbCm4FY8NHOPUM6DimpN6wRIK+lAaBx63PkQsLmzVwT0m
         tOFeJJXXVCv/4Iuiy5laRgMDsU0T0lrJqmtmdGi5sKXyKTqe4QtWiO8JEu9T5cow/X0g
         XCZo9NydQGk36rlDvu+nsv7GHh2VtxQII41uQUq+p+b6BlxyASwPKAhcx1ROlUzwLHI3
         wtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715174685; x=1715779485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFYU/ERHgcG3qou9V3wcQY5XN6M0+wb2L+7Lfwo5Dzc=;
        b=iA5NyJ3jMWvDUJL0lDXRp1z4aQrpdIB1Wj0me8+0BQ+hX1NOBHxqB7nGn47U2X7tAA
         f62HiCcDE4WOjMoCpQDP2vOJzVGuTnr+UJeJX/v/EZwAzUni4tiBK7WyHia/m2QQ55Q7
         1yXO9+DRkCrYAO1g8+CGoXdWMWNoWKma/4KQbUvfotosNqAUS3r9ZusNIIDgogAPXDIu
         uyj4U3cp4A2YKSOoumihcMYzrvrAmWhYoNFi12YFTAaPrYgcAlg+zbrh6+zyHpU7uFru
         sypiDxWUPti1IZpCk3e6zI7W5a3EMMynELlDqxDYxPJpBn7KixtSmsRcgbaWoNMqHpvz
         j5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK7+KixwV45VhR8kYXa+YODPp8kXVFdHJWh2QObyKcnTrU2fmoxSTYYDsmsyjEVCi/gp2h7d6mxpG/D88IQ+2REDGIcVrJ2W070xr5rpeuF1PqpaCE7CJ0xZlOzEklvYSz+77CbSu5BA==
X-Gm-Message-State: AOJu0Yxq2O4H22HOhBv+Uxm1ziD6glXMW0c9zu8VS3EDuZFTc5j/Ygn7
	CyvgOIx60wwFoq1aJ7pn8ddMYTfbflwnveHMm0KHqupTpwmfSZGesd5yU6dk
X-Google-Smtp-Source: AGHT+IFQd3LXtHALrZn9QA82TSP+NTQvstJwDCfqRp7iAfEDzBvGkkEI3NmiT97NUdBAkM7gnHma9A==
X-Received: by 2002:a05:6a20:3219:b0:1a7:91b0:9ba3 with SMTP id adf61e73a8af0-1afc8e0ed11mr2820483637.4.1715174684932;
        Wed, 08 May 2024 06:24:44 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7848a000000b006f3eedaa816sm11144212pfn.47.2024.05.08.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 06:24:44 -0700 (PDT)
Date: Wed, 8 May 2024 21:24:41 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <Zjt9GRTRgjfgtOwd@visitorckw-System-Product-Name>
References: <20240508162755.7d339509@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508162755.7d339509@canb.auug.org.au>

On Wed, May 08, 2024 at 04:27:55PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bitmap tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> lib/test_bitops.c: In function 'test_fns':
> lib/test_bitops.c:56:9: error: cleanup argument not a function
>    56 |         unsigned long *buf __free(kfree) = NULL;
>       |         ^~~~~~~~
> lib/test_bitops.c:60:15: error: implicit declaration of function 'kmalloc_array' [-Werror=implicit-function-declaration]
>    60 |         buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
>       |               ^~~~~~~~~~~~~
> lib/test_bitops.c:60:13: error: assignment to 'long unsigned int *' from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>    60 |         buf = kmalloc_array(10000, sizeof(unsigned long), GFP_KERNEL);
>       |             ^
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   777c893e12fa ("lib/test_bitops: Add benchmark test for fns()")
>
> I have used the bitmap tree from next-20240507 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell

Hi Yury,

I believe the following patch can resolve this issue. If you agree that
this patch is correct, could you help me fold it into the commit that
caused the error mentioned above?

Regards,
Kuan-Wei

From e028ad2415fc1b9cf7f59faa298ac7d6c2723b4a Mon Sep 17 00:00:00 2001
From: Kuan-Wei Chiu <visitorckw@gmail.com>
Date: Wed, 8 May 2024 21:16:50 +0800
Subject: [PATCH] lib/test_bitops: Fix compilation error on ppc64_defconfig

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/test_bitops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/test_bitops.c b/lib/test_bitops.c
index ee4759ced0f6..564bc486b599 100644
--- a/lib/test_bitops.c
+++ b/lib/test_bitops.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/printk.h>
+#include <linux/slab.h>
 
 /* a tiny module only meant to test
  *
-- 
2.34.1




