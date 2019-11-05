Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2A74F07DD
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 22:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbfKEVLh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 16:11:37 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35396 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729882AbfKEVLg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 16:11:36 -0500
Received: by mail-pl1-f193.google.com with SMTP id x6so10227724pln.2
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 13:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EDFtuLy+bl/NW8X2QOLdaolpKjO4Wik6NyTB30UALl8=;
        b=ltWEUXt1SAkhLm3RREhX3pnVgbpB45XLqGCGG/xhaThVfZ6oCxNYBXURHJd2ngsv2N
         nL5WleK2QZsdnrYJeCzsDjVk6b805JlN8Ou3iupe+nacaZHqmqutsDgjy3WvQg9ksBPy
         bMHvdyRf9lsCD1NetielxYhW7DluzsjQa3B3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EDFtuLy+bl/NW8X2QOLdaolpKjO4Wik6NyTB30UALl8=;
        b=B+Vz7O31HPT2zQxpnGXHI9tfBh82ZRLaRwGXarkZPF0jjHT9ThHsiXyBSluIR8ZZdE
         1wtAk+F2z1BemAv+a00jjUKbl2HueIAnI1RDf27XEefxcP3UK/Lx7+TK7lqGdrvearzh
         de2WC9uX9wjfw32UqQaxP90Tekrs01dR3nsmYGSSM+ITMTNA/hMZ6PhZ//bvywVbX7Jx
         QNJoBAIQTHh6wxyD1DAli9F5gNK/NsUT4hs2AvSrr9vHo5cJmPA9H8ozc68o7qTpo6In
         rP8GQWfv12hxavRUrNaALl9d3ZN53jmyXViHkP9u8RpprANsGsPy8z9KOV4xRhkZZNHY
         ZzBA==
X-Gm-Message-State: APjAAAXxTfrSkxL7IffrHZcbiaqHE2CnDEfufXb54DDGMzzv4lXa33Rt
        wr9tid86mkqQhcTx0hbxa2PrFw==
X-Google-Smtp-Source: APXvYqyuc6YL1Fr0pBlRwAzxvqWBDgfDGt3pkKu3anunU8rVJ1UxhJxamgGEXNCZoWPRHanHpsbmVQ==
X-Received: by 2002:a17:902:7205:: with SMTP id ba5mr7897598plb.95.1572988296109;
        Tue, 05 Nov 2019 13:11:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w8sm12731600pfi.60.2019.11.05.13.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 13:11:35 -0800 (PST)
Date:   Tue, 5 Nov 2019 13:11:34 -0800
From:   Kees Cook <keescook@chromium.org>
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: meson_allocate_chanlist(): Uninitialized variables
Message-ID: <201911051311.6A783103F@keescook>
References: <201911040939.3AB1A8CC2B@keescook>
 <20191105191644.GD16603@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105191644.GD16603@Red>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 05, 2019 at 08:16:44PM +0100, LABBE Corentin wrote:
> On Mon, Nov 04, 2019 at 09:39:49AM -0800, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191031 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487398:  Uninitialized variables  (UNINIT)
> > /drivers/crypto/amlogic/amlogic-gxl-core.c: 184 in meson_allocate_chanlist()
> > 178     			goto error_engine;
> > 179     		}
> > 180     	}
> > 181     	return 0;
> > 182     error_engine:
> > 183     	meson_free_chanlist(mc, i);
> > vvv     CID 1487398:  Uninitialized variables  (UNINIT)
> > vvv     Using uninitialized value "err".
> > 184     	return err;
> > 185     }
> > 186
> > 187     static int meson_register_algs(struct meson_dev *mc)
> > 188     {
> > 189     	int err, i;
> > 
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
> > 
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1487398 ("Uninitialized variables")
> > Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> > 
> > 
> > Thanks for your attention!
> 
> Hello
> 
> A patch was already posted for this issue ("[PATCH][next] crypto: amlogic: ensure error variable err is set before returning it")

Excellent, thank you! (And for the upcoming patches!)

-- 
Kees Cook
