Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69CA8EE641
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbfKDRjw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:39:52 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40960 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729362AbfKDRjw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:39:52 -0500
Received: by mail-pl1-f195.google.com with SMTP id d29so1536190plj.8
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nnc02y2mVvcwsjK+5OxNf5NIm6spEyBcFyvczZg9OVw=;
        b=nPfzuWMjB7pns9I/nii8PhcEk9Chdus75+1i6dQXzhkI76+o+ZW4rJnp/5BmwbrDfy
         l4kET/hWk7Es/dSx3SNwwxbXqPwh6xn5cgTf+Pq/Mbt1sXYxZ0JW4yI4sz9/FhSn0LeG
         CaPCodZAKvUj4nghS3iRg5WexnNFYvvpxwM1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nnc02y2mVvcwsjK+5OxNf5NIm6spEyBcFyvczZg9OVw=;
        b=N/0cBPotFDfrpfz0Ds9E2qjMb9tk4qEXrqHBLw0T83CQGHboSggXiH2vscKivqkPua
         +h4o6KKwaETf1zAJE6hVjLAHPKQw1R/Kq2htBVIh9vRLgOavJOhoDHwqsogCnKQo0m8C
         zXXioMr+M1+jHcYmuGK15zLS5lWOv3xQMCWP1d2D5WXySJDaBY3q/4NNdHcx6BSnfBTa
         ft2unGdjSrSj4eK5D5T6WIf+oY8ByyAT3ybvpGX+Oka8uIV9az2qhp/4VA04O/22Q6lq
         SkMjyxsH4p0gQTe/MmEXOtGj7LxE1EHCTAteFCjab3UQ2R27PbAuESnB+Yjgd2xG3dgN
         4XHA==
X-Gm-Message-State: APjAAAV45UiLXMwp79kNe9Xw2Wg3UUiipS2KVzQ3LwvySNuERlC5xyOu
        RWiu9QbjyPZ7krE3XmGLwAk/tg==
X-Google-Smtp-Source: APXvYqzzA7uqS5Q941RA0PRajYrO8BjsWFPRrLWyT6UMrTuejTCAlKHiskLvNo4hYHu+gJmldvrccA==
X-Received: by 2002:a17:902:d910:: with SMTP id c16mr24873667plz.102.1572889190978;
        Mon, 04 Nov 2019 09:39:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 184sm18065106pfu.58.2019.11.04.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:39:50 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:39:49 -0800
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: meson_allocate_chanlist(): Uninitialized variables
Message-ID: <201911040939.3AB1A8CC2B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191031 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")

Coverity reported the following:

*** CID 1487398:  Uninitialized variables  (UNINIT)
/drivers/crypto/amlogic/amlogic-gxl-core.c: 184 in meson_allocate_chanlist()
178     			goto error_engine;
179     		}
180     	}
181     	return 0;
182     error_engine:
183     	meson_free_chanlist(mc, i);
vvv     CID 1487398:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "err".
184     	return err;
185     }
186
187     static int meson_register_algs(struct meson_dev *mc)
188     {
189     	int err, i;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487398 ("Uninitialized variables")
Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")


Thanks for your attention!

-- 
Coverity-bot
