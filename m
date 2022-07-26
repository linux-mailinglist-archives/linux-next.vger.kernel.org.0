Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E45580C01
	for <lists+linux-next@lfdr.de>; Tue, 26 Jul 2022 08:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbiGZG6o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jul 2022 02:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbiGZG6n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jul 2022 02:58:43 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736B62124D
        for <linux-next@vger.kernel.org>; Mon, 25 Jul 2022 23:58:42 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z18so4276432edb.10
        for <linux-next@vger.kernel.org>; Mon, 25 Jul 2022 23:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=VO93DLDSyuiE5m/h3CZQjoxqN5ZUewPL97M2fFnH/Ms=;
        b=xxDn2/5x1eOM3bJXBPJHTeh/x6nTyx4S7ffCNaq1gtDhyu/yl8+ARXDntYn5WK8nim
         Pb0wIGNCiktlQg7lpbUJGPCSIPnaZtTr3JxL/aMrfS7eUPsxD8Dns23byMqhme8SvZq6
         qvpI+EaYVEZJ5mZesrko8p1c7G+yqwT6D3EvrtQdD6wgIT7s1p0iV0MVeRbgYVpkY6vN
         FBtTxHvbDS0eh/ZGmzKi3s88hAj+8DmpOuvconLElTRiF6UclozLDBNDYTudFeET85H+
         igNVpA6fnDiZY3+91tO5yBBso5q9ajnoJs01C8gzRKaftG4iS4c2E8SVZXhIiYUVcBQy
         ZSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=VO93DLDSyuiE5m/h3CZQjoxqN5ZUewPL97M2fFnH/Ms=;
        b=4IWtoNrdUvOqH8PADL4BUu1HfiJiCtwwwPEljdQI0bOdHIfIusEgw+Q8zg8te2Dt64
         mjgpOtMFP0Yr3QSumw3G3jny6qMjbxHPFWB9CKH4PkcTV+0RWNPxLPqk9OT/RNyDic/i
         GwhJ7E/SDW7HmgbNkL9QYPj1R3htOApDOpBZbRj3TwvDpSa01u2cbWVqwndwRAvyArgA
         wn+JWeec8R1qLBlyBtxNuNePsPpbKmn976AhHPUAphnUVWYNFrieZahRg1rvIB2mqjWZ
         3LV5S+lOVAQiZza6+fT2LGlkTeiiYlxI5SiMIUKHSMlWzXVG2PT+itlTxJcEdoRsU0o3
         MICQ==
X-Gm-Message-State: AJIora8SVtNudEm1sZh7lirwc3+BRbrP9VFo8SBHAUN2EhOwiOV2fC8Y
        dJX44sJn09NvaD7NW4piYx0GVuFhLV4lsMJ93Rce9Id/V9XNNg==
X-Google-Smtp-Source: AGRyM1sHcB8im8ckzbaXWEnk89N66dulZhudukS3hn368DoQg0apkNatvAJ3/pqjz/MO7qPI7bcFw5PaHE/jpF0/zuc=
X-Received: by 2002:a05:6402:caa:b0:43b:c350:18c7 with SMTP id
 cn10-20020a0564020caa00b0043bc35018c7mr16973239edb.193.1658818720183; Mon, 25
 Jul 2022 23:58:40 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 26 Jul 2022 12:28:29 +0530
Message-ID: <CA+G9fYuH+Jo3xFypJc8+F6juT783StO=oe0P9ZMMLE7nM0bQJg@mail.gmail.com>
Subject: [next] clang: drivers/gpu/drm/i915/gt/intel_region_lmem.c:94:23:
 error: result of comparison of constant 4294967296 with expression of type
 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Cc:     Nirmoy Das <nirmoy.das@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The Linux next-20220725 i386 clang builds failed due this build error,

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on i386:

   - build-clang-11-defconfig
   - build-clang-14-lkftconfig
   - build-clang-13-defconfig
   - build-clang-12-defconfig
   - build-clang-13-lkftconfig
   - build-clang-12-lkftconfig
   - build-clang-14-defconfig

Steps to reproduce:
-------------------
tuxmake --runtime podman \
        --target-arch i386 \
        --toolchain clang-14 \
        --kconfig
https://builds.tuxbuild.com/2CQwgxqR0lJKwPMl2LxaDTNwsq0/config \
          LLVM=1 \
          LLVM_IAS=1

Build error log:
-----------------
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=i386 CROSS_COMPILE=i686-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'
drivers/gpu/drm/i915/gt/intel_region_lmem.c:94:23: error: result of
comparison of constant 4294967296 with expression of type
'resource_size_t' (aka 'unsigned int') is always false
[-Werror,-Wtautological-constant-out-of-range-compare]
                    root_res->start > 0x100000000ull)
                    ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
1 error generated.
make[5]: *** [scripts/Makefile.build:250:
drivers/gpu/drm/i915/gt/intel_region_lmem.o] Error 1
make[5]: Target '__build' not remade because of errors.


Build link:
https://builds.tuxbuild.com/2CQwgxqR0lJKwPMl2LxaDTNwsq0/


--
Linaro LKFT
https://lkft.linaro.org
