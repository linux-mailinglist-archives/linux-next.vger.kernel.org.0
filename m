Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C5A44BB61
	for <lists+linux-next@lfdr.de>; Wed, 10 Nov 2021 06:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhKJFtm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Nov 2021 00:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhKJFtm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Nov 2021 00:49:42 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA75C061764
        for <linux-next@vger.kernel.org>; Tue,  9 Nov 2021 21:46:55 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id r5so2142245pls.1
        for <linux-next@vger.kernel.org>; Tue, 09 Nov 2021 21:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=024y36RIV5lzK0Qq+9biC1ng1R+92rvnjvk1PUivGDo=;
        b=F9mwoLgIl+0F9ZcxPz5puO0SZ+DQuZzm5LasLEnVi2TOsoAvoCB8gqG1N2B/Xgqu9a
         G/aaB+6QAekEfKd4uomyFh+mkKqFLfI03QvNLaqJHemvO3k0jIk/XAWxF1bucTvTEYiD
         1hdZ1lv2z0mI1hmSrzeZm3EXwHva7mwb8GBxmnU6C99gxRFH/BdgWUkNE1sIzqY2rhb6
         9JtB9gObcojdeDJQOCufmnZM5rDDKQ2rdqgBEGMtvPL7W5d3vx3iCad9sEjqt+zCNVFo
         PF0WuRPxfjb9O5twtf+mBQKD6KPY7wEm3Zr725ZpJ8cd7Vq/tHveWpv03ybWYOc2x9Ae
         x4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=024y36RIV5lzK0Qq+9biC1ng1R+92rvnjvk1PUivGDo=;
        b=DNe884V21max121QR/jdULVMi8y8UjrbyFnohtXIxZws2I/NvARLD5gpcmBtKH8eLt
         u4bWG6FiVshq3DPpSn66AiXok3Z0Bog+DfTL74KkQPegpvMqleG/mj8sUCDGq8dGCrbC
         ybkpy8OArGYWIFu1i3WZCo+dsL/sMvDbYxj+GqgMGwWpqTzXKNNNMXRE6agfN+XryTd+
         HkU/cpPnTSDdiOOkfUkmSD+Qi0IFOoTiepMoeO/dYotSGNh2wJXrelTJPhJ19Y8uvftz
         GRKhN36cT1Mbpa4c48KKX4wlLd3GDO1J0s/bFv5mwU9qY2/Ml/Vu2vBg7Py9AzIFx6gs
         VxmQ==
X-Gm-Message-State: AOAM530ReoMQW64kE3ywHpMnEfkhz8MAD1dRmT+YER24AGS482UH76eu
        oXdT6K90cShTAnLhOS8W6fgvUJRrpvvB3TS2
X-Google-Smtp-Source: ABdhPJzIV/sIRfdS58fXYesvUNsJMfGaqfEO07df02lfqxfe/H9Q1JKkWCPo43GapNUliYE5r203/A==
X-Received: by 2002:a17:90b:33c8:: with SMTP id lk8mr13757277pjb.97.1636523212483;
        Tue, 09 Nov 2021 21:46:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l4sm22458395pfc.121.2021.11.09.21.46.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 21:46:51 -0800 (PST)
Message-ID: <618b5ccb.1c69fb81.d2c34.4031@mx.google.com>
Date:   Tue, 09 Nov 2021 21:46:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211110
X-Kernelci-Report-Type: build
Subject: next/master build: 225 builds: 17 failed, 208 passed, 456 errors,
 225 warnings (next-20211110)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 225 builds: 17 failed, 208 passed, 456 errors, 225 warni=
ngs (next-20211110)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211110/

Tree: next
Branch: master
Git Describe: next-20211110
Git Commit: 73e5c18006f5e1f7d35d1e996609eaff6536ae5e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    defconfig: (clang-10) FAIL
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy: (clang-10) FAIL

arm:
    allmodconfig: (clang-10) FAIL
    allnoconfig: (clang-10) FAIL
    aspeed_g5_defconfig: (clang-10) FAIL
    multi_v7_defconfig: (clang-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-13) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-10) FAIL
    x86_64_defconfig: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 3 warnings
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-10): 129 errors
    defconfig (clang-10): 129 errors
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 129 errors

