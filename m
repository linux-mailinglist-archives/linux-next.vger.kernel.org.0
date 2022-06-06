Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B4453E757
	for <lists+linux-next@lfdr.de>; Mon,  6 Jun 2022 19:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235623AbiFFLqO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jun 2022 07:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235619AbiFFLqN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2022 07:46:13 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E45723A017
        for <linux-next@vger.kernel.org>; Mon,  6 Jun 2022 04:46:12 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id g4so25143223ybf.12
        for <linux-next@vger.kernel.org>; Mon, 06 Jun 2022 04:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pq4w54S0xjOQhYVPvRcjJWBaSHI24L9PwLtQAAo4Ntg=;
        b=gHaQNvBBVKcmZcocDQXhBOlog/h3SF6dgiasF2SXoHuLOtRY6PTNX8CJCUJTMQucRo
         nkXSl1LAtAwDnvBOXLRmZZofPjkPhpJ9XnHGEPmfmhy5b9bYXyFOn5XCOsj6krAKOg8B
         7f8Vooud4xE7xg0EqY+CdiZCmnaK7y85Azd2rO/cIH66U2Ut411KoKhqDDhAkKL9pPxm
         DQNu84vWMMACJXyd5ltToyc62/56P8w3pZ4ftBmhG48+rAL3CZKpq7NZUnyDq+lpD9Dd
         DqGxkqV5e2gPitP9FdardR9Ei70BfqIUstRyZvmQ/6SXx9G+LK4YI9qh42kJDwBR2zM1
         5Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pq4w54S0xjOQhYVPvRcjJWBaSHI24L9PwLtQAAo4Ntg=;
        b=7PwhLsvnZSvqbj2Ng3piGTIgVebXjRorq7jY6F6KhxE8tR37RaSqt/FZLgWovcTaJc
         M+7V+zPYTlMPQjIMm4ggrMnipjFDArh9Fi0qD6eoLjQljUlbj3FAHQbB0Bu3e/zZfj/D
         HdqZihX1H0f5sfxTMioqFduHWt4KohdXObh6nnRavtX89T+TV+s2mmtBu0tBOGtfvReC
         qyQwGyVk7CbIY/00wVC31INqV8pziPueGvxlk6xH2KwPdgmXGOEpWFqJGVLsZadjXgMt
         8rFUvgjJHPzUJMjmkiY7IYBmMpUWrXuybZmkcIEIjRK5xowWexluA8MYlfKMOH2ZbTE/
         63zQ==
X-Gm-Message-State: AOAM533LO8iCF8GSUaw2W8C25tAwSEZWGCmQXlJ1XEKFFAfCL9xl7wwu
        4ZL5+Vq5CPOiij594ihT7Jbpwc//IsfV+yC/F4KQxMO1Ey3s0w==
X-Google-Smtp-Source: ABdhPJzbneoLeu30KiEdfnDmFRZ6ePkYkJLIfh3Fz42eU0SJGKqIICy/fbowKdH3ZfS8w2qGdglt9DN/yIu46atMQ00=
X-Received: by 2002:a25:4705:0:b0:65d:43f8:5652 with SMTP id
 u5-20020a254705000000b0065d43f85652mr23688028yba.389.1654515971012; Mon, 06
 Jun 2022 04:46:11 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 6 Jun 2022 17:16:00 +0530
Message-ID: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
Subject: [next] arm64: boot failed - next-20220606
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mm <linux-mm@kvack.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Raghuram Thammiraju <raghuram.thammiraju@arm.com>,
        Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next-20220606 arm64 boot failed. The kernel boot log is empty.
I am bisecting this problem.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

The initial investigation show that,

GOOD: next-20220603
BAD:  next-20220606

Boot log:
Starting kernel ...

The recent changes show,

# git log --oneline  next-20220603..next-20220606  -- arch/arm64/
202693ac55e0 (origin/akpm-base, origin/akpm) Merge branch
'mm-everything' of
git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
a83bdd6800e3 Merge branch 'rust-next' of
https://github.com/Rust-for-Linux/linux.git
9daba6cb8145 Merge branch 'for-next' of git://github.com/Xilinx/linux-xlnx.git
582d5ed4caf7 Merge branch 'master' of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git
1ec6574a3c0a Merge tag 'kthread-cleanups-for-v5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace
21873bd66b6e Merge tag 'arm64-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
a8fc46f5a417 mm: avoid unnecessary page fault retires on shared memory types
3c59c47d1a6d arm64: Change elfcore for_each_mte_vma() to use VMA iterator
1c826fa748d5 arm64: remove mmap linked list from vdso
54c2cc79194c Merge tag 'usb-5.19-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
09a018176ba2 Merge tag 'arm-late-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
96479c09803b Merge tag 'arm-multiplatform-5.19-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc


Test job link,
https://lkft.validation.linaro.org/scheduler/job/5136989#L560


metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 40b58e42584bf5bd9230481dc8946f714fb387de
  git_describe: next-20220606
  kernel_version: 5.19.0-rc1
  kernel-config: https://builds.tuxbuild.com/2ABl8X9kHAAU5MlL3E3xExHFrNy/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/556237413
  artifact-location: https://builds.tuxbuild.com/2ABl8X9kHAAU5MlL3E3xExHFrNy


--
Linaro LKFT
https://lkft.linaro.org
