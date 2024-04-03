Return-Path: <linux-next+bounces-1790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A1897A51
	for <lists+linux-next@lfdr.de>; Wed,  3 Apr 2024 23:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E83431C2628F
	for <lists+linux-next@lfdr.de>; Wed,  3 Apr 2024 21:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2914715624A;
	Wed,  3 Apr 2024 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Xmsn6XCB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2E15625F
	for <linux-next@vger.kernel.org>; Wed,  3 Apr 2024 21:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712178134; cv=none; b=klN5yeKsJ3xlGTHoQhDSExlebXDkPKnKL78RlvTYSruSiiQicQVPm99ckGT6Ro+AYAnF8qFwaZ38xVajCNGeHu/ipSvNmAbKdVyAA8eW9FnkHtSFZTJGD0LNuEJrGe4A5iDPY9U3GcjKPvjrlHiNRSmEkM/Jk6sWsC/UgHogeJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712178134; c=relaxed/simple;
	bh=jtTKpR7IVDtNZS1onv8M2yCY085VIEsBdTxKq2H6e+k=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=dBzjTfjkm725Ty9Ln3ibkJ7BkNfueLKvBDuf5yIRX8Plwk23653pEsXynAQZoys+F4JPFG39PH9N0u4yEefessw/+w/LajXI4TD6gHcmxPoUC3lrAz62N+CDvA4QdtMY53yqQlEnRCi4P4Fs34XeZleoTHOIqBECM47JyB+SrO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Xmsn6XCB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e27fadbbe1so2255335ad.1
        for <linux-next@vger.kernel.org>; Wed, 03 Apr 2024 14:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712178113; x=1712782913; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xDWXSc7NGO20mO6HMV5MuVxbwwdEOzt9y+P2KlwTARE=;
        b=Xmsn6XCB9ajG6rZJasyUbbHHlVHZfPqL0sslbvuV3EkCra1NJqk78QrxbSwacbHf7C
         /VypbIS80MAAANg4Lbiq3pmymGxsiugd3mZLc26i7HmYvlw8Qe4eZ7lnzyz0Q/+vrRvH
         7q/9spxZrv8uqUI5r8UZSLMFBhB1RuDIFNS6X6zsNQaNQ09D01WHWS61wRGo9tXLZ1VX
         ru6DMNtMWmf9AtBZ98o05LFIxyTgIjtw+9JJ36auEhn0KKPw9eG8oGoS5j49EerybVfY
         POMNROcapUXM/+SLsXfHrQFphg4AHZngwC0SRVINSXhVupreHWJ/7TFchHTv9WPYW/o+
         NVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712178113; x=1712782913;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDWXSc7NGO20mO6HMV5MuVxbwwdEOzt9y+P2KlwTARE=;
        b=FoFPR6E2x1b8J6PA824qjtbyAli0Ajj9e6n4PX2dSCkpjzcOksdLipWMF2r7LvZDca
         Vavd9oUTcOhT5/Vn5azl8uUg3Eva31JO3Ms2tP7lLpD12IpVnqQE2mpUfaKhYRoH/z87
         7s8f8VSsezitX979iygbzX0UBiwUA9gUqFxp7wrQqN8n2Hfi431lCgvjdPoiLqtU3YG7
         +g7Ylx8xdmXPinOuIGUN6jShGAgUhYxtJBiAEWJaqKVS6FXzZv7/hxhHEi4QHdpKb0DG
         IA/ycmA9CEir6EuFMpXkpLS5Iv4y6khnNAPYWX9pIEO4hQj3tWI1ojH4oUmFPvOx0PH7
         Rnog==
X-Gm-Message-State: AOJu0YxSsfXuAoomCJo23OXqXhEjSDiIUiMXdF72KgZJNDFPSTy6xOrE
	AMKl1x0u/KBDCg2rqb4DrBrHwmKoIKZUBqIK04oamO+MefCCFNXWFkCQu1qg8qfSXEp1hjXLPA9
	AQCE=
X-Google-Smtp-Source: AGHT+IGleYDjU5RL6DZHwbey9Ciock0Iih0wdmuJqCXXnzvVDVTX7iQ/PtrZZM4i6hlykXZHDFkSVg==
X-Received: by 2002:a17:902:650a:b0:1e2:755d:2b48 with SMTP id b10-20020a170902650a00b001e2755d2b48mr407369plk.62.1712178111619;
        Wed, 03 Apr 2024 14:01:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f7ca00b001e27ab90fe6sm2244618plw.11.2024.04.03.14.01.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 14:01:49 -0700 (PDT)
Message-ID: <660dc3bd.170a0220.43c0e.7c28@mx.google.com>
Date: Wed, 03 Apr 2024 14:01:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20240403
X-Kernelci-Report-Type: build
Subject: next/master build: 178 builds: 33 failed, 145 passed, 83 errors,
 3363 warnings (next-20240403)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 178 builds: 33 failed, 145 passed, 83 errors, 3363 warni=
ngs (next-20240403)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20240403/

Tree: next
Branch: master
Git Describe: next-20240403
Git Commit: 727900b675b749c40ba1f6669c7ae5eb7eb8e837
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    allnoconfig: (gcc-10) FAIL
    axs103_defconfig: (gcc-10) FAIL
    axs103_smp_defconfig: (gcc-10) FAIL
    haps_hs_defconfig: (gcc-10) FAIL
    haps_hs_smp_defconfig: (gcc-10) FAIL
    haps_hs_smp_defconfig+debug: (gcc-10) FAIL
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL
    hsdk_defconfig: (gcc-10) FAIL
    nsimosci_hs_defconfig: (gcc-10) FAIL
    nsimosci_hs_smp_defconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL
    vdk_hs38_defconfig: (gcc-10) FAIL
    vdk_hs38_smp_defconfig: (gcc-10) FAIL

arm:
    aspeed_g4_defconfig: (gcc-10) FAIL
    assabet_defconfig: (gcc-10) FAIL
    collie_defconfig: (gcc-10) FAIL
    footbridge_defconfig: (gcc-10) FAIL
    h3600_defconfig: (gcc-10) FAIL
    hisi_defconfig: (gcc-10) FAIL
    jornada720_defconfig: (gcc-10) FAIL
    neponset_defconfig: (gcc-10) FAIL
    netwinder_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    spear3xx_defconfig: (gcc-10) FAIL
    spear6xx_defconfig: (gcc-10) FAIL
    spitz_defconfig: (gcc-10) FAIL

mips:
    cavium_octeon_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL

