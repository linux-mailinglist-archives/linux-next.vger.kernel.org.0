Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB069706A75
	for <lists+linux-next@lfdr.de>; Wed, 17 May 2023 16:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbjEQODE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 May 2023 10:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjEQODD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 10:03:03 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEEC126
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 07:03:02 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-ba827a34ba8so1040706276.0
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684332180; x=1686924180;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EnN81p2MeWO9EzOWTpebA/OMy7HtWZHmn+rKTFE9OqM=;
        b=HdfqFplYz7Qf9SanlMHtPvfRuEa8h8QgTs2pp24EwWfK02ZbEs06WnBq6Vi4ke8ALC
         Nu+AHv2FBCR+drvv6EuN666Wt/A5Vbd6xAnLElWstD7ALkee9Q05qV8GX5uhw6uhuuZi
         B4fBFopzSA1bGTqnA8XRDAxwWETprDKa4PpCCT/WD6+4Bu6UwY3NM5coNv8rZ1teGyAo
         voZ/fh6D1yfhCuJd5IlTu2kLKijc9Fwju3/gVrSdGdQfY85CWAkIoYQEgmPlOrQ6VZkk
         +AlktRzrpxoJa4kYyVQXkjwIJz1JbkoFm0dNwWSFMhfmf1JmMhZ34uqN+PWcYHxpY9Wj
         y2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684332180; x=1686924180;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnN81p2MeWO9EzOWTpebA/OMy7HtWZHmn+rKTFE9OqM=;
        b=WIkdCRBQdrYrg4tQ4qys+5xzhlMPmTgQZSWw53svrE+t4X9HSwDGbx8EEW6ZNVE2xD
         SBIH121ZFyvmSLbSfX/KQBkvoBMIz3oVpf4ptprplPK1rt5h8Pb+e0Yj0sSLtAe2T82x
         7S5bkBbno7WlwdnGRJZFTE/eO4/ie3KB4RO6Y+F+nW5q51NRTZrVhAtHZ5MI2kYYkTbE
         cqnK4YrIFBVrVY4PY71XzzcEqblXulTP+ZFvZpnK+zUFaokYX77ws2DF/eagt+pMngxz
         sqqCArUsEifOFuQyz4j8vk1Dnmaal2F9lhDLADPYp6J9RmnABSKGiQlvaOK0WjvDHdar
         iTGQ==
X-Gm-Message-State: AC+VfDwQ2pMhU5CQ2KGfi2psRz1ier4gbQto/nG9aw0Kf0UDUDhMyxU0
        jSaxLG+5yAmVx1hR+cvVweRAeE6uWbclgQxWS0hwJw==
X-Google-Smtp-Source: ACHHUZ5ebL6rGP7D45jjjmqs/3K8SRxUe+aFYYf5yNPLUOHysTYfhtudOs1R+FMLsNcRKZaBP9DtvPGuDCjBp+f73xA=
X-Received: by 2002:a05:7500:e568:b0:106:ad71:fc05 with SMTP id
 rh40-20020a057500e56800b00106ad71fc05mr43929gab.73.1684332180208; Wed, 17 May
 2023 07:03:00 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 17 May 2023 19:32:48 +0530
Message-ID: <CA+G9fYsShNP=LALHdMd-Btx3PBtO_CjyBNgpStr9fPGXNbRvdg@mail.gmail.com>
Subject: next: gcc-8-ppc6xx_defconfig: ERROR: modpost: "__divdi3"
 [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
To:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
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

Linux next powerpc gcc-8 build failed on Linux next 20230516 and 20230517.
 - build/gcc-8-ppc6xx_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
====
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build \
  ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- \
  'CC=sccache powerpc64le-linux-gnu-gcc' \
  'HOSTCC=sccache gcc'

ERROR: modpost: "__divdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/pci/emu10k1/snd-emu10k1.ko] undefined!
make[2]: *** [/builds/linux/scripts/Makefile.modpost:136:
Module.symvers] Error 1
make[2]: Target '__modpost' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1978: modpost] Error 2


links,
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031706/suite/build/test/gcc-8-ppc6xx_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031706/suite/build/test/gcc-8-ppc6xx_defconfig/history/

Steps to reproduce:
=======
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

 tuxmake --runtime podman --target-arch powerpc --toolchain gcc-8
--kconfig ppc6xx_defconfig


--
Linaro LKFT
https://lkft.linaro.org
