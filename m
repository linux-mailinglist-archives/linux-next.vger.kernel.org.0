Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E0CE7C9C
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730574AbfJ1XCJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:02:09 -0400
Received: from mail-pg1-f175.google.com ([209.85.215.175]:44517 "EHLO
        mail-pg1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730303AbfJ1XCJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:02:09 -0400
Received: by mail-pg1-f175.google.com with SMTP id e10so8015465pgd.11
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hRNLu2gXBMd0JVikshIGjfzgzqHpj61jbCLV+o6tuSQ=;
        b=iGwfi4o9THONAdB5sxiV10FfuCjZagSfm87He39HCLTzFPBxQu6pUwDkvUYAsKcHJU
         iq3yG/FIk8qSjjm68OjGIH4LbQgWuW7nhHfZQjQMqQ3lK4VEQlGEHdI9dv1LEP60xdKF
         SMouS/hX5YmLGlEn19a3fFJiajm2H82ozRQLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hRNLu2gXBMd0JVikshIGjfzgzqHpj61jbCLV+o6tuSQ=;
        b=NZ2HRmFG9N0GCiKiPCJ0OA3NQcB6Tt4c+m4u1hPMeKm7bG5ryhvNO32mfFrvOoDRPq
         TjnE5f7r0roRnquOUIv7YibNcEyDBY7sLMIi8fzCOgr70l2yDeT5Y2CSGFUU6YZ1FZGQ
         OVIQ8x4ylVWyJOxS+I2iYvAgNss/SA7mHHLX/Dvt26RvAhe+ClCphRUJ32I1wMO9kLso
         vwxnLAeAqTroYBoKTZlH40TSDqK+4+5NdAfy31W1uxVYQ4yaj4ZIl6SQssBIDRnWjMub
         zVA7OEPaGuYJbQbpPKBwnqPl3WnpteufD9IkkBd5ioJ36d204fFDGEukpEwNw6FaBhci
         0fSg==
X-Gm-Message-State: APjAAAWiXo8Ax+IzEbZAKCJ4nSB/dEWcNdww2+Ai6ItAIRKOmTqJ2oAf
        QV1OTlOs9bw6Tssr6+CVcInWl/Fxekg=
X-Google-Smtp-Source: APXvYqzHv8p8E92lb9ANQBJNf+/8qQMajZliYrmHMR3SXOCNL3Cbf1A6yADWscrgKchOE6jWG4/yIQ==
X-Received: by 2002:a63:ab49:: with SMTP id k9mr20960365pgp.34.1572303728495;
        Mon, 28 Oct 2019 16:02:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x139sm12020338pgx.92.2019.10.28.16.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:02:07 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:02:06 -0700
To:     Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: gen12_emit_flush_render(): Integer handling issues
Message-ID: <201910281601.9BE937D4@keescook>
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

36a6b5d964d9 ("drm/i915/tgl: Add extra hdc flush workaround")

Coverity reported the following:

*** CID 1487377:  Integer handling issues  (NO_EFFECT)
/drivers/gpu/drm/i915/gt/intel_lrc.c: 3282 in gen12_emit_flush_render()
3276     		*cs++ = preparser_disable(false);
3277     		intel_ring_advance(request, cs);
3278
3279     		/*
3280     		 * Wa_1604544889:tgl
3281     		 */
vvv     CID 1487377:  Integer handling issues  (NO_EFFECT)
vvv     This greater-than-or-equal-to-zero comparison of an unsigned value is always true. "request->i915->drm.pdev->revision >= 0".
3282     		if (IS_TGL_REVID(request->i915, TGL_REVID_A0, TGL_REVID_A0)) {
3283     			flags = 0;
3284     			flags |= PIPE_CONTROL_CS_STALL;
3285     			flags |= PIPE_CONTROL_HDC_PIPELINE_FLUSH;
3286
3287     			flags |= PIPE_CONTROL_STORE_DATA_INDEX;

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487377 ("Integer handling issues")
Fixes: 36a6b5d964d9 ("drm/i915/tgl: Add extra hdc flush workaround")


Thanks for your attention!

-- 
Coverity-bot
