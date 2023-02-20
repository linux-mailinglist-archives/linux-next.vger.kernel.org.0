Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E9469C8DB
	for <lists+linux-next@lfdr.de>; Mon, 20 Feb 2023 11:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjBTKo7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Feb 2023 05:44:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbjBTKov (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2023 05:44:51 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9E7BB81
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2023 02:44:45 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id df34so2083442vsb.6
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2023 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676889884;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SdbFyaUotfrnGaxTQFQI5slhKlHiFD8ZqAfdVqy1S9s=;
        b=xNuknyL9AQ1n+Up+CuP5ygJOO7YdsgCedODTBuoHxiY7ZM3rXCprZkl2u424znjDfb
         OqdWS+xjf9YclyvuocLIDYfwD2GdWqkzhGQe+APRN3tJl11vQKjXUhhsoM5lAvEnInd9
         lB1NlYqShVlcYoqEu7GxKFOlLmEtigfnT7+ncqE+4SNB1gVIiFif2C8HRQZcnFlBqyAE
         j0RN3bJTCxQC7ULzSGeRv6HMhva/19b9PS+D9xsrvzrn6Vc3vDoia4qGxmkBxBqOOp01
         9rDP+Queb6MCJrDH2A3vYo7vBxUzhVW7550/er6k0SjRiB3kDF8KqRRY5NV9GCpZrBtR
         53qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676889884;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdbFyaUotfrnGaxTQFQI5slhKlHiFD8ZqAfdVqy1S9s=;
        b=EhMeIsGswpK8ejt0CzQ25FgpjNicKgeBkAOe3l3vHMO0qtJ/ew4m6hB43ynTn018i+
         /1T45nC6YSrrfi9wJ/p8p/lKOvK0j2JNKPf235ya7zTC5BArJqW0clXZRZk9FqRPr9oy
         6VP0bFCFlBifazRPBXwjcnSSRgsFziy/Y9+zO4ceDzBqVrbBUwFlB8NOf2Zvjg8Yie3P
         4kVq+rGr3QHhRaxJaJdCLD05WMDjsB1DHCagPJLogENyLdcly5W2C7A0adRuZwQHIdUA
         ILv2A9LAZT3+mTooeLnHvTHvDifp0k0EG7jfUTIoXhPgU2S1JXa/EIspKUMyamaf0EHo
         +xaQ==
X-Gm-Message-State: AO0yUKXIVg2ga0GelFEKIxl8A3ltjqNhlvMfDTk2ydrmozbPw4GLS1Mv
        NwjilOwDFksHlOk+k5zJr5yr8MBjhMZlv3DaTrA7kA==
X-Google-Smtp-Source: AK7set/qMZP6wYZOsm0gA0Ih1aDYNjaLRXmFUrbSAhFGkTnveqvXNAHg081fU1+g6sU/C5m1xHwgm38ukLbJWVMMO9Y=
X-Received: by 2002:a67:d61e:0:b0:414:4aab:3c73 with SMTP id
 n30-20020a67d61e000000b004144aab3c73mr57980vsj.71.1676889884253; Mon, 20 Feb
 2023 02:44:44 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 20 Feb 2023 16:14:33 +0530
Message-ID: <CA+G9fYsQZrpiLRN1=zW-VRGZ57smV5OW5ZAF4rbLPFA05F5zYg@mail.gmail.com>
Subject: next: 32-bit: ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        linux-btrfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
        Josef Bacik <josef@toxicpanda.com>, Chris Mason <clm@fb.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[Please ignore this email if it is already reported]

Following build error noticed on 32bit arm and i386 with kselftest merge
configs with gcc-10/12 on today's Linux next-20230220 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build regression:
  - gcc-10-lkftconfig-kselftest
  - gcc-12-lkftconfig-kselftest

Build error:
ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [Makefile:1980: modpost] Error 2


Build details,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230220/testrun/14861694/suite/build/test/gcc-10-lkftconfig-kselftest/details/
config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2LzUSQ9Y7f1N6Op0juNKcpbfGiM/config


# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake  \
 --runtime podman  \
 --target-arch arm  \
 --toolchain gcc-10  \
 --kconfig defconfig  \
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
 --kconfig-add CONFIG_ARM_TI_CPUFREQ=y  \
 --kconfig-add CONFIG_SERIAL_8250_OMAP=y  \
 --kconfig-add CONFIG_POSIX_MQUEUE=y  \
 --kconfig-add CONFIG_OF=y  \
 --kconfig-add make:kselftest-merge  \
 --kconfig-add CONFIG_KFENCE=n  \
 --kconfig-add CONFIG_AHCI_DWC=y debugkernel dtbs dtbs-legacy headers
kernel kselftest modules


--
Linaro LKFT
https://lkft.linaro.org
