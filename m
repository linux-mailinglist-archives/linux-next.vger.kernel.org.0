Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE69A45D4DB
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 07:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhKYGi6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 01:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbhKYGg6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 01:36:58 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3CFC061574
        for <linux-next@vger.kernel.org>; Wed, 24 Nov 2021 22:33:47 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id u80so4952565pfc.9
        for <linux-next@vger.kernel.org>; Wed, 24 Nov 2021 22:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EmrFWE+B6KDLCJ6f2tqK8VreiAsjNfvlSA+fbMZm/W0=;
        b=QKZBa2ik0RWp2Tzs7aacCCd1W4sdzHTEVxscMPWCxTtDAIcb1d1JQJwiOa9GyvcA79
         OV1X6wqd+WhC9LliTp4/YVNvFHr/EPhA/q7bWZPt6BZCztHP/3O2kxxOqj5Q4iEHyHTX
         cL+NiSsIfrVrIU5vcinK/K4kNpM9+o0lqddaJ9M88skAZCrNMCkCatS/0OdnN3kbyJBS
         eP/VXmocEqHT++6d72FKEWitKS+I03ZKuyIGTnPXyQRsfI47lHWNPzXMvlKInM6cwDtR
         QzV39oqz9tWa4wNmThzVbPi6mh+aXvcbAEljYIEuO0xRv3pY44n7eeD0gnCY3Wm/Dt87
         qXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EmrFWE+B6KDLCJ6f2tqK8VreiAsjNfvlSA+fbMZm/W0=;
        b=vjtMQVycUVBLjjMdCNKnYkv53rcKE6SyLqb5e3OKiJFfkq+oAMHty3NwT9z/SmOetA
         YTW8uCQ+XUxTxwkB4E/yJWXakMfiHEni96iOpvsqzUWWoPXbXJOjFWNpTCVbsvl8mkOy
         eiwIXokATGK+rG8HduS/ZhkjLtUdXqqEBULYVqNOfUDYieSuLfgQg0/pCLaQ0p3dgO6r
         a8CGhO3eX4GUXV6uFS+wNBJHVKLLQAVMq8UzQvUvKUVu/uR8CBUiJ/kXvFqOVGINTgws
         8fI7eCuiGoPECF39KO3rf8s/pwogxwdL94sU8AhoOIh3WDjMvoxGG7qg7d9StlTOFqLN
         PScA==
X-Gm-Message-State: AOAM530WlypB57vDiMfNwcKIKJGqiElBdIlcKgv6ZnF++DqYddQssWda
        BPhcFJkrwsL+yGHyBuY4DBH7egHhXk7K8mZCYas=
X-Google-Smtp-Source: ABdhPJyHEdPSOsMeJylMJ2HUCRZ0bD/23PqKBTZ3TWnUVz752UMvlq+EWqM5AqHHP8q8z0aqaDrmKg==
X-Received: by 2002:a63:230a:: with SMTP id j10mr14452668pgj.472.1637822024464;
        Wed, 24 Nov 2021 22:33:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n16sm1566079pja.46.2021.11.24.22.33.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 22:33:44 -0800 (PST)
Message-ID: <619f2e48.1c69fb81.c6aff.5038@mx.google.com>
Date:   Wed, 24 Nov 2021 22:33:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211125
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 209 builds: 25 failed, 184 passed, 347 errors,
 88 warnings (next-20211125)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 209 builds: 25 failed, 184 passed, 347 errors, 88 warnin=
gs (next-20211125)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211125/

Tree: next
Branch: master
Git Describe: next-20211125
Git Commit: f81e94e91878bded599cc60f2881cfd50991aeb9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    defconfig: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL

arm:
    allmodconfig: (clang-10) FAIL
    allnoconfig: (clang-10) FAIL
    aspeed_g5_defconfig: (clang-10) FAIL
    multi_v7_defconfig: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL
    multi_v7_defconfig+debug: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL

mips:
    bigsur_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    jazz_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-10) FAIL
    x86_64_defconfig: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+debug (gcc-10): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-10): 3 warnings

arm64:
    allmodconfig (clang-10): 129 errors
    allmodconfig (clang-13): 2 errors, 1 warning
    defconfig (clang-10): 129 errors

arm:
    allmodconfig (clang-10): 33 errors, 16 warnings
    allmodconfig (clang-13): 1 error, 13 warnings
    allmodconfig (gcc-10): 1 error
    allnoconfig (clang-10): 1 error
    aspeed_g5_defconfig (clang-10): 23 errors, 8 warnings
    aspeed_g5_defconfig (clang-13): 10 warnings
    at91_dt_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-10): 5 errors, 8 warnings
    multi_v7_defconfig (clang-13): 10 warnings
    multi_v7_defconfig+debug (gcc-10): 1 error
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-13): 1 error, 1 warning
    allmodconfig (clang-10): 1 error, 1 warning

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 1 error
    cavium_octeon_defconfig (gcc-10): 1 error
    ci20_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 1 error
    decstation_r4k_defconfig (gcc-10): 1 error
    ip32_defconfig (gcc-10): 1 error
    jazz_defconfig (gcc-10): 2 errors
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    sb1250_swarm_defconfig (gcc-10): 1 error

