Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22F73509EC
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 00:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhCaWEY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 18:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCaWDz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 18:03:55 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790BAC061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 15:03:55 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so2025266pjb.0
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 15:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=9H7T43Cz6yUrqvvSm/QPDG7xiExrWpaXoxXTt8KFwjQ=;
        b=BDbQvlPKacxqWUJc9Nv0uqpIJV/Wa2vjfjdON2MWCtAuzXuQqfgA06eMwHHeYaVJ2F
         e9LRcYFFIizpUYzP1qYqq+W7LASKJczCDoqn7B+yD5VsatTCwHsBXI2QzlitVqiclqeL
         vt24HtgLawGhQJIWk/5U9Diom3VdtXgUx0cLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=9H7T43Cz6yUrqvvSm/QPDG7xiExrWpaXoxXTt8KFwjQ=;
        b=rHKQ4E62T7nTh8BhfnpUEGA1TWa68Qma31f5sSiX+pRjqEuZVGm6jPGAIy8hrNmFHq
         kynqjwr6SEmnIV6oZGKrRjPK6lA+YQEPiP3GKNf6brLyMV/UMm9sQa1L9U0895E6Syp9
         4PEYGBlWcAfUMyATLM/bZdEyrrlMoEs71qvZ87zvxYu9bDExNVmRChMLWYYJOUQowZiq
         IDZ65sqS/xlwHUBAKvHKo2WnwMJ4Ez7pja8OhPbSSGSC8ubrP/LXWTo/E54kPr05eh9s
         vvUktmi9Ybct8cYHAIBGvEknT/Ka4KIncdD5+vNNoyhQjbw+hXELe09YKE5WmFW1Qwuw
         dhKQ==
X-Gm-Message-State: AOAM531pZxNVh72PbgPubumG0eVpFdwCtsgzFuqYKYWrgkocwE6CjS/D
        3OfFJlX9pZdideOPR8UcaaU9RQ==
X-Google-Smtp-Source: ABdhPJz+xRtTeMc3BDNTyRV4j1De9zzI9D1MjfGZVUcx50QjGRjZ+He4wV9sSZIEsKj4g5AryzMJZw==
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr5611127pjr.228.1617228235115;
        Wed, 31 Mar 2021 15:03:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 202sm3250515pfu.46.2021.03.31.15.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:03:54 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 15:03:54 -0700
To:     Jaroslav Kysela <perex@perex.cz>
Cc:     Takashi Iwai <tiwai@suse.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: snd_ctl_disconnect_layer(): Possible Control flow issues
Message-ID: <202103311503.E6CA7884@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210331 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  None
    3f0638a0333b ("ALSA: control - add layer registration routines")

Coverity reported the following:

*** CID 1503580:  Possible Control flow issues  (DEADCODE)
/sound/core/control.c: 2082 in snd_ctl_disconnect_layer()
2076     	down_write(&snd_ctl_layer_rwsem);
2077     	for (lops2 = snd_ctl_layer, prev_lops2 = NULL; lops2; lops2 = lops2->next)
2078     		if (lops2 == lops) {
2079     			if (!prev_lops2)
2080     				snd_ctl_layer = lops->next;
2081     			else
vvv     CID 1503580:  Possible Control flow issues  (DEADCODE)
vvv     Execution cannot reach this statement: "prev_lops2->next = lops->next;".
2082     				prev_lops2->next = lops->next;
2083     			break;
2084     		}
2085     	up_write(&snd_ctl_layer_rwsem);
2086     }
2087     EXPORT_SYMBOL_GPL(snd_ctl_disconnect_layer);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503580 ("Possible Control flow issues")
Fixes: 3f0638a0333b ("ALSA: control - add layer registration routines")

Thanks for your attention!

-- 
Coverity-bot
