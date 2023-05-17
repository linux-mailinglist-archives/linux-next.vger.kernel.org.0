Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7F2706C21
	for <lists+linux-next@lfdr.de>; Wed, 17 May 2023 17:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjEQPGH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 May 2023 11:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjEQPFz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 11:05:55 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F3CDA5F8
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 08:05:14 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-ba6d024a196so680606276.2
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684335911; x=1686927911;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Hy3S/uLeBJ9wbvFj8d26FLWVZjY/CD9djb2cwqZy34=;
        b=T/WYkkiHWMusiXUZTwjMzyHLY6Orz4UuXXFlZJTaouPK9IL7H5ErB2u7JAXXvtF3vI
         HTMnAKIGK7Oh0Xp0COrXEW8A5zrC9dV14isKDfm+5bIv9QNmdP990cCbsXM8ZGOWxPHl
         uyzSJTDQ/b/tAEfnjl+rdPX89NP9BHmM0ZK8o+qgCHfYmSL9F0ezWCrpTu1NJk2MiFya
         jAHg5qZAEPchSZeHY27XeMVC2FxYbRiZO4YIFRBCKXoeTiQN2zEArWTHvvZF9hiuT3DH
         QXpFdymSj93HmlqqlhQU+cIIxTxqz+2npp4HkWW+C9yWPhmlFokj+86wf+i9ua9LR/9W
         VgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684335911; x=1686927911;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Hy3S/uLeBJ9wbvFj8d26FLWVZjY/CD9djb2cwqZy34=;
        b=VVfpcwaDqkl42AmP0EmgpqKtCXEmZL0rp54FGq1Mp5RavnS6FbIwC6P9HHthS6Ys1o
         OuyR4+PmlD9LHx9DJkmbu8s8+yfPJneQktO3VxlslAHXT/4E3byTI0fFTJ5616WXMgUG
         jli/ynVFrridSxQpu4Zl4nkzdUe68DGP9Tuctms6hLiKSnUgS7bvSwuGwcxU8ZifTCOn
         vBMRhaWs3DwRVFFkVxhB0RkBGexTT/K9+N8qyu3I3qutKOA+JCEe4icIPNz5PU099Pvo
         py9/yKKIjCJkJkF0rp1Q+GtukYB5FT5lapl90VISdIr02odSNASeqe+tenIZrQZJ/ezM
         MwUg==
X-Gm-Message-State: AC+VfDwfRfKDt5GsrPXdTlTCWt+oV9EVr6rfsx9d+BAMpnXnGwm9vco6
        zb8fkT5FHi7igWLjngi3NOzJOwcTqSLhlvm+/qxu0B2I6Be7yw6Uw1kAnw==
X-Google-Smtp-Source: ACHHUZ7D6NuHwORKshX3NmiXkO5zOiVNEny2VwT8YmVta8L5cjWpUWNB5G+eC5ugovKpugcv3xQ6RidsBuX4195wB/E=
X-Received: by 2002:a05:7500:2cb:b0:101:b5c1:6721 with SMTP id
 i11-20020a05750002cb00b00101b5c16721mr61462gai.27.1684335910923; Wed, 17 May
 2023 08:05:10 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 17 May 2023 20:34:59 +0530
Message-ID: <CA+G9fYvgBR1iB0CorM8OC4AM_w_tFzyQKHc+rF6qPzJL=TbfDQ@mail.gmail.com>
Subject: next: perf: i386: bench/syscall.c:101:22: error: '__NR_execve'
 undeclared (first use in this function)
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-perf-users@vger.kernel.org, lkft-triage@lists.linaro.org
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next perf build failing for i386 architecture.
 - build/gcc-11-lkftconfig-perf

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/bench/syscall.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/tests/parse-events.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/build-id.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/cacheline.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/config.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/copyfile.o
  CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/bench/mem-functions.o
bench/syscall.c: In function 'bench_syscall_common':
bench/syscall.c:101:22: error: '__NR_execve' undeclared (first use in
this function)
  101 |                 case __NR_execve:
      |                      ^~~~~~~~~~~
bench/syscall.c:101:22: note: each undeclared identifier is reported
only once for each function it appears in
bench/syscall.c: In function 'bench_syscall_execve':
bench/syscall.c:183:49: error: '__NR_execve' undeclared (first use in
this function)
  183 |         return bench_syscall_common(argc, argv, __NR_execve);
      |                                                 ^~~~~~~~~~~
bench/syscall.c:184:1: error: control reaches end of non-void function
[-Werror=return-type]
  184 | }
      | ^
cc1: all warnings being treated as errors

logs:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031014/suite/build/test/gcc-11-lkftconfig-perf/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031014/suite/build/test/gcc-11-lkftconfig-perf/history/


Steps to reproduce:
=============
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake   \
 --runtime podman   \
 --target-arch i386   \
 --toolchain gcc-11   \
 --kconfig defconfig   \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
  \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
  \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
  \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
  \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
  \
 --kconfig-add CONFIG_IGB=y   \
 --kconfig-add CONFIG_UNWINDER_FRAME_POINTER=y   \
 --kconfig-add CONFIG_SYN_COOKIES=y   \
 --kconfig-add CONFIG_FTRACE_SYSCALLS=y NO_BPF_SKEL=1 debugkernel
headers kernel modules perf


--
Linaro LKFT
https://lkft.linaro.org
