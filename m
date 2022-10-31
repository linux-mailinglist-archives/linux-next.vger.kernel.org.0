Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D79613206
	for <lists+linux-next@lfdr.de>; Mon, 31 Oct 2022 09:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiJaI4p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Oct 2022 04:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiJaI4o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Oct 2022 04:56:44 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDEAD126
        for <linux-next@vger.kernel.org>; Mon, 31 Oct 2022 01:56:42 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c2so10139061plz.11
        for <linux-next@vger.kernel.org>; Mon, 31 Oct 2022 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+RjuB7U9jpo35XTlJMjyzkcx01WUajTAZdTqLvn43mY=;
        b=GNQu9KvM9E4Dqh1ytMffDaB4gZFXFLrVlLZA7RkzFAMkq57uaSLBmzRUnuBMZlnGHo
         QXU9t/bb1hT9smVoW3Z/mf+uE5JGZRoqr2wUPGTJc1u3hMLhW+32HMrpATuj/0c+zsKk
         +XelBIgOmuAJCWt0ekIe4GjYrz+SLfi1xReQz0FS/+i1y4Y/APMBzr9EcVSWtiZmAxxn
         AWB3i5rreHuPoruNvYd5sqVn1XdGI+eSA23SudKxf51qU2IqqBJlmLzgZ/HCOM+327vZ
         Q0okbamUq8Lh8VOp21OlECm3cO6wtRXt9Rta3N2sdQuVt8GaKB0i1vytf6CxYDCvGfqb
         Lpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RjuB7U9jpo35XTlJMjyzkcx01WUajTAZdTqLvn43mY=;
        b=PEJ1f5Wt6uXuoQ3jwmc3T2fWIc+/jfbss0DOnBqg7D1GO90ZjMdQ8PYhzS9qSb+zYD
         l/ay2Nynbd0p5vFz4m32vV5SOXjG/ulFlblQtgXvuKKWuu4Q/Tp+oqoZhdxlW+fJDDIS
         8OnMI51B8R5RGDCoIZuRuLnevISGbvrAH2S8JtKk/+X+MHEbL3CK6b1rd0DVV0m/EZqg
         KrBiIV7wru5IPfml9nnkfJSkhAkdqLMKeL7K4TNncZCUZjgWh/tZm+hiVcMmdJt7Oq1V
         N/uhYP3DTuJkLYtXC+OPdMhQmLrL7CqFcey9Cb/dQxUxo4vUHGX3JlihSID2buwi9G6t
         JDCg==
X-Gm-Message-State: ACrzQf1oNBTaaFoSj2zgm3m4P4UNkVQ1+7EL3Y9n+1RUbkbpFtyaLyvP
        4hd+u1UW0Q1uf/kTU9jpOTXONXeKb9dzheeW
X-Google-Smtp-Source: AMsMyM5nWBt2pIlY69FEcHa9Ol4vKRJXvYizpchm2gctfdfYWEESQw8Jg1727P/vqZ1Obq7y8/+q5w==
X-Received: by 2002:a17:90b:1642:b0:213:f368:648b with SMTP id il2-20020a17090b164200b00213f368648bmr1731743pjb.173.1667206602215;
        Mon, 31 Oct 2022 01:56:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b0017854cee6ebsm3966881plx.72.2022.10.31.01.56.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:56:41 -0700 (PDT)
Message-ID: <635f8dc9.170a0220.f0f0a.6904@mx.google.com>
Date:   Mon, 31 Oct 2022 01:56:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221031
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 12 failed, 2 passed, 12 errors,
 10 warnings (next-20221031)
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

next/master build: 14 builds: 12 failed, 2 passed, 12 errors, 10 warnings (=
next-20221031)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221031/

Tree: next
Branch: master
Git Describe: next-20221031
Git Commit: 6fbda10ec6f8d70d0f4446f861f7db726c2f2e7c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL

Errors and Warnings Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 1 error

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 5 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 5 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error

Errors summary:

    12   ERROR: modpost: Section mismatches detected.

Warnings summary:

    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]

Section mismatches summary:

    14   WARNING: modpost: vmlinux.o: section mismatch in reference: snd_so=
c_init (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismat=
ches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismat=
ches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mism=
atches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

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

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

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

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatch=
es

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
