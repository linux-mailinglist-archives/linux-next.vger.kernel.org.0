Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7E473DB7B
	for <lists+linux-next@lfdr.de>; Mon, 26 Jun 2023 11:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjFZJfs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jun 2023 05:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjFZJfr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2023 05:35:47 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E74D8F
        for <linux-next@vger.kernel.org>; Mon, 26 Jun 2023 02:35:47 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b7f9d66812so10296495ad.0
        for <linux-next@vger.kernel.org>; Mon, 26 Jun 2023 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687772146; x=1690364146;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UH3eVzjLKwWmRMVYeQqwjO56lgLsezdOhj6baGSx02Y=;
        b=LeEFBqUNhuw5yNcvg5Q29qiXPmpSN/Jc42a8jBXJW4EknksnjFB6+XlUbNzq6irRuD
         4w/cPwCBr3El6hUPzDCcrsLRR6a/MytCSoiM5rG5gybmftbbxhp80tiKoH8QJiV6sE3s
         t3cBizmr+gJ24sP8gJE9M0bQR6B6hfWuOqHfJ0IdDIzr0H0bWI7k64Xi/wtiBq3oBrwi
         0KFowwouu6VfjhJEeEqIEd2q8ct6Kp/NdKpTQ3rVg4Hgni+YfIUtM9C11oSeqAR2/0ZU
         DWKDmWh+VMLcao3uytRXzE4Vu+VjH7rDaVPVGTC0b7R87EWN2I9aA8d5rNGng+hDnxqg
         UCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687772146; x=1690364146;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UH3eVzjLKwWmRMVYeQqwjO56lgLsezdOhj6baGSx02Y=;
        b=A6TPrPcxGmHY1cq2EqJjEnrv56HFHcHNLV7abVFIIhrnD5qfLRjpplLTHpsZairLCD
         uwvLJHGtKhOLy6wv5KRgWeScB5Lipe7pCX3giXzaIBbNTIC2nZsLkbr0+AAaUwhztzGi
         qu/egFxX56uwE/tfVb2I7nrtI3noifK5vtSFYeRM7NcXf9YcXc7USTfcT7z8kcSuvRZm
         jz1ei1lU4kERPv62aTvmq0savzvefLpQTd7pJI5P8sY76Nbxe0u5GaL+iCj3oppPRtQ0
         hFT+SUJA5pyARqHpyNsuIu2Uzj3S+nVssBvk/B0cOTEn5QNWJWAwMdRKBj9GQGONc8V5
         0VlA==
X-Gm-Message-State: AC+VfDzgjTHZBssx++C/6UG8L3mszy5ktLMavw5GLvmy6vVHHdxI+t7o
        FviOIuzc8ML/GuTq4R1kvATY/pKQpHg0d0EAVh0=
X-Google-Smtp-Source: ACHHUZ6ghtQaOGyr03SfIj9hY8IMq4oYJy2Zz609zH6i12qvSt6ZDdAjG6e09LV7bfaZ2l7a2yOBNA==
X-Received: by 2002:a17:902:ec8a:b0:1b7:dfbd:4de0 with SMTP id x10-20020a170902ec8a00b001b7dfbd4de0mr7464541plg.57.1687772145995;
        Mon, 26 Jun 2023 02:35:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c20-20020a170902c1d400b001b7f95fbec1sm2160788plc.78.2023.06.26.02.35.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 02:35:45 -0700 (PDT)
Message-ID: <64995bf1.170a0220.b4d1f.389a@mx.google.com>
Date:   Mon, 26 Jun 2023 02:35:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20230626
Subject: next/master build: 13 builds: 0 failed, 13 passed (next-20230626)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 13 builds: 0 failed, 13 passed (next-20230626)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230626/

Tree: next
Branch: master
Git Describe: next-20230626
Git Commit: 60e7c4a25da68cd826719b685babbd23e73b85b0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

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
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
