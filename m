Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E124360DAA2
	for <lists+linux-next@lfdr.de>; Wed, 26 Oct 2022 07:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbiJZFf1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Oct 2022 01:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbiJZFf0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Oct 2022 01:35:26 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAFE5B53F
        for <linux-next@vger.kernel.org>; Tue, 25 Oct 2022 22:35:21 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id k22so2589056pfd.3
        for <linux-next@vger.kernel.org>; Tue, 25 Oct 2022 22:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ub87HXH9e4VxzP0AK2qyxXHHCyvH3uyP0jL6XfY6VhM=;
        b=GcMurLXyDNRr0+7rJJFgPZAVrPlxerNQYEvK59vCfHO9fseQZC4dzS//ey7iSW6cB/
         JvbkHbCOoZ4aUeXJeXyVb2gul5V58aO6JVohB/2gbKbEGS1zhSbpxAL7uTTCP7TkRMJd
         GtVO1DMtRactB176BpVfdzXP1wmnC76uwK8CFxE8x8w7qNgy8h1B39I/t3Jm7dGnvPbJ
         NbU3vPkyxRSD+Mhpbs0qfiH65+TxNZmQ9W2qdOkeK8eBqR5cixKGMkS9GtOwhBlvcGJd
         XTcIyNG0+QZQXIHx7b3lvgvP16TI3yl11kCsnXtKqxSn+3vo3sw3eHpV3Hz2RPQTOqHz
         279A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ub87HXH9e4VxzP0AK2qyxXHHCyvH3uyP0jL6XfY6VhM=;
        b=1wYrbmV3uVD57RG9ipvQsF+qjv6sSd7uVs/j0397KokdXrGgHqTPTeC3LDKQQKUiKB
         PJvAuONETBlASoXs12WfXCGOTBKsE3eue66/l9dhMDnekh2h+miqwp7b8gwlVUInZare
         j8Ei05T3MqhZagqyW6JskZ8dXQ0bGRhJM6Y/O74ubvatO7Enzl0V2nW64jfxXPQUvSbT
         DJa9P1+VKX1k4WsDq9x+aXjUVF3MnsghCLcNXhWxv4/amp0wuuIj/FTx98YAhn/Hp5PW
         fnz2facF2zL5JuFdpjEHBPHs6tIAEfeRZXov6jgb9EDBNmsPLvx92/a8bfTFrj7ZJYY0
         EcdA==
X-Gm-Message-State: ACrzQf3X5wFUVHS88eBGEl/NMDcX8C7XEzGKFZ0Rkr5J9wcUHA3H5Jsu
        fBq02QhDJFS6OQN6wJeKZdxE2wncF5dp57kH
X-Google-Smtp-Source: AMsMyM4v3ghfv7QzepZ4VNCk8HrO8SL2847EYsckhlRx3GjWfpzSAXeLZD67IoQmK3qKT1Ct+7OW8A==
X-Received: by 2002:a05:6a00:14d3:b0:567:6e2c:2f0a with SMTP id w19-20020a056a0014d300b005676e2c2f0amr39161334pfu.57.1666762519301;
        Tue, 25 Oct 2022 22:35:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id rj9-20020a17090b3e8900b0020b21019086sm3665826pjb.3.2022.10.25.22.35.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 22:35:18 -0700 (PDT)
Message-ID: <6358c716.170a0220.fc75.379a@mx.google.com>
Date:   Tue, 25 Oct 2022 22:35:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221026
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 234 builds: 12 failed, 222 passed, 158 errors,
 128 warnings (next-20221026)
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

next/master build: 234 builds: 12 failed, 222 passed, 158 errors, 128 warni=
ngs (next-20221026)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221026/

Tree: next
Branch: master
Git Describe: next-20221026
Git Commit: 60eac8672b5b6061ec07499c0f1b79f6d94311ce
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-16) FAIL

arm:
    allmodconfig: (clang-16) FAIL
    allmodconfig: (gcc-10) FAIL
    corgi_defconfig: (gcc-10) FAIL
    pxa_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    s3c6400_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-16) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

riscv:
    allnoconfig: (clang-16) FAIL
    defconfig+CONFIG_EFI=3Dn: (clang-16) FAIL

x86_64:
    allmodconfig: (clang-16) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-16): 3 errors, 1 warning
    defconfig (clang-16): 1 error, 7 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-16): 1 error, 7 warnings
    defconfig+arm64-chromebook (clang-13): 7 warnings

arm:
    allmodconfig (gcc-10): 23 errors, 1 warning
    allmodconfig (clang-16): 17 errors, 13 warnings
    aspeed_g5_defconfig (clang-16): 1 error, 10 warnings
    corgi_defconfig (gcc-10): 74 errors, 6 warnings
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings
    keystone_defconfig (gcc-10): 1 warning
    moxart_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-16): 1 error
    multi_v7_defconfig (clang-16): 1 error, 10 warnings
    pxa_defconfig (gcc-10): 3 errors
    rpc_defconfig (gcc-10): 2 errors
    s3c6400_defconfig (gcc-10): 19 errors, 4 warnings
    tct_hammer_defconfig (gcc-10): 1 warning
    tegra_defconfig (gcc-10): 1 warning
    viper_defconfig (gcc-10): 1 warning

