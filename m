Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5EA1EE627
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfKDRiC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:38:02 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41861 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbfKDRiB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:38:01 -0500
Received: by mail-pl1-f195.google.com with SMTP id d29so1533549plj.8
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=V9nM2XGh7ZEq7NP5EkckwSkKQynwhybM4kRyyutddAA=;
        b=I7+CR9EOB2mR4R/zCDgW1GDIirTNuOHTbG6gbrYcTNCkgfmxl0zTb/QC1B8ihVYxwK
         AWsimpGqIjnsLo9BhGXG7lDrI6CMYrAyy6bZb9ivdoMhdD2XgG25clX8CF7GkZE27l3O
         8rpAFSH802RiMV7bXcW4w4hLwzMJayOvUbNhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=V9nM2XGh7ZEq7NP5EkckwSkKQynwhybM4kRyyutddAA=;
        b=K7U4Zkk44k3GCUQTOFkwu+zGiW5TTSVoKGoMGxsWwqup8Sg+SnWWFW0o3+V8nkyDK8
         LqwJVu8FQWjhmRLa6jHUwrq1x2TlP4QWMEjPoSTmTMnGSsDoGTc5jqrLn3n5yTZJA2OY
         fFi1IXmHiwQzoVdYrI6/gfbGlMxELXQD448R3sFyw8H+snx6omnZB1atYoDmnaX8CXqC
         Bj6SHFahoJ5yMh1mlh4uxDHJavSTT2DWYAviLS6eXTsGgPUrMTNtvnfMPDJJpPq8JpNB
         j8xmYzq02OPu29eI3K6LiKkXXFYcp+xbFqcXyQdwdxGZMkUh+nkoN07QYw2KnY3I6JkV
         Yowg==
X-Gm-Message-State: APjAAAXVEf4/0ZlXG3IDnqE4+62OBjKFqzTABXta3hBOM6iOHPkBzncg
        HrrTm5KgsbqgAbd5xKpki7XFZA==
X-Google-Smtp-Source: APXvYqwLf93oFpGbqkHZWb49L2wksFjIQwkCOfaS4fFU/Pp4zcwIdfA1jwp78QrKjN5pkAeANLi1KA==
X-Received: by 2002:a17:902:5a44:: with SMTP id f4mr27211270plm.174.1572889079895;
        Mon, 04 Nov 2019 09:37:59 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u3sm14770588pgp.51.2019.11.04.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:37:59 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:37:58 -0800
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: meson_cipher(): Resource leaks
Message-ID: <201911040937.0C30944DE6@keescook>
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

*** CID 1487401:  Resource leaks  (RESOURCE_LEAK)
/drivers/crypto/amlogic/amlogic-gxl-cipher.c: 134 in meson_cipher()
128     	keyivlen = op->keylen;
129
130     	ivsize = crypto_skcipher_ivsize(tfm);
131     	if (areq->iv && ivsize > 0) {
132     		if (ivsize > areq->cryptlen) {
133     			dev_err(mc->dev, "invalid ivsize=%d vs len=%d\n", ivsize, areq->cryptlen);
vvv     CID 1487401:  Resource leaks  (RESOURCE_LEAK)
vvv     Variable "bkeyiv" going out of scope leaks the storage it points to.
134     			return -EINVAL;
135     		}
136     		memcpy(bkeyiv + 32, areq->iv, ivsize);
137     		keyivlen = 48;
138     		if (rctx->op_dir == MESON_DECRYPT) {
139     			backup_iv = kzalloc(ivsize, GFP_KERNEL);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487401 ("Resource leaks")
Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")


Thanks for your attention!

-- 
Coverity-bot
