Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B357B4B10AC
	for <lists+linux-next@lfdr.de>; Thu, 10 Feb 2022 15:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243039AbiBJOnE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Feb 2022 09:43:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243024AbiBJOnE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2022 09:43:04 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46FCC4C
        for <linux-next@vger.kernel.org>; Thu, 10 Feb 2022 06:43:02 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id i21so9119607pfd.13
        for <linux-next@vger.kernel.org>; Thu, 10 Feb 2022 06:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8+WU1D7DvlM/2jRU5zWCRPGXlokl5RFABvKLT8O5UqA=;
        b=nJDk9NAIF2n4PuPrxwmGkDfPQYSeuTUpYu64FPkU5QzcecHMP17PBS9p2T9przDXXv
         m5n6UdIYmzBOKcwj+Xym1p70SI6clsw3PNNLt/esnuHi24uD2wiost4sNnIHdS5m9H82
         +miIuMom4vpv7MWcrOGpA1u6tcY2hhTLPw6FLDEatDegckcwaF+dGa51iWNM2mDMhH+l
         TQF6GJ2LQDQA0bjosRFcBxg6ct9L9eHe7JFsji1H5k+AOeOj5+NUXAmERaAkynMY2rfW
         ID1FwZgFxwLaCktrkUKTYvtGb22HRlKAZtP8d4UEbPqu4hG83QbazgghjPGm14yrpypL
         /jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8+WU1D7DvlM/2jRU5zWCRPGXlokl5RFABvKLT8O5UqA=;
        b=m8clKZ5l9c32VFakvEUYUYlRYjg83xTZoUsfFkNKCT3wm6pL4lFBC1+MrHsHfSibT/
         Mxsyd9HNIkLwsXtByzcBZBNaDtvTy2ejOTu2f61nwrZMrS28fmrpW7tm/+SkPqhVlp0g
         cZOVpHHnR7t1T8rGTUF4tMjod0JTp5u438uZXpT+6T3dnBqSz23GUsCSFq9SpsJXm1s9
         O6huHKddjhATFJ1YnyhT/5fy9oXAX2a1ojhFrVRV/wPlTbI+uLn3nmN7rHoHxBSGR+08
         LmgBkjsTbjLj+EfL8DWu55WkKYqt06SrPNWxw2LftrhIF7AWyLMxVwZ3jONDYgEME3j3
         nRSQ==
X-Gm-Message-State: AOAM531DIzf5RCIJ6t/CEpqmWJtjlm1vzRP39brch1TPmpn+x+Fm1jDn
        4CvZj3yb8rQ044uUaANzbw8ZKHXtLvNZ3vWC3hs=
X-Google-Smtp-Source: ABdhPJxo/BTxxcM+0PptMWjB9RE8f2VIw3PxQQEL4T7BHEeWgwnoJH6oyZijIZewvTU6tLkasfWyIA==
X-Received: by 2002:a63:4003:: with SMTP id n3mr6320099pga.279.1644504180576;
        Thu, 10 Feb 2022 06:43:00 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id my18sm2942814pjb.57.2022.02.10.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 06:43:00 -0800 (PST)
Message-ID: <62052474.1c69fb81.22252.5f4e@mx.google.com>
Date:   Thu, 10 Feb 2022 06:43:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220210
Subject: next/master baseline: 716 runs, 139 regressions (next-20220210)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 716 runs, 139 regressions (next-20220210)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
cubietruck                 | arm   | lab-baylibre    | clang-14 | multi_v7_=
defconfig           | 2          =

cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 2          =

cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =

cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =

i945gsex-qs                | i386  | lab-clabbe      | clang-14 | i386_defc=
onfig               | 1          =

meson-gxbb-nanopi-k2       | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | clang-14 | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

qemu_i386                  | i386  | lab-baylibre    | clang-14 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-broonie     | clang-14 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-cip         | clang-14 | i386_defc=
onfig               | 1          =

qemu_i386                  | i386  | lab-linaro-lkft | clang-14 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-baylibre    | clang-14 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-broonie     | clang-14 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-cip         | clang-14 | i386_defc=
onfig               | 1          =