arm:
    allmodconfig (clang-10): 33 errors, 14 warnings
    allnoconfig (clang-10): 1 error
    aspeed_g5_defconfig (clang-13): 10 warnings
    aspeed_g5_defconfig (clang-10): 2 errors
    multi_v7_defconfig (clang-10): 5 errors, 16 warnings
    multi_v7_defconfig (clang-13): 10 warnings
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-13): 10 errors

mips:
    32r2el_defconfig (gcc-10): 3 warnings
    32r2el_defconfig+kselftest (gcc-10): 4 warnings
    ar7_defconfig (gcc-10): 2 warnings
    ath25_defconfig (gcc-10): 2 warnings
    ath79_defconfig (gcc-10): 2 warnings
    bcm47xx_defconfig (gcc-10): 2 warnings
    bcm63xx_defconfig (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 1 error, 6 warnings
    bmips_be_defconfig (gcc-10): 1 warning
    bmips_stb_defconfig (gcc-10): 2 warnings
    capcella_defconfig (gcc-10): 2 warnings
    cavium_octeon_defconfig (gcc-10): 1 error, 6 warnings
    ci20_defconfig (gcc-10): 3 warnings
    cobalt_defconfig (gcc-10): 2 warnings
    cu1000-neo_defconfig (gcc-10): 2 warnings
    cu1830-neo_defconfig (gcc-10): 2 warnings
    db1xxx_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 1 error, 6 warnings
    decstation_defconfig (gcc-10): 2 warnings
    decstation_r4k_defconfig (gcc-10): 2 warnings
    e55_defconfig (gcc-10): 2 warnings
    fuloong2e_defconfig (gcc-10): 1 error, 6 warnings
    gcw0_defconfig (gcc-10): 2 warnings
    gpr_defconfig (gcc-10): 2 warnings
    ip22_defconfig (gcc-10): 2 warnings
    ip32_defconfig (gcc-10): 1 error, 6 warnings
    jazz_defconfig (gcc-10): 2 warnings
    jmr3927_defconfig (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 1 error, 6 warnings
    loongson1b_defconfig (gcc-10): 2 warnings
    loongson1c_defconfig (gcc-10): 2 warnings
    loongson2k_defconfig (gcc-10): 1 error, 6 warnings
    loongson3_defconfig (gcc-10): 1 error, 6 warnings
    malta_defconfig (gcc-10): 2 warnings
    malta_kvm_defconfig (gcc-10): 2 warnings
    malta_qemu_32r6_defconfig (gcc-10): 2 warnings
    maltaaprp_defconfig (gcc-10): 2 warnings
    maltasmvp_defconfig (gcc-10): 2 warnings
    maltasmvp_eva_defconfig (gcc-10): 2 warnings
    maltaup_defconfig (gcc-10): 2 warnings
    maltaup_xpa_defconfig (gcc-10): 2 warnings
    mpc30x_defconfig (gcc-10): 2 warnings
    mtx1_defconfig (gcc-10): 2 warnings
    omega2p_defconfig (gcc-10): 1 warning
    pic32mzda_defconfig (gcc-10): 2 warnings
    qi_lb60_defconfig (gcc-10): 2 warnings
    rb532_defconfig (gcc-10): 2 warnings
    rbtx49xx_defconfig (gcc-10): 2 warnings
    rm200_defconfig (gcc-10): 3 warnings
    rs90_defconfig (gcc-10): 1 warning
    rt305x_defconfig (gcc-10): 2 warnings
    sb1250_swarm_defconfig (gcc-10): 1 error, 4 warnings
    tb0219_defconfig (gcc-10): 2 warnings
    tb0226_defconfig (gcc-10): 2 warnings
    tb0287_defconfig (gcc-10): 2 warnings
    vocore2_defconfig (gcc-10): 1 warning
    workpad_defconfig (gcc-10): 2 warnings
    xway_defconfig (gcc-10): 2 errors, 4 warnings

riscv:

x86_64:
    allmodconfig (clang-10): 1 error, 2 warnings
    allmodconfig (clang-13): 2 errors, 16 warnings
    allnoconfig (clang-10): 3 warnings
    x86_64_defconfig (clang-10): 1 error

Errors summary:

    9    expr: syntax error: unexpected argument =E2=80=980xffffffff8000000=
0=E2=80=99
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocatio=
n name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocatio=
n name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocat=
ion name
    3    arch/arm/kernel/entry-armv.S:503:4: error: invalid instruction, an=
y one of the following would fix this:
    3    arch/arm/kernel/entry-armv.S:499:4: error: invalid instruction, an=
y one of the following would fix this:
    2    <instantiation>:2:2: error: unknown use of instruction mnemonic wi=
thout a size suffix
    1    drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.c:79:=
16: error: implicit declaration of function 'readq' [-Werror,-Wimplicit-fun=
ction-declaration]
    1    drivers/platform/x86/intel/ishtp_eclite.c:685:4: error: initialize=
r element is not a compile-time constant
    1    drivers/platform/chrome/cros_ec_ishtp.c:778:4: error: initializer =
element is not a compile-time constant
    1    drivers/net/ethernet/lantiq_etop.c:673:8: error: implicit declarat=
ion of function =E2=80=98device_property_read_u32=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]
    1    drivers/net/ethernet/lantiq_etop.c:265:55: error: =E2=80=98rx_burs=
t_len=E2=80=99 undeclared (first use in this function)
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vb=
a_31.c:3952:6: error: stack frame size (2092) exceeds limit (2048) in funct=
ion 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: error: stack frame size (1148) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:829:13: error: stack frame size (1116) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3518:6: error: stack frame size (1276) exceeds limit (1024) in funct=
ion 'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: error: stack frame size (1196) exceeds limit (1024) in func=
tion 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanc=
eCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in fun=
ction 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larg=
er-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: error: stack frame size (1276) exceeds limit (1024) in fu=
nction 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAnd=
PerformanceCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: error: stack frame size (1612) exceeds limit (1024) in funct=
ion 'dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: error: stack frame size (1356) exceeds limit (1024) in func=
tion 'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerf=
ormanceCalculation' [-Werror,-Wframe-larger-than]
    1    clang: error: unsupported argument '-mimplicit-it=3Dalways' to opt=
ion 'Wa,'
    1    arch/arm/mm/proc-v7.S:169:164: error: ALT_UP() content must assemb=
le to exactly 4 bytes
    1    arch/arm/mm/proc-v7.S:169:147: error: expected absolute expression
    1    arch/arm/mm/proc-v7.S:169:111: error: expected absolute expression
    1    arch/arm/mm/cache-v7.S:97:2: error: instruction requires: data-bar=
riers
    1    arch/arm/mm/cache-v7.S:69:2: error: instruction requires: data-bar=
riers
    1    arch/arm/mm/cache-v7.S:68:4: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:56:4: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:45:2: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:431:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:42:2: error: instruction requires: data-bar=
riers
    1    arch/arm/mm/cache-v7.S:423:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:409:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:401:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:387:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:372:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:352:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:344:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:321:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:312:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:311:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:294:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:286:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:179:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:178:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:172:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:152:2: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:149:2: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:142:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:125:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:107:2: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:106:2: error: instruction requires: armv6t2
    1    arch/arm/mach-mvebu/coherency_ll.S:155:2: error: instruction requi=
res: data-barriers
    1    arch/arm/mach-mvebu/coherency_ll.S:128:2: error: instruction requi=
res: data-barriers
    1    arch/arm/mach-imx/suspend-imx6.S:315:2: error: instruction require=
s: data-barriers
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'

Warnings summary:

    143  <stdin>:1559:2: warning: #warning syscall futex_waitv not implemen=
ted [-Wcpp]
    18   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    14   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    13   clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv7-a' [-Wunused-command-line-argument]
    2    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't f=
ind starting instruction
    2    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't f=
ind starting instruction
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    1    warning: argument unused during compilation: '-march=3Darmv6k' [-W=
unused-command-line-argument]
    1    vmlinux.o: warning: objtool: xen_set_debugreg()+0x0: call to HYPER=
VISOR_set_debugreg() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: xen_get_debugreg()+0x0: call to HYPER=
VISOR_get_debugreg() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: vc_switch_off_ist()+0xdc: call to mem=
cpy() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() le=
aves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_setup()+0xa2: call to cpuid_eax()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_st=
ack_page() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_en=
try_stack() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset(=
) leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_machine_check()+0xdd: call to mce_=
gather_info() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to m=
emset() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to=
 ghcb_set_sw_exit_code() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to =
memset() leaves .noinstr.text section
    1    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete=
()+0x1095: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176
    1    drivers/net/ethernet/lantiq_etop.c:284:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98wa=
rn_unused_result=E2=80=99 [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:276:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98wa=
rn_unused_result=E2=80=99 [-Wunused-result]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    clangclang: warning: : argument unused during compilation: '-march=
=3Darmv6k' [-Wunused-command-line-argument]
    1    clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv6k' [-Wunused-command-line-argument]
    1    clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv6' [-Wunused-command-line-argument]
    1    cc1: some warnings being treated as errors
    1    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): =
can't find starting instruction
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_m=
ap' defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_=
map' defined but not used [-Wunused-const-variable=3D]
    1    : warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x71393): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149e97): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149e4f): Section mismatch in r=
