Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DE5F05B3
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 20:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390696AbfKETKv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 14:10:51 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36030 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389724AbfKETKv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 14:10:51 -0500
Received: by mail-wm1-f67.google.com with SMTP id c22so559258wmd.1
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 11:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BuIzAvpMFV9oGmG8hXgD+pNPIXUi/dz17Bh59MX81WQ=;
        b=tIyUD48WzTDGaIk9Ezy/Q1loYHm7hqGLVU/KEn3BoNOVrTlbPvH44tV/BXubOCmqYm
         FTq0UT7BpPqSkOAwxbaG3XF+pKyJq22BxNqjcW+6QtqeN3E5v/8Te6PsjtxJdKFi9CR2
         /T9s6pyqXERY4Pba/UYLpydUO/q+9bzHGfJurTGVFSgEQp7IO0z/K9pZzQ/hT+m5k1xx
         4K1N4w6lHj3ImoamlvwNIR7gdvjA2T0eiudTg6qS2SG/tjmhqPbmplrbvrb3rCE+6rDJ
         PlWc1paJ5JuXFAe+bshiwuDxWwouSD5vxEhWctSXzh7EQw9df1bWj0wR4LZF6WUPgHjc
         +knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BuIzAvpMFV9oGmG8hXgD+pNPIXUi/dz17Bh59MX81WQ=;
        b=O330y7fdG3Y295osg6GgYoTdxdXHwXWhK3MvFwCmyS4kY8d5us7YMAisCu2P5zs5bl
         S9rO5eWwv2irUDv1RU58pschrgORcBS9JflM1dybKk5bSEVrekeC9FoObbFeQgiXIbmP
         kkprNG3/GkbQl0InI3Z5To3pthWl81nQMUqvFsQdhNmI4Hj7LRUBBgyoLtSvmibNswDJ
         OB45CvRbx2Lpk+y5ePyjotBuQxRrcOEhslcJ3eDesSB9smZPA+j+V7cH90PAbQggzCl1
         s8h8MxwZOzYiHKC3+Rffq16i86+boSUim5F1j3hQnQfzkhViIO81jjAInvJ9Wuqd1jMe
         rhPQ==
X-Gm-Message-State: APjAAAVxp4sTRHzW8ImtkQ6wtro3M2OhThu8L7kkoV/TVrh70DV/mGN5
        W9/LyMzFbBjju9aNMECepIA1FQ==
X-Google-Smtp-Source: APXvYqzZHxPEa4fNdUwhcgz+SBeeyIvAKfHwvFXqRDkKI6T/1DAowEZnqqcB9+v9n0Fi1pdTpJHZnw==
X-Received: by 2002:a7b:cf32:: with SMTP id m18mr487128wmg.166.1572981047721;
        Tue, 05 Nov 2019 11:10:47 -0800 (PST)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id w81sm434160wmg.5.2019.11.05.11.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 11:10:46 -0800 (PST)
Date:   Tue, 5 Nov 2019 20:10:44 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: meson_cipher(): RESOURCE_LEAK
Message-ID: <20191105191044.GC16603@Red>
References: <201911040935.DF55E91E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911040935.DF55E91E@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 04, 2019 at 09:35:05AM -0800, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191031 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> 
> Coverity reported the following:
> 
> *** CID 1487403:    (RESOURCE_LEAK)
> /drivers/crypto/amlogic/amlogic-gxl-cipher.c: 258 in meson_cipher()
> 252     						 ivsize, 0);
> 253     		}
> 254     	}
> 255     theend:
> 256     	kzfree(bkeyiv);
> 257
> vvv     CID 1487403:    (RESOURCE_LEAK)
> vvv     Variable "backup_iv" going out of scope leaks the storage it points to.
> 258     	return err;
> 259     }
> 260
> 261     static int meson_handle_cipher_request(struct crypto_engine *engine,
> 262     				       void *areq)
> 263     {
> /drivers/crypto/amlogic/amlogic-gxl-cipher.c: 156 in meson_cipher()
> 150     		keyivlen = 32;
> 151
> 152     	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
> 153     				  DMA_TO_DEVICE);
> 154     	if (dma_mapping_error(mc->dev, phykeyiv)) {
> 155     		dev_err(mc->dev, "Cannot DMA MAP KEY IV\n");
> vvv     CID 1487403:    (RESOURCE_LEAK)
> vvv     Variable "backup_iv" going out of scope leaks the storage it points to.
> 156     		return -EFAULT;
> 157     	}
> 158
> 159     	tloffset = 0;
> 160     	eat = 0;
> 161     	i = 0;
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487403 ("RESOURCE_LEAK")
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> 
> 
> Thanks for your attention!
> 

I will send the fix soon.

Thanks