qemu_i386-uefi             | i386  | lab-linaro-lkft | clang-14 | i386_defc=
onfig               | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | clang-14 | multi_v7_=
defconfig           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | clang-14 | multi_v7_=
defconfig           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =

sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defconfig           | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =

sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220210/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220210
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      395a61741f7ea29e1f4a0d6e160197fe8e377572 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
cubietruck                 | arm   | lab-baylibre    | clang-14 | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6204ef541158cd8241c629ee

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204ef541158cd8=
241c629f2
        failing since 8 days (last pass: next-20220127, first fail: next-20=
220201)
        16 lines

    2022-02-10T10:56:12.702356  kern  :alert : 8<--- cut here ---
    2022-02-10T10:56:12.710194  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T10:56:12.714102  kern  :alert : [000001a0] *pgd=3Dbcb08835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204ef541158cd8=
241c629f3
        failing since 8 days (last pass: next-20220127, first fail: next-20=
220201)
        83 lines

    2022-02-10T10:56:12.725260  kern  :alert : Register<8>[   37.043774] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-10T10:56:12.727289   r0 information: NULL pointer
    2022-02-10T10:56:12.732780  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T10:56:12.738662  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T10:56:12.743290  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-10T10:56:12.751776  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c21bc400 pointer offset 64 size 1024
    2022-02-10T10:56:12.757478  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-10T10:56:12.766151  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21bc400 pointer offset 608 size 1024
    2022-02-10T10:56:12.775036  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c21bc400 pointer offset 64 size 1024
    2022-02-10T10:56:12.783815  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6204ed9cb53d476d40c6297e

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204ed9cb53d476=
d40c62982
        failing since 6 days (last pass: next-20220128, first fail: next-20=
220204)
        16 lines

    2022-02-10T10:48:49.426242  kern  :alert : 8<--- cut here ---
    2022-02-10T10:48:49.434167  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T10:48:49.451200  kern  :alert : [000001a0] *pgd=3Dbc<8>[   3=
7.723676] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-10T10:48:49.451519  b74835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204ed9cb53d476=
d40c62983
        failing since 6 days (last pass: next-20220128, first fail: next-20=
220204)
        54 lines

    2022-02-10T10:48:49.452816  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-10T10:48:49.459135  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T10:48:49.463174  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T10:48:49.471167  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-10T10:48:49.479131  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c459e400 pointer offset 64 size 1024
    2022-02-10T10:48:49.487135  kern  :alert : Register r5 information: sla=
b task_struct start c44f5500 pointer offset 0
    2022-02-10T10:48:49.495141  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21aa000 pointer offset 16 size 1024
    2022-02-10T10:48:49.503135  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c459e400 pointer offset 128 size 1024
    2022-02-10T10:48:49.507150  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-10T10:48:49.515356  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21aa000 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6204f10d96e8ce5f46c62974

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204f10d96e8ce5=
f46c62978
        failing since 6 days (last pass: next-20220125, first fail: next-20=
220204)
        16 lines

    2022-02-10T11:03:29.989737  <8>[   38.255050] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-10T11:03:30.018325  kern  :alert : 8<--- cut here ---
    2022-02-10T11:03:30.026369  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204f10d96e8ce5=
f46c62979
        failing since 6 days (last pass: next-20220125, first fail: next-20=
220204)
        54 lines

    2022-02-10T11:03:30.038570  kern  :alert : [00000188] *pgd=3Dbc<8>[   3=
8.301770] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-10T11:03:30.038917  aca835
    2022-02-10T11:03:30.043392  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-10T11:03:30.048930  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T11:03:30.054557  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T11:03:30.060394  kern  :alert : Register r3 information: non=
-slab/vmalloc memory
    2022-02-10T11:03:30.068976  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4465800 pointer offset 64 size 1024
    2022-02-10T11:03:30.076745  kern  :alert : Register r5 information: sla=
b task_struct start c4406d00 pointer offset 0
    2022-02-10T11:03:30.085187  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c214b000 pointer offset 16 size 1024
    2022-02-10T11:03:30.094384  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4465800 pointer offset 120 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