eference from the function __first_node() to the variable .init.data:numa_n=
odes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149e14): Section mismatch in r=
eference from the function early_get_smp_config() to the variable .init.dat=
a:x86_init
    1    WARNING: modpost: vmlinux.o(.text+0x149e08): Section mismatch in r=
eference from the function early_get_smp_config() to the variable .init.dat=
a:x86_init
    1    WARNING: modpost: vmlinux.o(.text+0x149dc8): Section mismatch in r=
eference from the function __nodes_weight() to the variable .init.data:numa=
_nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149d62): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149d4e): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 4 warni=
ngs, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 33 errors, 14 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/kernel/entry-armv.S:499:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/kernel/entry-armv.S:503:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/mm/cache-v7.S:42:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:45:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:56:4: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:68:4: error: invalid instruction
    arch/arm/mm/cache-v7.S:69:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:97:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:106:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:107:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:125:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:142:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:149:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:152:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:172:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:178:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:179:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:286:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:294:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:311:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:312:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:321:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:344:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:352:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:372:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:387:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:401:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:409:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:423:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:431:2: error: invalid instruction
    arch/arm/mach-mvebu/coherency_ll.S:128:2: error: instruction requires: =
data-barriers
    arch/arm/mach-mvebu/coherency_ll.S:155:2: error: instruction requires: =
