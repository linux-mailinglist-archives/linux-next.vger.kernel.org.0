Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA1BE7CAC
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 00:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729692AbfJ1XEM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 19:04:12 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:37493 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbfJ1XEM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 19:04:12 -0400
Received: by mail-pl1-f179.google.com with SMTP id p13so6497939pll.4
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=CxKWWurgtxLRRnDLULtGpclQvp5eclwe0z2atIbw8d4=;
        b=Xc/6wXfWO48faiPQc7wUZpR4C0Atnr2/VgGNkYQbCb/gMEIcZc1Y73fGPqu7hslhRe
         WH88a7xPln4YMItZDJx39QSTAj9ufqGYHeEgkLD5z4Mrmbu4J7Kb6Atv3yzw7cGX8Tuw
         IOfRakYVxziGl5PokNHJeM5wr25nz00JGOQ70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CxKWWurgtxLRRnDLULtGpclQvp5eclwe0z2atIbw8d4=;
        b=XF5m3e99iKSe3gAS0V+zsL8zQ8l6Xz8VA03pIHABJum0gnTadzR5ixlNatmAAu8x7V
         wPJp7alk3mlihV7/Op5WChdaIJTGfX/S0zwG5BBS415CO5GJwK13Mbvc/amKInTnItvp
         ONFCGpMk0qvfQ7m4xfSm7G1oIA94Tf2V2Lb9eD4+98z/jkOZRH5DKjFADxZ1SXzkA14h
         2Ux5d8wteHhzLfQlTka8CNZceW+GzDx8KLkuv9nM5HTvHgwZBckJzi9T4ePRUKc/nPXV
         tykzBfg2gm4Y2YW+jkNDRNpFQwzKBFd6uNcv8VMzIp4pJp/M6lA7kzL+uQUtLDOXbzRj
         CuKQ==
X-Gm-Message-State: APjAAAV0wDzuRC8X1pG7+sMEHPXbqIwF0ldmCpzHoE3yUsFz4SE+IJmO
        SDRnJpUY12K0O5DF3n+tS5Q68A==
X-Google-Smtp-Source: APXvYqy6YGGZegQF8v+GTz6KbTrqriq/i6/EnND+h7N3n9aDzVEyb/owrBmq1UOKFgyvmOI7BwGQXg==
X-Received: by 2002:a17:902:6944:: with SMTP id k4mr556309plt.175.1572303851500;
        Mon, 28 Oct 2019 16:04:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id cx22sm471147pjb.19.2019.10.28.16.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 16:04:10 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 28 Oct 2019 16:04:09 -0700
To:     Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: execlists_update_context(): Integer handling issues
Message-ID: <201910281603.AE297D69@keescook>
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

08fff7aeddc9 ("drm/i915/tgl: Wa_1607138340")

Coverity reported the following:

*** CID 1487369:  Integer handling issues  (NO_EFFECT)
/drivers/gpu/drm/i915/gt/intel_lrc.c: 1057 in execlists_update_context()
1051     	mb();
1052
1053     	desc = ce->lrc_desc;
1054     	ce->lrc_desc &= ~CTX_DESC_FORCE_RESTORE;
1055
1056     	/* Wa_1607138340:tgl */
vvv     CID 1487369:  Integer handling issues  (NO_EFFECT)
vvv     This greater-than-or-equal-to-zero comparison of an unsigned value is always true. "rq->i915->drm.pdev->revision >= 0".
1057     	if (IS_TGL_REVID(rq->i915, TGL_REVID_A0, TGL_REVID_A0))
1058     		desc |= CTX_DESC_FORCE_RESTORE;
1059
1060     	return desc;
1061     }
1062

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include:

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487369 ("Integer handling issues")
Fixes: 08fff7aeddc9 ("drm/i915/tgl: Wa_1607138340")


Thanks for your attention!

-- 
Coverity-bot
