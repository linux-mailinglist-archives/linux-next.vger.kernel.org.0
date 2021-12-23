Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE1F47E1EE
	for <lists+linux-next@lfdr.de>; Thu, 23 Dec 2021 12:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239583AbhLWLE5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Dec 2021 06:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbhLWLE5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Dec 2021 06:04:57 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2000C061401
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 03:04:56 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id t19so4958143pfg.9
        for <linux-next@vger.kernel.org>; Thu, 23 Dec 2021 03:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=r58qZBUdWi3DuQksnLAcSbXclbzPdWwQy5XFEvnV/Fc=;
        b=lNYin0MPHah8vWqq8vQAHAg7tGurHq8uqR/q7hFTBYzyDBpktc3EV7D8HPYW7WhxuY
         RTkoBRF5lqh49W7wS+VB7IW+m+h9j9QSoKZW24NezM63q0ilInkvGefpYH0hOCoeXZhr
         3gkrlZ7EYN/goDoJK1FpG9R3q58XzFFKOT4TP32/4M9y2A60TK315FtOO1LWN86x4TPN
         iZpk53Kcs9HnFmGfhSSB90bqRZE+9b/AY+L/zvkRxWT71khufyyJmyFVq+K0WFAUnkEm
         bjL6XSw3h9JWK0zRPPdfIv7iqEJXGVxKV+65x0tsxmWSxdLFIzDEnxYdYI2J1Y6yuqn4
         cNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=r58qZBUdWi3DuQksnLAcSbXclbzPdWwQy5XFEvnV/Fc=;
        b=59F3uiwbUi19mnVVlPYdXyqc/8xGo+A9l2GBkuZctEFfZE3VtjLI5b4S+UbVKkWsSv
         AzSaeifVj7vWmK69cYI6gPT/do0gB8ej/wsDptrKav0AWnRbLcpl2cQXmLk3vHR8AsKA
         8dmbHT5BC1Z5E6J/bWeaMid3WAy4vWDXFAh1Ov1YfFlaBBgxl+1166EHhXVyl9PJ3Wp7
         wCZBoTQ1rvqSRo6dvhV3qGxFE3AOsQkePHblnh3ZxF+nZlzkjx7gRqoDcq5LdBu1n6J+
         DGY2Peb7yZ2Q/64OvMd188rNrOnbcduiKsU6wDZBcSYCYgBoGXUhFcSh3aiY9Kr+cV7+
         vo0A==
X-Gm-Message-State: AOAM533gT34HRvCF/QfP/BFOWmmiVNnd7WoxWhD4WXihbfj3NO9w+//d
        1MPT0PG8wDORqvw2XY1mxGK127A9nwaReGkR4so=
X-Google-Smtp-Source: ABdhPJx6vK4EGAzGRI7OUpHsU+GhIO/zl9jNTpZaarzHPulDhkkZ81iyV6vyx7dOEwUX0SqWRJJOxg==
X-Received: by 2002:a05:6a00:14d3:b0:4ba:8ccb:73f1 with SMTP id w19-20020a056a0014d300b004ba8ccb73f1mr1929627pfu.65.1640257494860;
        Thu, 23 Dec 2021 03:04:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j20sm7065509pjl.3.2021.12.23.03.04.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 03:04:54 -0800 (PST)
Message-ID: <61c457d6.1c69fb81.9d49a.20af@mx.google.com>
Date:   Thu, 23 Dec 2021 03:04:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211223
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 203 builds: 17 failed, 186 passed, 246 errors,
 67 warnings (next-20211223)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 203 builds: 17 failed, 186 passed, 246 errors, 67 warnin=
gs (next-20211223)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211223/

Tree: next
Branch: master
Git Describe: next-20211223
Git Commit: 79f063d60c8cfc0c215d342cb7778e2ad402c2d5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-13) FAIL
    multi_v5_defconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL
    multi_v7_defconfig+CONFIG_SMP=3Dn: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-13) FAIL

mips:
    bigsur_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+debug (gcc-10): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-10): 3 warnings
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (gcc-10): 1 error, 1 warning
    allmodconfig (clang-13): 1 error

arm:
    allmodconfig (clang-13): 40 errors, 13 warnings
    allmodconfig (gcc-10): 179 errors, 2 warnings
    aspeed_g5_defconfig (clang-13): 10 warnings
    at91_dt_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-13): 2 errors
    multi_v7_defconfig (clang-13): 10 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 errors
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-13): 9 errors

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 1 error
    ci20_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 1 error
    decstation_defconfig (gcc-10): 1 error
    decstation_r4k_defconfig (gcc-10): 1 error
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error

riscv:

x86_64:
    allmodconfig (gcc-10): 2 errors
    allmodconfig (clang-13): 1 error, 18 warnings
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    25   arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relati=
ve fixup value
    13   arch/arm/include/asm/current.h:39:28: error: out of range pc-relat=
ive fixup value
    3    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of =
read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    2    drivers/hv/vmbus_drv.c:2082:29: error: shift count >=3D width of t=
ype [-Werror,-Wshift-count-overflow]
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    arch/arm/include/asm/current.h:53:6: error: out of range pc-relati=
ve fixup value
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    irq-gic-v3-its.c:(.text+0x14b8): undefined reference to `cpus_boot=
ed_once_mask'
    1    include/asm-generic/div64.h:222:28: error: comparison of distinct =
pointer types lacks a cast [-Werror]
    1    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%=
d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 h=
as type =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment disc=
ards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3D=
discarded-qualifiers]
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'c=
onst char **' from 'const char *const *' discards qualifiers [-Werror,-Winc=
ompatible-pointer-types-discards-qualifiers]
    1    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignm=
ent of read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: error: stack frame size (1180) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3518:6: error: stack frame size (1244) exceeds limit (1024) in funct=
ion 'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: error: stack frame size (1212) exceeds limit (1024) in func=
tion 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanc=
eCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in fun=
ction 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larg=
er-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in fu=
nction 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAnd=
PerformanceCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: error: stack frame size (1548) exceeds limit (1024) in funct=
ion 'dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: error: stack frame size (1356) exceeds limit (1024) in func=
tion 'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerf=
ormanceCalculation' [-Werror,-Wframe-larger-than]
    1    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined=
 reference to `cpus_booted_once_mask'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'
    1    /tmp/ccwhzsAI.s:7962: Error: invalid literal constant: pool needs =
to be closer
    1    /tmp/ccwhzsAI.s:516: Error: invalid literal constant: pool needs t=
o be closer
    1    /tmp/ccwhzsAI.s:45435: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:45376: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:45314: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:45219: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:44699: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:44640: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:44578: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:44481: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:44116: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:44057: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:43997: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:43907: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:43680: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:43621: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:43554: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:43454: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:43008: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:42963: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:42714: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:42655: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:42588: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:42488: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:42043: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:41998: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:41339: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:41280: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:41220: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:41130: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:40867: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:40808: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:40746: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:40652: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:40428: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:40369: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:40302: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:40204: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39999: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39940: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39878: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39784: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39600: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39541: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39474: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39374: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39130: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39071: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:39011: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:38907: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:38669: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:38610: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:38543: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:38445: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:38185: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:38126: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:38059: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37963: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37747: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37688: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37626: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37531: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37333: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37274: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37207: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:37111: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:36933: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:36874: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:36812: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:36716: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:36084: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:36025: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35963: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35868: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35689: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35630: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35563: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35467: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35313: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35254: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35188: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:35091: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34946: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34887: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34821: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34724: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34560: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34501: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34434: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34338: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34137: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34078: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:34016: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33920: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33754: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33695: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33628: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33529: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33377: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33318: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33252: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33155: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:33001: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32942: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32880: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32783: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32654: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32595: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32533: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32438: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32282: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32223: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32160: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:32065: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31927: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31868: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31806: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31711: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31570: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31511: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31451: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31362: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31212: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31153: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31091: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:31002: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30907: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30848: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30788: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30699: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30562: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30503: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30441: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30346: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30207: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30148: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:30086: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29997: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29909: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29850: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29790: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29701: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29549: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29490: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29428: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29333: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29226: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29167: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29107: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:29017: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28717: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28657: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28597: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28505: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28432: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28372: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28312: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28222: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28149: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28089: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:28029: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27944: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27872: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27812: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27752: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27668: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27599: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27540: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27480: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:27396: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:25885: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:17780: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:17719: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:13638: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:13538: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:12248: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccwhzsAI.s:12208: Error: invalid literal constant: pool needs=
 to be closer

Warnings summary:

    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    3    cc1: all warnings being treated as errors
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    3    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    1    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to mem=
cpy() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() le=
aves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_che=
ck_write() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_=
severity_amd_smca() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_=
reg() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_sta=
ck_page() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_en=
try_stack() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset(=
) leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_machine_check()+0x13a: call to mce=
_no_way_out() leaves .noinstr.text section
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
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
a: call to do_strncpy_from_user() with UACCESS enabled
    1    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely=