data-barriers
    arch/arm/mach-imx/suspend-imx6.S:315:2: error: instruction requires: da=
ta-barriers

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv6=
k' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clangclang: warning: : argument unused during compilation: '-march=3Dar=
mv6k' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv6=
' [-Wunused-command-line-argument]
    warning: argument unused during compilation: '-march=3Darmv6k' [-Wunuse=
d-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    : warning: argument unused during compilation: '-march=3Darmv6k' [-Wunu=
sed-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 129 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocation n=
ame

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 FAIL, 1 error, 2 warnings, 0 sect=
ion mismatches

Errors:
    <instantiation>:2:2: error: unknown use of instruction mnemonic without=
 a size suffix

Warnings:
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 16 warnings, 0 se=
ction mismatches

Errors:
    drivers/platform/chrome/cros_ec_ishtp.c:778:4: error: initializer eleme=
nt is not a compile-time constant
    drivers/platform/x86/intel/ishtp_eclite.c:685:4: error: initializer ele=
ment is not a compile-time constant

Warnings:
    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset() lea=
ves .noinstr.text section
    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to memset=
() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to memse=
t() leaves .noinstr.text section
    vmlinux.o: warning: objtool: xen_get_debugreg()+0x0: call to HYPERVISOR=
_get_debugreg() leaves .noinstr.text section
    vmlinux.o: warning: objtool: xen_set_debugreg()+0x0: call to HYPERVISOR=
_set_debugreg() leaves .noinstr.text section
    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves =
.noinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist()+0xdc: call to memcpy()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_stack_p=
age() leaves .noinstr.text section
    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_s=
tack() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_setup()+0xa2: call to cpuid_eax() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: do_machine_check()+0xdd: call to mce_gathe=
r_info() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to ghcb=
_set_sw_exit_code() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy() le=
aves .noinstr.text section
    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete()+0x=
1095: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x149d4e): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x149d62): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x149dc8): Section mismatch in refere=
nce from the function __nodes_weight() to the variable .init.data:numa_node=
s_parsed
    WARNING: modpost: vmlinux.o(.text+0x149e08): Section mismatch in refere=