i386:
    allnoconfig (clang-16): 1 error
    i386_defconfig (clang-16): 1 error

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    ar7_defconfig (gcc-10): 1 warning
    bmips_be_defconfig (gcc-10): 8 warnings
    bmips_stb_defconfig (gcc-10): 8 warnings
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 2 warnings
    rs90_defconfig (gcc-10): 1 warning

riscv:
    allnoconfig (clang-16): 1 error

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-16): 3 errors, 10 warnings
    allnoconfig (clang-16): 1 error
    x86_64_defconfig (clang-16): 1 error

Errors summary:

    12   error: write on a pipe with no reader
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    fs/ntfs3/namei.c:445:7: error: variable 'uni1' is used uninitializ=
ed whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    2    fs/ntfs3/namei.c:434:7: error: variable 'uni1' is used uninitializ=
ed whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    2    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: =E2=80=98EV_SW=E2=
=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: initializer eleme=
nt is not constant
    2    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: =E2=80=98SW_FRONT=
_PROXIMITY=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: initializer eleme=
nt is not constant
    2    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: =E2=80=98EV_KEY=
=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98PF_KEY=
=E2=80=99?
    2    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: initializer eleme=
nt is not constant
    2    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: =E2=80=98KEY_SUSP=
END=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98PMS=
G_SUSPEND=E2=80=99?
    2    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: initializer eleme=
nt is not constant
    2    arch/arm/mach-s3c/mach-crag6410.c:194:12: error: =E2=80=98KEY_CAME=
RA=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:193:12: error: =E2=80=98KEY_RIGH=
T=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:192:12: error: =E2=80=98KEY_UP=
=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:191:12: error: =E2=80=98KEY_LEFT=
=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98KERN_A=
LERT=E2=80=99?
    2    arch/arm/mach-s3c/mach-crag6410.c:190:12: error: =E2=80=98KEY_DOWN=
=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98KEY_RO=
W=E2=80=99?
    2    arch/arm/mach-s3c/mach-crag6410.c:188:12: error: =E2=80=98KEY_MEDI=
A=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:187:12: error: =E2=80=98KEY_MENU=
=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:186:12: error: =E2=80=98KEY_HELP=
=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:185:12: error: =E2=80=98KEY_VOLU=
MEDOWN=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:184:12: error: =E2=80=98KEY_HOME=
=E2=80=99 undeclared here (not in a function)
    2    arch/arm/mach-s3c/mach-crag6410.c:183:12: error: =E2=80=98KEY_VOLU=
MEUP=E2=80=99 undeclared here (not in a function)
    1    arch/arm/mach-s3c/mach-crag6410.c:225:14: error: invalid applicati=
on of 'sizeof' to an incomplete type 'struct gpio_keys_button[]'
    1    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: use of undeclared=
 identifier 'EV_SW'
    1    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: initialization of=
 =E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=
=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Werror=3Dint-conversion]
    1    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: use of undeclared=
 identifier 'SW_FRONT_PROXIMITY'
    1    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: initialization of=
 =E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=
=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Werror=3Dint-conversion]
    1    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: use of undeclared=
 identifier 'EV_KEY'
    1    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: initialization of=
 =E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=
=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Werror=3Dint-conversion]
    1    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: use of undeclared=
 identifier 'KEY_SUSPEND'
    1    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: initialization of=
 =E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=
=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Werror=3Dint-conversion]
    1    arch/arm/mach-s3c/mach-crag6410.c:199:17: error: invalid applicati=
on of 'sizeof' to an incomplete type 'uint32_t[]' (aka 'unsigned int[]')
    1    arch/arm/mach-s3c/mach-crag6410.c:194:12: error: use of undeclared=
 identifier 'KEY_CAMERA'
    1    arch/arm/mach-s3c/mach-crag6410.c:193:12: error: use of undeclared=
 identifier 'KEY_RIGHT'
    1    arch/arm/mach-s3c/mach-crag6410.c:192:12: error: use of undeclared=
 identifier 'KEY_UP'
    1    arch/arm/mach-s3c/mach-crag6410.c:191:12: error: use of undeclared=
 identifier 'KEY_LEFT'
    1    arch/arm/mach-s3c/mach-crag6410.c:190:12: error: use of undeclared=
 identifier 'KEY_DOWN'; did you mean 'SM_DOWN'?
    1    arch/arm/mach-s3c/mach-crag6410.c:188:12: error: use of undeclared=
 identifier 'KEY_MEDIA'
    1    arch/arm/mach-s3c/mach-crag6410.c:187:12: error: use of undeclared=
 identifier 'KEY_MENU'
    1    arch/arm/mach-s3c/mach-crag6410.c:186:12: error: use of undeclared=
 identifier 'KEY_HELP'
    1    arch/arm/mach-s3c/mach-crag6410.c:185:12: error: use of undeclared=
 identifier 'KEY_VOLUMEDOWN'
    1    arch/arm/mach-s3c/mach-crag6410.c:184:12: error: use of undeclared=
 identifier 'KEY_HOME'
    1    arch/arm/mach-s3c/mach-crag6410.c:183:12: error: use of undeclared=
 identifier 'KEY_VOLUMEUP'
    1    arch/arm/mach-pxa/spitz.c:418:11: error: =E2=80=98EV_SW=E2=80=99 u=
ndeclared here (not in a function)
    1    arch/arm/mach-pxa/spitz.c:411:11: error: =E2=80=98KEY_SUSPEND=E2=