riscv:
    allnoconfig: (clang-17) FAIL
    defconfig: (clang-17) FAIL
    nommu_k210_defconfig: (clang-17) FAIL
    nommu_k210_sdcard_defconfig: (clang-17) FAIL
    nommu_virt_defconfig: (clang-17) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-10): 2 errors, 1 warning
    axs103_defconfig (gcc-10): 2 errors, 1 warning
    axs103_smp_defconfig (gcc-10): 2 errors, 1 warning
    haps_hs_defconfig (gcc-10): 2 errors, 1 warning
    haps_hs_smp_defconfig (gcc-10): 2 errors, 1 warning
    haps_hs_smp_defconfig+debug (gcc-10): 2 errors, 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-10): 2 errors, 1 warning
    hsdk_defconfig (gcc-10): 2 errors, 1 warning
    nsimosci_hs_defconfig (gcc-10): 2 errors, 1 warning
    nsimosci_hs_smp_defconfig (gcc-10): 2 errors, 1 warning
    tinyconfig (gcc-10): 2 errors, 1 warning
    vdk_hs38_defconfig (gcc-10): 2 errors, 1 warning
    vdk_hs38_smp_defconfig (gcc-10): 2 errors, 1 warning

arm64:
    defconfig (clang-17): 4 warnings

arm:
    aspeed_g4_defconfig (gcc-10): 4 errors
    assabet_defconfig (gcc-10): 1 error
    collie_defconfig (gcc-10): 1 error, 1 warning
    footbridge_defconfig (gcc-10): 1 error
    h3600_defconfig (gcc-10): 1 error
    hisi_defconfig (gcc-10): 4 errors
    jornada720_defconfig (gcc-10): 1 error
    multi_v7_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-17): 2 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 1 warni=
ng
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 1 warning
    mxs_defconfig (gcc-10): 1 warning
    neponset_defconfig (gcc-10): 1 error
    netwinder_defconfig (gcc-10): 1 error
    qcom_defconfig (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 1 error
    spear3xx_defconfig (gcc-10): 1 error
    spear6xx_defconfig (gcc-10): 1 error
    spitz_defconfig (gcc-10): 1 error

i386:

mips:
    32r2el_defconfig (gcc-10): 3 warnings
    32r2el_defconfig+debug (gcc-10): 3 warnings
    32r2el_defconfig+kselftest (gcc-10): 3 warnings
    ath79_defconfig (gcc-10): 3 warnings
    bigsur_defconfig (gcc-10): 15 warnings
    cavium_octeon_defconfig (gcc-10): 1 error, 8 warnings
    db1xxx_defconfig (gcc-10): 21 warnings
    decstation_64_defconfig (gcc-10): 1 error, 8 warnings
    decstation_defconfig (gcc-10): 9 warnings
    decstation_r4k_defconfig (gcc-10): 9 warnings
    fuloong2e_defconfig (gcc-10): 1 warning
    gpr_defconfig (gcc-10): 1 warning
    ip22_defconfig (gcc-10): 6 warnings
    ip28_defconfig (gcc-10): 8 warnings
    ip32_defconfig (gcc-10): 1 warning
    jazz_defconfig (gcc-10): 5 warnings
    lemote2f_defconfig (gcc-10): 22 warnings
    loongson1b_defconfig (gcc-10): 1 warning
    loongson1c_defconfig (gcc-10): 1 warning
    loongson2k_defconfig (gcc-10): 12 warnings
    loongson3_defconfig (gcc-10): 13 warnings
    maltaaprp_defconfig (gcc-10): 4 warnings
    omega2p_defconfig (gcc-10): 2 warnings
    pic32mzda_defconfig (gcc-10): 1 warning
    rb532_defconfig (gcc-10): 3 warnings
    rm200_defconfig (gcc-10): 8 warnings
    rt305x_defconfig (gcc-10): 2 warnings
    sb1250_swarm_defconfig (gcc-10): 16 warnings
    vocore2_defconfig (gcc-10): 2 warnings

riscv:
    allnoconfig (clang-17): 6 errors
    defconfig (clang-17): 6 errors
    defconfig (gcc-10): 823 warnings
    defconfig+debug (gcc-10): 847 warnings
    defconfig+kselftest (gcc-10): 1000 warnings
    nommu_k210_defconfig (gcc-10): 187 warnings
    nommu_k210_defconfig (clang-17): 6 errors
    nommu_k210_sdcard_defconfig (gcc-10): 210 warnings
    nommu_k210_sdcard_defconfig (clang-17): 12 errors
    nommu_virt_defconfig (clang-17): 6 errors

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 26 warnings
    sparc64_defconfig+debug (gcc-10): 24 warnings
    sparc64_defconfig+kselftest (gcc-10): 24 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:

Errors summary:

    20   kernel/sched/core.c:961:15: error: incompatible pointer to integer=
 conversion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') t=
o parameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    11   include/linux/build_bug.h:78:41: error: static assertion failed: "=
struct bpf_fib_lookup size check"
    11   arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration =
of function 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]
    11   arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration =
of function 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    10   kernel/sched/core.c:961:15: error: incompatible integer to pointer=
 conversion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node =
*') from 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    4    mm/oom_kill.c:766:7: error: incompatible pointer to integer conver=
sion passing 'typeof (*((__ai_ptr)))' (aka 'struct mm_struct *') to paramet=
er of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    2    mm/oom_kill.c:766:7: error: incompatible integer to pointer conver=
sion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct mm_struct *') from =
'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    2    arch/arc/include/asm/cmpxchg.h:80:13: error: implicit declaration =
of function 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]
    2    arch/arc/include/asm/cmpxchg.h:76:13: error: implicit declaration =
