Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C389DE7CB0
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbfJ1XFc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:05:32 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:36754 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbfJ1XFc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:05:32 -0400
Received: by mail-pl1-f169.google.com with SMTP id g9so5885553plp.3
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oNaSxDIXw/8Rvb1Zvy4x460C6jGdqKxWHH0v6pmhjmc=;
        b=gyB9sViI9jvM2XXkwkGiayX0PIrJZUsjIsWtbOcCzTKHtK8yIs54wk6Lovr83REuqs
         MmtkWWcVghfM5vtUFFdBzivtaIIazAag6Y35c15SLMAQtA5q3YJWNBC0GazQW1VfMJXr
         C6aN+uHruYnCvAG+RMe31FgvKhSJ7xbyKH0Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oNaSxDIXw/8Rvb1Zvy4x460C6jGdqKxWHH0v6pmhjmc=;
        b=FLuFaFk97DGe9DfdiBrUwGX2rETVJycBcHMb35DusuBzKOXZFlBdKRUceo2eXYKc1j
         jIbf21xPaAbXCDXM/Z+M55dTL3lTYtK4Bz1UVnhbdyf9XdzCfpM6BW1cuzkaGKtUrY8t
         tezoBoa9Go6U+gyU/DSaqMsvNYXT1MitSus/tQ0H6sj8O6P1xeptfpfb8lnWQh/EDqTJ
         Zm7pyNu4/asP5FI1tZCY4ibpm9IPfH258vc/hA/qq88765B/G2ebgANY22+o6TD4pxMr
         K7Vaz0iUevV3a+tyz/Jqiku+rSiMaF/9la+5r2796/9ec06L4C/xZlQIaTUNdOk49Abs
         LZnA==
X-Gm-Message-State: APjAAAXQ6F/c2q27dRlzOhGrhRW7XhFMBePsdwWNYY7/9Jx3Xtfi3wAc
        7dsXrGjznxIJ9N23tXuL4ezmeQ==
X-Google-Smtp-Source: APXvYqzQeAwWK7wo4SYtxYbCsKSdBN14tx9lzNprkpsxlyJBVwOjMX0+ow3Q/hEhoBJUaVA++y6JJQ==
X-Received: by 2002:a17:902:b489:: with SMTP id y9mr588084plr.9.1572303931560;
        Mon, 28 Oct 2019 16:05:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a33sm5636519pgb.57.2019.10.28.16.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:05:30 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:05:29 -0700
To:     Jens Axboe <axboe@kernel.dk>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: io_wqe_worker(): Program hangs
Message-ID: <201910281605.8F6E7C376@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191025 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

46134db8fdc5 ("io-wq: small threadpool implementation for io_uring")

Coverity reported the following:

*** CID 1487365:  Program hangs  (LOCK)
/fs/io-wq.c: 349 in io_wqe_worker()
343     			io_worker_handle_work(worker);
344     		else
345     			spin_unlock(&wqe->lock);
346     	}
347
348     	io_worker_exit(worker);
vvv     CID 1487365:  Program hangs  (LOCK)
vvv     Returning without unlocking "(*wqe).lock".
349     	return 0;
350     }
351
352     /*
353      * Check head of free list for an available worker. If one isn't available,
354      * caller must wake up the wq manager to create one.

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487365 ("Program hangs")
Fixes: 46134db8fdc5 ("io-wq: small threadpool implementation for io_uring")


Thanks for your attention!

-- 
Coverity-bot