=80=99 undeclared here (not in a function); did you mean =E2=80=98LED_SUSPE=
NDED=E2=80=99?
    1    arch/arm/mach-pxa/spitz.c:410:11: error: =E2=80=98EV_PWR=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:425:11: error: =E2=80=98SW_HEADPHONE_INS=
ERT=E2=80=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:425:11: error: initializer element is no=
t constant
    1    arch/arm/mach-pxa/corgi.c:424:11: error: initializer element is no=
t constant
    1    arch/arm/mach-pxa/corgi.c:418:11: error: =E2=80=98SW_TABLET_MODE=
=E2=80=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:418:11: error: initializer element is no=
t constant
    1    arch/arm/mach-pxa/corgi.c:417:11: error: initializer element is no=
t constant
    1    arch/arm/mach-pxa/corgi.c:411:11: error: =E2=80=98SW_LID=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:411:11: error: initializer element is no=
t constant
    1    arch/arm/mach-pxa/corgi.c:410:11: error: =E2=80=98EV_SW=E2=80=99 u=
ndeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:410:11: error: initializer element is no=
t constant
    1    arch/arm/mach-pxa/corgi.c:371:12: error: =E2=80=98KEY_RIGHT=E2=80=
=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:370:12: error: =E2=80=98KEY_DOWN=E2=80=
=99 undeclared here (not in a function); did you mean =E2=80=98KEY_ROW=E2=
=80=99?
    1    arch/arm/mach-pxa/corgi.c:369:12: error: =E2=80=98KEY_LEFT=E2=80=
=99 undeclared here (not in a function); did you mean =E2=80=98KERN_ALERT=
=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:363:12: error: =E2=80=98KEY_SYSRQ=E2=80=
=99 undeclared here (not in a function); did you mean =E2=80=98KERN_SYSRQ=
=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:361:12: error: =E2=80=98KEY_UP=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:360:12: error: =E2=80=98KEY_COMMA=E2=80=
=99 undeclared here (not in a function); did you mean =E2=80=98KEY_COL=E2=
=80=99?
    1    arch/arm/mach-pxa/corgi.c:359:12: error: =E2=80=98KEY_SPACE=E2=80=
=99 undeclared here (not in a function); did you mean =E2=80=98QC_SPACE=E2=
=80=99?
    1    arch/arm/mach-pxa/corgi.c:358:12: error: =E2=80=98KEY_MINUS=E2=80=
=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:357:12: error: =E2=80=98KEY_X=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:356:12: error: =E2=80=98KEY_Z=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:354:13: error: =E2=80=98KEY_LEFTSHIFT=E2=
=80=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:353:12: error: =E2=80=98KEY_ENTER=E2=80=
=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:352:12: error: =E2=80=98KEY_DOT=E2=80=99=
 undeclared here (not in a function); did you mean =E2=80=98KEY_ROW=E2=80=
=99?
    1    arch/arm/mach-pxa/corgi.c:351:12: error: =E2=80=98KEY_N=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:350:12: error: =E2=80=98KEY_B=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:349:12: error: =E2=80=98KEY_C=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:348:12: error: =E2=80=98KEY_D=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:347:12: error: =E2=80=98KEY_A=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:345:12: error: =E2=80=98KEY_RIGHTSHIFT=
=E2=80=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:344:12: error: =E2=80=98KEY_L=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:343:12: error: =E2=80=98KEY_M=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:342:12: error: =E2=80=98KEY_H=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:341:12: error: =E2=80=98KEY_V=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:340:12: error: =E2=80=98KEY_F=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:339:12: error: =E2=80=98KEY_S=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:338:12: error: =E2=80=98KEY_W=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:336:12: error: =E2=80=98KEY_K=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:335:12: error: =E2=80=98KEY_J=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:334:12: error: =E2=80=98KEY_U=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:333:12: error: =E2=80=98KEY_G=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:332:12: error: =E2=80=98KEY_T=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:331:12: error: =E2=80=98KEY_E=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:330:12: error: =E2=80=98KEY_Q=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:329:12: error: =E2=80=98KEY_TAB=E2=80=99=
 undeclared here (not in a function); did you mean =E2=80=98KEY_VAL=E2=80=
=99?
    1    arch/arm/mach-pxa/corgi.c:328:12: error: =E2=80=98KEY_P=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:327:12: error: =E2=80=98KEY_O=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:326:12: error: =E2=80=98KEY_I=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:325:12: error: =E2=80=98KEY_8=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:324:12: error: =E2=80=98KEY_Y=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:323:12: error: =E2=80=98KEY_R=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:322:12: error: =E2=80=98KEY_4=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:321:12: error: =E2=80=98KEY_2=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:320:12: error: =E2=80=98KEY_BACKSPACE=E2=
=80=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:319:12: error: =E2=80=98KEY_0=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:318:12: error: =E2=80=98KEY_9=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:317:12: error: =E2=80=98KEY_7=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:316:12: error: =E2=80=98KEY_6=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:315:12: error: =E2=80=98KEY_5=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:314:12: error: =E2=80=98KEY_3=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:313:12: error: =E2=80=98KEY_1=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:310:25: error: =E2=80=98KEY_F12=E2=80=99=
 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:309:23: error: =E2=80=98KEY_F11=E2=80=99=
 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:308:25: error: =E2=80=98KEY_F10=E2=80=99=
 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:307:25: error: =E2=80=98KEY_LEFTALT=E2=