riscv:

x86_64:
    allmodconfig (clang-10): 2 errors, 3 warnings
    allmodconfig (clang-13): 1 error, 1 warning
    allmodconfig (gcc-10): 2 errors
    allnoconfig (clang-10): 3 warnings
    x86_64_defconfig (clang-13): 3 warnings
    x86_64_defconfig (clang-10): 1 error

Errors summary:

    5    expr: syntax error: unexpected argument =E2=80=980xffffffff8000000=
0=E2=80=99
    4    drivers/iommu/intel/iommu.c:1344:7: error: variable 'level_pfn' is=
 used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-un=
initialized]
    3    arch/arm/kernel/entry-armv.S:503:4: error: invalid instruction, an=
y one of the following would fix this:
    3    arch/arm/kernel/entry-armv.S:499:4: error: invalid instruction, an=
y one of the following would fix this:
    2    mm/kasan/shadow.c:528:19: error: =E2=80=98VM_DELAY_KMEMLEAK=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98VM_DEFER=
_KMEMLEAK=E2=80=99?
    2    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignm=
ent of read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of =
read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocatio=
n name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocatio=
n name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocat=
ion name
    2    arch/arm/mm/cache-v7.S:97:2: error: instruction requires: data-bar=
riers
    2    arch/arm/mm/cache-v7.S:69:2: error: instruction requires: data-bar=
riers
    2    arch/arm/mm/cache-v7.S:68:4: error: invalid instruction
    2    arch/arm/mm/cache-v7.S:56:4: error: instruction requires: armv6t2
    2    arch/arm/mm/cache-v7.S:45:2: error: instruction requires: armv6t2
    2    arch/arm/mm/cache-v7.S:431:2: error: invalid instruction
    2    arch/arm/mm/cache-v7.S:42:2: error: instruction requires: data-bar=
riers
    2    arch/arm/mm/cache-v7.S:409:2: error: invalid instruction
    2    arch/arm/mm/cache-v7.S:387:2: error: invalid instruction
    2    arch/arm/mm/cache-v7.S:352:2: error: invalid instruction
    2    arch/arm/mm/cache-v7.S:312:2: error: instruction requires: data-ba=
rriers
    2    arch/arm/mm/cache-v7.S:311:2: error: invalid instruction
    2    arch/arm/mm/cache-v7.S:294:2: error: invalid instruction
    2    arch/arm/mm/cache-v7.S:179:2: error: instruction requires: data-ba=
rriers
    2    arch/arm/mm/cache-v7.S:178:2: error: invalid instruction
    2    arch/arm/mm/cache-v7.S:152:2: error: instruction requires: armv6t2
    2    arch/arm/mm/cache-v7.S:149:2: error: instruction requires: armv6t2
    2    arch/arm/mm/cache-v7.S:142:2: error: instruction requires: data-ba=
rriers
    2    arch/arm/mm/cache-v7.S:125:2: error: instruction requires: data-ba=
rriers
    2    arch/arm/mm/cache-v7.S:107:2: error: instruction requires: armv6t2
    2    arch/arm/mm/cache-v7.S:106:2: error: instruction requires: armv6t2
    2    <instantiation>:2:2: error: unknown use of instruction mnemonic wi=
thout a size suffix
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    mm/kasan/shadow.c:528:19: error: use of undeclared identifier 'VM_=
DELAY_KMEMLEAK'
    1    drivers/net/ethernet/natsemi/jazzsonic.c:147:24: error: assignment=
 of read-only location =E2=80=98*(dev->dev_addr + ((sizetype)(i * 2) + 1))=
=E2=80=99
    1    drivers/net/ethernet/natsemi/jazzsonic.c:146:22: error: assignment=
 of read-only location =E2=80=98*(dev->dev_addr + (sizetype)(i * 2))=E2=80=
=99
    1    drivers/net/dsa/qca8k.c:2256:3: error: variable 'hash' is uninitia=
lized when used here [-Werror,-Wuninitialized]
    1    drivers/net/dsa/qca8k.c:2235:44: error: overlapping comparisons al=
ways evaluate to true [-Werror,-Wtautological-overlap-compare]
    1    clang: error: unsupported argument '-mimplicit-it=3Dalways' to opt=
ion 'Wa,'
    1    arch/arm/mm/proc-v7.S:169:164: error: ALT_UP() content must assemb=
le to exactly 4 bytes
    1    arch/arm/mm/proc-v7.S:169:147: error: expected absolute expression
    1    arch/arm/mm/proc-v7.S:169:111: error: expected absolute expression
    1    arch/arm/mm/cache-v7.S:423:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:401:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:372:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:344:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:321:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:286:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:172:2: error: instruction requires: data-ba=