cubietruck                 | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6204f2c5806dafcf15c62985

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204f2c5806dafc=
f15c62989
        failing since 8 days (last pass: next-20220127, first fail: next-20=
220201)
        16 lines

    2022-02-10T11:10:49.385399  <8>[   37.134187] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-02-10T11:10:49.416405  kern  :alert : 8<--- cut here ---
    2022-02-10T11:10:49.424513  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T11:10:49.435982  kern  :alert : [000001a0] *pgd=3Dbc<8>[   3=
7.184135] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204f2c5806dafc=
f15c6298a
        failing since 8 days (last pass: next-20220127, first fail: next-20=
220201)
        54 lines

    2022-02-10T11:10:49.437100  907835
    2022-02-10T11:10:49.441616  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-10T11:10:49.447130  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T11:10:49.452757  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T11:10:49.457715  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-10T11:10:49.466547  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c2ecf800 pointer offset 64 size 1024
    2022-02-10T11:10:49.472655  kern  :alert : Register r5 information: sla=
b task_struct start c2cf6600
    2022-02-10T11:10:49.481767  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c19aa000 pointer offset 16 size 1024
    2022-02-10T11:10:49.490415  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c2ecf800 pointer offset 128 size 1024
    2022-02-10T11:10:49.493875  kern  :alert : Register r8 information: =

    ... (44 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
i945gsex-qs                | i386  | lab-clabbe      | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e87835d8088f02c62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-clabbe/baseline-i945gsex-qs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-clabbe/baseline-i945gsex-qs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e87835d8088f02c62=
98a
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxbb-nanopi-k2       | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ebeb0ddcbf4b25c62984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ebeb0ddcbf4b25c62=
985
        failing since 30 days (last pass: next-20220106, first fail: next-2=
0220110) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ead27315e87ad1c62a35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ead27315e87ad1c62=
a36
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f03a697744c08fc62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f03a697744c08fc62=
96a
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e8e6766b6b44d6c6298b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e8e6766b6b44d6c62=
98c
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ed6e0736d023e2c6298f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ed6e0736d023e2c62=
990
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e8d7c1b5aa0342c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e8d7c1b5aa0342c62=
972
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f23abaed16850fc6298f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f23abaed16850fc62=
990
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e6c39d365c4050c62970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e6c39d365c4050c62=
971
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb7248d687360ac629aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb7248d687360ac62=
9ab
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204edcbc731fbd6c8c6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204edcbc731fbd6c8c62=
97b
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ef5ec149e13c04c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ef5ec149e13c04c62=
976
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f1b68bff652764c629d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f1b68bff652764c62=
9d8
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f245a875c6af12c62995

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f245a875c6af12c62=
996
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e6145b8b53765bc6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e6145b8b53765bc62=
98d
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e9335c47a513fac62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e9335c47a513fac62=
981
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb2b2b984c1f9ec62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb2b2b984c1f9ec62=
969
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ecb9c1522b8352c629a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ecb9c1522b8352c62=
9a1
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eeac1e562ace9bc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eeac1e562ace9bc62=
969
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ef109d60dd30bac62981

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ef109d60dd30bac62=
982
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e5e13b800fd41cc62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e5e13b800fd41cc62=
973
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e9648a6c9ce58cc6298d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e9648a6c9ce58cc62=
98e
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ec3715eedb204fc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ec3715eedb204fc62=
969
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f0a758468c0250c6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f0a758468c0250c62=
96c
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f47cd0a2deed01c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f47cd0a2deed01c62=
96a
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f53cbf5e20666cc6298c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f53cbf5e20666cc62=
98d
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eac13755179303c629e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eac13755179303c62=
9e1
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f051687e8007dcc62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f051687e8007dcc62=
976
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e8cf89f5d435bec62998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e8cf89f5d435bec62=
999
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ed8077a54ba281c62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ed8077a54ba281c62=
983
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e89c5e8d5b6dafc62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e89c5e8d5b6dafc62=
986
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f208f098b82ff7c62991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f208f098b82ff7c62=
992
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e6fd06bf632f4dc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e6fd06bf632f4dc62=
969
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb74c0d856d866c62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb74c0d856d866c62=
978
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204edb7b53d476d40c629ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204edb7b53d476d40c62=
9cb
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ee309411f726d5c629a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ee309411f726d5c62=
9a6
        failing since 1 day (last pass: next-20220207, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204efc35dc749bb8dc62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204efc35dc749bb8dc62=
981
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f155729621d5c2c629ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f155729621d5c2c62=
9cb
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f22fa875c6af12c6296d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f22fa875c6af12c62=
96e
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e628e11c9d6ad1c6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e628e11c9d6ad1c62=
96b
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e947404e24cb2cc62987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e947404e24cb2cc62=
988
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb3b1b55fb318ec6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb3b1b55fb318ec62=
970
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb784edafcfad1c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb784edafcfad1c62=
976
        failing since 1 day (last pass: next-20220207, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ecf4a713467191c62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ecf4a713467191c62=
984
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ee4a01a7649c0ec62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ee4a01a7649c0ec62=
975
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eee810015f3064c6298b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eee810015f3064c62=
98c
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e628a5a0ec28f6c6298a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e628a5a0ec28f6c62=
98b
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e95c8a6c9ce58cc62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e95c8a6c9ce58cc62=
972
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ec200ee525396ec62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ec200ee525396ec62=
986
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ed3b0755eef87fc62a10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ed3b0755eef87fc62=
a11
        failing since 1 day (last pass: next-20220207, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f15eb8ad788297c62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f15eb8ad788297c62=
983
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f3db0aa612b64dc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f3db0aa612b64dc62=
969
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f507f35c53a478c6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f507f35c53a478c62=
98f
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/620503ebcaf8dd430dc62970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620503ebcaf8dd430dc62=
971
        failing since 1 day (last pass: next-20220207, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eac03c5df29fc2c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eac03c5df29fc2c62=
976
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f026acee9390c8c629ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f026acee9390c8c62=
9af
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e8bcec5f575e23c62991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e8bcec5f575e23c62=
992
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ed6de9739be15ec629ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ed6de9739be15ec62=
9eb
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e858701faac024c62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e858701faac024c62=
979
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f20ff098b82ff7c62998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f20ff098b82ff7c62=
999
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e6c29d365c4050c6296d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e6c29d365c4050c62=
96e
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ebc16d4f3e7d3dc6299e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ebc16d4f3e7d3dc62=
99f
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eddf636dad3684c6297e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eddf636dad3684c62=
97f
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ef72f8d308e138c62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ef72f8d308e138c62=
986
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f167b8ad788297c62988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f167b8ad788297c62=
989
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f1ccff9a1fe483c62979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f1ccff9a1fe483c62=
97a
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e612b962b9b7f0c6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e612b962b9b7f0c62=
970
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e96f8a6c9ce58cc62a02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e96f8a6c9ce58cc62=
a03
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb3c2b984c1f9ec6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb3c2b984c1f9ec62=
97d
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ece0979e53f72dc629bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ece0979e53f72dc62=
9be
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ee5c710ecc0caac62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ee5c710ecc0caac62=
96a
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eed410015f3064c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eed410015f3064c62=
97e
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e5df88eeefe0efc62a1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e5df88eeefe0efc62=
a1c
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e9de559354a5eac62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e9de559354a5eac62=
969
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ec40e7819514c6c6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ec40e7819514c6c62=
96b
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f104081a3993aac62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f104081a3993aac62=
978
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f3e80aa612b64dc6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f3e80aa612b64dc62=
97b
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3      | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f50af35c53a478c62991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f50af35c53a478c62=
992
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb382b984c1f9ec6296e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb382b984c1f9ec62=
96f
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f08add95f66ba1c62993

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f08add95f66ba1c62=
994
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e91f42eaaf27bcc629a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e91f42eaaf27bcc62=
9a5
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ed94b53d476d40c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ed94b53d476d40c62=
969
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e8d0c1b5aa0342c6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e8d0c1b5aa0342c62=
96c
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f26c984dbc4510c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/clang-14/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f26c984dbc4510c62=
96d
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e69ae39c4f7bc1c6296a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e69ae39c4f7bc1c62=
96b
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb492b984c1f9ec62989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb492b984c1f9ec62=
98a
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204edb6b53d476d40c629c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204edb6b53d476d40c62=
9c8
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ee319411f726d5c629a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ee319411f726d5c62=
9a9
        failing since 1 day (last pass: next-20220207, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204efc25dc749bb8dc6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204efc25dc749bb8dc62=
97e
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f1b71c960f38c1c6297a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-g=
icv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f1b71c960f38c1c62=
97b
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f21abaed16850fc6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f21abaed16850fc62=
97d
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e5ee3b800fd41cc629b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e5ee3b800fd41cc62=
9b5
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e920241cab3cb7c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e920241cab3cb7c62=
969
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb2adda48b4b1fc6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb2adda48b4b1fc62=
98f
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ebc708fe513f89c62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ebc708fe513f89c62=
984
        failing since 1 day (last pass: next-20220207, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ece1979e53f72dc629c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ece1979e53f72dc62=
9c1
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eec11e562ace9bc62983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gi=
cv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eec11e562ace9bc62=
984
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eed786fbbd41d0c6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eed786fbbd41d0c62=
97e
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e59cf7d14cfa55c62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e59cf7d14cfa55c62=
978
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6204e93ec331909856c62a01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204e93ec331909856c62=
a02
        new failure (last pass: next-20220208) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ebb46d4f3e7d3dc62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ebb46d4f3e7d3dc62=
978
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ecf4e01ecf9e29c6296e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ecf4e01ecf9e29c62=
96f
        failing since 1 day (last pass: next-20220207, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f10df519ec125ac62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f10df519ec125ac62=
983
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f44ce6b2b6ee39c6299b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f44ce6b2b6ee39c62=
99c
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip         | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6204f4d87393f3d886c62a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204f4d87393f3d886c62=
a52
        failing since 1 day (last pass: next-20220208, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/620503edf239567e4bc629a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620503edf239567e4bc62=
9a7
        failing since 1 day (last pass: next-20220207, first fail: next-202=
20209) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-baylibre    | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eceee01ecf9e29c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eceee01ecf9e29c62=
969
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-broonie     | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ead7300a321cc7c62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ead7300a321cc7c62=
973
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-cip         | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb0897459defc7c62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb0897459defc7c62=
983
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-linaro-lkft | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/620503bc281358b985c629a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620503bc281358b985c62=
9a3
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-baylibre    | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6204ed1bb9f5d96ebdc629a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204ed1bb9f5d96ebdc62=
9a5
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-broonie     | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eaeb162c693441c629cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eaeb162c693441c62=
9d0
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-cip         | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6204eb1c97459defc7c62992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6204eb1c97459defc7c62=
993
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386-uefi             | i386  | lab-linaro-lkft | clang-14 | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/620503bd0927b04e2cc6297e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/i386=
/i386_defconfig/clang-14/lab-linaro-lkft/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/620503bd0927b04e2cc62=
97f
        failing since 3 days (last pass: next-20220204, first fail: next-20=
220207) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62050292ce6267390dc62974

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62050292ce6267390dc6299a
        failing since 17 days (last pass: next-20220121, first fail: next-2=
0220124)

    2022-02-10T12:18:00.308903  /lava-5661459/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | clang-14 | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6204ebe60ddcbf4b25c6297a

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204ebe60ddcbf4=
b25c6297e
        failing since 1 day (last pass: next-20220127, first fail: next-202=
20209)
        16 lines

    2022-02-10T10:41:22.681465  kern  :alert : 8<--- cut here ---
    2022-02-10T10:41:22.681779  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T10:41:22.681977  kern  :alert : [000001a0] *pgd=3D7d492835
    2022-02-10T10:41:22.682148  kern  :alert : Register<8>[   37.217957] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-10T10:41:22.682268   r0 information: NULL pointer
    2022-02-10T10:41:22.682379  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T10:41:22.682486  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204ebe60ddcbf4=
b25c6297f
        failing since 1 day (last pass: next-20220127, first fail: next-202=
20209)
        83 lines

    2022-02-10T10:41:22.724261  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-10T10:41:22.724702  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4cb3c00 pointer offset 64 size 1024
    2022-02-10T10:41:22.725058  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-10T10:41:22.725343  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4cb3c00 pointer offset 608 size 1024
    2022-02-10T10:41:22.725518  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4cb3c00 pointer offset 64 size 1024
    2022-02-10T10:41:22.725673  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-10T10:41:22.767789  kern  :alert : Register r9 information: non=
-paged memory
    2022-02-10T10:41:22.768117  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c4cb3c00 pointer offset 128 size 1024
    2022-02-10T10:41:22.768333  kern  :alert : Register r11 information: sl=
ab kmalloc-64 start c4eebb80 pointer offset 0 size 64
    2022-02-10T10:41:22.768518  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (45 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | clang-14 | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6204f00ecb90c12d6ec62973

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220208083014+52475=
8d1a75e-1~exp1~20220208083110.21)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/clang-14/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204f00ecb90c12=
d6ec62977
        failing since 1 day (last pass: next-20220127, first fail: next-202=
20209)
        16 lines

    2022-02-10T10:59:06.182557  kern  :alert : 8<--- cut here ---
    2022-02-10T10:59:06.193489  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T10:59:06.202701  kern  :alert : [000001a0] *pgd=3D7d[   42.8=
31547] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-10T10:59:06.203075  4b4835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204f00ecb90c12=
d6ec62978
        failing since 1 day (last pass: next-20220127, first fail: next-202=
20209)
        83 lines

    2022-02-10T10:59:06.208207  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-10T10:59:06.213642  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T10:59:06.217229  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T10:59:06.222693  kern  :alert : Register r3 information: NUL=
L pointer
    2022-02-10T10:59:06.233534  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4db1000 pointer offset 64 size 1024
    2022-02-10T10:59:06.237285  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-02-10T10:59:06.248228  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4db1000 pointer offset 608 size 1024
    2022-02-10T10:59:06.253742  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4db1000 pointer offset 64 size 1024
    2022-02-10T10:59:06.262881  kern  :alert : Register r8 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-10T10:59:06.268410  kern  :alert : Register r9 information: non=
-paged memory =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6204eb459d066c9551c6297e

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204eb459d066c9=
551c62982
        failing since 2 days (last pass: next-20220128, first fail: next-20=
220208)
        16 lines

    2022-02-10T10:38:52.426881  kern  :alert : 8<--- cut here ---
    2022-02-10T10:38:52.427157  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T10:38:52.427297  kern  :alert : [000001a0] *pgd=3D7d32f835
    2022-02-10T10:38:52.427432  kern  :alert : Register<8>[   37.151137] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-10T10:38:52.427570   r0 information: NULL pointer
    2022-02-10T10:38:52.427699  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T10:38:52.427831  kern  :alert : Register r2 information: non=
-slab/vmalloc memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204eb459d066c9=
551c62983
        failing since 2 days (last pass: next-20220128, first fail: next-20=
220208)
        54 lines

    2022-02-10T10:38:52.470106  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-10T10:38:52.470341  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c21b3800 pointer offset 64 size 1024
    2022-02-10T10:38:52.470519  kern  :alert : Register r5 information: sla=
b task_struct start c40c0000 pointer offset 0
    2022-02-10T10:38:52.470669  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-10T10:38:52.470812  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c21b3800 pointer offset 128 size 1024
    2022-02-10T10:38:52.470957  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-10T10:38:52.512865  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024
    2022-02-10T10:38:52.513112  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c4594800 pointer offset 0 size 1024
    2022-02-10T10:38:52.513397  kern  :alert : Register r11 information: NU=
LL pointer
    2022-02-10T10:38:52.513555  kern  :alert : Register r12 information: sl=
ab task_struct start c40c0000 pointer offset 0 =

    ... (47 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6204edb0b53d476d40c629ba

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204edb0b53d476=
d40c629be
        failing since 2 days (last pass: next-20220125, first fail: next-20=
220208)
        16 lines

    2022-02-10T10:49:13.500771  kern  :alert : 8<--- cut here ---
    2022-02-10T10:49:13.543946  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188
    2022-02-10T10:49:13.544176  kern  :alert : [00000188] *pgd=3D7d<8>[   3=
8.243748] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3D=
lines MEASUREMENT=3D16>
    2022-02-10T10:49:13.544335  2a0835
    2022-02-10T10:49:13.544478  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-10T10:49:13.544595  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T10:49:13.544707  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T10:49:13.544816  kern  :alert : Register r3 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204edb0b53d476=
d40c629bf
        failing since 2 days (last pass: next-20220125, first fail: next-20=
220208)
        54 lines

    2022-02-10T10:49:13.587043  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4631800 pointer offset 64 size 1024
    2022-02-10T10:49:13.587294  kern  :alert : Register r5 information: sla=
b task_struct start c442e580 pointer offset 0
    2022-02-10T10:49:13.587435  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 16 size 1024
    2022-02-10T10:49:13.587555  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4631800 pointer offset 120 size 1024
    2022-02-10T10:49:13.587669  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-10T10:49:13.629831  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 0 size 1024
    2022-02-10T10:49:13.630080  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c4456000 pointer offset 0 size 1024
    2022-02-10T10:49:13.630211  kern  :alert : Register r11 information: NU=
LL pointer
    2022-02-10T10:49:13.630329  kern  :alert : Register r12 information: sl=
ab task_struct start c442e580 pointer offset 0
    2022-02-10T10:49:13.630443  kern  :emerg : Internal error: Oops: 17 [#1=
] ARM =

    ... (39 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-baylibre    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6204f138729621d5c2c62999

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204f138729621d=
5c2c6299d
        failing since 2 days (last pass: next-20220127, first fail: next-20=
220208)
        16 lines

    2022-02-10T11:04:01.612415  kern  :alert : 8<--- cut here ---
    2022-02-10T11:04:01.655354  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T11:04:01.655630  kern  :alert : [000001a0] *pgd=3D7d0aa835
    2022-02-10T11:04:01.655792  kern  :alert : Register<8>[   36.908288] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D16>
    2022-02-10T11:04:01.655946   r0 information: NULL pointer
    2022-02-10T11:04:01.656092  kern  :alert : Register r1 information:
    2022-02-10T11:04:01.656236  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T11:04:01.656379  kern  :alert : Register r3 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204f138729621d=
5c2c6299e
        failing since 2 days (last pass: next-20220127, first fail: next-20=
220208)
        54 lines

    2022-02-10T11:04:01.698460  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c2e8b800
    2022-02-10T11:04:01.698699  kern  :alert : Register r5 information: sla=
b task_struct start c2ca9980 pointer offset 0
    2022-02-10T11:04:01.698826  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c19a1c00 pointer offset 16 size 1024
    2022-02-10T11:04:01.698939  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c2e8b800 pointer offset 128 size 1024
    2022-02-10T11:04:01.699066  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-10T11:04:01.699175  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c19a1c00 pointer offset 0 size 1024
    2022-02-10T11:04:01.741506  kern  :alert : Register r10 information: sl=
ab kmalloc-1k start c2de2800 pointer offset 0 size 1024
    2022-02-10T11:04:01.741807  kern  :alert : Register r11 information: NU=
LL pointer
    2022-02-10T11:04:01.742006  kern  :alert : Register r12 information: sl=
ab task_struct start c2ca9980 pointer offset 0
    2022-02-10T11:04:01.742186  kern  :emerg : Internal error: Oops: 17 [#1=
] SMP THUMB2 =

    ... (40 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6204eddd636dad3684c62974

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204eddd636dad3=
684c62978
        failing since 2 days (last pass: next-20220128, first fail: next-20=
220208)
        16 lines

    2022-02-10T10:49:45.252626  kern  :alert : 8<--- cut here ---
    2022-02-10T10:49:45.263523  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T10:49:45.263969  kern  :alert : [000001a0] *pgd=3D7d350835
    2022-02-10T10:49:45.272682  kern  :alert : Register[   43.733331] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204eddd636dad3=
684c62979
        failing since 2 days (last pass: next-20220128, first fail: next-20=
220208)
        54 lines

    2022-02-10T10:49:45.278208   r0 information: NULL pointer
    2022-02-10T10:49:45.283661  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T10:49:45.287869  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T10:49:45.293028  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-10T10:49:45.305828  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4511400 pointer offset 64 size 1024
    2022-02-10T10:49:45.307711  kern  :alert : Register r5 information: sla=
b task_struct start c2514400 pointer offset 0
    2022-02-10T10:49:45.318566  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 16 size 1024
    2022-02-10T10:49:45.327797  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4511400 pointer offset 128 size 1024
    2022-02-10T10:49:45.333372  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-10T10:49:45.344250  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c21a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6204f085854738e521c6296a

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204f085854738e=
521c6296e
        failing since 2 days (last pass: next-20220125, first fail: next-20=
220208)
        16 lines

    2022-02-10T11:01:15.126699  kern  :alert : 8<--- cut here ---
    2022-02-10T11:01:15.137662  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000188
    2022-02-10T11:01:15.146776  kern  :alert : [00000188] *pgd=3D7d[   44.7=
20024] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D16>
    2022-02-10T11:01:15.147147  2d7835   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204f085854738e=
521c6296f
        failing since 2 days (last pass: next-20220125, first fail: next-20=
220208)
        54 lines

    2022-02-10T11:01:15.152246  kern  :alert : Register r0 information: NUL=
L pointer
    2022-02-10T11:01:15.157733  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T11:01:15.161384  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T11:01:15.166880  kern  :alert : Register r3 information: non=
-slab/vmalloc memory
    2022-02-10T11:01:15.177834  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c4497c00 pointer offset 64 size 1024
    2022-02-10T11:01:15.187027  kern  :alert : Register r5 information: sla=
b task_struct start c443de00 pointer offset 0
    2022-02-10T11:01:15.192667  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 16 size 1024
    2022-02-10T11:01:15.201713  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c4497c00 pointer offset 120 size 1024
    2022-02-10T11:01:15.207295  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-10T11:01:15.218078  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c20f4c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2      | arm   | lab-clabbe      | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6204f162f1fc4fa744c6297a

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220210/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6204f163f1fc4fa=
744c6297e
        failing since 2 days (last pass: next-20220127, first fail: next-20=
220208)
        16 lines

    2022-02-10T11:04:47.350810  kern  :alert : 8<--- cut here ---
    2022-02-10T11:04:47.361670  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000001a0
    2022-02-10T11:04:47.362064  kern  :alert : [000001a0] *pgd=3D7d048835
    2022-02-10T11:04:47.370795  kern  :alert : Register[   44.900654] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6204f163f1fc4fa=
744c6297f
        failing since 2 days (last pass: next-20220127, first fail: next-20=
220208)
        54 lines

    2022-02-10T11:04:47.376275   r0 information: NULL pointer
    2022-02-10T11:04:47.381696  kern  :alert : Register r1 information: non=
-slab/vmalloc memory
    2022-02-10T11:04:47.385389  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2022-02-10T11:04:47.390903  kern  :alert : Register r3 information: non=
-paged memory
    2022-02-10T11:04:47.401809  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c2c98c00 pointer offset 64 size 1024
    2022-02-10T11:04:47.411010  kern  :alert : Register r5 information: sla=
b task_struct start c1aebb80 pointer offset 0
    2022-02-10T11:04:47.416632  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c19a1c00 pointer offset 16 size 1024
    2022-02-10T11:04:47.425714  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c2c98c00 pointer offset 128 size 1024
    2022-02-10T11:04:47.431149  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-02-10T11:04:47.442054  kern  :alert : Register r9 information: sla=
b kmalloc-1k start c19a1c00 pointer offset 0 size 1024 =

    ... (43 line(s) more)  =

 =20