=80=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:306:25: error: =E2=80=98KEY_LEFTCTRL=E2=
=80=99 undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:305:27: error: =E2=80=98KEY_F8=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:304:29: error: =E2=80=98KEY_F7=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:303:28: error: =E2=80=98KEY_F6=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:302:25: error: =E2=80=98KEY_F5=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:301:24: error: =E2=80=98KEY_SUSPEND=E2=
=80=99 undeclared here (not in a function); did you mean =E2=80=98LED_SUSPE=
NDED=E2=80=99?
    1    arch/arm/mach-pxa/corgi.c:300:26: error: =E2=80=98KEY_F4=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:299:23: error: =E2=80=98KEY_F3=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:298:27: error: =E2=80=98KEY_F2=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/mach-pxa/corgi.c:297:28: error: =E2=80=98KEY_F1=E2=80=99 =
undeclared here (not in a function)
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    22   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    21   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    8    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 de=
fined but not used [-Wunused-function]
    3    mm/khugepaged.c:1729:7: warning: variable 'nr' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    3    mm/khugepaged.c:1729:7: warning: variable 'index' is used uninitia=
lized whenever 'if' condition is true [-Wsometimes-uninitialized]
    3    mm/khugepaged.c:1716:6: warning: variable 'nr' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    3    mm/khugepaged.c:1716:6: warning: variable 'index' is used uninitia=
lized whenever 'if' condition is true [-Wsometimes-uninitialized]
    3    mm/khugepaged.c:1710:8: note: initialize the variable 'nr' to sile=
nce this warning
    3    mm/khugepaged.c:1705:15: note: initialize the variable 'index' to =
silence this warning
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    3    4 warnings generated.
    2    fs/ntfs3/namei.c:430:22: note: initialize the variable 'uni1' to s=
ilence this warning
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_forma=
t): /ubus/timer-mfd@10000080/watchdog@1c:reg: property has invalid length (=
8 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid=
_default_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on defau=
lt #size-cells value
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid=
_default_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on defau=
lt #address-cells value
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:111.4-35: Warning (ranges_fo=
rmat): /ubus/timer-mfd@10000080:ranges: "ranges" property has invalid lengt=
h (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
    2    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (s=
pi_bus_reg): Failed prerequisite 'reg_format'
    2    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (p=
ci_device_reg): Failed prerequisite 'reg_format'
    2    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (p=
ci_device_bus_num): Failed prerequisite 'reg_format'
    2    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (i=
2c_bus_reg): Failed prerequisite 'reg_format'
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: vc_switch_off_ist+0xbe: call to memcp=
y() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leav=
es .noinstr.text section
    1    vmlinux.o: warning: objtool: get_cpu_entry_area+0x4: call to cea_o=
ffset() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_put_ghcb+0x35: call to memcpy()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb+0xad: call to memcpy()=
 leaves .noinstr.text section
    1    fs/reiserfs/reiserfs.o: warning: objtool: replace_key+0x226: stack=
 state mismatch: cfa1=3D4+80 cfa2=3D4+96
    1    drivers/media/platform/qcom/camss/qcom-camss.o: warning: objtool: =
csiphy_lanes_enable+0x494: sibling call from callable instruction with modi=
fied stack frame
    1    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fm=
t() falls through to next function __cfi_m5mols_enum_mbus_code()
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    cc1: all warnings being treated as errors
    1    arch/arm/mach-s3c/mach-crag6410.c:219:11: warning: initialization =
of =E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =
=E2=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast=
 [-Wint-conversion]
    1    arch/arm/mach-s3c/mach-crag6410.c:217:11: warning: initialization =
of =E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =
=E2=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast=
 [-Wint-conversion]
    1    arch/arm/mach-s3c/mach-crag6410.c:212:11: warning: initialization =
of =E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =
=E2=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast=
 [-Wint-conversion]
    1    arch/arm/mach-s3c/mach-crag6410.c:210:11: warning: initialization =
of =E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =
=E2=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast=
 [-Wint-conversion]
    1    arch/arm/mach-pxa/corgi.c:425:11: warning: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =
=E2=80=98const unsigned int *=E2=80=99} makes integer from pointer without =
a cast [-Wint-conversion]
    1    arch/arm/mach-pxa/corgi.c:424:11: warning: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =
=E2=80=98const unsigned int *=E2=80=99} makes integer from pointer without =
a cast [-Wint-conversion]
    1    arch/arm/mach-pxa/corgi.c:418:11: warning: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =
=E2=80=98const unsigned int *=E2=80=99} makes integer from pointer without =
a cast [-Wint-conversion]
    1    arch/arm/mach-pxa/corgi.c:417:11: warning: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =
=E2=80=98const unsigned int *=E2=80=99} makes integer from pointer without =
a cast [-Wint-conversion]
    1    arch/arm/mach-pxa/corgi.c:411:11: warning: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =
=E2=80=98const unsigned int *=E2=80=99} makes integer from pointer without =
a cast [-Wint-conversion]
    1    arch/arm/mach-pxa/corgi.c:410:11: warning: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =
=E2=80=98const unsigned int *=E2=80=99} makes integer from pointer without =
a cast [-Wint-conversion]
    1    : warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    1    ..clangclang: warning: argument unused during compilation: '-march=
