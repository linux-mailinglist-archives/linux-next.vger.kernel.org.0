Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6513F1A82C7
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 17:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbgDNPck (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 11:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729745AbgDNPci (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 11:32:38 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208D3C061A0C
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 08:32:38 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id z6so52204plk.10
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 08:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=4AISdqS7X4wh7m6EaseI1sWddmgqnyPeB3/dji6Tk+8=;
        b=LGyPa2HS0FpBDM6XiBQPqTgwT4jCaROv0C7Oi0t/kz3cTWBCsUkxRMZY3AWlyxNe63
         YENAeExec4RTcKzn8XRzqyrJuVdlIcbFuWEuYhjxsi3bG6sx/uSvaX8VU8Zaxf42MsK1
         9AFsfprpaqAy9HtOfzxaMhOCXcM0HAVE1RmSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=4AISdqS7X4wh7m6EaseI1sWddmgqnyPeB3/dji6Tk+8=;
        b=DuX+qDz1+/+ya4SYuNX1HTm/SHIq508+ACe0bq0nElvb1+cvHMDBxnyqoTIZhhCJFg
         r+MElX+iNB0SPdx/jAl9PjAYaQekFXTVlTStJY+LGeWRXw/M07pN1dSEru5RKkxv9twh
         Q47clgd+YDJXelXEPDPH/Byh3fd8mieRdDTQ+7mFP9+2ybI7UggJyTzEAOOd6kTnwDnq
         EOwUevpWSlLZYO/xKUk0nuFIMD8Ks4vh3jQYUWhw+wrm7DGsyGOTK73WitVQBhvHax+g
         sFMD52oj2/iHPg8ql3Asy45r6vu5bYjz+2VvDssfTrLDtH9FnEf/+vXOdiMyzk6fWTSa
         ATUw==
X-Gm-Message-State: AGi0PuaTFhOuDLGN4JU0Aivgnzvmax5UiPh/zAic+uLrPpnk3TzXb23l
        KGxwkUYVq57dT9febvwbVVAqcg==
X-Google-Smtp-Source: APiQypJcmNHsb/w+rJWKuSzAfDaKy3e2pBMUvNkNzb1S7aT7Z7rtFYZg0Sf3nXXwmEthrSWq6evqew==
X-Received: by 2002:a17:90a:dd45:: with SMTP id u5mr702044pjv.19.1586878357335;
        Tue, 14 Apr 2020 08:32:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o187sm11344245pfb.12.2020.04.14.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:32:36 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Tue, 14 Apr 2020 08:32:35 -0700
To:     Nirmoy Das <nirmoy.das@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: amdgpu_ring_init(): OVERRUN
Message-ID: <202004140832.AFDD14E3@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200414 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Apr 1 11:46:57 2020 +0200
    1c6d567bdf73 ("drm/amdgpu: rework sched_list generation")

Coverity reported the following:

*** CID 1492592:    (OVERRUN)
/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c: 266 in amdgpu_ring_init()
260     	ring->priority = DRM_SCHED_PRIORITY_NORMAL;
261     	mutex_init(&ring->priority_mutex);
262
263     	if (!ring->no_scheduler) {
264     		hw_ip = ring->funcs->type;
265     		num_sched = &adev->gpu_sched[hw_ip][hw_prio].num_scheds;
vvv     CID 1492592:    (OVERRUN)
vvv     Overrunning array "adev->gpu_sched" of 9 216-byte elements at element index 9 (byte offset 2159) using index "hw_ip" (which evaluates to 9).
266     		adev->gpu_sched[hw_ip][hw_prio].sched[(*num_sched)++] =
267     			&ring->sched;
268     	}
269
270     	for (i = 0; i < DRM_SCHED_PRIORITY_MAX; ++i)
271     		atomic_set(&ring->num_jobs[i], 0);
/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c: 265 in amdgpu_ring_init()
259     	ring->max_dw = max_dw;
260     	ring->priority = DRM_SCHED_PRIORITY_NORMAL;
261     	mutex_init(&ring->priority_mutex);
262
263     	if (!ring->no_scheduler) {
264     		hw_ip = ring->funcs->type;
vvv     CID 1492592:    (OVERRUN)
vvv     Overrunning array "adev->gpu_sched" of 9 216-byte elements at element index 9 (byte offset 2159) using index "hw_ip" (which evaluates to 9).
265     		num_sched = &adev->gpu_sched[hw_ip][hw_prio].num_scheds;
266     		adev->gpu_sched[hw_ip][hw_prio].sched[(*num_sched)++] =
267     			&ring->sched;
268     	}
269
270     	for (i = 0; i < DRM_SCHED_PRIORITY_MAX; ++i)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492592 ("OVERRUN")
Fixes: 1c6d567bdf73 ("drm/amdgpu: rework sched_list generation")

Thanks for your attention!

-- 
Coverity-bot
