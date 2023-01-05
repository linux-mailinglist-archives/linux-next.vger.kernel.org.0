Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0BE65F195
	for <lists+linux-next@lfdr.de>; Thu,  5 Jan 2023 17:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234747AbjAEQ6n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Jan 2023 11:58:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbjAEQ6d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2023 11:58:33 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E5C392F3
        for <linux-next@vger.kernel.org>; Thu,  5 Jan 2023 08:58:33 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id t2so8572616vkk.9
        for <linux-next@vger.kernel.org>; Thu, 05 Jan 2023 08:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ax967uLsBA3GZ5v4kGKlUq/iPf9fnH+4W/AZZQrvrhY=;
        b=up6JbAUOoVYfp7UKnJzEIyb3T+Dar30KNi/m0G5GObz3TZ/h9VhcRLsGFDexwEFO5X
         YddZlUcBl1cSpl4JR4LTAvCRDiz3npWpjAKHJyyUvzDzwitwR8GKsMzzPQscZ7CVs3ry
         wMxgfm4bdEQcOF6eix1YFCyH+ytjDwPX3id6/v/t+KyKdJkuVKaxEoeeTFdnPlkzzx9D
         YR6cvoq5+AXHG9u5GrocGl5tALbLVZlBnJePE6xaSlSGFs9J/kX6XESpUYs0dlrDCu8+
         FpJlVTAaJmzlkeM7OV0+LNN+DQqFCtPRm0Q9FLMjfcti6fBGKrper/HA/xhIGLY4jm/f
         6ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ax967uLsBA3GZ5v4kGKlUq/iPf9fnH+4W/AZZQrvrhY=;
        b=TaF/+mmyskAxFneCKKlQ5sKcI7I7qrjn7b8VQ4kSl4ORagTsgqspMCmmYwJidR/HNr
         dT6lKETIr5C/a67Mk1Odk7/4qTXJszA4l4dWkW7i/IZjhfe3M326V1lfdonlIwPahv2C
         IKJNtkjt2YX21L9CIUMjr/7ZT0Thg7bOdqVJMdBf2DCNUwO3LyJxS40s03QK/RViRwgE
         JfhQBlvlhHG8aF0c5JK0ipomTN4d/FTSedsDpFv4HdtrAvXOqQtqrVyhlpB49/mWlkhR
         y7CUvzd5asPfYdDLnJsHpBIwRxE2po+qKE9YVHP0GZ6shyxb8OvgrY5/+wdQ0dfICrSC
         GBYQ==
X-Gm-Message-State: AFqh2kpuUJ+UOT3J80AoFMsCyzAdSodY1Rjq9whOK5vqwv0QovWcji6t
        KPswzEzi17DQFRJ35p5vPJrM0H4NSuYqsT2/siaVOP0NKXYhRuLp
X-Google-Smtp-Source: AMrXdXuJlnnKSFG7oQLM0fOQ/Xam46a8u/3M3IUgLGmmHu2URT9xp5Jc5tpJCq/Nl063q71lEOjE9jbajufd0iD0OXM=
X-Received: by 2002:a1f:9e12:0:b0:3d5:de78:715f with SMTP id
 h18-20020a1f9e12000000b003d5de78715fmr1212730vke.7.1672937911996; Thu, 05 Jan
 2023 08:58:31 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 5 Jan 2023 22:28:21 +0530
Message-ID: <CA+G9fYtrJySuME_dtNZSqPT9Ej7FWwwBGWHamDEEcE06=qruhA@mail.gmail.com>
Subject: next: powerpc: clang-15: defconfig failed
To:     llvm@lists.linux.dev,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The powerpc clang-15 defconfig build failures on Linux next-20230105 due to
following errors / warnings.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

`.exit.text' referenced in section `__bug_table' of crypto/algboss.o:
defined in discarded section `.exit.text' of crypto/algboss.o
`.exit.text' referenced in section `__ex_table' of
drivers/nvdimm/core.o: defined in discarded section `.exit.text' of
drivers/nvdimm/core.o
`.exit.text' referenced in section `__ex_table' of
drivers/nvdimm/core.o: defined in discarded section `.exit.text' of
drivers/nvdimm/core.o
`.exit.text' referenced in section `__bug_table' of
drivers/nvdimm/core.o: defined in discarded section `.exit.text' of
drivers/nvdimm/core.o
`.exit.text' referenced in section `__bug_table' of
drivers/macintosh/windfarm_core.o: defined in discarded section
`.exit.text' of drivers/macintosh/windfarm_core.o
`.exit.text' referenced in section `__bug_table' of drivers/scsi/sd.o:
defined in discarded section `.exit.text' of drivers/scsi/sd.o
`.exit.text' referenced in section `__ex_table' of
drivers/i2c/i2c-core-base.o: defined in discarded section `.exit.text'
of drivers/i2c/i2c-core-base.o
`.exit.text' referenced in section `__ex_table' of
drivers/i2c/i2c-core-base.o: defined in discarded section `.exit.text'
of drivers/i2c/i2c-core-base.o
`.exit.text' referenced in section `__bug_table' of
drivers/i2c/i2c-core-base.o: defined in discarded section `.exit.text'
of drivers/i2c/i2c-core-base.o
make[2]: *** [/builds/linux/scripts/Makefile.vmlinux:34: vmlinux] Error 1

build logs:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230105/testrun/13988496/suite/build/test/clang-15-defconfig/log
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230105/testrun/13988496/suite/build/test/clang-15-defconfig/details/

metadata:
build_name: clang-15-defconfig
config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2JtJjO4H316O94lONiPAIir18yV/config
git_describe: next-20230105
git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
git_sha: cc3c08b41a9c9402ead726ec6deb1217081d0d8b


steps to reproduce with tuxmake:
--------------------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch powerpc --toolchain clang-15
--kconfig defconfig LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld

--
Linaro LKFT
https://lkft.linaro.org