=3Darmv6k' [-Wunused-command-line-argument]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 23 errors, 1 warning, 0 section =
mismatches

Errors:
    arch/arm/mach-s3c/mach-crag6410.c:183:12: error: =E2=80=98KEY_VOLUMEUP=
=E2=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:184:12: error: =E2=80=98KEY_HOME=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:185:12: error: =E2=80=98KEY_VOLUMEDOW=
N=E2=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:186:12: error: =E2=80=98KEY_HELP=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:187:12: error: =E2=80=98KEY_MENU=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:188:12: error: =E2=80=98KEY_MEDIA=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:190:12: error: =E2=80=98KEY_DOWN=E2=
=80=99 undeclared here (not in a function); did you mean =E2=80=98KEY_ROW=
=E2=80=99?
    arch/arm/mach-s3c/mach-crag6410.c:191:12: error: =E2=80=98KEY_LEFT=E2=
=80=99 undeclared here (not in a function); did you mean =E2=80=98KERN_ALER=
T=E2=80=99?
    arch/arm/mach-s3c/mach-crag6410.c:192:12: error: =E2=80=98KEY_UP=E2=80=
=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:193:12: error: =E2=80=98KEY_RIGHT=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:194:12: error: =E2=80=98KEY_CAMERA=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: =E2=80=98KEY_SUSPEND=
=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98PMSG_S=
USPEND=E2=80=99?
    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=80=
=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-Wer=
ror=3Dint-conversion]
    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: initializer element is=
 not constant
    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: =E2=80=98EV_KEY=E2=80=
=99 undeclared here (not in a function); did you mean =E2=80=98PF_KEY=E2=80=
=99?
    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=80=
=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-Wer=
ror=3Dint-conversion]
    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: initializer element is=
 not constant
    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: =E2=80=98SW_FRONT_PROX=
IMITY=E2=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=80=
=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-Wer=
ror=3Dint-conversion]
    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: initializer element is=
 not constant
    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: =E2=80=98EV_SW=E2=80=
=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: initialization of =E2=
=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=80=
=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-Wer=
ror=3Dint-conversion]
    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: initializer element is=
 not constant

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-16) =E2=80=94 FAIL, 17 errors, 13 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/mach-s3c/mach-crag6410.c:183:12: error: use of undeclared iden=
tifier 'KEY_VOLUMEUP'
    arch/arm/mach-s3c/mach-crag6410.c:184:12: error: use of undeclared iden=
tifier 'KEY_HOME'
    arch/arm/mach-s3c/mach-crag6410.c:185:12: error: use of undeclared iden=
tifier 'KEY_VOLUMEDOWN'
    arch/arm/mach-s3c/mach-crag6410.c:186:12: error: use of undeclared iden=
tifier 'KEY_HELP'
    arch/arm/mach-s3c/mach-crag6410.c:187:12: error: use of undeclared iden=
tifier 'KEY_MENU'
    arch/arm/mach-s3c/mach-crag6410.c:188:12: error: use of undeclared iden=
tifier 'KEY_MEDIA'
    arch/arm/mach-s3c/mach-crag6410.c:190:12: error: use of undeclared iden=
tifier 'KEY_DOWN'; did you mean 'SM_DOWN'?
    arch/arm/mach-s3c/mach-crag6410.c:191:12: error: use of undeclared iden=
tifier 'KEY_LEFT'
    arch/arm/mach-s3c/mach-crag6410.c:192:12: error: use of undeclared iden=
tifier 'KEY_UP'
    arch/arm/mach-s3c/mach-crag6410.c:193:12: error: use of undeclared iden=
tifier 'KEY_RIGHT'
    arch/arm/mach-s3c/mach-crag6410.c:194:12: error: use of undeclared iden=
tifier 'KEY_CAMERA'
    arch/arm/mach-s3c/mach-crag6410.c:199:17: error: invalid application of=
 'sizeof' to an incomplete type 'uint32_t[]' (aka 'unsigned int[]')
    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: use of undeclared iden=
tifier 'KEY_SUSPEND'
    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: use of undeclared iden=
tifier 'EV_KEY'
    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: use of undeclared iden=
tifier 'SW_FRONT_PROXIMITY'
    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: use of undeclared iden=
tifier 'EV_SW'
    arch/arm/mach-s3c/mach-crag6410.c:225:14: error: invalid application of=
 'sizeof' to an incomplete type 'struct gpio_keys_button[]'

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    ..clangclang: warning: argument unused during compilation: '-march=3Dar=
mv6k' [-Wunused-command-line-argument]
    : warning: argument unused during compilation: '-march=3Darmv6k' [-Wunu=
sed-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-16) =E2=80=94 FAIL, 3 errors, 10 warnings, 0 se=
ction mismatches

Errors:
    error: write on a pipe with no reader
    fs/ntfs3/namei.c:445:7: error: variable 'uni1' is used uninitialized wh=
enever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    fs/ntfs3/namei.c:434:7: error: variable 'uni1' is used uninitialized wh=
enever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .n=
oinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist+0xbe: call to memcpy() l=
eaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb+0xad: call to memcpy() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb+0x35: call to memcpy() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: get_cpu_entry_area+0x4: call to cea_offset=
() leaves .noinstr.text section
    fs/reiserfs/reiserfs.o: warning: objtool: replace_key+0x226: stack stat=
