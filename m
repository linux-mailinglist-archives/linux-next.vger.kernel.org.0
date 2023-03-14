Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1296B9284
	for <lists+linux-next@lfdr.de>; Tue, 14 Mar 2023 13:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbjCNMCS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Mar 2023 08:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjCNMCR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Mar 2023 08:02:17 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B76A02A5
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 05:01:40 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so4822992pjt.2
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678795248;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zzdZlteVWktk1QOErkjIUUAR62LdrpQLTg3bwhTJt38=;
        b=1ZwvLz8zi/t5JExhvCDcS9M4JTHIaOcCbtNR59F6l0v3nl1AJ7I9yeXShqcKKk5GcV
         gr+OBXtDft4ErXfx9MQDNJWzcOn/chphnUvQEdcjaJvuDjFfjQXYTz/FE216lBaXIjTs
         bgfm3I49mB4DKZBIc1ESHQII6hIJ2lI03pFAPkey1p0h7WD3lBGymt/cBSLIwtqqgVsQ
         80f0+Q2YSQEmfJMVXigKBC42+XWlCRKVePq7sbH+8n/klhAlcoUi+QEpSYyS/qdzabnc
         CXHubOAk50rWVaKohSpesXSLw71ezdsdCOwbOn54UQAAW6B5oaFutn6SEv7SjkfjS0KH
         3CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678795248;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzdZlteVWktk1QOErkjIUUAR62LdrpQLTg3bwhTJt38=;
        b=IVsy2j+at0ThG8PXK7z60+rNtJTKfdE+XRGYj+CI8geJFwUXNTk2H7Y+VQesxvhEUd
         9OHLprv0D1TOfM6f3RfoK0OPU7dP8JmqAxMk3MZ9tb4OaghqY+1ncVsrAZk1HKz0/jvr
         4u8vGxsKfbJGnFAiJ6j+ofh4M/uHzVNepHHiHRV8Vb7j33ULLzQGfeXSW/U198RoNn31
         YY9YcFfkkJCPunLXzrco7McH1+6WvUfcVJQ3Y4Pex0J6rk8eqpN7NkrKnm3IrlPX08hw
         dOZuIUEBwch4nOqjeHlOcLNJlm7I1XK/ziL/H7+FbQEvL7bCnKpQrOH5HVUrpbVpeth3
         0fLQ==
X-Gm-Message-State: AO0yUKUHmDKiRtGyF62fwQS0TZSLg8h29wm2OSJpoiBlEHX4ageoyBb0
        eYHQTUpA5rfCk3zAeZ+fEUPt20u69B+zaFIjap9lilrV
X-Google-Smtp-Source: AK7set8IT0w9B7jEHctMtkRiIdt6KaUZM+49ktBA9W3/Qe9edkW7T0gVjLMdRHp1o/EJ1y5Vjyb+fg==
X-Received: by 2002:a17:902:dac3:b0:19f:8ad5:4331 with SMTP id q3-20020a170902dac300b0019f8ad54331mr7394191plx.38.1678795248182;
        Tue, 14 Mar 2023 05:00:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902868c00b0019b0afc24e8sm1575986plo.250.2023.03.14.05.00.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:00:47 -0700 (PDT)
Message-ID: <641061ef.170a0220.6200c.38fe@mx.google.com>
Date:   Tue, 14 Mar 2023 05:00:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230314
X-Kernelci-Report-Type: build
Subject: next/master build: 13 builds: 0 failed, 13 passed (next-20230314)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 13 builds: 0 failed, 13 passed (next-20230314)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230314/

Tree: next
Branch: master
Git Describe: next-20230314
Git Commit: ec0fa9a0a6fac454745c930bdb8619d0a354bac9
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
