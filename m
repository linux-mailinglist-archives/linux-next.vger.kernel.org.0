Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F6A3509E0
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 00:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhCaV7y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 17:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbhCaV7p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 17:59:45 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8209AC061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:59:45 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso1916423pji.3
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=o6cVP/Hyd+IJoAbbWeUqu70F8kY7jqZxnvxhQO4a7+E=;
        b=J12K7YicqdLYYU1F6pb1bg/UgvJ7wVtUVaqnUZqNXzT3MDNvZFWYxPyUemdEjMP8TA
         37Eah0fGI9crTuDJcKy7d4P3t4tK3iWzt4N/ZyyEwBfCP3urj8Zbc3LgQMpox8SdqLqb
         FP6E1XWz+T84zJTnqc3APgoEcBgA4oSqjA+98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=o6cVP/Hyd+IJoAbbWeUqu70F8kY7jqZxnvxhQO4a7+E=;
        b=PnD0HWH8/Lq+rUbFW4KL8w6k9DrNxjiZrIoyRVNPV1rqSFDpi30kSbRLdoxNXhEkF0
         YgEFeJ+TtWwxhsyKs5CDqZojX3dXJdRckuvMGCI2WedRjtRjIQMNNpef1cdB8vzOmWG5
         UzC3Z4w92xwq/LANX/GafPcNUxQ7hk3u077R40q06trJe33M1gX6z9E5SXqIhT4Kbo0d
         CPcFLVsrzYJTQF3ihtDwF6N7xDz5UTzdhHh6nshGAJbOj99FmbtzPCoxVxop/RKR+TTr
         fa+VTI/RgDAGJpRpvqcoLLGNQw7cohBQyLHdBgWX1oDpSIjcQTh2g5k4cuunqmAWqqEF
         QENQ==
X-Gm-Message-State: AOAM530RMWeNuz9I0M6fJmiaEzau4YBP0YbD4JDR2QJwD6ICTzv7cfgG
        bwBv2muu+pjN/QHk70AGVMj+8h6lYFU5pg==
X-Google-Smtp-Source: ABdhPJw3IAweAz7FWYovvvotd5+zDf41UIjG/njGExPOfV4vCqAqmICRiktNQOJv4aLP+csI3Ckkxw==
X-Received: by 2002:a17:90a:d58a:: with SMTP id v10mr5613036pju.36.1617227985157;
        Wed, 31 Mar 2021 14:59:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 11sm3393600pfn.146.2021.03.31.14.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 14:59:44 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 14:59:44 -0700
To:     Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: mcp251xfd_dump_rx_ring(): Memory - illegal accesses
Message-ID: <202103311459.93EB7DEBDC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210331 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  None
    e0ab3dd5f98f ("can: mcp251xfd: add dev coredump support")

Coverity reported the following:

*** CID 1503585:  Memory - illegal accesses  (OVERRUN)
/drivers/net/can/spi/mcp251xfd/mcp251xfd-dump.c: 190 in mcp251xfd_dump_rx_ring()
184     static void mcp251xfd_dump_rx_ring(const struct mcp251xfd_priv *priv,
185     				   struct mcp251xfd_dump_iter *iter)
186     {
187     	struct mcp251xfd_rx_ring *rx_ring;
188     	unsigned int i;
189
vvv     CID 1503585:  Memory - illegal accesses  (OVERRUN)
vvv     Overrunning array of 1 8-byte elements at element index 1 (byte offset 15) by dereferencing pointer "priv->rx + i".
190     	mcp251xfd_for_each_rx_ring(priv, rx_ring, i)
191     		mcp251xfd_dump_rx_ring_one(priv, iter, rx_ring);
192     }
193
194     static void mcp251xfd_dump_tx_ring(const struct mcp251xfd_priv *priv,
195     				   struct mcp251xfd_dump_iter *iter)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503585 ("Memory - illegal accesses")
Fixes: e0ab3dd5f98f ("can: mcp251xfd: add dev coredump support")

Thanks for your attention!

-- 
Coverity-bot