rriers
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

    33   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    14   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    12   clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv7-a' [-Wunused-command-line-argument]
    5    drivers/iommu/intel/iommu.c:1342:26: note: initialize the variable=
 'level_pfn' to silence this warning
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    2    clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv6k' [-Wunused-command-line-argument]
    2    clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv6' [-Wunused-command-line-argument]
    2    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't f=
ind starting instruction
    2    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't f=
ind starting instruction
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    1    drivers/net/dsa/qca8k.c:2250:10: note: initialize the variable 'ha=
sh' to silence this warning
    1    drivers/iommu/intel/iommu.c:1344:7: warning: variable 'level_pfn' =
is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitia=
lized]
    1    clangclang: warning: argument unused during compilation: '-march=
=3Darmv6k' [-Wunused-command-line-argument]
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
    1    1 warning generated.

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x712b3): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed

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
allmodconfig (x86_64, clang-10) =E2=80=94 FAIL, 2 errors, 3 warnings, 0 sec=
tion mismatches

Errors:
    <instantiation>:2:2: error: unknown use of instruction mnemonic without=
 a size suffix
    drivers/iommu/intel/iommu.c:1344:7: error: variable 'level_pfn' is used=
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uniniti=
alized]

Warnings:
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction
    drivers/iommu/intel/iommu.c:1342:26: note: initialize the variable 'lev=
el_pfn' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    drivers/iommu/intel/iommu.c:1344:7: error: variable 'level_pfn' is used=
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uniniti=
alized]

Warnings:
    drivers/iommu/intel/iommu.c:1342:26: note: initialize the variable 'lev=
el_pfn' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 33 errors, 16 warnings, 0 sect=
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
    clangclang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv6=
' [-Wunused-command-line-argument]
    : warning: argument unused during compilation: '-march=3Darmv6k' [-Wunu=
sed-command-line-argument]
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
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/net/dsa/qca8k.c:2235:44: error: overlapping comparisons always =
evaluate to true [-Werror,-Wtautological-overlap-compare]
    drivers/net/dsa/qca8k.c:2256:3: error: variable 'hash' is uninitialized=
 when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/net/dsa/qca8k.c:2250:10: note: initialize the variable 'hash' t=
o silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-13) =E2=80=94 FAIL, 1 error, 13 warnings, 0 sectio=
n mismatches

Errors:
    mm/kasan/shadow.c:528:19: error: use of undeclared identifier 'VM_DELAY=
_KMEMLEAK'

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
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    drivers/iommu/intel/iommu.c:1344:7: error: variable 'level_pfn' is used=
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uniniti=
alized]

Warnings:
    drivers/iommu/intel/iommu.c:1342:26: note: initialize the variable 'lev=
el_pfn' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/iommu/intel/iommu.c:1344:7: error: variable 'level_pfn' is used=
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uniniti=
alized]

Warnings:
    drivers/iommu/intel/iommu.c:1342:26: note: initialize the variable 'lev=
el_pfn' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    mm/kasan/shadow.c:528:19: error: =E2=80=98VM_DELAY_KMEMLEAK=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98VM_DEFER_KMEML=
EAK=E2=80=99?

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
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
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    clang: error: unsupported argument '-mimplicit-it=3Dalways' to option '=
Wa,'

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 23 errors, 8 warnings, =
0 section mismatches

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
    arch/arm/mm/cache-v7.S:178:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:179:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:294:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:311:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:312:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:352:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:387:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:409:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:431:2: error: invalid instruction

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv6=
k' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv6=
' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

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
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

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
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignment o=
f read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"

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
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings=
, 0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

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
defconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

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
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

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
i386_defconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/net/ethernet/natsemi/jazzsonic.c:146:22: error: assignment of r=
ead-only location =E2=80=98*(dev->dev_addr + (sizetype)(i * 2))=E2=80=99
    drivers/net/ethernet/natsemi/jazzsonic.c:147:24: error: assignment of r=
ead-only location =E2=80=98*(dev->dev_addr + ((sizetype)(i * 2) + 1))=E2=80=
=99

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

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
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    expr: syntax error: unexpected argument =E2=80=980xffffffff80000000=E2=
=80=99

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
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
multi_v5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 FAIL, 5 errors, 8 warnings, 0 =
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
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    mm/kasan/shadow.c:528:19: error: =E2=80=98VM_DELAY_KMEMLEAK=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98VM_DEFER_KMEML=
EAK=E2=80=99?

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
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, =
0 section mismatches

Errors:
    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignment o=
f read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

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
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    drivers/iommu/intel/iommu.c:1344:7: warning: variable 'level_pfn' is us=
ed uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/iommu/intel/iommu.c:1342:26: note: initialize the variable 'lev=
el_pfn' to silence this warning
    1 warning generated.

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x712b3): Section mismatch in referen=
ce from the function __nodes_weight() to the variable .init.data:numa_nodes=
_parsed

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    <instantiation>:2:2: error: unknown use of instruction mnemonic without=
 a size suffix

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
