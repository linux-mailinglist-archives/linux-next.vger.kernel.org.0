Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDE49F9D5
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 07:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfH1Faq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 01:30:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34549 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfH1Faq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Aug 2019 01:30:46 -0400
Received: by mail-pf1-f194.google.com with SMTP id b24so936356pfp.1;
        Tue, 27 Aug 2019 22:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qecDIkMeHBFjm/kMW1gsobuyMP+gtivx3tLy17j70fI=;
        b=jRSPoAMdEZqyMHgL4B0YmmMwy1VnO8QPUNCTSG7YqC93q88WjBS8hppPgCMqaLP/x/
         bjMqp5/ikaBz4qEyk7Kdb4V/jRuG0PdAR1Eb8qd4jV5LxhxtCD1fp6oX3etXZDVCCO80
         OvJL6+onURyXpTItyg2jJK2FjkorbCuD1sWItgz7vE4wd9GX7aKHp+YNs09MUOpqPSOs
         cU70ZRllPME73UPe2ISdMl0yUnanoPR5QnUb2YSyS3IXcTBMP0x1SYnHAg0XceqAvMOs
         Y1jSmX77POzPCBhagit4Bc/VbsqdHWGSgv7U9Wm1RbaYtmGJWxXO786gt6OCCnGr9ep0
         akdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qecDIkMeHBFjm/kMW1gsobuyMP+gtivx3tLy17j70fI=;
        b=IYYPELN6IuFudi4ZXDpbH8b5k8BSm+9YkM9t02syAuuEBqnoydXBJClXVp7QB2oUhZ
         MtEP2Acqb3bUgCg70FIE43/U8xThFrUEPlnQ1lH7MF1fyMDsN4uE/81JVqQxNrp1hVph
         3b4J2yYY3N6AEK51MFzPDbUTdG3MJQX4J7sT0CA9BiiVkhTFMCAdTZ9y34jsLQmLKoqu
         C5htid481P14Vu4kPqL2V6VjKVO3Fc9HosvZcm208Hsu/vjTI9MiKut0svVHndpkD4st
         61xpPQ0eJv/FTRlewGKwyzQJUTltl2KgbtE9+MWNeYPpcXn5GgpVSBxnGaRuruFUVes5
         4B4g==
X-Gm-Message-State: APjAAAUQamxyk3h1LWFcKFgG323pWdhCm2b4LYvRhMXvvvErSvM4tQAH
        4MjcGXSBD2/sY+GXkw+arDA=
X-Google-Smtp-Source: APXvYqzs9qv8QyGAzL0ZrVFVOrYL3MkkQw8ssw8tigeK6949uy2jyvPhWTsxoNF16sIrw3nnfpLK6Q==
X-Received: by 2002:a62:7912:: with SMTP id u18mr2740540pfc.254.1566970245542;
        Tue, 27 Aug 2019 22:30:45 -0700 (PDT)
Received: from localhost ([39.7.47.251])
        by smtp.gmail.com with ESMTPSA id 4sm1212555pfn.118.2019.08.27.22.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 22:30:44 -0700 (PDT)
Date:   Wed, 28 Aug 2019 14:30:41 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Minchan Kim <minchan@kernel.org>,
        Nitin Gupta <ngupta@vflare.org>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for Aug 27 (mm/zsmalloc.c)
Message-ID: <20190828053041.GC526@jagdpanzerIV>
References: <20190827190526.6f27e763@canb.auug.org.au>
 <895d0324-3537-3d36-fa0f-5d61b733ef6e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <895d0324-3537-3d36-fa0f-5d61b733ef6e@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (08/27/19 08:37), Randy Dunlap wrote:
> on x86_64:
> 
> In file included from ../include/linux/mmzone.h:10:0,
>                  from ../include/linux/gfp.h:6,
>                  from ../include/linux/umh.h:4,
>                  from ../include/linux/kmod.h:9,
>                  from ../include/linux/module.h:13,
>                  from ../mm/zsmalloc.c:33:
> ../mm/zsmalloc.c: In function ‘zs_create_pool’:
> ../mm/zsmalloc.c:2416:27: error: ‘struct zs_pool’ has no member named ‘migration_wait’
>   init_waitqueue_head(&pool->migration_wait);
>                            ^
> ../include/linux/wait.h:67:26: note: in definition of macro ‘init_waitqueue_head’
>    __init_waitqueue_head((wq_head), #wq_head, &__key);  \
>                           ^~~~~~~

Thanks.

I believe akpm has a patch for that build error.

===========

--- a/mm/zsmalloc.c~mm-zsmallocc-fix-build-when-config_compaction=n
+++ a/mm/zsmalloc.c
@@ -2412,7 +2412,9 @@ struct zs_pool *zs_create_pool(const cha
        if (!pool->name)
                goto err;

+#ifdef CONFIG_COMPACTION
        init_waitqueue_head(&pool->migration_wait);
+#endif

===========

	-ss