of function 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    1    drm_dp_mst_topology.c:(.text+0x8bc0): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x7ba4): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x3380): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x2958): undefined reference to `__dr=
m_atomic_helper_private_obj_duplicate_state'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/display/drm_dp_mst_topolog=
y.c:5094: undefined reference to `__drm_atomic_helper_private_obj_duplicate=
_state'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/display/drm_dp_mst_topolog=
y.c:5080: undefined reference to `drm_kms_helper_hotplug_event'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/display/drm_dp_mst_topolog=
y.c:4039: undefined reference to `drm_kms_helper_hotplug_event'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/display/drm_dp_mst_topolog=
y.c:2692: undefined reference to `drm_kms_helper_hotplug_event'
    1    ./../include/linux/compiler_types.h:460:38: error: call to =E2=80=
=98__compiletime_assert_319=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:460:38: error: call to =E2=80=
=98__compiletime_assert_312=E2=80=99 declared with attribute error: BUILD_B=
UG failed

Warnings summary:

    597  arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    466  arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    279  arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument=
 3 of =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without =
a cast [-Wint-conversion]
    279  arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument=
 2 of =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without =
a cast [-Wint-conversion]
    279  arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument=
 3 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a=
 cast [-Wint-conversion]
    279  arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument=
 2 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a=
 cast [-Wint-conversion]
    92   arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    52   arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    46   arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    29   arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    29   arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    18   arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    18   arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    16   arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument=
 3 of =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without =
a cast [-Wint-conversion]
    16   arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument=
 2 of =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without =
a cast [-Wint-conversion]
    16   arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument=
 3 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a=
 cast [-Wint-conversion]
    16   arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument=
 2 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a=
 cast [-Wint-conversion]
    15   arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    15   arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    15   arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    15   arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    13   cc1: some warnings being treated as errors
    12   arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    12   arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    12   arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    12   arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    12   arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    12   arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long u=
nsigned int=E2=80=99} makes pointer from integer without a cast [-Wint-conv=
ersion]
    9    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    9    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    9    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long u=
nsigned int=E2=80=99} makes pointer from integer without a cast [-Wint-conv=
ersion]
    9    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    9    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    8    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    8    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    6    include/drm/drm_print.h:536:35: warning: =E2=80=98%4.4s=E2=80=99 d=
irective argument is null [-Wformat-overflow=3D]
    6    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=
=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from inte=
ger without a cast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=
=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from inte=
ger without a cast [-Wint-conversion]
    6    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {=
aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without=
 a cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {=
aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without=
 a cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=
=80=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=
=80=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=
=80=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=
=80=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:179:9: warning: assignment to =E2=
=80=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:179:57: warning: passing argument=
 3 of =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without =
a cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:179:50: warning: passing argument=
 2 of =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without =
a cast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:175:9: warning: assignment to =E2=
=80=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    5    arch/riscv/include/asm/cmpxchg.h:175:55: warning: passing argument=
 3 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a=
 cast [-Wint-conversion]
    4    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    4    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    4    arch/riscv/include/asm/cmpxchg.h:175:48: warning: passing argument=
 2 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a=
 cast [-Wint-conversion]
    4    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (in=
terrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, bu=
t node is not an interrupt provider
    3    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =
=E2=80=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-p=
rototypes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototy=
pes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-=
prototypes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-protot=
ypes]
    3    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =
=E2=80=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype fo=
r =E2=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for=
 =E2=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype=
 for =E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype=
 for =E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototyp=
e for =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototy=
pe for =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype f=
or =E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype =
for =E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype =
for =E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct tty_audit_buf *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct rtable *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct rt6_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct obj_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct nfs4_file_layout_dsaddr *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct nfs4_ff_layout_ds *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct net_device_core_stats *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct idmap_legacy_upcalldata *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct file_lock_context *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct epitem *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct btrfs_stripe_hash_table *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct bpf_map *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct bpf_local_storage *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct auth_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98mempool_t *=E2=80=99 {aka =E2=80=98struct mempool_s *=E2=80=99} from =
=E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes=
 pointer from integer without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98fsnotify_connp_t=E2=80=99 {aka =E2=80=98struct fsnotify_mark_connecto=
r *=E2=80=99} from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned =
int=E2=80=99} makes pointer from integer without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct sock_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct inet_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct tty_audit_buf *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct rtable *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct rt6_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct obj_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct nfs4_file_layout_dsaddr *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct nfs4_ff_layout_ds *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct net_device_core_stats *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct idmap_legacy_upcalldata *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct file_lock_context *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct epitem *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct btrfs_stripe_hash_table *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct bpf_map *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct bpf_local_storage *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct auth_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98mempool_t *=E2=80=99 {aka =E2=80=98struct mempool_s *=E2=80=99} from =
=E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes=
 pointer from integer without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98fsnotify_connp_t=E2=80=99 {aka =E2=80=98struct fsnotify_mark_connecto=
r *=E2=80=99} from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned =
int=E2=80=99} makes pointer from integer without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct sock_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct inet_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=
=80=98struct file *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    3    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=
=80=98struct file *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    3    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =
=E2=80=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =
=E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototyp=
e for =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototyp=
e for =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous protot=
ype for =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =
=E2=80=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =
=E2=80=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =
=E2=80=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =
=E2=80=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =
=E2=80=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt=
_provider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cel=
ls' found, but node is not an interrupt provider
    3    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt=
_provider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node=
 is not an interrupt provider
    3    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
    3    1 warning generated.
    2    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =
=E2=80=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]
    2    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous =
prototype for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]
    2    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variab=
le 'out' set but not used [-Wunused-but-set-variable]
    2    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype=
 for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototyp=
e for =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-protot=
ypes]
    2    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototyp=
e for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    2    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct buffer_page *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct lwtunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct ip6_tnl_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98const struct gre_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct buffer_page *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct lwtunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct ip6_tnl_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98const struct gre_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=
=80=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=
=80=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:229:9: warning: assignment to =E2=
=80=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:229:57: warning: passing argument=
 3 of =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without =
a cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:229:50: warning: passing argument=
 2 of =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without =
a cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:225:9: warning: assignment to =E2=
=80=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:225:55: warning: passing argument=
 3 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a=
 cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:225:48: warning: passing argument=
 2 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a=
 cast [-Wint-conversion]
    2    arch/riscv/include/asm/cmpxchg.h:179:11: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    2    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototyp=
e for =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous=
 prototype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previou=
s prototype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous=
 prototype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous pr=
ototype for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous p=
rototype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous pr=
ototype for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sgi-ip22/ip22-time.c:119:18: warning: no previous protot=
ype for =E2=80=98indy_8254timer_irq=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sgi-ip22/ip22-gio.c:398:12: warning: no previous prototy=
pe for =E2=80=98ip22_gio_init=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sgi-ip22/ip22-gio.c:249:6: warning: no previous prototyp=
e for =E2=80=98ip22_gio_set_64bit=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for=
 =E2=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson64/pm.c:67:13: warning: no previous prototype fo=
r =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson64/pm.c:63:13: warning: no previous prototype fo=
r =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson64/pm.c:59:13: warning: no previous prototype fo=
r =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson64/dma.c:25:13: warning: no previous prototype f=
or =E2=80=98plat_swiotlb_setup=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson32/common/platform.c:71:5: warning: no previous =
prototype for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previou=
s prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-protot=
ypes]
    2    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype fo=
r =E2=80=98which_prom=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts:32.31-40.4:=
 Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missi=
ng '#interrupt-cells' in interrupt provider
    2    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (i=
nterrupt_map): Failed prerequisite 'interrupt_provider'
    2    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4:=
 Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missi=
ng '#interrupt-cells' in interrupt provider
    2    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (i=
nterrupt_map): Failed prerequisite 'interrupt_provider'
    2    arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: Warning (=
interrupt_map): Failed prerequisite 'interrupt_provider'
    2    arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5: W=
arning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells'=
 found, but node is not an interrupt provider
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    drivers/video/fbdev/au1100fb.c:565:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_resume=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:548:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_suspend=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:523:6: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_remove=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:341:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_mmap=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:294:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_pan_display=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:235:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_setcolreg=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:138:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_setmode=E2=80=99 [-Wmissing-prototypes]
    1    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous protot=
ype for =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/net/ethernet/sgi/meth.c:271:5: warning: no previous protot=
ype for =E2=80=98meth_reset=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-pic32-evic.c:164:5: warning: no previous proto=
type for =E2=80=98pic32_irq_domain_xlate=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-mxs.c:133:39: warning: no previous prototype f=
or =E2=80=98icoll_handle_irq=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-misc.c:26:5: warning: no previous protot=
ype for =E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-misc.c:181:13: warning: no previous prot=
otype for =E2=80=98ath79_misc_irq_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-cpu.c:89:13: warning: no previous protot=
ype for =E2=80=98ath79_cpu_irq_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/gpu/drm/panthor/panthor_sched.c:2048:6: warning: variable =
'csg_mod_mask' set but not used [-Wunused-but-set-variable]
    1    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct mptcp_mib *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    1    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=
=80=98struct folio *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    1    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct mptcp_mib *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    1    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=
=80=98struct folio *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    1    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=
=80=98struct fsverity_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    1    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=
=80=98struct fsverity_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    1    arch/mips/sni/rm200.c:428:6: warning: no previous prototype for =
=E2=80=98disable_rm200_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:387:13: warning: no previous prototype for =
=E2=80=98sni_rm200_i8259_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:331:6: warning: no previous prototype for =
=E2=80=98sni_rm200_init_8259A=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:211:6: warning: no previous prototype for =
=E2=80=98sni_rm200_mask_and_ack_8259A=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/reset.c:45:6: warning: no previous prototype for =E2=
=80=98sni_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/reset.c:28:6: warning: no previous prototype for =E2=
=80=98sni_machine_restart=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/pcit.c:168:6: warning: no previous prototype for =E2=
=80=98disable_pcit_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/pcimt.c:206:6: warning: no previous prototype for =
=E2=80=98disable_pcimt_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/time.c:10:13: warning: no previous prototy=
pe for =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/smp.c:38:6: warning: no previous prototype=
 for =E2=80=98sb1250_smp_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/smp.c:147:6: warning: no previous prototyp=
e for =E2=80=98sb1250_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/setup.c:79:5: warning: no previous prototy=
pe for =E2=80=98sb1250_m3_workaround_needed=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/setup.c:168:13: warning: no previous proto=
type for =E2=80=98sb1250_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/irq.c:182:13: warning: no previous prototy=
pe for =E2=80=98init_sb1250_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/time.c:10:13: warning: no previous protot=
ype for =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/smp.c:49:6: warning: no previous prototyp=
e for =E2=80=98bcm1480_smp_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/smp.c:158:6: warning: no previous prototy=
pe for =E2=80=98bcm1480_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/setup.c:104:13: warning: no previous prot=
otype for =E2=80=98bcm1480_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/irq.c:200:13: warning: no previous protot=
ype for =E2=80=98init_bcm1480_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip28-berr.c:474:5: warning: no previous prototy=
pe for =E2=80=98ip28_show_be_info=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip28-berr.c:469:13: warning: no previous protot=
ype for =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip28-berr.c:440:6: warning: no previous prototy=
pe for =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-eisa.c:95:12: warning: no previous prototy=
pe for =E2=80=98ip22_eisa_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-berr.c:89:6: warning: no previous prototyp=
e for =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-berr.c:113:13: warning: no previous protot=
ype for =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/rb532/serial.c:48:12: warning: no previous prototype for=
 =E2=80=98setup_serial_port=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/rb532/prom.c:49:13: warning: no previous prototype for =
=E2=80=98prom_setup_cmdline=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/rb532/gpio.c:200:12: warning: no previous prototype for =
=E2=80=98rb532_gpio_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/mm/c-octeon.c:351:17: warning: no previous prototype for=
 =E2=80=98cache_parity_error_octeon_non_recoverable=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/mm/c-octeon.c:342:17: warning: no previous prototype for=
 =E2=80=98cache_parity_error_octeon_recoverable=E2=80=99 [-Wmissing-prototy=
pes]
    1    arch/mips/mm/c-octeon.c:303:5: warning: no previous prototype for =
=E2=80=98unregister_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/mm/c-octeon.c:297:5: warning: no previous prototype for =
=E2=80=98register_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous pr=
ototype for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous pr=
ototype for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous =
prototype for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous =
prototype for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no prev=
ious prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/pm.c:66:12: warning: no previous prot=
otype for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:59:13: warning: no previous prot=
otype for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:118:13: warning: no previous pro=
totype for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:114:13: warning: no previous pro=
totype for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:70:5: warning: n=
o previous prototype for =E2=80=98pci_ohci_read_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:15:6: warning: n=
o previous prototype for =E2=80=98pci_ohci_write_reg=E2=80=99 [-Wmissing-pr=
ototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:84:6: warning: no=
 previous prototype for =E2=80=98pci_isa_write_bar=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:228:5: warning: n=
o previous prototype for =E2=80=98pci_isa_read_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:134:6: warning: n=
o previous prototype for =E2=80=98pci_isa_write_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:110:5: warning: n=
o previous prototype for =E2=80=98pci_isa_read_bar=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: warning: no=
 previous prototype for =E2=80=98pci_ide_read_reg=E2=80=99 [-Wmissing-proto=
types]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: warning: no=
 previous prototype for =E2=80=98pci_ide_write_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:75:5: warning: n=
o previous prototype for =E2=80=98pci_ehci_read_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:15:6: warning: n=
o previous prototype for =E2=80=98pci_ehci_write_reg=E2=80=99 [-Wmissing-pr=
ototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:62:5: warning: no=
 previous prototype for =E2=80=98pci_acc_read_reg=E2=80=99 [-Wmissing-proto=
types]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:15:6: warning: no=
 previous prototype for =E2=80=98pci_acc_write_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/kvm/loongson_ipi.c:190:6: warning: no previous prototype=
 for =E2=80=98kvm_init_loongson_ipi=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:226:5: warning: no previous prototype fo=
r =E2=80=98vpe_free=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:205:5: warning: no previous prototype fo=
r =E2=80=98vpe_stop=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:195:5: warning: no previous prototype fo=
r =E2=80=98vpe_start=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:177:7: warning: no previous prototype fo=
r =E2=80=98vpe_alloc=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/csrc-sb1250.c:53:13: warning: no previous prototy=
pe for =E2=80=98sb1250_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/csrc-bcm1480.c:37:13: warning: no previous protot=
ype for =E2=80=98sb1480_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/cevt-sb1250.c:95:6: warning: no previous prototyp=
e for =E2=80=98sb1250_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/cevt-bcm1480.c:96:6: warning: no previous prototy=
pe for =E2=80=98sb1480_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/setup.c:54:13: warning: no previous prototype for =
=E2=80=98plat_mem_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/reset.c:49:6: warning: no previous prototype for =
=E2=80=98jazz_machine_restart=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:55:13: warning: no previous prototype for =E2=
=80=98init_r4030_ints=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:38:6: warning: no previous prototype for =E2=
=80=98disable_r4030_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:128:13: warning: no previous prototype for =
=E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/smp.c:100:6: warning: no previous prototyp=
e for =E2=80=98octeon_send_ipi_single=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/octeon-platform.c:701:13: warning: no prev=
ious prototype for =E2=80=98octeon_fill_mac_addresses=E2=80=99 [-Wmissing-p=
rototypes]
    1    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:53:6: w=
arning: no previous prototype for =E2=80=98__cvmx_interrupt_gmxx_rxx_int_en=
_enable=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/executive/cvmx-helper-errata.c:49:6: warni=
ng: no previous prototype for =E2=80=98__cvmx_helper_errata_qlm_disable_2nd=
_order_cdr=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/platform.c:68:12: warning: no previous=
 prototype for =E2=80=98db1x_register_pcmcia_socket=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/alchemy/devboards/platform.c:152:12: warning: no previou=
s prototype for =E2=80=98db1x_register_norflash=E2=80=99 [-Wmissing-prototy=
pes]
    1    arch/mips/alchemy/devboards/db1xxx.c:52:13: warning: no previous p=
rototype for =E2=80=98get_system_type=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:582:12: warning: no previous =
prototype for =E2=80=98db1550_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:56:12: warning: no previous p=
rototype for =E2=80=98db1550_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:501:12: warning: no previous =
prototype for =E2=80=98db1550_pci_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1300.c:855:12: warning: no previous =
prototype for =E2=80=98db1300_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1300.c:786:12: warning: no previous =
prototype for =E2=80=98db1300_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1200.c:799:12: warning: no previous =
prototype for =E2=80=98db1200_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1200.c:116:12: warning: no previous =
prototype for =E2=80=98db1200_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:93:12: warning: no previous p=
rototype for =E2=80=98db1500_pci_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:451:12: warning: no previous =
prototype for =E2=80=98db1000_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:35:12: warning: no previous p=
rototype for =E2=80=98db1000_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    .../arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prot=
otype for =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-pr=
ototypes]
    1    ....../arch/riscv/include/asm/cmpxchg.h:175:48: warning: passing a=
rgument 2 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer wi=
thout a cast [-Wint-conversion]
    1    .............../arch/sparc/kernel/traps_64.c:2035:6: warning: no p=
revious prototype for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    1    ..................................................................=
............................../arch/sparc/kernel/traps_64.c:253:6: warning:=
 no previous prototype for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissi=
ng-prototypes]

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
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warni=
ngs, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-17) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section mi=
smatches

Errors:
    arch/arc/include/asm/cmpxchg.h:76:13: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:80:13: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/display/drm_dp_mst_topology.c:5=
094: undefined reference to `__drm_atomic_helper_private_obj_duplicate_stat=
e'
    /tmp/kci/linux/build/../drivers/gpu/drm/display/drm_dp_mst_topology.c:5=
