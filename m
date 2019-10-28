Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C648E7CA3
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730749AbfJ1XDP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:03:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45752 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730527AbfJ1XDP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:03:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id c7so6842916pfo.12
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=RsQQ5Q2H0EQg7+oCF/ZaoSgXACxGnzXk3u19hfweb5I=;
        b=h1LRdiIVQXFNl+7BnNPc1ol+yINzvUBomuUInMz8fwpCXRSin820/1w1RQu/ZV38R7
         49FrHKCNaH+X1m6x8371/kWuhpV+5+nQ221BAPPfIXWnn9OHjLWl94xVzUqLm84nrjtz
         g0N1akSNmlteAi5fRVDgJoL+SL7385qUurNoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=RsQQ5Q2H0EQg7+oCF/ZaoSgXACxGnzXk3u19hfweb5I=;
        b=f8LXpngDpzNcfh+WQ6HfXhpkVNdaKA0an5mFdidHh+mPHf6NK0yXqZA7tSQSd3TzG5
         qrEb1aL2w6rzWfMR14sjeSngR2N/kiCXWKVhXQS29ZyUadiZiTEb5j+sWdq2gv78Hhb6
         syRX308kP7y2iThkSH3gcipFVFgubWKSgtXj8g1F6YYRkAzzkwXrCbOYiPa97wm/QFUe
         vcnoq8nSlXGeMG32PhvEnDI+AU/yEjaX36DkyJybC5SlaxY5KyINUFjetJZ2y9zqiNWc
         47kiSTPA58+mxWE4PhB1mACqPQO85UeKvJAq4PrxVl51cDBWn9QbmiV43watvtupbuhr
         IZZA==
X-Gm-Message-State: APjAAAXhMUEilgt14VjNDvq1toJxkz231qucUjjeS4zqVNFAOiNPAqoU
        Hb2Ed/omW8mFQIqshzXaVThhXA==
X-Google-Smtp-Source: APXvYqzkBEbJNP44CZ3lbywORZX1iJmVKiAMB/WZ/dnPsLpzULd0XXzs8kcFYagWe1K5wXKFSTWl5A==
X-Received: by 2002:a65:4bc3:: with SMTP id p3mr23552190pgr.188.1572303793870;
        Mon, 28 Oct 2019 16:03:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n72sm570877pjc.4.2019.10.28.16.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:03:13 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:03:12 -0700
To:     Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: tgl_gt_workarounds_init(): Integer handling issues
Message-ID: <201910281602.AE52B8D@keescook>
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

65df78bda385 ("drm/i915/tgl: Wa_1409420604")

Coverity reported the following:

*** CID 1487372:  Integer handling issues  (NO_EFFECT)
/drivers/gpu/drm/i915/gt/intel_workarounds.c: 906 in tgl_gt_workarounds_init()
900     }
901
902     static void
903     tgl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
904     {
905     	/* Wa_1409420604:tgl */
vvv     CID 1487372:  Integer handling issues  (NO_EFFECT)
vvv     This greater-than-or-equal-to-zero comparison of an unsigned value is always true. "i915->drm.pdev->revision >= 0".
906     	if (IS_TGL_REVID(i915, TGL_REVID_A0, TGL_REVID_A0))
907     		wa_write_or(wal,
908     			    SUBSLICE_UNIT_LEVEL_CLKGATE2,
909     			    CPSSUNIT_CLKGATE_DIS);
910
911     	/* Wa_1409180338:tgl */

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487372 ("Integer handling issues")
Fixes: 65df78bda385 ("drm/i915/tgl: Wa_1409420604")


Thanks for your attention!

-- 
Coverity-bot
