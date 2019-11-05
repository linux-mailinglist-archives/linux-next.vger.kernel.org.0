Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6016BF05C4
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 20:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390526AbfKETQt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 14:16:49 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:37668 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389724AbfKETQt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 14:16:49 -0500
Received: by mail-wr1-f49.google.com with SMTP id t1so16871518wrv.4
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 11:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s+Bu7gNdPl9Jdbx/+5SaggRVW47AidOs+/qujE0I2TA=;
        b=yutrWNHBSWGrkp60sN7L+e4igP9/ib7pl/n/otD3TnCiJNJz0VNwfnaqo7g/VuyxkV
         AXY8z0fjs2q5hIX/0tgwSZjmM+ay1BQ0nQRtbZk7ITAlzB3VW+tWG79yZVZ3UTiJVBGw
         RPOgH82YDs3gGvY5P5n1izxTxQHozCSFWXkYNOUc5TSFYnkQ/oIhecAe5bYNZPDHpevQ
         IYzBSp9BUx/fa4O+zVvbg84nv2t3uhIEV/CDWnG3SgaYrmpubPPvD5nu7h8dloMXebV8
         qSazHwNeXnpmK4X8thRU4JXdIk/54Xjfe7upVQq8gVm5BvNWOGaIAfxkzgweNmFeWgVZ
         o6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s+Bu7gNdPl9Jdbx/+5SaggRVW47AidOs+/qujE0I2TA=;
        b=TvUBaVM/1A/zOakrMetTn9Qg3sl+Tu7jPp9ceNeOOJ9oenvx9eLwEZQalMfJpp4K0q
         jcK8WHUY5eMW7B/3eQoomIe/S167tlIHPRIc+IXHKMEpbd6DinEZ1OFLJVcOQogAJJDq
         MfftKAHdDfo6B8xRhFBWX/7fNUDTkT1TyL2rXDiexbSLDEihukeTJooJsjcycxVg0+Vh
         gWcHB/1ChrEYRTecDA0E2bbmjJ+Z4oqMQHISI0NcQNX9BqHpu9HMaZ68cz5p9Wa+NgEl
         07zzmjfvgGXU70Xmh36eHZNWLsUfTJZIED5dl+TODK0RpWDfKNPT42+f/pyiHXIJq3tt
         r/SA==
X-Gm-Message-State: APjAAAVew7DGBgDiuYGAzFDGYIHCNKiYj64g/DYujn3zH6ygR7pvwTfj
        iz/Nd5orIq0jFWyrcqBEbueJ8Q5x7vvexg==
X-Google-Smtp-Source: APXvYqwS/l3JQzAz+nufmoZ//G2y4NeLSTGew3GkGeXr7vLytQwVEgn13yhRuei5/Ulg86TVyIGZYw==
X-Received: by 2002:adf:9bdc:: with SMTP id e28mr28018489wrc.309.1572981407266;
        Tue, 05 Nov 2019 11:16:47 -0800 (PST)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id n1sm12779083wrr.24.2019.11.05.11.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 11:16:46 -0800 (PST)
Date:   Tue, 5 Nov 2019 20:16:44 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: meson_allocate_chanlist(): Uninitialized variables
Message-ID: <20191105191644.GD16603@Red>
References: <201911040939.3AB1A8CC2B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911040939.3AB1A8CC2B@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 04, 2019 at 09:39:49AM -0800, coverity-bot wrote:
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
> *** CID 1487398:  Uninitialized variables  (UNINIT)
> /drivers/crypto/amlogic/amlogic-gxl-core.c: 184 in meson_allocate_chanlist()
> 178     			goto error_engine;
> 179     		}
> 180     	}
> 181     	return 0;
> 182     error_engine:
> 183     	meson_free_chanlist(mc, i);
> vvv     CID 1487398:  Uninitialized variables  (UNINIT)
> vvv     Using uninitialized value "err".
> 184     	return err;
> 185     }
> 186
> 187     static int meson_register_algs(struct meson_dev *mc)
> 188     {
> 189     	int err, i;
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487398 ("Uninitialized variables")
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> 
> 
> Thanks for your attention!

Hello

A patch was already posted for this issue ("[PATCH][next] crypto: amlogic: ensure error variable err is set before returning it")

Regards
