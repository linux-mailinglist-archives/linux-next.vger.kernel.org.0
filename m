Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57056625163
	for <lists+linux-next@lfdr.de>; Fri, 11 Nov 2022 04:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbiKKDQU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 22:16:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232542AbiKKDQS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 22:16:18 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E1B641B
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 19:16:17 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id q9so3803137pfg.5
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 19:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHYtmfAkk1aJiFrWOQcK74WseWK+F2wWdmGdTPL8r5I=;
        b=PLhiLl2rFexSXAqPrdy+JcBIIVG9if/iJukhcki/6b31uXZj13fFwWK2CUJm1Baj2s
         /30vEA6cCpgthMu5aerjhcoSyL3VNIf7YC6No9K3mAw9NTtQZXBxIAdl8YFcrSUNk2ax
         PKLw8/PceYAM/t+0hRJJeWRUDRoy+1/uckzZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHYtmfAkk1aJiFrWOQcK74WseWK+F2wWdmGdTPL8r5I=;
        b=5oft4/qbG2P0W4yRy1EkiDBln+YvZSbKAbtS1zPyUWn/PfAhlfMI+gZx+wCQ8rMF9M
         MYCQDaAhRIUyYEcnT5caiYYDtl83zWj9P4IgzIxzVyrE5vkcurF2NPq6a1Qa+5YKkf7j
         ehsZs5w+67JXY4Ksmi8+EYcqekST/tg/kE86uxHWXSROZlaxUKEhSKuxiJ4lI13+Ay5X
         ezINv5CvPdrhKBqGjo/qyHXpUeO2pKBmEWLH0crNdaaGF1XRDSWz3PAMliZy8ngHWu6I
         WYilhuqZ24v3AAfUiHydI6wSIhO3yrhqenU4S5sbXPXUeSOmJLSVcmoBssDjOo5S6lSF
         UInA==
X-Gm-Message-State: ANoB5pn4gUnfqiieihVCqKT5lMe1Z0C/Q1PQBo3APpPd5Gggk+RVQzVp
        ZJZWUtJMeVt9qceeDhWK6HaOag==
X-Google-Smtp-Source: AA0mqf5oumcRWXs+UNB8JbUMhp0s1tVKT0S+NPKFT46G7SRi1Mu55t1aEsRugB1x0ZpTt2hj0XpNyg==
X-Received: by 2002:aa7:9218:0:b0:562:ce80:1417 with SMTP id 24-20020aa79218000000b00562ce801417mr692070pfo.19.1668136577012;
        Thu, 10 Nov 2022 19:16:17 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z28-20020aa7959c000000b0056be4dbd4besm402806pfj.111.2022.11.10.19.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 19:16:16 -0800 (PST)
Date:   Thu, 10 Nov 2022 19:16:16 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Alexey Romanov <avromanov@sberdevices.ru>,
        linux-kernel@vger.kernel.org, Nick Terrell <terrelln@fb.com>,
        Minchan Kim <minchan@kernel.org>,
        Suleiman Souhlal <suleiman@google.com>,
        Nitin Gupta <ngupta@vflare.org>, Jens Axboe <axboe@kernel.dk>,
        Nhat Pham <nphamcs@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-block@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: zram_recompress(): OVERRUN
Message-ID: <202211101915.6A6C5758AA@keescook>
References: <202211100847.388C61B3@keescook>
 <Y22ZNtdH9s+cuL9l@google.com>
 <Y22afneyl4pZ32ig@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y22afneyl4pZ32ig@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 11, 2022 at 09:42:38AM +0900, Sergey Senozhatsky wrote:
> On (22/11/11 09:37), Sergey Senozhatsky wrote:
> > On (22/11/10 08:47), coverity-bot wrote:
> > [..]
> > > 1704     	class_index_old = zs_lookup_class_index(zram->mem_pool, comp_len_old);
> > > 1705     	/*
> > > 1706     	 * Iterate the secondary comp algorithms list (in order of priority)
> > > 1707     	 * and try to recompress the page.
> > > 1708     	 */
> > > 1709     	for (; prio < prio_max; prio++) {
> > > vvv     CID 1527270:    (OVERRUN)
> > > vvv     Overrunning array "zram->comps" of 4 8-byte elements at element index 4 (byte offset 39) using index "prio" (which evaluates to 4).
> > > 1710     		if (!zram->comps[prio])
> > > 1711     			continue;
> > > 1712
> > > 1713     		/*
> > > 1714     		 * Skip if the object is already re-compressed with a higher
> > > 1715     		 * priority algorithm (or same algorithm).
> > 
> > prio_max is always limited and max value it can have is 4 (ZRAM_MAX_COMPS).
> > Depending on use case we can limit prio_max even to lower values.
> > 
> > So we have
> > 
> > 	for (; prio < 4; prio++) {
> > 		foo = comps[prio];
> > 	}
> > 
> > I don't see how prio can be 4 inside of this loop.
> 
> Kees, if we do something like this will it make coverity happy?
> 
> ---
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 9d33801e8ba8..e67a124f2e88 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1706,6 +1706,7 @@ static int zram_recompress(struct zram *zram, u32 index, struct page *page,
>  	 * Iterate the secondary comp algorithms list (in order of priority)
>  	 * and try to recompress the page.
>  	 */
> +	prio_max = min(prio_max, ZRAM_MAX_COMPS);
>  	for (; prio < prio_max; prio++) {
>  		if (!zram->comps[prio])
>  			continue;

It would, but given this is a clear false positive, don't feel the need
to add this just for Coverity's sake. It is a nice bit of added
robustness, but I leave that decision up to you! :)

-- 
Kees Cook