080: undefined reference to `drm_kms_helper_hotplug_event'
    /tmp/kci/linux/build/../drivers/gpu/drm/display/drm_dp_mst_topology.c:4=
039: undefined reference to `drm_kms_helper_hotplug_event'
    /tmp/kci/linux/build/../drivers/gpu/drm/display/drm_dp_mst_topology.c:2=
692: undefined reference to `drm_kms_helper_hotplug_event'

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

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
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/irqchip/irq-ath79-cpu.c:89:13: warning: no previous prototype f=
or =E2=80=98ath79_cpu_irq_init=E2=80=99 [-Wmissing-prototypes]
    drivers/irqchip/irq-ath79-misc.c:26:5: warning: no previous prototype f=
or =E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    drivers/irqchip/irq-ath79-misc.c:181:13: warning: no previous prototype=
 for =E2=80=98ath79_misc_irq_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

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
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 15 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/sibyte/bcm1480/setup.c:104:13: warning: no previous prototype=
 for =E2=80=98bcm1480_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/irq.c:200:13: warning: no previous prototype f=
or =E2=80=98init_bcm1480_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/time.c:10:13: warning: no previous prototype f=
or =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/smp.c:49:6: warning: no previous prototype for=
 =E2=80=98bcm1480_smp_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/smp.c:158:6: warning: no previous prototype fo=
r =E2=80=98bcm1480_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototype for=
 =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous prot=
otype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previous pro=
totype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous prot=
otype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous prototy=
pe for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous protot=
ype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous prototy=
pe for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-bcm1480.c:96:6: warning: no previous prototype fo=
r =E2=80=98sb1480_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/csrc-bcm1480.c:37:13: warning: no previous prototype f=
or =E2=80=98sb1480_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for =E2=
=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]

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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 8 warnings,=
 0 section mismatches

Errors:
    ./../include/linux/compiler_types.h:460:38: error: call to =E2=80=98__c=
ompiletime_assert_319=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

Warnings:
    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:53:6: warnin=
g: no previous prototype for =E2=80=98__cvmx_interrupt_gmxx_rxx_int_en_enab=
le=E2=80=99 [-Wmissing-prototypes]
    arch/mips/cavium-octeon/executive/cvmx-helper-errata.c:49:6: warning: n=
o previous prototype for =E2=80=98__cvmx_helper_errata_qlm_disable_2nd_orde=
r_cdr=E2=80=99 [-Wmissing-prototypes]
    arch/mips/cavium-octeon/octeon-platform.c:701:13: warning: no previous =
prototype for =E2=80=98octeon_fill_mac_addresses=E2=80=99 [-Wmissing-protot=
ypes]
    arch/mips/cavium-octeon/smp.c:100:6: warning: no previous prototype for=
 =E2=80=98octeon_send_ipi_single=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:297:5: warning: no previous prototype for =E2=
=80=98register_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:303:5: warning: no previous prototype for =E2=
=80=98unregister_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:342:17: warning: no previous prototype for =E2=
=80=98cache_parity_error_octeon_recoverable=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:351:17: warning: no previous prototype for =E2=
=80=98cache_parity_error_octeon_non_recoverable=E2=80=99 [-Wmissing-prototy=
pes]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

Warnings:
    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype f=
or =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]

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
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 21 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/alchemy/devboards/platform.c:68:12: warning: no previous prot=
otype for =E2=80=98db1x_register_pcmcia_socket=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/alchemy/devboards/platform.c:152:12: warning: no previous pro=
totype for =E2=80=98db1x_register_norflash=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:35:12: warning: no previous protot=
ype for =E2=80=98db1000_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:93:12: warning: no previous protot=
ype for =E2=80=98db1500_pci_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:451:12: warning: no previous proto=
type for =E2=80=98db1000_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1200.c:116:12: warning: no previous proto=
type for =E2=80=98db1200_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1200.c:799:12: warning: no previous proto=
type for =E2=80=98db1200_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1300.c:786:12: warning: no previous proto=
type for =E2=80=98db1300_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1300.c:855:12: warning: no previous proto=
type for =E2=80=98db1300_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:56:12: warning: no previous protot=
ype for =E2=80=98db1550_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:501:12: warning: no previous proto=
type for =E2=80=98db1550_pci_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:582:12: warning: no previous proto=
type for =E2=80=98db1550_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1xxx.c:52:13: warning: no previous protot=
ype for =E2=80=98get_system_type=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:138:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_setmode=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:235:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_setcolreg=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:294:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_pan_display=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:341:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_mmap=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:523:6: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_remove=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:548:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_suspend=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:565:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_resume=E2=80=99 [-Wmissing-prototypes]
    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous proto=
type for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 8 warnings,=
 0 section mismatches

Errors:
    ./../include/linux/compiler_types.h:460:38: error: call to =E2=80=98__c=
ompiletime_assert_312=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 9 warnings, 0=
 section mismatches

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 9 warning=
s, 0 section mismatches

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    drivers/gpu/drm/panthor/panthor_sched.c:2048:6: warning: variable 'csg_=
mod_mask' set but not used [-Wunused-but-set-variable]
    1 warning generated.
    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable 'o=
ut' set but not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 823 warnings, 0 section=
 mismatches

Warnings:
    arch/riscv/include/asm/cmpxchg.h:175:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98mempool_t *=E2=80=99 {aka =E2=80=98struct mempool_s *=E2=80=99} from =E2=
=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes po=
inter from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98mempool_t *=E2=80=99 {aka =E2=80=98struct mempool_s *=E2=80=99} from =E2=
=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes po=
inter from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98fsnotify_connp_t=E2=80=99 {aka =E2=80=98struct fsnotify_mark_connector *=
=E2=80=99} from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=
=E2=80=99} makes pointer from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98fsnotify_connp_t=E2=80=99 {aka =E2=80=98struct fsnotify_mark_connector *=
=E2=80=99} from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=
=E2=80=99} makes pointer from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct obj_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct obj_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_local_storage *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_local_storage *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct nfs4_file_layout_dsaddr *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct nfs4_file_layout_dsaddr *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct nfs4_ff_layout_ds *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct nfs4_ff_layout_ds *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct idmap_legacy_upcalldata *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct idmap_legacy_upcalldata *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct net_device_core_stats *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct net_device_core_stats *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_map *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_map *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct sock_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct sock_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct file *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98lo=
ng unsigned int=E2=80=99} makes pointer from integer without a cast [-Wint-=
conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct file *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98lo=
ng unsigned int=E2=80=99} makes pointer from integer without a cast [-Wint-=
conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct btrfs_stripe_hash_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct btrfs_stripe_hash_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct epitem *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct epitem *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct file_lock_context *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct file_lock_context *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct rtable *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct rtable *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct tty_audit_buf *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct tty_audit_buf *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct rt6_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct rt6_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct auth_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct auth_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

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
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
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
defconfig+arm64-chromebook+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 847 warnings, 0 s=
ection mismatches

Warnings:
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:175:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98fsnotify_connp_t=E2=80=99 {aka =E2=80=98struct fsnotify_mark_connector *=
=E2=80=99} from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=
=E2=80=99} makes pointer from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98fsnotify_connp_t=E2=80=99 {aka =E2=80=98struct fsnotify_mark_connector *=
=E2=80=99} from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=
=E2=80=99} makes pointer from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct buffer_page *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct buffer_page *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98mempool_t *=E2=80=99 {aka =E2=80=98struct mempool_s *=E2=80=99} from =E2=
=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes po=
inter from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98mempool_t *=E2=80=99 {aka =E2=80=98struct mempool_s *=E2=80=99} from =E2=
=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes po=
inter from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct obj_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct obj_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct nfs4_file_layout_dsaddr *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct nfs4_file_layout_dsaddr *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct nfs4_ff_layout_ds *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct nfs4_ff_layout_ds *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_local_storage *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_local_storage *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct idmap_legacy_upcalldata *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct idmap_legacy_upcalldata *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct file *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98lo=
ng unsigned int=E2=80=99} makes pointer from integer without a cast [-Wint-=
conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct file *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98lo=
ng unsigned int=E2=80=99} makes pointer from integer without a cast [-Wint-=
conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct btrfs_stripe_hash_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct btrfs_stripe_hash_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct epitem *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct epitem *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct file_lock_context *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct file_lock_context *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct net_device_core_stats *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct net_device_core_stats *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_map *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_map *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct sock_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct sock_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct rtable *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct rtable *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct tty_audit_buf *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct tty_audit_buf *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct rt6_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct rt6_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct auth_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct auth_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1000 warnings=
, 0 section mismatches

Warnings:
    ....../arch/riscv/include/asm/cmpxchg.h:175:48: warning: passing argume=
nt 2 of =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without=
 a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct fsverity_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct fsverity_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98fsnotify_connp_t=E2=80=99 {aka =E2=80=98struct fsnotify_mark_connector *=
=E2=80=99} from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=
=E2=80=99} makes pointer from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98fsnotify_connp_t=E2=80=99 {aka =E2=80=98struct fsnotify_mark_connector *=
=E2=80=99} from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=
=E2=80=99} makes pointer from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct buffer_page *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct buffer_page *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98mempool_t *=E2=80=99 {aka =E2=80=98struct mempool_s *=E2=80=99} from =E2=
=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes po=
inter from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98mempool_t *=E2=80=99 {aka =E2=80=98struct mempool_s *=E2=80=99} from =E2=
=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes po=
inter from integer without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct folio *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98l=
ong unsigned int=E2=80=99} makes pointer from integer without a cast [-Wint=
-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct folio *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98l=
ong unsigned int=E2=80=99} makes pointer from integer without a cast [-Wint=
-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mem_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct obj_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct obj_cgroup *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct nfs4_file_layout_dsaddr *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct nfs4_file_layout_dsaddr *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct nfs4_ff_layout_ds *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct nfs4_ff_layout_ds *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_local_storage *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_local_storage *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct net_device_core_stats *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct net_device_core_stats *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99=
 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer witho=
ut a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_dtab_netdev *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct idmap_legacy_upcalldata *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct idmap_legacy_upcalldata *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct sock_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct sock_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_map *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_map *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct lwtunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct lwtunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct lwtunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct lwtunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct file *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98lo=
ng unsigned int=E2=80=99} makes pointer from integer without a cast [-Wint-=
conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct file *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98lo=
ng unsigned int=E2=80=99} makes pointer from integer without a cast [-Wint-=
conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98long unsi=
gned int=E2=80=99} makes pointer from integer without a cast [-Wint-convers=
ion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct rtable *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct rtable *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct metadata_dst *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct rt6_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct rt6_info *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct tty_audit_buf *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct tty_audit_buf *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct ip6_tnl_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct ip6_tnl_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct ip6_tnl_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct ip6_tnl_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet6_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct net_offload *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct ip_tunnel_encap_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer=
 without a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct btrfs_stripe_hash_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct btrfs_stripe_hash_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct gre_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct gre_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct gre_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct gre_protocol *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {a=
ka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without =
a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct inet_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct inet_diag_handler *=E2=80=99 from =E2=80=98uintptr_t=E2=80=
=99 {aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer wi=
thout a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98const struct rpc_authops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct auth_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct auth_ops *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct list_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct epitem *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct epitem *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct file_lock_context *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct file_lock_context *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {ak=
a =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a=
 cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct posix_acl *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dma_fence *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mptcp_mib *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mptcp_mib *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bpf_prog *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct ffs_buffer *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
eyeq5_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous pro=
totype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototypes]

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
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous proto=
type for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 =
section mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warni=
ng, 0 section mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 w=
arning, 0 section mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    drm_dp_mst_topology.c:(.text+0x2958): undefined reference to `__drm_ato=
mic_helper_private_obj_duplicate_state'
    drm_dp_mst_topology.c:(.text+0x3380): undefined reference to `drm_kms_h=
elper_hotplug_event'
    drm_dp_mst_topology.c:(.text+0x7ba4): undefined reference to `drm_kms_h=
