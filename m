Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92379E7CAF
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbfJ1XFR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:05:17 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:36578 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729539AbfJ1XFR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:05:17 -0400
Received: by mail-pf1-f178.google.com with SMTP id v19so8035565pfm.3
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=S20LFV3UateWo1oNjOYRFL6S3szZnWuc/DjnXP7S81U=;
        b=N6Iv5i3EPvyXI0yBwR27xhB4n7Cw0Os+S+eu+Yf3CkzuFegv+c/ATB1sEdT9lYLwJt
         7LbVzX32ApQBueA6JnyC8R+qC/6JYxyMLAsTUaPK/V2tTUvVCtVIbBxpyto/5NgMcQKS
         Gx7nEVQ6SI7cxcCPHTOAq8arMtUuUDm59NVo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=S20LFV3UateWo1oNjOYRFL6S3szZnWuc/DjnXP7S81U=;
        b=Fa9+kwUrP6eGLa9Vg0y1v6qJsWOgvHBdjfcimIBb8Xoww5xaYDY8dObn/1JXbeyORx
         Em4Lo0HTeRVNXjx2sigWKlLdY2LxzMKdQENgk9Ehne8icvUu53Qp5BulJdTyIy0m3dnZ
         oSC8hCwBD4j5zvI02/h439nXaUfqTjzm320AVBCyNeJRmwbu+NAUhss6feTqfeX2yjDW
         ll0rA1jAL+/1qnzwA8fRRz+1uhrNkg8gSchfpfk9HmW5bvd4gBZZLRMPdUGGLjoor6kb
         pC7DQlJoZMsvEemAPfrfOGwgUb02D9xyHkJNVAEQ/OyC0mYkUdOuorEe4H8MOuS5e+9E
         KtOA==
X-Gm-Message-State: APjAAAXdc5venKZq2oL43eMJ7Dg7wIa5nh+RaXNeB8GM2db7XjUeJ1EL
        xS9XhXMHCVdxkJScR3D103Wcjg==
X-Google-Smtp-Source: APXvYqxblbBIx+26xJ+gcDYejl6AurQ5s14xfskeWTMplQiX2c1AMKJDiYTn4vxopWcK8FNGbfc4Rg==
X-Received: by 2002:a17:90a:7142:: with SMTP id g2mr2290156pjs.36.1572303916092;
        Mon, 28 Oct 2019 16:05:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w2sm11456806pgr.78.2019.10.28.16.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:05:15 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:05:14 -0700
To:     Thierry Reding <treding@nvidia.com>
Cc:     Lyude Paul <lyude@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: drm_dp_get_adjust_request_post_cursor(): Memory -
 corruptions
Message-ID: <201910281605.3B5CC6A661@keescook>
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

79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")

Coverity reported the following:

*** CID 1487366:  Memory - corruptions  (OVERRUN)
/drivers/gpu/drm/drm_dp_helper.c: 127 in drm_dp_get_adjust_request_post_cursor()
121     EXPORT_SYMBOL(drm_dp_get_adjust_request_pre_emphasis);
122
123     u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
124     					 unsigned int lane)
125     {
126     	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
vvv     CID 1487366:  Memory - corruptions  (OVERRUN)
vvv     Overrunning buffer pointed to by "link_status" of 6 bytes by passing it to a function which accesses it at byte offset 10 using argument "offset" (which evaluates to 524).
127     	u8 value = dp_link_status(link_status, offset);
128
129     	return (value >> (lane << 1)) & 0x3;
130     }
131     EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
132

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487366 ("Memory - corruptions")
Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")


Thanks for your attention!

-- 
Coverity-bot
