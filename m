Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586CA588686
	for <lists+linux-next@lfdr.de>; Wed,  3 Aug 2022 06:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbiHCEaQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Aug 2022 00:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiHCEaP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Aug 2022 00:30:15 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0CF10B0
        for <linux-next@vger.kernel.org>; Tue,  2 Aug 2022 21:30:13 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id o3so15319074ple.5
        for <linux-next@vger.kernel.org>; Tue, 02 Aug 2022 21:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pYtQQVdJ40E4X50kSCl+ciWvL0c0vltSjFrXrNpwjnQ=;
        b=aCwnaMYqDxhdZ6Ys/BXGOyQoQ6oU5f5ICJ3xoRYn1dmCpS69VHxHx8MQmQtWBqB7OS
         YW1Ppdlrk+iScNK7cLBS0+gpos1pD/Avm+5yN6cvjkcbqfDYqQGxnA7Ufqjb6PuSw0i3
         1jZzghMCB4EKkikmrHZrFw9kwUsvL0DT+RjTY46aITbBDEtEYGZFY4OhDCnfgHE5XnVd
         hDUrJ6+unpl0+NnHF8u7TNsRCv76bJH5jtQbpEdox6HMToHb3QPnpIZt0WpJS18KNrTq
         tQMZsY+gmbzK3uTmhMHg6ygmZxDIYwbM/GYSddKk0UA/5OlZvXOp2BM6wN9Twl7pKWQZ
         USnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pYtQQVdJ40E4X50kSCl+ciWvL0c0vltSjFrXrNpwjnQ=;
        b=JD+dsxZH+31PXM4cm/KXIA87Lj6LkQGh14oThUrvNmjo9vt8d2FEbg4mJ98L84Ot8+
         XFO3/m0n2QCHZ9RglgH9N5Z70qcL4HfTQ8mNGU+5sucsonSTjulF/YOgEDg/YjNozsEP
         L7gq0Y8U8HXp09yf2OgDanvDjj4hBaD2X6T8ARNSH0yn6h6CQa7k7sNcdsqnpyQ3Zx3Y
         ni9aNx8oRLt5Y3vbsmsgFcHRfv80+GFsSj5JwD6GRLHhxjdjtXhLyG11TV5bT2hCxBrF
         rkRf35JyAm/mEtkhptGQp3etws2CZ1vU8vS+bNos5DLS5CID7PuKYYRfJe4GDr9VsrSl
         qOFQ==
X-Gm-Message-State: ACgBeo13bSYkiqw+NhamUsboTwyjSzxBH1qbAJRna63Enu5qiUKp2iDq
        9kRxszeN8CsUXQ+dMgHk3/6f9fiRIVzQQqcF/I4=
X-Google-Smtp-Source: AA6agR5Nm+7eqrfyaSMJmmNEbGC+TKhjIsO8gSGe7g8A3By0MOdt4PrBb9NNxRY6/+cOaOhV2Gv9cg==
X-Received: by 2002:a17:903:244e:b0:16d:d5cd:c184 with SMTP id l14-20020a170903244e00b0016dd5cdc184mr22819016pls.44.1659501013051;
        Tue, 02 Aug 2022 21:30:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e7-20020a17090a7c4700b001f2ef3c7956sm409307pjl.25.2022.08.02.21.30.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 21:30:12 -0700 (PDT)
Message-ID: <62e9f9d4.170a0220.99b58.0da9@mx.google.com>
Date:   Tue, 02 Aug 2022 21:30:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220802
Subject: next/master build: 7 builds: 0 failed, 7 passed,
 12 warnings (next-20220802)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 7 builds: 0 failed, 7 passed, 12 warnings (next-20220802)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220802/

Tree: next
Branch: master
Git Describe: next-20220802
Git Commit: 42d670bda02fdba0f3944c92f545984501e5788d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

x86_64:


Warnings summary:

    12   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
