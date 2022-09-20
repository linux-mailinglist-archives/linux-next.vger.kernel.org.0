Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA995BDC65
	for <lists+linux-next@lfdr.de>; Tue, 20 Sep 2022 07:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbiITFZS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Sep 2022 01:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiITFYr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Sep 2022 01:24:47 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17810E37
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 22:24:31 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c24so1302966plo.3
        for <linux-next@vger.kernel.org>; Mon, 19 Sep 2022 22:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=TtOUqFuilSh/QRx55cZ/GdxeD3jeE5tI+loAzoQL+QA=;
        b=XskmXYfxNOdZJSFGTpViKAqImNWyHBinAMNJXCHSx7K8UfcXrGwUIpMhnp4lt2Ljfi
         qypxV1AjLjBdR/A3hrwp3NMTI27HjOgZfNEuDzkQ4Oy62vYaTFDXEgtzNhGsM1RA8D5P
         LEGG26kKg9yeg+5Fj8+eR765DccSFzu7pcb5km7IZ9XHc0s6uLr8sUIhZzjemW5d/nyZ
         kx8bt0m/RyfoQzRlO2HyjxhcXGX9znUegDcG7crBIYKXCHD7qmWgNaYYhetxC8do5tF1
         BjFlnSFEaVGqanJunN4GKuKH+pMBOB7pF4qncKa3sPL1+DTclA3ZfvEqJH/wBu0vMS8E
         UPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=TtOUqFuilSh/QRx55cZ/GdxeD3jeE5tI+loAzoQL+QA=;
        b=dScDeCt2cACGjfMcNMVAgi1A8pkTEqZAMkpnYQqVGDyf/hsAe6d6QueboWtc9xMsNV
         +lcAUypjfg0Jx4IsCuWjk8zlmkVGp8GpXv15IR01gCWtdasCXI2x3drGmtEkG9/sDbyS
         SLMTDGnl+vVl6CCOvqQWzXdnOEgY9vVZBiRLutItCC7lYmdjDWkskIGnztkKh441bekJ
         SlTHSwWIyJcxDYCIYBgMKCVpbOfQIQDHbdhqiK26nCLqFcal2ACYy0RQEQOWIK8apk34
         n5Nq2B04vfiV+iptjxuIWAvxv9NY6Fn7N5Qsofifp0QHX8olt1bEkT0VP859U2GdibZo
         E3gQ==
X-Gm-Message-State: ACrzQf24gejw2/EZw//roLL8VlR82ej4Ygj4XljQqd8drj8sovsJB9Um
        pKougF5MOBxAUYU3W5RzOg8y/+EYsScsARqyvL4=
X-Google-Smtp-Source: AMsMyM5Te0OkBrzt24oKjMaSLNTlHKhRPLstNN4t7bsl1sc4Bb+k+/rTqMYbh4bfrnYRbibtcOl6KQ==
X-Received: by 2002:a17:902:6549:b0:178:12e9:8d7b with SMTP id d9-20020a170902654900b0017812e98d7bmr3157389pln.14.1663651470156;
        Mon, 19 Sep 2022 22:24:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b001754cfb5e21sm388481plh.96.2022.09.19.22.24.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 22:24:29 -0700 (PDT)
Message-ID: <63294e8d.170a0220.8781f.0b7d@mx.google.com>
Date:   Mon, 19 Sep 2022 22:24:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.0-rc6-212-g9e152597d89ac
Subject: next/pending-fixes build: 27 builds: 1 failed, 26 passed,
 3 errors (v6.0-rc6-212-g9e152597d89ac)
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

next/pending-fixes build: 27 builds: 1 failed, 26 passed, 3 errors (v6.0-rc=
6-212-g9e152597d89ac)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.0-rc6-212-g9e152597d89ac/

Tree: next
Branch: pending-fixes
Git Describe: v6.0-rc6-212-g9e152597d89ac
Git Commit: 9e152597d89ac9ca06385594634eddda9b0c2e7e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 5 unique architectures

Build Failure Detected:

arm:
    rpc_defconfig: (gcc-10) FAIL

Errors Detected:

arm64:

arm:
    rpc_defconfig (gcc-10): 2 errors

i386:

mips:
    fuloong2e_defconfig (gcc-10): 1 error

x86_64:

Errors summary:

    1    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>