()+0x734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    1    drivers/scsi/mpi3mr/mpi3mr_fw.o: warning: objtool: mpi3mr_op_reque=
st_post() falls through to next function mpi3mr_process_op_reply_q()
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_m=
ap' defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_=
map' defined but not used [-Wunused-const-variable=3D]

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x70513): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc97): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc22): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc0e): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed

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
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment discards =
=E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Ddisca=
rded-qualifiers]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 9 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/hv/vmbus_drv.c:2082:29: error: shift count >=3D width of type [=
-Werror,-Wshift-count-overflow]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: error: stack frame size (1180) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1356) exceeds limit (1024) in function =
'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in functio=
n 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerfo=
rmanceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1212) exceeds limit (1024) in function =
'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalc=
ulation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1548) exceeds limit (1024) in function '=
dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in function=
 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-th=
an]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3518:6: error: stack frame size (1244) exceeds limit (1024) in function '=
dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]

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
allmodconfig (arm, clang-13) =E2=80=94 FAIL, 40 errors, 13 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

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
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'const =
char **' from 'const char *const *' discards qualifiers [-Werror,-Wincompat=
ible-pointer-types-discards-qualifiers]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 18 warnings, 0 sec=
tion mismatches

Errors:
    drivers/hv/vmbus_drv.c:2082:29: error: shift count >=3D width of type [=
-Werror,-Wshift-count-overflow]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()
    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset() lea=
ves .noinstr.text section
    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to memset=
() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to memse=
t() leaves .noinstr.text section
    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves =
.noinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to memcpy()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_pa=
ge() leaves .noinstr.text section
    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_s=
tack() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_reg()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: do_machine_check()+0x13a: call to mce_no_w=
ay_out() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_check_wr=
ite() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_sever=
ity_amd_smca() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to ghcb=
_set_sw_exit_code() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy() le=
aves .noinstr.text section
    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x=
734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    drivers/scsi/mpi3mr/mpi3mr_fw.o: warning: objtool: mpi3mr_op_request_po=
st() falls through to next function mpi3mr_process_op_reply_q()

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x15dc0e): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15dc22): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15dc97): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 179 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/ccwhzsAI.s:516: Error: invalid literal constant: pool needs to be =
closer
    /tmp/ccwhzsAI.s:7962: Error: invalid literal constant: pool needs to be=
 closer
    /tmp/ccwhzsAI.s:12208: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:12248: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:13538: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:13638: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:17719: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:17780: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:25885: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27396: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27480: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27540: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27599: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27668: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27752: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27812: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27872: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:27944: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28029: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28089: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28149: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28222: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28312: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28372: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28432: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28505: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28597: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28657: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:28717: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29017: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29107: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29167: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29226: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29333: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29428: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29490: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29549: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29701: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29790: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29850: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29909: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:29997: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30086: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30148: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30207: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30346: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30441: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30503: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30562: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30699: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30788: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30848: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:30907: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31002: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31091: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31153: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31212: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31362: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31451: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31511: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31570: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31711: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31806: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31868: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:31927: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32065: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32160: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32223: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32282: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32438: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32533: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32595: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32654: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32783: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32880: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:32942: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33001: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33155: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33252: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33318: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33377: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33529: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33628: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33695: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33754: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:33920: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34016: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34078: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34137: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34338: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34434: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34501: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34560: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34724: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34821: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34887: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:34946: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35091: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35188: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35254: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35313: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35467: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35563: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35630: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35689: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35868: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:35963: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:36025: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:36084: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:36716: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:36812: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:36874: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:36933: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37111: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37207: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37274: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37333: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37531: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37626: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37688: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37747: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:37963: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:38059: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:38126: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:38185: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:38445: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:38543: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:38610: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:38669: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:38907: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39011: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39071: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39130: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39374: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39474: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39541: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39600: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39784: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39878: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39940: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:39999: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:40204: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:40302: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:40369: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:40428: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:40652: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:40746: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:40808: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:40867: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:41130: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:41220: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:41280: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:41339: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:41998: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:42043: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:42488: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:42588: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:42655: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:42714: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:42963: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:43008: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:43454: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:43554: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:43621: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:43680: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:43907: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:43997: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:44057: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:44116: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:44481: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:44578: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:44640: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:44699: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:45219: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:45314: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:45376: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccwhzsAI.s:45435: Error: invalid literal constant: pool needs to b=
e closer
    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]
    include/asm-generic/div64.h:222:28: error: comparison of distinct point=
er types lacks a cast [-Werror]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

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
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
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
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

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
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value

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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0=
 warnings, 0 section mismatches

Errors:
    irq-gic-v3-its.c:(.text+0x14b8): undefined reference to `cpus_booted_on=
ce_mask'
    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined refe=
rence to `cpus_booted_once_mask'

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
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: undefine=
d reference to `drm_panel_dp_aux_backlight'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
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
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

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
x86_64_defconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x70513): Section mismatch in referen=
ce from the function __nodes_weight() to the variable .init.data:numa_nodes=
_parsed

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8a: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to do_s=
trnlen_user() with UACCESS enabled

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
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
