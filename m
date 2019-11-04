Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD62EE64A
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729304AbfKDRlT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:41:19 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:42178 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbfKDRlS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:41:18 -0500
Received: by mail-pf1-f182.google.com with SMTP id s5so4486919pfh.9
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=o5B7gu83DQKL2nWySZHCqkH2uLJ49bUJ4q9sXn3s4ZU=;
        b=HQBU37nEWYtF9954ZoEOzcmmvAK1OW20jBtNAwtjgObH6FuEnIBlpvXpsreOFn262H
         fSB5/Cxks9UErNUBn8kgJtdDiNL1S7oY+XP54YBPlBWnX0WnvhYBr6SqhxesjWDUy9S5
         9qoqUZF9qgn48ELX2AN3i5LBga6aB8vakERec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=o5B7gu83DQKL2nWySZHCqkH2uLJ49bUJ4q9sXn3s4ZU=;
        b=hC/1ePueNSz7Uf0kwnO0OODurgkEEUJuZgXaT/7dNi2pqlMmAjp9kHbpJHH9KdN85n
         iPR9XEUZsD4GtTkuGyM8JxgjjmWa/A5E4C+GZCfwA2txEcMW0pZf33mN20Nn9VjS+xou
         xrZUx/b/Ys7B2TDyNBpahu///wDiP4ZTQLIeTRoRmLsVMmh/9XVKF2q/FDQ6CmEKkjT1
         rcehKasBxZn/0jRRTojj9caDJW/CB2ZmQit0u/4AtoRCakFSL6PIUUp2qSOetCZ+I8mi
         S2MKYD8rjRsU7cNknWCjK8QaJAK6T1LQUyH36HOJgnKjhds5PNtOj0YJHgyDbFZWlZ9d
         ZfGw==
X-Gm-Message-State: APjAAAUpGduWcEcPHjrAzW9tGGksuaLGPftxorlkER87b0kqgaqVXO5m
        zmannQssto+twHfnKoody1ow21ppUBE=
X-Google-Smtp-Source: APXvYqyDuFNUQ47sOZ4/3NBynf1FFFXqu4vMNLpT1biFKrf6fMa5dqVPEKa5u49WHNsY6WTgG1QTuQ==
X-Received: by 2002:a17:90a:901:: with SMTP id n1mr359305pjn.113.1572889276880;
        Mon, 04 Nov 2019 09:41:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b21sm14312689pfd.74.2019.11.04.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:41:16 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:41:15 -0800
To:     David Francis <David.Francis@amd.com>
Cc:     Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: amdgpu_dm_commit_planes(): Null pointer dereferences
Message-ID: <201911040941.A2E9B4259@keescook>
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

74aa7bd4c6f7 ("drm/amd/display: Make stream commits call into DC only once")

Coverity reported the following:

*** CID 1487396:  Null pointer dereferences  (FORWARD_NULL)
/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 5901 in amdgpu_dm_commit_planes()
5895
5896     		if (dc_plane && !dc_plane->tiling_info.gfx9.swizzle)
5897     			swizzle = false;
5898
5899     		bundle->surface_updates[planes_count].surface = dc_plane;
5900     		if (new_pcrtc_state->color_mgmt_changed) {
vvv     CID 1487396:  Null pointer dereferences  (FORWARD_NULL)
vvv     Dereferencing null pointer "dc_plane".
5901     			bundle->surface_updates[planes_count].gamma = dc_plane->gamma_correction;
5902     			bundle->surface_updates[planes_count].in_transfer_func = dc_plane->in_transfer_func;
5903     		}
5904
5905     		fill_dc_scaling_info(new_plane_state,
5906     				     &bundle->scaling_infos[planes_count]);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487396 ("Null pointer dereferences")
Fixes: 74aa7bd4c6f7 ("drm/amd/display: Make stream commits call into DC only once")


Thanks for your attention!

-- 
Coverity-bot
