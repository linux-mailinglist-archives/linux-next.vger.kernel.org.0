Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF5ADF05A9
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 20:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390895AbfKETIn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 14:08:43 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40846 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390812AbfKETIn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 14:08:43 -0500
Received: by mail-wm1-f66.google.com with SMTP id f3so514396wmc.5
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 11:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7plNekB+19pQRqlt3+by9rJWTk/3fLbD4ieDvUhKExA=;
        b=OK+0zANMluwF5zsTf+y1XinEd0QNM8/JILDMuKr8dcDOmK9y0crr0vKtnuIMgqAYT1
         4MeBf+iZW0CVEez/4hlsWMrMtTBC3oJFHJQf61aAHeS+2jo3cOOEUdeGR08pR93PLlJG
         d7BtbHDcZ3bR2X/EMDlKonCVxMwlMAmPPaKZWVOYRQx82ZjmNu4B3qfKX6fW/fRV7cbA
         YzZ6OYluu7ZEeaBRv9xaDpXk0jjLYRDN3clJ1dRuLztiFrhDjaxo0c2EMDuFvNiwtk+6
         Fr1vbAr8uG6+IU8oKCw22Uhznt0B6sx6kfXNqBzVmAp3YFfI7vomv+BAOeo2MUtzYc7R
         MleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7plNekB+19pQRqlt3+by9rJWTk/3fLbD4ieDvUhKExA=;
        b=KoZiteRuGTV4HC6adI36PubcYV2vtc9BqT5H7RFfoPzKWfpTNosHMIBBTGdXki47B4
         tHttQWjxkCSr816WRquW8oY9pYEhcTwjTJi08fFmjyW8jK6PLKG4B43Y+5X79iCFx9sP
         bChQ/rEobqigvRw8C1WPaLp39G173xakHvlnHeekaL6zbOXD95JrL9AwanXisj+szGik
         Ns01p46yf3v1h/RbYWz10yq/+Y6QRRSaHez2LS9glfcZP0Kt1X1Ll6h90mw6Ur/0+CHY
         6DVmtk6R2/8VogcMYT9TAlIc1M7NaE58YAT2uDIsKKindcr2RE4rcS8AjtqVeo3Mr4JR
         UYyw==
X-Gm-Message-State: APjAAAV7ETBTY45WeBovrGJyJeNlml4Av3B0GJ4qE9LY55Guais6h+p+
        +dYKCbT/HPGXpjnVUpii0kU1lA==
X-Google-Smtp-Source: APXvYqxAzdsrAPSoB6/ZszGcQCk0vQGzLJCEZk8o/EnmD9dn327knL8s6uykYr8+kbbe0ueuFRvLLA==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr492665wmc.68.1572980920002;
        Tue, 05 Nov 2019 11:08:40 -0800 (PST)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id e27sm2293822wra.21.2019.11.05.11.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 11:08:39 -0800 (PST)
Date:   Tue, 5 Nov 2019 20:08:37 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: meson_cipher(): Resource leaks
Message-ID: <20191105190837.GB16603@Red>
References: <201911040937.0C30944DE6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911040937.0C30944DE6@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 04, 2019 at 09:37:58AM -0800, coverity-bot wrote:
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
> *** CID 1487401:  Resource leaks  (RESOURCE_LEAK)
> /drivers/crypto/amlogic/amlogic-gxl-cipher.c: 134 in meson_cipher()
> 128     	keyivlen = op->keylen;
> 129
> 130     	ivsize = crypto_skcipher_ivsize(tfm);
> 131     	if (areq->iv && ivsize > 0) {
> 132     		if (ivsize > areq->cryptlen) {
> 133     			dev_err(mc->dev, "invalid ivsize=%d vs len=%d\n", ivsize, areq->cryptlen);
> vvv     CID 1487401:  Resource leaks  (RESOURCE_LEAK)
> vvv     Variable "bkeyiv" going out of scope leaks the storage it points to.
> 134     			return -EINVAL;
> 135     		}
> 136     		memcpy(bkeyiv + 32, areq->iv, ivsize);
> 137     		keyivlen = 48;
> 138     		if (rctx->op_dir == MESON_DECRYPT) {
> 139     			backup_iv = kzalloc(ivsize, GFP_KERNEL);
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487401 ("Resource leaks")
> Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
> 
> 
> Thanks for your attention!
> 

Thanks for the report, I will send the fix soon.

Regards
