Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8016469C4
	for <lists+linux-next@lfdr.de>; Thu,  8 Dec 2022 08:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiLHHgk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Dec 2022 02:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiLHHgj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Dec 2022 02:36:39 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA48F2A711
        for <linux-next@vger.kernel.org>; Wed,  7 Dec 2022 23:36:38 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id p18so313546qkg.2
        for <linux-next@vger.kernel.org>; Wed, 07 Dec 2022 23:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=97CF61NxNfINvAmFCHySr8pBYXl0fpYSbMxv8vXatSE=;
        b=QlyXdnWfeAGEZrdOzy9s6Z4X237j8Pipot9BBuCfCRDqWCQpOi464m8FComOVhAP8a
         3UewOiGSWl2flvhaBM//5YFvyOVH0AafmRZokxXAXiH2pMK3/MDpcBsMF6IdvRVyrJ//
         sUJFaGIBWiR4PuKQVzsIl6PPuhbj0gJBlF/OeXi1KmkFnYfG9FSXo9QZ1N4jxVmwB6MD
         c+A8DPLIq1Wa59nidmiqsn3XihHjDvYBo2YeNIum0v9E7Yf1YwAq3GruNpD1e9hZTkum
         JJCsENXYTiW/+pnS0uT6UEGIEZ8YO6JogP/pe+MLwxHIBWWjYkaIOhw73prhhgFsJWtg
         GOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97CF61NxNfINvAmFCHySr8pBYXl0fpYSbMxv8vXatSE=;
        b=ta0qq8J1VGvJHtDiV6YdXXAYqj590uMv3V98hA8xoMcUPqkwGv9pQiu/ndWfH/IVwY
         ZeNbZlv6aiKJ3W0kJDfHgN5TxxTWuj/7HionuMMM2GJjEjKLsfGqw+ACl1+4dMy/gb6t
         jeLidLD0ySlzYpdWOkivbUeDMpf71bQOoMeDW/d95CRc5oT2cZK7lAIFOFxoTrZgliRg
         f5dEjwi2Bv/JA14ZJr9HR1+KXCccjFOLeuQkfweX98B3Zpz8p+09OpI6CpvUAwoDsDGo
         5OI6XCUqVnYt9pgQJ2PcwGtWEtQDHmrNG8VWcqzX8v/qEb2mOBcmiui12AcOo0/5kR2+
         /zNg==
X-Gm-Message-State: ANoB5pnOSrrVuZjEte/rHHxp2iQWaJEKum/ziINKq2lwVjC7qAXEktl8
        KIeMjTJ1RBXFnCH4vI4YPsk6vDwM2/SsUd1uI02iVA==
X-Google-Smtp-Source: AA0mqf5OdwKrHO32/1x7P/rNBKW+fZ551hgS5X0cGSFAUGwcbf2vK6lAreSWv++D00yRLWC6YrOQ28myI+AyLgolrfQ=
X-Received: by 2002:a05:620a:13aa:b0:6fc:99c2:2567 with SMTP id
 m10-20020a05620a13aa00b006fc99c22567mr30870312qki.784.1670484997799; Wed, 07
 Dec 2022 23:36:37 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 8 Dec 2022 13:06:26 +0530
Message-ID: <CA+G9fYu5JjZzpFfNOqzLV+KQnSL1VU7n8Yv-FrZYvuvwo1Ayug@mail.gmail.com>
Subject: security: policy_unpack.c:325:10: error: use of undeclared identifier 'TRI_TRUE'
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, apparmor@lists.ubuntu.com
Cc:     Nick Terrell <terrelln@fb.com>,
        John Johansen <john.johansen@canonical.com>,
        David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build regresion found on Linux next-20221208 tag.

Regressions found on riscv:
  - build/clang-nightly-defconfig
  - build/gcc-8-defconfig
  - build/gcc-11-defconfig
  - build/clang-15-defconfig

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang' defconfig
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'
security/apparmor/policy_unpack.c:316:18: error: unknown type name 'tri'
VISIBLE_IF_KUNIT tri aa_unpack_array(struct aa_ext *e, const char
*name, u16 *size)
                 ^
security/apparmor/policy_unpack.c:325:10: error: use of undeclared
identifier 'TRI_TRUE'
                return TRI_TRUE;
                       ^
security/apparmor/policy_unpack.c:328:9: error: use of undeclared
identifier 'TRI_NONE'
        return TRI_NONE;
               ^
security/apparmor/policy_unpack.c:331:9: error: use of undeclared
identifier 'TRI_FALSE'
        return TRI_FALSE;
               ^
security/apparmor/policy_unpack.c:455:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
                                                       ^
security/apparmor/policy_unpack.c:529:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
                                                       ^
security/apparmor/policy_unpack.c:559:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
                                                       ^
security/apparmor/policy_unpack.c:611:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE ||
                                                       ^
security/apparmor/policy_unpack.c:674:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
                                                       ^
9 errors generated.
make[4]: *** [scripts/Makefile.build:252:
security/apparmor/policy_unpack.o] Error 1
make[4]: Target 'security/apparmor/' not remade because of errors.
make[3]: *** [scripts/Makefile.build:504: security/apparmor] Error 2

Build link,
  - https://builds.tuxbuild.com/2IcJeyR3s4kGd2Nca8vVq7Sleao/
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221208/testrun/13508560/suite/build/test/gcc-11-defconfig/details/

Build results comparison:
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221208/testrun/13508560/suite/build/test/gcc-11-defconfig/history/


steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig


tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig https://builds.tuxbuild.com/2IcJeyR3s4kGd2Nca8vVq7Sleao/config

--
Linaro LKFT
https://lkft.linaro.org
