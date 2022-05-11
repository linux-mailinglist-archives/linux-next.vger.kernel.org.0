Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B9F523B14
	for <lists+linux-next@lfdr.de>; Wed, 11 May 2022 19:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345297AbiEKRDP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 May 2022 13:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345294AbiEKRDO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 May 2022 13:03:14 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7A569B63
        for <linux-next@vger.kernel.org>; Wed, 11 May 2022 10:03:12 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2fb9a85a124so25326857b3.13
        for <linux-next@vger.kernel.org>; Wed, 11 May 2022 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=IpFPdO/uhoos0ytjMYOded4nPoWVZB+GddWGBdrYbMs=;
        b=DftVrELHUbG6fAglpJBSkYraK/JxtyLTYij8BRwZtbKjUIRS9rXC3CRLLTATNg0yT6
         /BV+kAxtxbvLKnrVBCq0rp4iVtB/4xhip7cMbKBqncF40dKtWBU/O75l6+6mtUQuc9Jf
         7OqdNr68dN+aTIx2kNYySQZF4SNazr9zk17XEMjMRw6dwpWf8ZA09XtvmjNzAv1U0y1d
         GEKn6XWp/zxkLAVu5hg1NlJ4KHcUSYtjiCCzmG5lBNHBzItUWlQVzKhpeEGOwAitnl8d
         uP2bBRoM5MySUSBzHeW1tUa+DBONyCkjwtBe+nX1wiLYnPvzR87oYgJ7gr9jdyn54zaf
         II6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=IpFPdO/uhoos0ytjMYOded4nPoWVZB+GddWGBdrYbMs=;
        b=002mu3i91xVHVA/4PRVLRRfsTMRYdjk1vZCiNkfnkN0g/HWwKYSCBrWRVlNStN9GMp
         kD/1gekUcOJkYpCo7vINQM536I6974xa3/K99dVSrutiJCV0qn13IfmBpGTGFeCu2csI
         2dj+woTPoeUJGGi3RNmEkHghVcGsfsu+ZeADauRq2TEHM+HzNI8+cAY9Luhu5zHlJC47
         vCBNWYyPIp3jkT5UFkc0pHX0z+QaW2r+axjb+E1d+z3aGDPjxBogtH3PCuwlZF8QUyab
         QQkP6IX3tVAWbdQz2HK1NInKs1zNY++bDXMgkJ0iA3mF0jWuqzNwKkqdfWc7TynQfZTM
         aHww==
X-Gm-Message-State: AOAM533S6FnaNbLvORMSOAieFhbixdocZAsu/hqz1PCwq66KHEoXChor
        jVD8YbiOVjf6ywdVpQbNCiEwuN7saKPfMBg+CorMIg==
X-Google-Smtp-Source: ABdhPJwPNDG2qz9xm6hazjQfNV88Bgu3tDJb25KA7U+2Gg82o7sTH39Xql9UQcRPBTAYCAQHCh1Bu4zryk5beAVHzQY=
X-Received: by 2002:a0d:d88c:0:b0:2f7:bb41:1bd0 with SMTP id
 a134-20020a0dd88c000000b002f7bb411bd0mr25670953ywe.199.1652288592004; Wed, 11
 May 2022 10:03:12 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 11 May 2022 22:33:00 +0530
Message-ID: <CA+G9fYtKJ_a2rLSvxsYFrkUjNHpGeTn_xsL8kyz=-pBoeA+eXA@mail.gmail.com>
Subject: [next] mm: overcommit_memory: failed - TFAIL: alloc passed, expected
 to fail
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        LTP List <ltp@lists.linux.it>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Peter Xu <peterx@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Shakeel Butt <shakeelb@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Ganesan Rajagopal <rganesan@arista.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following LTP test regressions were noticed on Linux next-20220511 tag on
all the devices.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on x86 and arm64.

   ltp-mm-tests/overcommit_memory04
   ltp-mm-tests/overcommit_memory06
   ltp-mm-tests/overcommit_memory03
   ltp-mm-tests/min_free_kbytes
   ltp-mm-tests/overcommit_memory01
   ltp-mm-tests/oom01
   ltp-mm-tests/overcommit_memory05


mem.c:154: TFAIL: victim signalled: (9) SIGKILL
overcommit_memory.c:203: TFAIL: alloc passed, expected to fail
overcommit_memory.c:176: TINFO: malloc 7102100 kB successfully
overcommit_memory.c:203: TFAIL: alloc passed, expected to fail
overcommit_memory.c:176: TINFO: malloc 3523530 kB successfully

overcommit_memory.c:203: TFAIL: alloc passed, expected to fail
overcommit_memory.c:176: TINFO: malloc 8456472 kB successfully
overcommit_memory.c:203: TFAIL: alloc passed, expected to fail
overcommit_memory.c:176: TINFO: malloc 4283276 kB successfully
overcommit_memory.c:203: TFAIL: alloc passed, expected to fail
overcommit_memory.c:176: TINFO: malloc 2114118 kB successfully


metadata:
  git_ref: master
  git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git_sha: 6107040c99d5dfc920721c198d45ed2d639b113a
  git_describe: next-20220511
  kernel_version: 5.18.0-rc6
  kernel-config: https://builds.tuxbuild.com/291BWBU964yoppGqYfnVF8AJMg4/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/536448964
  artifact-location: https://builds.tuxbuild.com/291BWBU964yoppGqYfnVF8AJMg4
  toolchain: gcc-11


Full test log on x86:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220511/testrun/9438084/suite/ltp-mm-tests/test/overcommit_memory01/log
https://lkft.validation.linaro.org/scheduler/job/5012581#L10525


--
Linaro LKFT
https://lkft.linaro.org