nce from the function early_get_smp_config() to the variable .init.data:x86=
_init
    WARNING: modpost: vmlinux.o(.text+0x149e14): Section mismatch in refere=
nce from the function early_get_smp_config() to the variable .init.data:x86=
_init
    WARNING: modpost: vmlinux.o(.text+0x149e4f): Section mismatch in refere=
nce from the function __first_node() to the variable .init.data:numa_nodes_=
parsed
    WARNING: modpost: vmlinux.o(.text+0x149e97): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 10 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.c:79:16: e=
rror: implicit declaration of function 'readq' [-Werror,-Wimplicit-function=
-declaration]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1116) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: error: stack frame size (1148) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1196) exceeds limit (1024) in function =
'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalc=
ulation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1356) exceeds limit (1024) in function =
'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3518:6: error: stack frame size (1276) exceeds limit (1024) in function '=
dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1276) exceeds limit (1024) in functio=
n 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerfo=
rmanceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1612) exceeds limit (1024) in function '=
dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in function=
 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-th=
an]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.=
c:3952:6: error: stack frame size (2092) exceeds limit (2048) in function '=
dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    clang: error: unsupported argument '-mimplicit-it=3Dalways' to option '=
Wa,'

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): can't=
 find starting instruction
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

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
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0=
 section mismatches

Errors:
    arch/arm/kernel/entry-armv.S:499:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/kernel/entry-armv.S:503:4: error: invalid instruction, any one=
 of the following would fix this:

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 sect=
ion mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings,=
 0 section mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 6 warnings,=
 0 section mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 FAIL, 129 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocation n=
ame

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
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 FAIL, 129 =
errors, 0 warnings, 0 section mismatches

Errors:
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocation n=
ame

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-13) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-13) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 s=
ection mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 3 w=
arnings, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_map' =
defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_map' d=
efined but not used [-Wunused-const-variable=3D]

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
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 sectio=
n mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 se=
ction mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 =
section mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 s=
ection mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 FAIL, 5 errors, 16 warnings, 0=
 section mismatches

Errors:
    arch/arm/kernel/entry-armv.S:499:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/kernel/entry-armv.S:503:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/mm/proc-v7.S:169:111: error: expected absolute expression
    arch/arm/mm/proc-v7.S:169:147: error: expected absolute expression
    arch/arm/mm/proc-v7.S:169:164: error: ALT_UP() content must assemble to=
 exactly 4 bytes

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
 section mismatches

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
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: undefine=
d reference to `drm_panel_dp_aux_backlight'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

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
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 4 warnings, =
0 section mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    <instantiation>:2:2: error: unknown use of instruction mnemonic without=
 a size suffix

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x71393): Section mismatch in referen=
ce from the function __nodes_weight() to the variable .init.data:numa_nodes=
_parsed

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

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
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 4 warnings, 0 secti=
on mismatches

Errors:
    drivers/net/ethernet/lantiq_etop.c:265:55: error: =E2=80=98rx_burst_len=
=E2=80=99 undeclared (first use in this function)
    drivers/net/ethernet/lantiq_etop.c:673:8: error: implicit declaration o=
f function =E2=80=98device_property_read_u32=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    drivers/net/ethernet/lantiq_etop.c:276:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98warn_un=
used_result=E2=80=99 [-Wunused-result]
    drivers/net/ethernet/lantiq_etop.c:284:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98warn_un=
used_result=E2=80=99 [-Wunused-result]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