elper_hotplug_event'
    drm_dp_mst_topology.c:(.text+0x8bc0): undefined reference to `drm_kms_h=
elper_hotplug_event'

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/sgi-ip22/ip22-time.c:119:18: warning: no previous prototype f=
or =E2=80=98indy_8254timer_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-gio.c:249:6: warning: no previous prototype for=
 =E2=80=98ip22_gio_set_64bit=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-gio.c:398:12: warning: no previous prototype fo=
r =E2=80=98ip22_gio_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-berr.c:89:6: warning: no previous prototype for=
 =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-berr.c:113:13: warning: no previous prototype f=
or =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =E2=80=
=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/sgi-ip22/ip22-time.c:119:18: warning: no previous prototype f=
or =E2=80=98indy_8254timer_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-gio.c:249:6: warning: no previous prototype for=
 =E2=80=98ip22_gio_set_64bit=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-gio.c:398:12: warning: no previous prototype fo=
r =E2=80=98ip22_gio_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip28-berr.c:440:6: warning: no previous prototype fo=
r =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip28-berr.c:469:13: warning: no previous prototype f=
or =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip28-berr.c:474:5: warning: no previous prototype fo=
r =E2=80=98ip28_show_be_info=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-eisa.c:95:12: warning: no previous prototype fo=
r =E2=80=98ip22_eisa_init=E2=80=99 [-Wmissing-prototypes]
    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =E2=80=
=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/net/ethernet/sgi/meth.c:271:5: warning: no previous prototype f=
or =E2=80=98meth_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/jazz/irq.c:38:6: warning: no previous prototype for =E2=80=98=
disable_r4030_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/irq.c:55:13: warning: no previous prototype for =E2=80=
=98init_r4030_ints=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/irq.c:128:13: warning: no previous prototype for =E2=80=
=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/reset.c:49:6: warning: no previous prototype for =E2=80=
=98jazz_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/setup.c:54:13: warning: no previous prototype for =E2=80=
=98plat_mem_setup=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 22 warnings, 0 =
section mismatches

Warnings:
    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: warning: no prev=
ious prototype for =E2=80=98pci_ide_write_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: warning: no prev=
ious prototype for =E2=80=98pci_ide_read_reg=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:15:6: warning: no prev=
ious prototype for =E2=80=98pci_acc_write_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:62:5: warning: no prev=
ious prototype for =E2=80=98pci_acc_read_reg=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:15:6: warning: no pre=
vious prototype for =E2=80=98pci_ohci_write_reg=E2=80=99 [-Wmissing-prototy=
pes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:70:5: warning: no pre=
vious prototype for =E2=80=98pci_ohci_read_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:84:6: warning: no prev=
ious prototype for =E2=80=98pci_isa_write_bar=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:110:5: warning: no pre=
vious prototype for =E2=80=98pci_isa_read_bar=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:134:6: warning: no pre=
vious prototype for =E2=80=98pci_isa_write_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:228:5: warning: no pre=
vious prototype for =E2=80=98pci_isa_read_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no previous =
prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:15:6: warning: no pre=
vious prototype for =E2=80=98pci_ehci_write_reg=E2=80=99 [-Wmissing-prototy=
pes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:75:5: warning: no pre=
vious prototype for =E2=80=98pci_ehci_read_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous prototy=
pe for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous prototy=
pe for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous proto=
type for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous proto=
type for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous pro=
totype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:59:13: warning: no previous prototype=
 for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:66:12: warning: no previous prototype=
 for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:114:13: warning: no previous prototyp=
e for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:118:13: warning: no previous prototyp=
e for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    arch/mips/loongson32/common/platform.c:71:5: warning: no previous proto=
type for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    arch/mips/loongson32/common/platform.c:71:5: warning: no previous proto=
type for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 12 warnings, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5: Warnin=
g (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' foun=
d, but node is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: Warning (inter=
rupt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts:32.31-40.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/loongson64/dma.c:25:13: warning: no previous prototype for =
=E2=80=98plat_swiotlb_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:59:13: warning: no previous prototype for =E2=
=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:63:13: warning: no previous prototype for =E2=
=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:67:13: warning: no previous prototype for =E2=
=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 13 warnings, 0=
 section mismatches

Warnings:
    arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5: Warnin=
g (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' foun=
d, but node is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: Warning (inter=
rupt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts:32.31-40.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/loongson64/dma.c:25:13: warning: no previous prototype for =
=E2=80=98plat_swiotlb_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:59:13: warning: no previous prototype for =E2=
=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:63:13: warning: no previous prototype for =E2=
=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson64/pm.c:67:13: warning: no previous prototype for =E2=
=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kvm/loongson_ipi.c:190:6: warning: no previous prototype for =
=E2=80=98kvm_init_loongson_ipi=E2=80=99 [-Wmissing-prototypes]

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
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/mips/kernel/vpe-mt.c:177:7: warning: no previous prototype for =E2=
=80=98vpe_alloc=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:195:5: warning: no previous prototype for =E2=
=80=98vpe_start=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:205:5: warning: no previous prototype for =E2=
=80=98vpe_stop=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:226:5: warning: no previous prototype for =E2=
=80=98vpe_free=E2=80=99 [-Wmissing-prototypes]

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
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/drm/drm_print.h:536:35: warning: =E2=80=98%4.4s=E2=80=99 direct=
ive argument is null [-Wformat-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable 'o=
ut' set but not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 1 warning, 0 section mismatches

Warnings:
    include/drm/drm_print.h:536:35: warning: =E2=80=98%4.4s=E2=80=99 direct=
ive argument is null [-Wformat-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    include/drm/drm_print.h:536:35: warning: =E2=80=98%4.4s=E2=80=99 direct=
ive argument is null [-Wformat-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    include/drm/drm_print.h:536:35: warning: =E2=80=98%4.4s=E2=80=99 direct=
ive argument is null [-Wformat-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    include/drm/drm_print.h:536:35: warning: =E2=80=98%4.4s=E2=80=99 direct=
ive argument is null [-Wformat-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/irqchip/irq-mxs.c:133:39: warning: no previous prototype for =
=E2=80=98icoll_handle_irq=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 187 warnings=
, 0 section mismatches

Warnings:
    arch/riscv/include/asm/cmpxchg.h:175:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:225:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:225:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:225:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:229:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:229:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 FAIL, 6 errors, 0 warnings=
, 0 section mismatches

Errors:
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 210 w=
arnings, 0 section mismatches

Warnings:
    arch/riscv/include/asm/cmpxchg.h:175:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:175:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: assignment to =E2=80=
=98struct wake_q_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct optimistic_spin_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99} makes pointer from integer withou=
t a cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:225:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:225:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:225:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:229:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:229:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct task_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct mm_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct callback_head *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct workqueue_struct *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka=
 =E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a =
cast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct request *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=
=98long unsigned int=E2=80=99} makes pointer from integer without a cast [-=
Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:229:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct dentry *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=80=98=
long unsigned int=E2=80=99} makes pointer from integer without a cast [-Win=
t-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct llist_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98union nested_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:329:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: assignment to =E2=80=
=98struct bucket_table *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =E2=
=80=98long unsigned int=E2=80=99} makes pointer from integer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_root *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:48: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:55: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u8=E2=80=99 makes integer from pointer without a cast=
 [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:277:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:50: warning: passing argument 2 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:57: warning: passing argument 3 of=
 =E2=80=98cmpxchg_emu_u16=E2=80=99 makes integer from pointer without a cas=
t [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: assignment to =E2=80=
=98struct genradix_node *=E2=80=99 from =E2=80=98uintptr_t=E2=80=99 {aka =
=E2=80=98long unsigned int=E2=80=99} makes pointer from integer without a c=
ast [-Wint-conversion]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:281:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:11: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:333:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    arch/riscv/include/asm/cmpxchg.h:179:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 FAIL, 12 errors, 0 =
warnings, 0 section mismatches

Errors:
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    mm/oom_kill.c:766:7: error: incompatible pointer to integer conversion =
passing 'typeof (*((__ai_ptr)))' (aka 'struct mm_struct *') to parameter of=
 type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    mm/oom_kill.c:766:7: error: incompatible pointer to integer conversion =
passing 'typeof (*((__ai_ptr)))' (aka 'struct mm_struct *') to parameter of=
 type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    mm/oom_kill.c:766:7: error: incompatible integer to pointer conversion =
assigning to 'typeof (*((__ai_ptr)))' (aka 'struct mm_struct *') from 'uint=
ptr_t' (aka 'unsigned long') [-Wint-conversion]
    mm/oom_kill.c:766:7: error: incompatible pointer to integer conversion =
passing 'typeof (*((__ai_ptr)))' (aka 'struct mm_struct *') to parameter of=
 type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    mm/oom_kill.c:766:7: error: incompatible pointer to integer conversion =
passing 'typeof (*((__ai_ptr)))' (aka 'struct mm_struct *') to parameter of=
 type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    mm/oom_kill.c:766:7: error: incompatible integer to pointer conversion =
assigning to 'typeof (*((__ai_ptr)))' (aka 'struct mm_struct *') from 'uint=
ptr_t' (aka 'unsigned long') [-Wint-conversion]

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, clang-17) =E2=80=94 FAIL, 6 errors, 0 warnings=
, 0 section mismatches

Errors:
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible pointer to integer conv=
ersion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') to par=
ameter of type 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]
    kernel/sched/core.c:961:15: error: incompatible integer to pointer conv=
ersion assigning to 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node *') f=
rom 'uintptr_t' (aka 'unsigned long') [-Wint-conversion]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 =
section mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning=
, 0 section mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/irqchip/irq-pic32-evic.c:164:5: warning: no previous prototype =
for =E2=80=98pic32_irq_domain_xlate=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/drm/drm_print.h:536:35: warning: =E2=80=98%4.4s=E2=80=99 direct=
ive argument is null [-Wformat-overflow=3D]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/mips/rb532/serial.c:48:12: warning: no previous prototype for =E2=
=80=98setup_serial_port=E2=80=99 [-Wmissing-prototypes]
    arch/mips/rb532/prom.c:49:13: warning: no previous prototype for =E2=80=
=98prom_setup_cmdline=E2=80=99 [-Wmissing-prototypes]
    arch/mips/rb532/gpio.c:200:12: warning: no previous prototype for =E2=
=80=98rb532_gpio_init=E2=80=99 [-Wmissing-prototypes]

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
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sect=
ion mismatches

Warnings:
    arch/mips/sni/reset.c:28:6: warning: no previous prototype for =E2=80=
=98sni_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/reset.c:45:6: warning: no previous prototype for =E2=80=
=98sni_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:211:6: warning: no previous prototype for =E2=80=
=98sni_rm200_mask_and_ack_8259A=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:331:6: warning: no previous prototype for =E2=80=
=98sni_rm200_init_8259A=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:387:13: warning: no previous prototype for =E2=80=
=98sni_rm200_i8259_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:428:6: warning: no previous prototype for =E2=80=
=98disable_rm200_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/pcimt.c:206:6: warning: no previous prototype for =E2=80=
=98disable_pcimt_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/pcit.c:168:6: warning: no previous prototype for =E2=80=
=98disable_pcit_irq=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 16 warnings=
, 0 section mismatches

Warnings:
    arch/mips/sibyte/sb1250/setup.c:79:5: warning: no previous prototype fo=
r =E2=80=98sb1250_m3_workaround_needed=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/setup.c:168:13: warning: no previous prototype =
for =E2=80=98sb1250_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/irq.c:182:13: warning: no previous prototype fo=
r =E2=80=98init_sb1250_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/time.c:10:13: warning: no previous prototype fo=
r =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/smp.c:38:6: warning: no previous prototype for =
=E2=80=98sb1250_smp_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/smp.c:147:6: warning: no previous prototype for=
 =E2=80=98sb1250_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototype for=
 =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous prot=
otype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previous pro=
totype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous prot=
otype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous prototy=
pe for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous protot=
ype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous prototy=
pe for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-sb1250.c:95:6: warning: no previous prototype for=
 =E2=80=98sb1250_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/csrc-sb1250.c:53:13: warning: no previous prototype fo=
r =E2=80=98sb1250_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for =E2=
=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 26 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype for =
=E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototype for=
 =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =E2=80=
=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-proto=
types]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-protot=
ypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 24 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype for =
=E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototype for=
 =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =E2=80=
=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-proto=
types]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-protot=
ypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 24 wa=
rnings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    .......................................................................=
........................./arch/sparc/kernel/traps_64.c:253:6: warning: no p=
revious prototype for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-pr=
ototypes]
    .............../arch/sparc/kernel/traps_64.c:2035:6: warning: no previo=
us prototype for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    .../arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype=
 for =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototy=
pes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =E2=80=
=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-proto=
types]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-protot=
ypes]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/build_bug.h:78:41: error: static assertion failed: "struc=
t bpf_fib_lookup size check"

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
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section mis=
matches

Errors:
    arch/arc/include/asm/cmpxchg.h:76:13: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:80:13: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

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
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0=
 section mismatches

Errors:
    arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u8' [-Werror=3Dimplicit-function-declaration]
    arch/arc/include/asm/cmpxchg.h:53:12: error: implicit declaration of fu=
nction 'cmpxchg_emu_u16' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

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
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 err=
ors, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>