e mismatch: cfa1=3D4+80 cfa2=3D4+96
    fs/ntfs3/namei.c:430:22: note: initialize the variable 'uni1' to silenc=
e this warning
    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fmt() f=
alls through to next function __cfi_m5mols_enum_mbus_code()
    drivers/media/platform/qcom/camss/qcom-camss.o: warning: objtool: csiph=
y_lanes_enable+0x494: sibling call from callable instruction with modified =
stack frame

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-16) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-16) =E2=80=94 FAIL, 3 errors, 1 warning, 0 secti=
on mismatches

Errors:
    error: write on a pipe with no reader
    fs/ntfs3/namei.c:445:7: error: variable 'uni1' is used uninitialized wh=
enever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    fs/ntfs3/namei.c:434:7: error: variable 'uni1' is used uninitialized wh=
enever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/ntfs3/namei.c:430:22: note: initialize the variable 'uni1' to silenc=
e this warning

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-16) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    error: write on a pipe with no reader

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-16) =E2=80=94 PASS, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    error: write on a pipe with no reader

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-16) =E2=80=94 PASS, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    error: write on a pipe with no reader

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-16) =E2=80=94 PASS, 1 error, 10 warnings, 0=
 section mismatches

Errors:
    error: write on a pipe with no reader

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 s=
ection mismatches

Warnings:
    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_format): /=
