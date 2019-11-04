Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD126EE612
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfKDRfK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:35:10 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37543 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDRfJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:35:09 -0500
Received: by mail-pl1-f195.google.com with SMTP id p13so7889331pll.4
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=+BgN6gPDcEUnNu9ZfKT1lliXh4QlYdC9ipz82LyN64U=;
        b=Qk9rRgv/eJDgK+TbIys0dbqQxC4NMjIwfsp2+H8nNnckAQZPwCh37FZGPHR3Ph2IRc
         aKbqCZD1SuUXcKDRmusXNnjypIow8ZF1TH8NdgomGTYhNuaPPmVmRSMhgKKkTHUf5Auu
         uS/m9ELeQQGzK2O0B39AaS8rfzyd2ggsDXffQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=+BgN6gPDcEUnNu9ZfKT1lliXh4QlYdC9ipz82LyN64U=;
        b=UITgIsp77IxyAz/vQYXeRlsdjgWZVC4Qrnn6yGlH36mVC6oln37nrwjNp6/vY9VYwW
         w2FZ0l0eh5mlKvcY7CRLV0nUe7Ig0SByrHyixvNXzNav/cei02wvZlfMR6zFxPvPdAIs
         PhNhmfPEIi8qaDVYBh6Va6Ex61JexTEoRRDb0F3KpV/kQ432/hzwPPDz3vKvMGJbVGzL
         bE0o0vqAvD+ildTLfnZHI1OM5gJ6IBOl5n0GAqaSzQxuxFZ30Wf4boegp4167AD7PiiX
         t1liWBawX7Ywq0l5pw1N/jgpncAcuZgBjHg+0ltfwuQYCiQdOi9buXDiUmRCydK44/1y
         drHA==
X-Gm-Message-State: APjAAAXTip5QqFtJxCmTtPSsP9nLMVvgwSKG+LY+s11R3ESQsKfJQJf1
        oAUxXpehKaJ4NUEhEii/GlJuRQ==
X-Google-Smtp-Source: APXvYqx45uxl+8WLI2cos5gB6+QIX4B59PkTB82+YWNb207dmsmjtBP5hurYuwqtnV5ejg4/rTWF+w==
X-Received: by 2002:a17:902:ab8b:: with SMTP id f11mr9737648plr.16.1572888907591;
        Mon, 04 Nov 2019 09:35:07 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m13sm14920739pga.70.2019.11.04.09.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:35:06 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:35:05 -0800
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: meson_cipher(): RESOURCE_LEAK
Message-ID: <201911040935.DF55E91E@keescook>
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

*** CID 1487403:    (RESOURCE_LEAK)
/drivers/crypto/amlogic/amlogic-gxl-cipher.c: 258 in meson_cipher()
252     						 ivsize, 0);
253     		}
254     	}
255     theend:
256     	kzfree(bkeyiv);
257
vvv     CID 1487403:    (RESOURCE_LEAK)
vvv     Variable "backup_iv" going out of scope leaks the storage it points to.
258     	return err;
259     }
260
261     static int meson_handle_cipher_request(struct crypto_engine *engine,
262     				       void *areq)
263     {
/drivers/crypto/amlogic/amlogic-gxl-cipher.c: 156 in meson_cipher()
150     		keyivlen = 32;
151
152     	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
153     				  DMA_TO_DEVICE);
154     	if (dma_mapping_error(mc->dev, phykeyiv)) {
155     		dev_err(mc->dev, "Cannot DMA MAP KEY IV\n");
vvv     CID 1487403:    (RESOURCE_LEAK)
vvv     Variable "backup_iv" going out of scope leaks the storage it points to.
156     		return -EFAULT;
157     	}
158
159     	tloffset = 0;
160     	eat = 0;
161     	i = 0;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487403 ("RESOURCE_LEAK")
Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")


Thanks for your attention!

-- 
Coverity-bot
