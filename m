Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245751B7983
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 17:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgDXP00 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 11:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727021AbgDXP00 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Apr 2020 11:26:26 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F746C09B045
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 08:26:26 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x77so4962196pfc.0
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 08:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=k4Kne5OLSSOY79cwmjGW25y25SNnkfWiVljIHgDeupc=;
        b=CIdJhI6ntqTPXxG1NTg8sqdKb3SdIwJeb6jwNSnels5/LI2YfK1234Xo8wdAzYAZ6U
         lmt/Y7CTtqqDBxLEgfr+h4+a9Bnq7d5KnAFv9CbyOuPaKwDSqc7dj0Ymy8wL9eY77dwP
         JGfZTq4dQRhCWwjqGU23p8yAYMdeTES9/g19Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=k4Kne5OLSSOY79cwmjGW25y25SNnkfWiVljIHgDeupc=;
        b=BNwlOWrq4sCxe5DscMCyO8+rpL+FrviCTV8w7ltRLQfUBDu4QD8100taNWQFpyNdWJ
         TZPHIa2sYVLESpbfZrfRW90i+4zKeqIMLXy2J6m8VIQnKHFAWGjQVGCxNMtwhShadqKY
         3s20jzLBqlXG/0yw+EpsDDmHKHV+z4TXOmYSTECc6r/9bO+f4h4mLx4fgrGMow6F3QP1
         tc6p4fEA87pYCjIt0gICNjUaFAKy2umOlpScL+BNnmFJW6Kw3tK4dLAqGghNOO6J+SDz
         H6BdfdXlQXtav0YiugT8NE0rlXDziZTFt5ddrqogVfaIgCepq0Uq255VblEOZxjGdBj3
         H4pA==
X-Gm-Message-State: AGi0PubNKaV3jh0iOLwYDEfE1+XKWRtg5EUSinrzpz0UBfo7W4jQcic6
        gGHQ2hMEZZ9U+fyObPVt7b/xgA==
X-Google-Smtp-Source: APiQypJvDUc07m5R+XOk3+jShGa+4s5q1FzB1ExUzXkxMKBs3+Lc4TUdZibHoLjbekn/aysAlIb/qg==
X-Received: by 2002:a63:f0b:: with SMTP id e11mr9423900pgl.155.1587741986031;
        Fri, 24 Apr 2020 08:26:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q2sm6144454pfl.174.2020.04.24.08.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 08:26:25 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 24 Apr 2020 08:26:24 -0700
To:     Yintian Tao <yttao@amd.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: gmc_v10_0_flush_gpu_tlb_pasid(): Program hangs
Message-ID: <202004240826.F065651@keescook>
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

  Thu Apr 23 12:05:54 2020 +0800
    82478876eaac ("drm/amdgpu: protect ring overrun")

Coverity reported the following:

*** CID 1492715:  Program hangs  (LOCK)
/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c: 434 in gmc_v10_0_flush_gpu_tlb_pasid()
428     		kiq->pmf->kiq_invalidate_tlbs(ring,
429     					pasid, flush_type, all_hub);
430     		r = amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
431     		if (r) {
432     			amdgpu_ring_undo(ring);
433     			spin_unlock(&kiq->ring_lock);
vvv     CID 1492715:  Program hangs  (LOCK)
vvv     Returning without unlocking "adev->gfx.kiq.ring_lock".
434     			return -ETIME;
435     		}
436
437     		amdgpu_ring_commit(ring);
438     		spin_unlock(&adev->gfx.kiq.ring_lock);
439     		r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492715 ("Program hangs")
Fixes: 82478876eaac ("drm/amdgpu: protect ring overrun")

Thanks for your attention!

-- 
Coverity-bot