ubus/timer-mfd@10000080/watchdog@1c:reg: property has invalid length (8 byt=
es) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268.dtsi:111.4-35: Warning (ranges_format)=
: /ubus/timer-mfd@10000080:ranges: "ranges" property has invalid length (12=
 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 2, #si=
ze-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (pci_de=
vice_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (pci_de=
vice_bus_num): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (i2c_bu=
s_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (spi_bu=
s_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #a=
ddress-cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #s=
ize-cells value

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 =
section mismatches

Warnings:
    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_format): /=
ubus/timer-mfd@10000080/watchdog@1c:reg: property has invalid length (8 byt=
es) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268.dtsi:111.4-35: Warning (ranges_format)=
: /ubus/timer-mfd@10000080:ranges: "ranges" property has invalid length (12=
 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 2, #si=
ze-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (pci_de=
vice_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (pci_de=
vice_bus_num): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (i2c_bu=
s_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (spi_bu=
s_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #a=
ddress-cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #s=
ize-cells value

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 FAIL, 74 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/mach-pxa/corgi.c:313:12: error: =E2=80=98KEY_1=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:314:12: error: =E2=80=98KEY_3=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:315:12: error: =E2=80=98KEY_5=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:316:12: error: =E2=80=98KEY_6=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:317:12: error: =E2=80=98KEY_7=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:318:12: error: =E2=80=98KEY_9=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:319:12: error: =E2=80=98KEY_0=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:320:12: error: =E2=80=98KEY_BACKSPACE=E2=80=
=99 undeclared here (not in a function)
    arch/arm/mach-pxa/corgi.c:321:12: error: =E2=80=98KEY_2=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:322:12: error: =E2=80=98KEY_4=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:323:12: error: =E2=80=98KEY_R=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:324:12: error: =E2=80=98KEY_Y=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:325:12: error: =E2=80=98KEY_8=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:326:12: error: =E2=80=98KEY_I=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:327:12: error: =E2=80=98KEY_O=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:328:12: error: =E2=80=98KEY_P=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:329:12: error: =E2=80=98KEY_TAB=E2=80=99 unde=
clared here (not in a function); did you mean =E2=80=98KEY_VAL=E2=80=99?
    arch/arm/mach-pxa/corgi.c:330:12: error: =E2=80=98KEY_Q=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:331:12: error: =E2=80=98KEY_E=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:332:12: error: =E2=80=98KEY_T=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:333:12: error: =E2=80=98KEY_G=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:334:12: error: =E2=80=98KEY_U=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:335:12: error: =E2=80=98KEY_J=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:336:12: error: =E2=80=98KEY_K=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:297:28: error: =E2=80=98KEY_F1=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:338:12: error: =E2=80=98KEY_W=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:339:12: error: =E2=80=98KEY_S=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:340:12: error: =E2=80=98KEY_F=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:341:12: error: =E2=80=98KEY_V=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:342:12: error: =E2=80=98KEY_H=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:343:12: error: =E2=80=98KEY_M=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:344:12: error: =E2=80=98KEY_L=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:345:12: error: =E2=80=98KEY_RIGHTSHIFT=E2=80=
=99 undeclared here (not in a function)
    arch/arm/mach-pxa/corgi.c:298:27: error: =E2=80=98KEY_F2=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:347:12: error: =E2=80=98KEY_A=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:348:12: error: =E2=80=98KEY_D=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:349:12: error: =E2=80=98KEY_C=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:350:12: error: =E2=80=98KEY_B=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:351:12: error: =E2=80=98KEY_N=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:352:12: error: =E2=80=98KEY_DOT=E2=80=99 unde=
clared here (not in a function); did you mean =E2=80=98KEY_ROW=E2=80=99?
    arch/arm/mach-pxa/corgi.c:353:12: error: =E2=80=98KEY_ENTER=E2=80=99 un=
declared here (not in a function)
    arch/arm/mach-pxa/corgi.c:354:13: error: =E2=80=98KEY_LEFTSHIFT=E2=80=
=99 undeclared here (not in a function)
    arch/arm/mach-pxa/corgi.c:308:25: error: =E2=80=98KEY_F10=E2=80=99 unde=
clared here (not in a function)
    arch/arm/mach-pxa/corgi.c:356:12: error: =E2=80=98KEY_Z=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:357:12: error: =E2=80=98KEY_X=E2=80=99 undecl=
ared here (not in a function); did you mean =E2=80=98KEY=E2=80=99?
    arch/arm/mach-pxa/corgi.c:358:12: error: =E2=80=98KEY_MINUS=E2=80=99 un=
declared here (not in a function)
    arch/arm/mach-pxa/corgi.c:359:12: error: =E2=80=98KEY_SPACE=E2=80=99 un=
declared here (not in a function); did you mean =E2=80=98QC_SPACE=E2=80=99?
    arch/arm/mach-pxa/corgi.c:360:12: error: =E2=80=98KEY_COMMA=E2=80=99 un=
declared here (not in a function); did you mean =E2=80=98KEY_COL=E2=80=99?
    arch/arm/mach-pxa/corgi.c:361:12: error: =E2=80=98KEY_UP=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:299:23: error: =E2=80=98KEY_F3=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:363:12: error: =E2=80=98KEY_SYSRQ=E2=80=99 un=
declared here (not in a function); did you mean =E2=80=98KERN_SYSRQ=E2=80=
=99?
    arch/arm/mach-pxa/corgi.c:306:25: error: =E2=80=98KEY_LEFTCTRL=E2=80=99=
 undeclared here (not in a function)
    arch/arm/mach-pxa/corgi.c:307:25: error: =E2=80=98KEY_LEFTALT=E2=80=99 =
undeclared here (not in a function)
    arch/arm/mach-pxa/corgi.c:300:26: error: =E2=80=98KEY_F4=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:309:23: error: =E2=80=98KEY_F11=E2=80=99 unde=
clared here (not in a function)
    arch/arm/mach-pxa/corgi.c:310:25: error: =E2=80=98KEY_F12=E2=80=99 unde=
clared here (not in a function)
    arch/arm/mach-pxa/corgi.c:369:12: error: =E2=80=98KEY_LEFT=E2=80=99 und=
eclared here (not in a function); did you mean =E2=80=98KERN_ALERT=E2=80=99?
    arch/arm/mach-pxa/corgi.c:370:12: error: =E2=80=98KEY_DOWN=E2=80=99 und=
eclared here (not in a function); did you mean =E2=80=98KEY_ROW=E2=80=99?
    arch/arm/mach-pxa/corgi.c:371:12: error: =E2=80=98KEY_RIGHT=E2=80=99 un=
declared here (not in a function)
    arch/arm/mach-pxa/corgi.c:301:24: error: =E2=80=98KEY_SUSPEND=E2=80=99 =
undeclared here (not in a function); did you mean =E2=80=98LED_SUSPENDED=E2=
=80=99?
    arch/arm/mach-pxa/corgi.c:302:25: error: =E2=80=98KEY_F5=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:303:28: error: =E2=80=98KEY_F6=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:304:29: error: =E2=80=98KEY_F7=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:305:27: error: =E2=80=98KEY_F8=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:410:11: error: =E2=80=98EV_SW=E2=80=99 undecl=
ared here (not in a function)
    arch/arm/mach-pxa/corgi.c:410:11: error: initializer element is not con=
stant
    arch/arm/mach-pxa/corgi.c:411:11: error: =E2=80=98SW_LID=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/corgi.c:411:11: error: initializer element is not con=
stant
    arch/arm/mach-pxa/corgi.c:417:11: error: initializer element is not con=
stant
    arch/arm/mach-pxa/corgi.c:418:11: error: =E2=80=98SW_TABLET_MODE=E2=80=
=99 undeclared here (not in a function)
    arch/arm/mach-pxa/corgi.c:418:11: error: initializer element is not con=
stant
    arch/arm/mach-pxa/corgi.c:424:11: error: initializer element is not con=
stant
    arch/arm/mach-pxa/corgi.c:425:11: error: =E2=80=98SW_HEADPHONE_INSERT=
=E2=80=99 undeclared here (not in a function)
    arch/arm/mach-pxa/corgi.c:425:11: error: initializer element is not con=
stant

Warnings:
    arch/arm/mach-pxa/corgi.c:410:11: warning: initialization of =E2=80=98u=
nsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =E2=80=98=
const unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]
    arch/arm/mach-pxa/corgi.c:411:11: warning: initialization of =E2=80=98u=
nsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =E2=80=98=
const unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]
    arch/arm/mach-pxa/corgi.c:417:11: warning: initialization of =E2=80=98u=
nsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =E2=80=98=
const unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]
    arch/arm/mach-pxa/corgi.c:418:11: warning: initialization of =E2=80=98u=
nsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =E2=80=98=
const unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]
    arch/arm/mach-pxa/corgi.c:424:11: warning: initialization of =E2=80=98u=
nsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =E2=80=98=
const unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]
    arch/arm/mach-pxa/corgi.c:425:11: warning: initialization of =E2=80=98u=
nsigned int=E2=80=99 from =E2=80=98const uint32_t *=E2=80=99 {aka =E2=80=98=
const unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]

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
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-16) =E2=80=94 PASS, 1 error, 7 warnings, 0 section =
mismatches

Errors:
    error: write on a pipe with no reader

Warnings:
    mm/khugepaged.c:1729:7: warning: variable 'index' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1716:6: warning: variable 'index' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1705:15: note: initialize the variable 'index' to silen=
ce this warning
    mm/khugepaged.c:1729:7: warning: variable 'nr' is used uninitialized wh=
enever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1716:6: warning: variable 'nr' is used uninitialized wh=
enever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1710:8: note: initialize the variable 'nr' to silence t=
his warning
    4 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-16) =E2=80=94 PASS, 1 er=
