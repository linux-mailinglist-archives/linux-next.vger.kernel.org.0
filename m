Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058A91B4C83
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 20:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgDVSNe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 14:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgDVSNd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2020 14:13:33 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA929C03C1A9
        for <linux-next@vger.kernel.org>; Wed, 22 Apr 2020 11:13:33 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id w3so1253693plz.5
        for <linux-next@vger.kernel.org>; Wed, 22 Apr 2020 11:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=DgJydwuk4gMph82j7+rjejPf2WRrWrDdHj8HhtrRzQ4=;
        b=WqePErKmLfh7KBagDLNs2ECFFKUWWBuS/LT9C73G43CCfr0jKZvKIYb3uoriovYgSC
         GcCA6bjDDcleiNLUD2Ie1lEcsqU9rzOh73+HA/8Bmaoo2nmOMvb/7qKYHDJEU2mJ4K13
         pQNJM1IgnSTfjuc7tCxndy6NECNoPdx5sbX8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=DgJydwuk4gMph82j7+rjejPf2WRrWrDdHj8HhtrRzQ4=;
        b=cWC60jmU4KNzcdPm5v1ITMGPUwRnaZRblse7o/GpHMrq48rOVEYNy0vkqi6G/HEs9B
         MduvdVi80DgG/lVQVv+US0OCsEvxOvCF3D3bgiXSZZne4ygSKCDQ0iChe6H2LBwjj/im
         kUpXdPIe8DSFrZ/m00FhsqhJT+a3YzCOaqzfgfLFqevPEzdnYaA+dbn6Dw1AxVHj77/b
         gRDN+4H4mj70M2QlUJKq83kqwtvdkqa2+kxlis9a3mMHvrbdc/gkRGF/qWw4rOsv6hdU
         Ek0y1ENjPEUGN7TJ5wKM4AV66i5oZIh3MhtlZR5VLownZjnE0b0nyvPevwrsRwOAD+x6
         pmWw==
X-Gm-Message-State: AGi0Pua8fR3ZBpHRpwIqjXXQzt7r5aRLZdoQAmj8XjJYLK3SDEkM1Prq
        5GHIjkD1/sJM0YtWvUztX3K3oQ==
X-Google-Smtp-Source: APiQypIF/TOFMVWqsqo9Ji5t23ufkdJTEnR9y/bKsOIqSx5+isvviBIv0rFXsZqqC+mxviI+g5ea1Q==
X-Received: by 2002:a17:90a:1954:: with SMTP id 20mr6897pjh.106.1587579213077;
        Wed, 22 Apr 2020 11:13:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 18sm6140343pjf.30.2020.04.22.11.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 11:13:32 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 22 Apr 2020 11:13:31 -0700
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: compat_ksys_shmctl(): Uninitialized variables
Message-ID: <202004221111.DD985EB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200422 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Sat Jul 8 22:52:47 2017 -0400
    553f770ef71b ("ipc: move compat shmctl to native")

Coverity reported the following:

*** CID 1492708:  Uninitialized variables  (UNINIT)
/ipc/shm.c: 1347 in compat_ksys_shmctl()
1341     	}
1342     	case SHM_INFO: {
1343     		struct shm_info shm_info;
1344     		err = shmctl_shm_info(ns, &shm_info);
1345     		if (err < 0)
1346     			return err;
vvv     CID 1492708:  Uninitialized variables  (UNINIT)
vvv     Using uninitialized value "shm_info.swap_successes" when calling "put_compat_shm_info".
1347     		if (put_compat_shm_info(&shm_info, uptr))
1348     			err = -EFAULT;
1349     		return err;
1350     	}
1351     	case IPC_STAT:
1352     	case SHM_STAT_ANY:

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Human edit:
This is technically a false-positive, but it's a weird one in that
everything else in the call graph checks for "err" being "!= 0", but
line 1345 checks for "< 0". Maybe this deserves a change to "if (err)"
there just for robustness?

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492708 ("Uninitialized variables")
Fixes: 553f770ef71b ("ipc: move compat shmctl to native")

Thanks for your attention!

-- 
Coverity-bot
