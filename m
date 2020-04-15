Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8FA1AAC5E
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 17:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414943AbgDOPyQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 11:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1414944AbgDOPyO (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 11:54:14 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B4FC061A0C
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2020 08:54:14 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id t11so113553pgg.2
        for <linux-next@vger.kernel.org>; Wed, 15 Apr 2020 08:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Pnaa9tO4TDdHHzxVVN3l2O5eXLi3htiwL1scVJIgPTk=;
        b=ZpjceMoCIcI3mYOsRl2ZnOe0O/0G+ye5xYrhSnK9ISc9YqZtqwquc85SL7CeuD0QHk
         izBpiu5YValAmZjWVvupWkgfn4fyNoJaLObgyScPzaHsk/uLdmSLtEfGE4lCBA4lQMIJ
         SkyAlv3hYTG9UiwavndZr9HFf3We015jded5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Pnaa9tO4TDdHHzxVVN3l2O5eXLi3htiwL1scVJIgPTk=;
        b=qWeFvPNBVThdVhFrbJbaBkSvyn8ZIB5/NXXmQ8jp962TqKZPHUlCkzV9rjgFMIRpEW
         QgDJPOPbyDCVa0YjcsFT8sZSm5Q3SK3AX44Lj+GykdwJTcP6X8yFFqyOhaEPewvwd5lb
         G6K/7FHpHev9qEo745wHLWip93t1qr99sUO8gdv3xDTDG0J6eh5ONO/7IrZwFBfDTT6i
         uigXSRvx0lIFmeKdA53MJnWRPpEXBbUIi5GnTj4dH5zxWVSP+Ukvutl/njd3qRCHDysr
         hSki21PWGRd1LRj3gs3or3i6vlqklNsMTD7s5/xHeHpfkFm69MMrHnRyy0WItxerJt7r
         iXXg==
X-Gm-Message-State: AGi0PuYBq9fX/bMwqhbBj9uVkSs23+9asBfdKqdKXSVSW/BaMW1/X2e+
        IatEJOF5FPY0gBg3X5cZPB2JOJANOa0=
X-Google-Smtp-Source: APiQypImWRZoQr12OLU/BxVpS9uRnMttjdlhLr0G93jsnLz34DEsw25EQqeca3GizTBh1xVcmi1qhg==
X-Received: by 2002:a62:ee05:: with SMTP id e5mr18097058pfi.288.1586966053567;
        Wed, 15 Apr 2020 08:54:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id my15sm15917027pjb.28.2020.04.15.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:54:12 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 15 Apr 2020 08:54:11 -0700
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Emil Velikov <emil.velikov@collabora.com>,
        James Qian Wang <james.qian.wang@arm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: drm_gem_fb_create_with_funcs(): Memory - corruptions
Message-ID: <202004150853.FD574CDD@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200415 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Mar 11 15:55:36 2020 +0100
    f2b816d78a94 ("drm/core: Allow drivers allocate a subclass of struct drm_framebuffer")

Coverity reported the following:

*** CID 1492613:  Memory - corruptions  (USE_AFTER_FREE)
/drivers/gpu/drm/drm_gem_framebuffer_helper.c: 230 in drm_gem_fb_create_with_funcs()
224     	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
225     	if (!fb)
226     		return ERR_PTR(-ENOMEM);
227
228     	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
229     	if (ret) {
vvv     CID 1492613:  Memory - corruptions  (USE_AFTER_FREE)
vvv     Calling "kfree" frees pointer "fb" which has already been freed. [Note: The source code implementation of the function has been overridden by a user model.]
230     		kfree(fb);
231     		return ERR_PTR(ret);
232     	}
233
234     	return fb;
235     }

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Edit by human, double checking context:
	drm_gem_fb_init_with_funcs() calls drm_gem_fb_init()
	drm_gem_fb_init() calls kfree(fb)

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492613 ("Memory - corruptions")
Fixes: f2b816d78a94 ("drm/core: Allow drivers allocate a subclass of struct drm_framebuffer")

Thanks for your attention!

-- 
Coverity-bot