ror, 7 warnings, 0 section mismatches

Errors:
    error: write on a pipe with no reader

Warnings:
    mm/khugepaged.c:1729:7: warning: variable 'index' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1716:6: warning: variable 'index' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1705:15: note: initialize the variable 'index' to silen=
ce this warning
    mm/khugepaged.c:1729:7: warning: variable 'nr' is used uninitialized wh=
enever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1716:6: warning: variable 'nr' is used uninitialized wh=
enever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1710:8: note: initialize the variable 'nr' to silence t=
his warning
    4 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-16) =E2=80=94 FAIL, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 7 wa=
rnings, 0 section mismatches

Warnings:
    mm/khugepaged.c:1729:7: warning: variable 'index' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1716:6: warning: variable 'index' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1705:15: note: initialize the variable 'index' to silen=
ce this warning
    mm/khugepaged.c:1729:7: warning: variable 'nr' is used uninitialized wh=
enever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1716:6: warning: variable 'nr' is used uninitialized wh=
enever 'if' condition is true [-Wsometimes-uninitialized]
    mm/khugepaged.c:1710:8: note: initialize the variable 'nr' to silence t=
his warning
    4 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-16) =E2=80=94 PASS, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    error: write on a pipe with no reader

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-16) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    error: write on a pipe with no reader

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-16) =E2=80=94 PASS, 1 error, 10 warnings, 0 =
section mismatches

Errors:
    error: write on a pipe with no reader

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
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/mach-pxa/spitz.c:410:11: error: =E2=80=98EV_PWR=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/spitz.c:411:11: error: =E2=80=98KEY_SUSPEND=E2=80=99 =
undeclared here (not in a function); did you mean =E2=80=98LED_SUSPENDED=E2=
=80=99?
    arch/arm/mach-pxa/spitz.c:418:11: error: =E2=80=98EV_SW=E2=80=99 undecl=
ared here (not in a function)

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]
    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requires 44 =
bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift-over=
flow=3D]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 FAIL, 19 errors, 4 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/mach-s3c/mach-crag6410.c:183:12: error: =E2=80=98KEY_VOLUMEUP=
=E2=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:184:12: error: =E2=80=98KEY_HOME=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:185:12: error: =E2=80=98KEY_VOLUMEDOW=
N=E2=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:186:12: error: =E2=80=98KEY_HELP=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:187:12: error: =E2=80=98KEY_MENU=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:188:12: error: =E2=80=98KEY_MEDIA=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:190:12: error: =E2=80=98KEY_DOWN=E2=
=80=99 undeclared here (not in a function); did you mean =E2=80=98KEY_ROW=
=E2=80=99?
    arch/arm/mach-s3c/mach-crag6410.c:191:12: error: =E2=80=98KEY_LEFT=E2=
=80=99 undeclared here (not in a function); did you mean =E2=80=98KERN_ALER=
T=E2=80=99?
    arch/arm/mach-s3c/mach-crag6410.c:192:12: error: =E2=80=98KEY_UP=E2=80=
=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:193:12: error: =E2=80=98KEY_RIGHT=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:194:12: error: =E2=80=98KEY_CAMERA=E2=
=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: =E2=80=98KEY_SUSPEND=
=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98PMSG_S=
USPEND=E2=80=99?
    arch/arm/mach-s3c/mach-crag6410.c:210:11: error: initializer element is=
 not constant
    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: =E2=80=98EV_KEY=E2=80=
=99 undeclared here (not in a function); did you mean =E2=80=98PF_KEY=E2=80=
=99?
    arch/arm/mach-s3c/mach-crag6410.c:212:11: error: initializer element is=
 not constant
    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: =E2=80=98SW_FRONT_PROX=
IMITY=E2=80=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:217:11: error: initializer element is=
 not constant
    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: =E2=80=98EV_SW=E2=80=
=99 undeclared here (not in a function)
    arch/arm/mach-s3c/mach-crag6410.c:219:11: error: initializer element is=
 not constant

Warnings:
    arch/arm/mach-s3c/mach-crag6410.c:210:11: warning: initialization of =
=E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=
=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]
    arch/arm/mach-s3c/mach-crag6410.c:212:11: warning: initialization of =
=E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=
=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]
    arch/arm/mach-s3c/mach-crag6410.c:217:11: warning: initialization of =
=E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=
=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]
    arch/arm/mach-s3c/mach-crag6410.c:219:11: warning: initialization of =
=E2=80=98unsigned int=E2=80=99 from =E2=80=98uint32_t *=E2=80=99 {aka =E2=
=80=98unsigned int *=E2=80=99} makes integer from pointer without a cast [-=
Wint-conversion]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:839:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
x86_64_defconfig (x86_64, clang-16) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    error: write on a pipe with no reader

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
