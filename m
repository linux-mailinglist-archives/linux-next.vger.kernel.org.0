Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086D6768B09
	for <lists+linux-next@lfdr.de>; Mon, 31 Jul 2023 07:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjGaFYp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jul 2023 01:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjGaFYm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2023 01:24:42 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D30CE7A
        for <linux-next@vger.kernel.org>; Sun, 30 Jul 2023 22:24:35 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-563dae89bc9so2358098a12.2
        for <linux-next@vger.kernel.org>; Sun, 30 Jul 2023 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690781075; x=1691385875;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t6fq/LV1YmPHkGDs9Wdm2PDP4k9jThXQzMa3/EskwoM=;
        b=eXGqqD8NP9Jx4KRiqpaoeDZdU4dzTxlh01jfpyw1CNRJ+26G5CPSktVIxLsZ7PR0WZ
         csQPw70W+i26UrHqaZwTf4XZyZVEYB8sOW7p3YnjMnp4hg3V6zpoJayYgSF3MNsLpyfq
         o4FQ7Sch5VqOfcSyx1WaivFQUOX2S/ag0zUGL+JjhWY4cONKQT37wOl948erJK0a4WOx
         1bv0DxJ/1UpXX3lH1cPDsvPlnISf5cKqBhPaxyUCyXARemHTaZ8LNjrIgl3N8n+kVvcm
         zsYH7vxq6ctPlpCF6ZBAubn5iWLEF4LBilwpYF26IJpQilvd/9GT39Hu4Ivv0YEKbGDG
         CQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690781075; x=1691385875;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6fq/LV1YmPHkGDs9Wdm2PDP4k9jThXQzMa3/EskwoM=;
        b=ZChRHQgPQxYUIs3YtVEXDRataCaTqfqP6WfOkQHIOm4psBC+PUmpT08J0Zix5JyeY2
         YFNkT3h5iAe0DKgg1AhI6D04zToz3A7vFHn9QZluZ4y6jL+EDid18IUHfDJS0gtYMf1K
         ggwx8saemYdssYHxkS7FENdLQEjxFa+V/qihQtsVFTBk6ZaO0F7N/ZNfOijVsSZJs9Ub
         MUjovdHM5PUuHT+cncHMh2jHY76HOtJQT1Z/rMOgqWLHswVlf9YhkuK77YQTioRrZ7XA
         ij1doBi6sCukoTonsLV9y7dEF99fXsCc32772/0Z4zqdJuNZOLNBtBoDrCIEWpUF6wKG
         XH2w==
X-Gm-Message-State: ABy/qLarB4hFLdVYU8c2sLSsruFFVyTi+urcqwxtEBHHaASxFOSTifgD
        ZbdPmEOCX4+MeKINO06NFY26ZAeUV3q5l14KDPJGCQ==
X-Google-Smtp-Source: APBJJlHejSCknwAJ2w7Jz5KuerS5lk/G4HUYrAmwf6BsbABAPYnJ80XoMmS0NO6PhBq29pp5kTOHQg==
X-Received: by 2002:a05:6a20:9193:b0:137:ff56:e871 with SMTP id v19-20020a056a20919300b00137ff56e871mr9594872pzd.33.1690781074720;
        Sun, 30 Jul 2023 22:24:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w8-20020a170902e88800b001b9be2e2b3esm7452082plg.277.2023.07.30.22.24.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 22:24:33 -0700 (PDT)
Message-ID: <64c74591.170a0220.92be3.d9ba@mx.google.com>
Date:   Sun, 30 Jul 2023 22:24:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230731
X-Kernelci-Report-Type: build
Subject: next/master build: 13 builds: 0 failed, 13 passed,
 2 warnings (next-20230731)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 13 builds: 0 failed, 13 passed, 2 warnings (next-2023073=
1)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230731/

Tree: next
Branch: master
Git Describe: next-20230731
Git Commit: ec89391563792edd11d138a853901bce76d11f44
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:
    defconfig+arm64-chromebook (clang-13): 2 warnings

arm:

x86_64:


Warnings summary:

    1    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' s=
et but not used [-Wunused-but-set-variable]
    1    1 warning generated.

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
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

Warnings:
    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set bu=
t not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
