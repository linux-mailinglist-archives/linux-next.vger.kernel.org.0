Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1901B7980
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 17:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgDXP0C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 11:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726998AbgDXP0C (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 11:26:02 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2FCC09B045
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 08:26:02 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id x26so4768626pgc.10
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 08:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oNsPtsYJbHb4rF1XB1zegmULpGf5PWuM/mHZ22BAN+0=;
        b=KHEe0OVviPgd2dkhmV/AATr62ArXU78eeeNx4TTAn5P4X9ltIVjiq1T/GGMEkUbE8S
         bAs5a8AkU/5vo7b00bYn+DUg7yi2rsBEyfyUw7W8+r7PYAUTQH/bhb9NeQh5zT4JPnFn
         zYyY6yV65rV2qTpTTPABfzZEs9nQx3l+8C0HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oNsPtsYJbHb4rF1XB1zegmULpGf5PWuM/mHZ22BAN+0=;
        b=FCIzsxqZizLR0y5rt+Pfzitdqz8KrmvRdZm21O79/b2p4y738teIunqbGyslNyrHVs
         Z4nWd5LtJhjGGCzBUidMaDdfmtk1Z1iFd5d4k6pXN9VV2YOy9tzjCH8IAcmgXHutRMgm
         NLj8VwDn4yoyZEkaRNeMxxw607EoPQXoffCzx4oVNT6elIEfNYbH7o/RnywWMpV6A3v1
         ISzlt+8f7lIhFvQlLgxe8ShOZ/YtihA2dMyUUimZWDihSQpUNLKIIL2wwTwmbLiDrW95
         xxiAk1pG2cNL5o9oNnikbzsf0L/dVJPIXRCIFY/psQGw8KkodnXyzBkrkSo1tZ57IBuf
         Tpqw==
X-Gm-Message-State: AGi0PuZIDaSRTqXuOQhKMufZMYlrMRrKB1I4EgzKUPE2bEQ8Gtp1t9YZ
        VkCsUthxz9paitvU8DKNCsB8rA==
X-Google-Smtp-Source: APiQypK8lZ0nph5TW5HfuxNWEJg4YVi3N9i605LT9cNjW2VrymzJYHrGxb2vzK+dzpbA4s/IOTzQXQ==
X-Received: by 2002:a63:ef4e:: with SMTP id c14mr9379882pgk.84.1587741961745;
        Fri, 24 Apr 2020 08:26:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 7sm5367087pga.15.2020.04.24.08.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 08:26:00 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 24 Apr 2020 08:25:59 -0700
To:     Dragos Bogdan <dragos.bogdan@analog.com>
Cc:     Beniamin Bia <beniamin.bia@analog.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: ad7476_probe(): Incorrect expression
Message-ID: <202004240825.C72A8C1A6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200424 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Mar 11 10:43:26 2020 +0200
    3a6af93dd66e ("iio: adc: ad7476: Add IIO_CHAN_INFO_RAW for AD7091R")

Coverity reported the following:

*** CID 1492717:  Incorrect expression  (NO_EFFECT)
/drivers/iio/adc/ad7476.c: 312 in ad7476_probe()
306     	indio_dev->name = spi_get_device_id(spi)->name;
307     	indio_dev->modes = INDIO_DIRECT_MODE;
308     	indio_dev->channels = st->chip_info->channel;
309     	indio_dev->num_channels = 2;
310     	indio_dev->info = &ad7476_info;
311
vvv     CID 1492717:  Incorrect expression  (NO_EFFECT)
vvv     Comparing an array to null is not useful: "st->chip_info->convst_channel", since the test will always evaluate as true.
312     	if (st->convst_gpio && st->chip_info->convst_channel)
313     		indio_dev->channels = st->chip_info->convst_channel;
314     	/* Setup default message */
315
316     	st->xfer.rx_buf = &st->data;
317     	st->xfer.len = st->chip_info->channel[0].scan_type.storagebits / 8;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492717 ("Incorrect expression")
Fixes: 3a6af93dd66e ("iio: adc: ad7476: Add IIO_CHAN_INFO_RAW for AD7091R")

Thanks for your attention!

-- 
Coverity-bot
