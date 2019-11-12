Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74025F867C
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 02:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfKLBgL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 20:36:11 -0500
Received: from mail-pg1-f182.google.com ([209.85.215.182]:38676 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfKLBgK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 20:36:10 -0500
Received: by mail-pg1-f182.google.com with SMTP id 15so10713348pgh.5
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 17:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=bLk0hEzzAkOXZE5eTbTKH2zjqDilRQyxV110YJrt+zI=;
        b=c7n2+rqbyZi/YfZlbExq+5ThMIYo8AS4h3dHdYpcABrDv/naWJehH4yoSDBb9yjXLu
         anbV+cRwOqRXyvq7XJoMXGUPZM0JLoCpEpAOXOcfyC5wZfZESHzzzfb4CPvwXKpMF+iu
         YQb0ig1XDCdE0XsqEpXCsy6dQTph9n+X74WC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=bLk0hEzzAkOXZE5eTbTKH2zjqDilRQyxV110YJrt+zI=;
        b=sC1L6OrKU7v9gzZVh4b3ckGL/XlwaeEfwvCuTRX9XOZNMIC6vicVWAelpLRz7Y9EqY
         bdFNC4Sz4gEWGWUEusL2kvmBtDHHXZrWKPwZQAkgG2TAcEL4kT730I1XXiwmjw0WEF6l
         dYEUDzflP+qFw4Jx2OZmGCATeynqSaaXFh5Y+HU2SwkLQspXW4qA6QDxWd+PxEKV3QLb
         iueQ5SARBsGyaqBF6V/mzkgrJjSlxcYUlqyKRdjRz8MyVPU+XAglPSxvJnBcsZ0lMbe+
         7Z+ib1PgtBFR9YyYB/Au4YnQ52Zy2KRKhwer9FIVm8m+6bftze9ULXRDr6kcPWYgxhqY
         NM+g==
X-Gm-Message-State: APjAAAU8b0mjLqWpNeX5OrZ2nBI+z6T2VGTpHo1tUSsAy4UrfLXJ9HRG
        nLJSN3tEb6NmUHCeTNyVJxJ2TQ==
X-Google-Smtp-Source: APXvYqxyF2SiR3JnzbZHuNOfmRkzvHdLp58qen+r2KRPTu4vFIoxv0jYtK1ZYpYOeGzm/tLDs0GyrQ==
X-Received: by 2002:a63:1001:: with SMTP id f1mr31967755pgl.373.1573522570095;
        Mon, 11 Nov 2019 17:36:10 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h9sm667435pjh.8.2019.11.11.17.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 17:36:09 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 11 Nov 2019 17:36:08 -0800
To:     Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: amdgpu_dm_fini(): Null pointer dereferences
Message-ID: <201911111736.85B8387@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191108 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

c9dc20afe70a ("drm/amd/display: Register DMUB service with DC")

Coverity reported the following:

*** CID 1487836:  Null pointer dereferences  (FORWARD_NULL)
/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c: 1037 in amdgpu_dm_fini()
1031     		adev->dm.hdcp_workqueue = NULL;
1032     	}
1033
1034     	if (adev->dm.dc)
1035     		dc_deinit_callbacks(adev->dm.dc);
1036     #endif
vvv     CID 1487836:  Null pointer dereferences  (FORWARD_NULL)
vvv     Dereferencing null pointer "adev->dm.dc".
1037     	if (adev->dm.dc->ctx->dmub_srv) {
1038     		dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
1039     		adev->dm.dc->ctx->dmub_srv = NULL;
1040     	}
1041
1042     	if (adev->dm.dmub_bo)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487836 ("Null pointer dereferences")
Fixes: c9dc20afe70a ("drm/amd/display: Register DMUB service with DC")


Thanks for your attention!

-- 
Coverity-bot
