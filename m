Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B76175C31A
	for <lists+linux-next@lfdr.de>; Fri, 21 Jul 2023 11:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjGUJd5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jul 2023 05:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjGUJd4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jul 2023 05:33:56 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF742D7F
        for <linux-next@vger.kernel.org>; Fri, 21 Jul 2023 02:33:55 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-55adfa61199so1159001a12.2
        for <linux-next@vger.kernel.org>; Fri, 21 Jul 2023 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689932034; x=1690536834;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S06AqqBQY/XLaTfW98+CLvTaCgLNSccXV/8O8vUmFHQ=;
        b=BvmdNimE4E5ll+PWPPwBcdH1SXSxR4LbHwwOMTJOSNXy8+u5t9noiR3FZcg8VAm5ku
         Qa0mpZt7rgXeeDM262nY5PX77vq2NCCDdARqUrbSvDSDVPhiuWglXIXErDmh2f3b7VYk
         SvUi2fWCStiRkCfp2GCRLBQbb6O+suFprGtAB25I+RUgY/2brMEET7UBH+MprBrJRpbB
         IZu16+oTwpz9724JTIJFZUtwdUjw19neoivY7cVwWpN/qJowtNprHg6KyJuELiZCxe8m
         0cBo1p9p1z61Q5RRQgiJ0c1h+eXz+AqT/C67De7PhqxYlWs2PSTa3SbPtibQghWqt45L
         xSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689932034; x=1690536834;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S06AqqBQY/XLaTfW98+CLvTaCgLNSccXV/8O8vUmFHQ=;
        b=aNUJ7S3oHH8RWEtNfavyCJcRKfCtOsx7Yp33wH+IeR3WmShhVvx6iuUt/orZyZuk66
         Ouqjmyrn3cjrGHjNSWGul5Bxw1gdHLtL/DD49/WfZKhVVtBQjkCOdonxjA6ESZNAWBZv
         eAKaVgoFIsecI7vZ/LTDOwC153nEKjk2bRacBt/YfvvJW1Z29T4cEXzwYAnSBTqstbja
         TgbxLGkn73L62MA3jpMfphh35KEXmOFE/hFMVIenfxDHahMyswKNJkUFq2nKo4D926wE
         j1r+NodxkOouwJMmxvr3V1NeKMlgAPaPErW36qj3wQcYyYu/17tPnGvt+a9Q/VhBMi/E
         oalw==
X-Gm-Message-State: ABy/qLZimmN/qwrIap0bs/4b+Up/1PNColn2sx0h9UxTRkf6LhX8eAPF
        YSNqkSD28EXPRCUb+uGYcvZ+XW9Fe6Um3XSFz1rZtA==
X-Google-Smtp-Source: APBJJlEDEPgyvQpZdXWcMdHxk6b/tuEAUaT8Zk+sFVkKg+QBBrZb4ON4QfeUWjat9iqHApHLr8Z08g==
X-Received: by 2002:a05:6a20:3955:b0:135:6ef6:171 with SMTP id r21-20020a056a20395500b001356ef60171mr1719409pzg.39.1689932034568;
        Fri, 21 Jul 2023 02:33:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e21-20020aa78255000000b0065da94fe917sm2595363pfn.36.2023.07.21.02.33.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 02:33:54 -0700 (PDT)
Message-ID: <64ba5102.a70a0220.479b9.4a0b@mx.google.com>
Date:   Fri, 21 Jul 2023 02:33:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230721
X-Kernelci-Report-Type: build
Subject: next/master build: 6 builds: 0 failed, 6 passed,
 1 warning (next-20230721)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 6 builds: 0 failed, 6 passed, 1 warning (next-20230721)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230721/

Tree: next
Branch: master
Git Describe: next-20230721
Git Commit: ae867bc97b713121b2a7f5fcac68378a0774739b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 4 unique architectures

Warnings Detected:

arm64:

arm:

sparc:
    allnoconfig (gcc-10): 1 warning

x86_64:


Warnings summary:

    1    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
