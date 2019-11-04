Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBE1EE669
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfKDRnW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:43:22 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45919 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbfKDRnW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:43:22 -0500
Received: by mail-pf1-f196.google.com with SMTP id z4so6709321pfn.12
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=SgaZH/bdAEkEWlRCV1U5jgpn4KIHnb2DDxpp4EhWyoU=;
        b=NDdRUsYqp4Gc4OPGqNtAUntyFUP5nLkswhunbRvKwuACbSSkfZ12WgAsNbDdnFEpLd
         7BB+HgoRMIg4w2bvF/tr3qG+6TSvfRk/6tF++GcaUuvhLbS48ij9+pAp5ffxtxglmsfl
         gIFU1zbu7BxCB4pmqq47aFAqkmWJ8FEAeL24U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SgaZH/bdAEkEWlRCV1U5jgpn4KIHnb2DDxpp4EhWyoU=;
        b=XJgGIBZM/LINBqUfCHiYZqogqcnEcvc8L9IHSxCLOW4GYrG8p1yC/YAko/fnETv3J2
         YX5BBdpaHB1hXLzoF0Emk41X89dxy9ez0EI/UwFr7N9WVc9jgmqmrI6XfZq1cMBr8WoU
         9/FzF8X2LuecT+wypzcTTKLhKXE988zrRXowQTPi/SuyMoZ+JnMKE6TRx5qZkRisIJbE
         7BdQkJGmT6mNMVEF7IQ7tQq6xIWZspDwwK4Wdlp9RfulqpGcYoqPFOzCiGUHkqwkcg1r
         Q32CJRrLGTDHJRmxWY6gcpxRiZquQToYgRE4vro2tkvXevaCRdz99lT1l0wuNl1mCLqt
         WUag==
X-Gm-Message-State: APjAAAVoEhpllely1YZqdKrx9OW87dCrcgIwXF82fuyr4y5omayca05r
        Uj37ugPp/dq7WUUlHDSLp+thiA==
X-Google-Smtp-Source: APXvYqxp8tb80M3nBoGEkr3jnfvhRwEaiJFQ7QZt6ZAR0gzQYI6sZA1IHujAG3ZSFoXsKpzoln3koQ==
X-Received: by 2002:a65:66c9:: with SMTP id c9mr30670039pgw.341.1572889401885;
        Mon, 04 Nov 2019 09:43:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f185sm17504851pfb.183.2019.11.04.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:43:21 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:43:20 -0800
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Andi Kleen <andi@firstfloor.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: perf_install_in_context(): Integer handling issues
Message-ID: <201911040943.49068D0@keescook>
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

db0503e4f675 ("perf/core: Optimize perf_install_in_event()")

Coverity reported the following:

*** CID 711630:  Integer handling issues  (NEGATIVE_RETURNS)
/kernel/events/core.c: 2683 in perf_install_in_context()
2677     	if (__perf_effective_state(event) == PERF_EVENT_STATE_OFF && ctx->nr_events) {
2678     		raw_spin_lock_irq(&ctx->lock);
2679     		if (ctx->task == TASK_TOMBSTONE) {
2680     			raw_spin_unlock_irq(&ctx->lock);
2681     			return;
2682     		}
vvv     CID 711630:  Integer handling issues  (NEGATIVE_RETURNS)
vvv     "event->cpu" is passed to a parameter that cannot be negative.
2683     		add_event_to_ctx(event, ctx);
2684     		raw_spin_unlock_irq(&ctx->lock);
2685     		return;
2686     	}
2687
2688     	if (!task) {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 711630 ("Integer handling issues")
Fixes: db0503e4f675 ("perf/core: Optimize perf_install_in_event()")


Thanks for your attention!

-- 
Coverity-bot
