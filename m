Return-Path: <linux-next+bounces-141-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C807FEAB2
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 09:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ADA71C20D18
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 08:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93741321A7;
	Thu, 30 Nov 2023 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NWsSkiEY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BB11710
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 00:32:17 -0800 (PST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1fa235f8026so306264fac.3
        for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 00:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701333136; x=1701937936; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhfsuskk81vOk+PeBd4YvXEhib62NHz+j2Uady2XgVY=;
        b=NWsSkiEYnLHb3E8qA6gnEsnZoM5zfumUjqQ4Y8hrEKumBVI1SaoBgr2kh5L6kGezms
         r9yZJMoRxuY8uVOyzSgktYb2yZafY8OgeMXCIOJ8tz4VGbxvznkSzo5UWWCxmSKyCH+T
         PjYOIweztro0yzBiTQb5ILYJa/uwobtZsqbjPRXcGOFZ1d4U9OEvg/HXY+7XwWtq3TgU
         ySbTZ+5kV67zRALvRpR5qRmaBMPkgrO+MQ0H/+U6HuOMxvT/4VLrJMtFuTlyl5eqXTQm
         NWW35YXGc1BmgQPRkOmPXKnO1umyI0XDtbnMT+vd5m5Lf8V95mFHRQiOETPGOUHbt98A
         iWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701333136; x=1701937936;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhfsuskk81vOk+PeBd4YvXEhib62NHz+j2Uady2XgVY=;
        b=IuWLmM3xu85FtVcoGDsHbDDhv6gmI652WNWPihH29PwWqUMebTGNkxTrDlAH4Z6qDg
         cEA1y0nXiw9U00+OejWEfDmL9OlW7Dn07L4kf9T1euUlK0R4zPDnfq/B8ZDj+vIDS6bw
         ZEhap6FlMHGtSAq++Igrrwky7qEiiAzCvFZdD34SQEfNhOsNpTVZ88eF8j6le9hda7rY
         Dp96tARvjmrYXPGQSJ6i18GphAtR5HbuDL/mWBOqob4B1e09tSIfc31DSI6U7ZoXiYq7
         lAvyIhQT4X5Aehq/sLix/IFaOmfsOMSM1i4GkB+Fvl6Dp1ISoL51d2rC1Tg+JbZQ5iek
         mZLw==
X-Gm-Message-State: AOJu0Yw1WpTn1JLBfbEgvWncXUQIcQMNCu3nLuCrBxKJqfYsAvCtLGq5
	vQiXwfKNbMORiXfeaj93bYkNysRPrEG+dwexQpwUhg==
X-Google-Smtp-Source: AGHT+IGHfDkoZd8NBGAneXPtfvypEFJbPrb3ElwzYehjsx49lDyJYZ6vOkri2chYcrl9CgzQsdm6ZA==
X-Received: by 2002:a05:6870:a11e:b0:1d5:8e6c:1794 with SMTP id m30-20020a056870a11e00b001d58e6c1794mr23186685oae.58.1701333134849;
        Thu, 30 Nov 2023 00:32:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id r27-20020aa78b9b000000b006900cb919b8sm661827pfd.53.2023.11.30.00.32.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 00:32:13 -0800 (PST)
Message-ID: <6568488d.a70a0220.e033f.1719@mx.google.com>
Date: Thu, 30 Nov 2023 00:32:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231130
Subject: next/master build: 188 builds: 63 failed, 125 passed, 276 errors,
 238 warnings (next-20231130)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 188 builds: 63 failed, 125 passed, 276 errors, 238 warni=
ngs (next-20231130)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20231130/

Tree: next
Branch: master
Git Describe: next-20231130
Git Commit: 3cd3fe06ff81cfb3a969acb12a56796cff5af23d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm:
    rpc_defconfig: (gcc-10) FAIL

i386:
    i386_defconfig: (gcc-10) FAIL
    i386_defconfig+debug: (gcc-10) FAIL
    i386_defconfig+kselftest: (gcc-10) FAIL

mips:
    32r2el_defconfig: (gcc-10) FAIL
    32r2el_defconfig+debug: (gcc-10) FAIL
    32r2el_defconfig+kselftest: (gcc-10) FAIL
    allnoconfig: (gcc-10) FAIL
    ath25_defconfig: (gcc-10) FAIL
    ath79_defconfig: (gcc-10) FAIL
    bcm47xx_defconfig: (gcc-10) FAIL
    bcm63xx_defconfig: (gcc-10) FAIL
    bigsur_defconfig: (gcc-10) FAIL
    bmips_be_defconfig: (gcc-10) FAIL
    bmips_stb_defconfig: (gcc-10) FAIL
    cavium_octeon_defconfig: (gcc-10) FAIL
    ci20_defconfig: (gcc-10) FAIL
    cobalt_defconfig: (gcc-10) FAIL
    cu1000-neo_defconfig: (gcc-10) FAIL
    cu1830-neo_defconfig: (gcc-10) FAIL
    db1xxx_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    fuloong2e_defconfig: (gcc-10) FAIL
    gcw0_defconfig: (gcc-10) FAIL
    gpr_defconfig: (gcc-10) FAIL
    ip22_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    ip32_defconfig: (gcc-10) FAIL
    jazz_defconfig: (gcc-10) FAIL
    lemote2f_defconfig: (gcc-10) FAIL
    loongson1b_defconfig: (gcc-10) FAIL
    loongson1c_defconfig: (gcc-10) FAIL
    loongson2k_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL
    malta_defconfig: (gcc-10) FAIL
    malta_kvm_defconfig: (gcc-10) FAIL
    malta_qemu_32r6_defconfig: (gcc-10) FAIL
    maltaaprp_defconfig: (gcc-10) FAIL
    maltasmvp_defconfig: (gcc-10) FAIL
    maltasmvp_eva_defconfig: (gcc-10) FAIL
    maltaup_defconfig: (gcc-10) FAIL
    maltaup_xpa_defconfig: (gcc-10) FAIL
    mtx1_defconfig: (gcc-10) FAIL
    omega2p_defconfig: (gcc-10) FAIL
    pic32mzda_defconfig: (gcc-10) FAIL
    qi_lb60_defconfig: (gcc-10) FAIL
    rb532_defconfig: (gcc-10) FAIL
    rbtx49xx_defconfig: (gcc-10) FAIL
    rm200_defconfig: (gcc-10) FAIL
    rs90_defconfig: (gcc-10) FAIL
    rt305x_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL
    vocore2_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

x86_64:
    x86_64_defconfig: (gcc-10) FAIL
    x86_64_defconfig+kselftest: (gcc-10) FAIL
    x86_64_defconfig+x86-board: (gcc-10) FAIL
    x86_64_defconfig+x86-board+kselftest: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-10): 1 warning
    axs103_defconfig (gcc-10): 1 warning
    axs103_smp_defconfig (gcc-10): 1 warning
    haps_hs_defconfig (gcc-10): 1 warning
    haps_hs_smp_defconfig (gcc-10): 2 warnings
    haps_hs_smp_defconfig+debug (gcc-10): 2 warnings
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error, 2 warnings
    hsdk_defconfig (gcc-10): 1 warning
    nsimosci_hs_defconfig (gcc-10): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning
    vdk_hs38_defconfig (gcc-10): 1 warning
    vdk_hs38_smp_defconfig (gcc-10): 1 warning

arm64:
    defconfig (gcc-10): 1 warning
    defconfig+CONFIG_ARM64_16K_PAGES=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-10): 1 warning
    defconfig+arm64-chromebook (gcc-10): 1 warning
    defconfig+arm64-chromebook+kselftest (gcc-10): 2 warnings
    defconfig+arm64-chromebook+videodec (gcc-10): 1 warning
    defconfig+kselftest (gcc-10): 2 warnings
    defconfig+videodec (gcc-10): 1 warning

arm:
    collie_defconfig (gcc-10): 1 warning
    multi_v7_defconfig+kselftest (gcc-10): 1 warning
    mxs_defconfig (gcc-10): 1 warning
    omap2plus_defconfig (gcc-10): 1 warning
    pxa_defconfig (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors

i386:
    i386_defconfig (gcc-10): 1 error, 1 warning
    i386_defconfig+debug (gcc-10): 1 error, 1 warning
    i386_defconfig+kselftest (gcc-10): 1 error, 1 warning

mips:
    32r2el_defconfig (gcc-10): 5 errors, 1 warning
    32r2el_defconfig+debug (gcc-10): 6 errors, 2 warnings
    32r2el_defconfig+kselftest (gcc-10): 5 errors, 1 warning
    allnoconfig (gcc-10): 7 errors, 3 warnings
    ath25_defconfig (gcc-10): 6 errors, 2 warnings
    ath79_defconfig (gcc-10): 6 errors, 2 warnings
    bcm47xx_defconfig (gcc-10): 6 errors, 2 warnings
    bcm63xx_defconfig (gcc-10): 1 error, 1 warning
    bigsur_defconfig (gcc-10): 5 errors, 2 warnings
    bmips_be_defconfig (gcc-10): 5 errors, 1 warning
    bmips_stb_defconfig (gcc-10): 5 errors, 1 warning
    cavium_octeon_defconfig (gcc-10): 2 errors, 2 warnings
    ci20_defconfig (gcc-10): 6 errors, 2 warnings
    cobalt_defconfig (gcc-10): 2 errors, 1 warning
    cu1000-neo_defconfig (gcc-10): 8 errors, 4 warnings
    cu1830-neo_defconfig (gcc-10): 7 errors, 3 warnings
    db1xxx_defconfig (gcc-10): 3 errors, 1 warning
    decstation_64_defconfig (gcc-10): 8 errors, 2 warnings
    decstation_defconfig (gcc-10): 10 errors, 3 warnings
    decstation_r4k_defconfig (gcc-10): 4 errors, 1 warning
    fuloong2e_defconfig (gcc-10): 5 errors, 2 warnings
    gcw0_defconfig (gcc-10): 8 errors, 4 warnings
    gpr_defconfig (gcc-10): 1 error, 1 warning
    ip22_defconfig (gcc-10): 1 error, 1 warning
    ip27_defconfig (gcc-10): 2 errors, 1 warning
    ip28_defconfig (gcc-10): 1 error, 1 warning
    ip32_defconfig (gcc-10): 1 error, 1 warning
    jazz_defconfig (gcc-10): 3 errors, 1 warning
    lemote2f_defconfig (gcc-10): 2 errors, 1 warning
    loongson1b_defconfig (gcc-10): 7 errors, 3 warnings
    loongson1c_defconfig (gcc-10): 7 errors, 3 warnings
    loongson2k_defconfig (gcc-10): 1 error, 1 warning
    loongson3_defconfig (gcc-10): 5 errors, 2 warnings
    malta_defconfig (gcc-10): 5 errors, 1 warning
    malta_kvm_defconfig (gcc-10): 7 errors, 3 warnings
    malta_qemu_32r6_defconfig (gcc-10): 5 errors, 1 warning
    maltaaprp_defconfig (gcc-10): 5 errors, 1 warning
    maltasmvp_defconfig (gcc-10): 6 errors, 2 warnings
    maltasmvp_eva_defconfig (gcc-10): 6 errors, 2 warnings
    maltaup_defconfig (gcc-10): 7 errors, 3 warnings
    maltaup_xpa_defconfig (gcc-10): 7 errors, 3 warnings
    mtx1_defconfig (gcc-10): 1 error, 1 warning
    omega2p_defconfig (gcc-10): 8 errors, 3 warnings
    pic32mzda_defconfig (gcc-10): 5 errors, 1 warning
    qi_lb60_defconfig (gcc-10): 5 errors, 1 warning
    rb532_defconfig (gcc-10): 1 error, 1 warning
    rbtx49xx_defconfig (gcc-10): 6 errors, 2 warnings
    rm200_defconfig (gcc-10): 7 errors, 2 warnings
    rs90_defconfig (gcc-10): 7 errors, 3 warnings
    rt305x_defconfig (gcc-10): 9 errors, 4 warnings
    sb1250_swarm_defconfig (gcc-10): 2 errors, 1 warning
    tinyconfig (gcc-10): 6 errors, 2 warnings
    vocore2_defconfig (gcc-10): 9 errors, 4 warnings
    xway_defconfig (gcc-10): 1 error, 1 warning

riscv:
    defconfig (gcc-10): 1 warning
    defconfig+kselftest (gcc-10): 1 warning
    rv32_defconfig (gcc-10): 1 warning

sparc:
    allnoconfig (gcc-10): 5 warnings
    sparc32_defconfig (gcc-10): 6 warnings
    sparc64_defconfig (gcc-10): 26 warnings
    sparc64_defconfig+debug (gcc-10): 24 warnings
    sparc64_defconfig+kselftest (gcc-10): 25 warnings
    tinyconfig (gcc-10): 5 warnings

x86_64:
    x86_64_defconfig (gcc-10): 1 error, 1 warning
    x86_64_defconfig+kselftest (gcc-10): 1 error, 1 warning
    x86_64_defconfig+kselftest (rustc-1.73): 1 warning
    x86_64_defconfig+x86-board (gcc-10): 1 error, 1 warning
    x86_64_defconfig+x86-board+kselftest (gcc-10): 1 error, 1 warning

Errors summary:

    37   arch/mips/kernel/signal.c:903:17: error: no previous prototype for=
 =E2=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    37   arch/mips/kernel/signal.c:673:17: error: no previous prototype for=
 =E2=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    37   arch/mips/kernel/signal.c:515:5: error: no previous prototype for =
=E2=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    37   arch/mips/kernel/signal.c:438:5: error: no previous prototype for =
=E2=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    33   arch/mips/kernel/signal.c:636:17: error: no previous prototype for=
 =E2=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    18   arch/mips/kernel/syscall.c:51:16: error: no previous prototype for=
 =E2=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]
    14   arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=
=80=98do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    3    include/linux/fortify-string.h:57:29: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]
    3    arch/mips/ralink/irq.c:92:14: error: no previous prototype for =E2=
=80=98get_c0_compare_int=E2=80=99 [-Werror=3Dmissing-prototypes]
    3    arch/mips/ralink/irq.c:86:5: error: no previous prototype for =E2=
=80=98get_c0_perfcount_int=E2=80=99 [-Werror=3Dmissing-prototypes]
    3    arch/mips/mm/init.c:60:6: error: no previous prototype for =E2=80=
=98setup_zero_pages=E2=80=99 [-Werror=3Dmissing-prototypes]
    3    arch/mips/dec/reset.c:38:13: error: no previous prototype for =E2=
=80=98dec_intr_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    3    arch/mips/dec/reset.c:32:17: error: no previous prototype for =E2=
=80=98dec_machine_power_off=E2=80=99 [-Werror=3Dmissing-prototypes]
    3    arch/mips/dec/reset.c:27:17: error: no previous prototype for =E2=
=80=98dec_machine_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    3    arch/mips/dec/reset.c:22:17: error: no previous prototype for =E2=
=80=98dec_machine_restart=E2=80=99 [-Werror=3Dmissing-prototypes]
    2    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset =
32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]
    2    arch/x86/include/asm/string_32.h:150:25: error: =E2=80=98__builtin=
_memcpy=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bou=
nds]
    2    arch/mips/sgi-ip22/ip22-time.c:119:18: error: no previous prototyp=
e for =E2=80=98indy_8254timer_irq=E2=80=99 [-Werror=3Dmissing-prototypes]
    2    arch/mips/loongson64/dma.c:25:13: error: no previous prototype for=
 =E2=80=98plat_swiotlb_setup=E2=80=99 [-Werror=3Dmissing-prototypes]
    2    arch/mips/loongson32/common/platform.c:71:5: error: no previous pr=
ototype for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Werror=3Dmissing-prototyp=
es]
    1    fs/proc/task_mmu.c:2130:21: error: 'HPAGE_SIZE' undeclared (first =
use in this function); did you mean 'PAGE_SIZE'?
    1    arch/mips/sni/reset.c:45:6: error: no previous prototype for =E2=
=80=98sni_machine_power_off=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/sni/reset.c:28:6: error: no previous prototype for =E2=
=80=98sni_machine_restart=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/sibyte/sb1250/setup.c:79:5: error: no previous prototype=
 for =E2=80=98sb1250_m3_workaround_needed=E2=80=99 [-Werror=3Dmissing-proto=
types]
    1    arch/mips/sibyte/sb1250/setup.c:168:13: error: no previous prototy=
pe for =E2=80=98sb1250_setup=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/setup.c:104:13: error: no previous protot=
ype for =E2=80=98bcm1480_setup=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/sgi-ip32/ip32-berr.c:35:13: error: no previous prototype=
 for =E2=80=98ip32_be_init=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/sgi-ip27/ip27-berr.c:82:13: error: no previous prototype=
 for =E2=80=98ip27_be_init=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/sgi-ip27/ip27-berr.c:60:5: error: no previous prototype =
for =E2=80=98ip27_be_handler=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/rb532/serial.c:48:12: error: no previous prototype for =
=E2=80=98setup_serial_port=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/loongson2ef/common/machtype.c:34:20: error: no previous =
prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Werror=3Dmissing-=
prototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: error: no p=
revious prototype for =E2=80=98pci_ide_read_reg=E2=80=99 [-Werror=3Dmissing=
-prototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: error: no p=
revious prototype for =E2=80=98pci_ide_write_reg=E2=80=99 [-Werror=3Dmissin=
g-prototypes]
    1    arch/mips/lantiq/xway/clk.c:77:15: error: no previous prototype fo=
r =E2=80=98ltq_ar9_sys_hz=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/jazz/irq.c:55:13: error: no previous prototype for =E2=
=80=98init_r4030_ints=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/jazz/irq.c:38:6: error: no previous prototype for =E2=80=
=98disable_r4030_irq=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/jazz/irq.c:128:13: error: no previous prototype for =E2=
=80=98plat_time_init=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/cobalt/reset.c:46:6: error: no previous prototype for =
=E2=80=98cobalt_machine_restart=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/cobalt/reset.c:32:6: error: no previous prototype for =
=E2=80=98cobalt_machine_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/cavium-octeon/octeon-platform.c:701:13: error: no previo=
us prototype for =E2=80=98octeon_fill_mac_addresses=E2=80=99 [-Werror=3Dmis=
sing-prototypes]
    1    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:53:6: e=
rror: no previous prototype for =E2=80=98__cvmx_interrupt_gmxx_rxx_int_en_e=
nable=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/bcm63xx/boards/board_bcm963xx.c:705:5: error: no previou=
s prototype for =E2=80=98bcm63xx_get_fallback_sprom=E2=80=99 [-Werror=3Dmis=
sing-prototypes]
    1    arch/mips/alchemy/common/prom.c:59:7: error: no previous prototype=
 for =E2=80=98prom_getenv=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/alchemy/common/prom.c:48:13: error: no previous prototyp=
e for =E2=80=98prom_init_cmdline=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/alchemy/common/prom.c:127:12: error: no previous prototy=
pe for =E2=80=98prom_get_ethernet_addr=E2=80=99 [-Werror=3Dmissing-prototyp=
es]
    1    arch/mips/alchemy/board-mtx1.c:53:13: error: no previous prototype=
 for =E2=80=98board_setup=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/mips/alchemy/board-gpr.c:61:13: error: no previous prototype =
for =E2=80=98board_setup=E2=80=99 [-Werror=3Dmissing-prototypes]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    108  cc1: all warnings being treated as errors
    13   arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype fo=
r 'syscall_trace_enter' [-Wmissing-prototypes]
    12   security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offse=
t 32 is out of the bounds [0, 0] [-Warray-bounds]
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype f=
or 'arc_kprobe_handler' [-Wmissing-prototypes]
    3    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98fre=
e_dma=E2=80=99 [-Wmissing-prototypes]
    3    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98req=
uest_dma=E2=80=99 [-Wmissing-prototypes]
    3    include/linux/fortify-string.h:57:29: warning: =E2=80=98__builtin_=
memcpy=E2=80=99 offset 32 is out of the bounds [0, 0] [-Warray-bounds]
    3    include/linux/fortify-string.h:402:12: warning: writing 1 byte int=
o a region of size 0 [-Wstringop-overflow=3D]
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
    3    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =
=E2=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =
=E2=80=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype=
 for =E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototyp=
e for =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-protot=
ypes]
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
    2    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype=
 for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototyp=
e for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to=
 !ENDBR: .text+0x14d439
    1    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous protot=
ype for =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-mxs.c:133:39: warning: no previous prototype f=
or =E2=80=98icoll_handle_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/include/asm/string.h:15:25: warning: =E2=80=98__builtin=
_memcpy=E2=80=99 offset 32 is out of the bounds [0, 0] [-Warray-bounds]
    1    ....../arch/sparc/kernel/traps_64.c:2035:6: warning: no previous p=
rototype for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    1    ................./arch/sparc/kernel/traps_64.c:253:6: warning: no =
previous prototype for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-p=
rototypes]

Section mismatches summary:

    2    WARNING: modpost: vmlinux: section mismatch in reference: at91_shd=
wc_probe+0xd8 (section: .text) -> at91_wakeup_status (section: .init.text)
    2    WARNING: modpost: vmlinux: section mismatch in reference: at91_pow=
eroff_probe+0x8c (section: .text) -> at91_wakeup_status (section: .init.tex=
t)
    2    WARNING: modpost: vmlinux: section mismatch in reference: at91_pow=
eroff_probe+0x80 (section: .text) -> at91_wakeup_status (section: .init.tex=
t)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings,=
 0 section mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warni=
ng, 0 section mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 3 warnings, 0 section =
mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98request_=
dma=E2=80=99 [-Wmissing-prototypes]
    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98free_dma=
=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =E2=80=
=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =E2=
=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/bcm63xx/boards/board_bcm963xx.c:705:5: error: no previous pro=
totype for =E2=80=98bcm63xx_get_fallback_sprom=E2=80=99 [-Werror=3Dmissing-=
prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/sibyte/bcm1480/setup.c:104:13: error: no previous prototype f=
or =E2=80=98bcm1480_setup=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warning, 0 se=
ction mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 2 warnings=
, 0 section mismatches

Errors:
    arch/mips/cavium-octeon/octeon-platform.c:701:13: error: no previous pr=
ototype for =E2=80=98octeon_fill_mac_addresses=E2=80=99 [-Werror=3Dmissing-=
prototypes]
    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:53:6: error:=
 no previous prototype for =E2=80=98__cvmx_interrupt_gmxx_rxx_int_en_enable=
=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/cobalt/reset.c:32:6: error: no previous prototype for =E2=80=
=98cobalt_machine_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/cobalt/reset.c:46:6: error: no previous prototype for =E2=80=
=98cobalt_machine_restart=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype f=
or =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 FAIL, 8 errors, 4 warnings, 0=
 section mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/mm/init.c:60:6: error: no previous prototype for =E2=80=98set=
up_zero_pages=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 3 warnings, 0=
 section mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 3 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/alchemy/common/prom.c:48:13: error: no previous prototype for=
 =E2=80=98prom_init_cmdline=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/alchemy/common/prom.c:59:7: error: no previous prototype for =
=E2=80=98prom_getenv=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/alchemy/common/prom.c:127:12: error: no previous prototype fo=
r =E2=80=98prom_get_ethernet_addr=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 8 errors, 2 warnings=
, 0 section mismatches

Errors:
    arch/mips/dec/reset.c:22:17: error: no previous prototype for =E2=80=98=
dec_machine_restart=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:27:17: error: no previous prototype for =E2=80=98=
dec_machine_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:32:17: error: no previous prototype for =E2=80=98=
dec_machine_power_off=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:38:13: error: no previous prototype for =E2=80=98=
dec_intr_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 FAIL, 10 errors, 3 warnings, =
0 section mismatches

Errors:
    arch/mips/dec/reset.c:22:17: error: no previous prototype for =E2=80=98=
dec_machine_restart=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:27:17: error: no previous prototype for =E2=80=98=
dec_machine_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:32:17: error: no previous prototype for =E2=80=98=
dec_machine_power_off=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:38:13: error: no previous prototype for =E2=80=98=
dec_intr_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 4 errors, 1 warning=
, 0 section mismatches

Errors:
    arch/mips/dec/reset.c:22:17: error: no previous prototype for =E2=80=98=
dec_machine_restart=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:27:17: error: no previous prototype for =E2=80=98=
dec_machine_halt=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:32:17: error: no previous prototype for =E2=80=98=
dec_machine_power_off=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/dec/reset.c:38:13: error: no previous prototype for =E2=80=98=
dec_intr_halt=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 2 warnings, 0 section mismatches

Warnings:
    include/linux/fortify-string.h:57:29: warning: =E2=80=98__builtin_memcp=
y=E2=80=99 offset 32 is out of the bounds [0, 0] [-Warray-bounds]
    include/linux/fortify-string.h:402:12: warning: writing 1 byte into a r=
egion of size 0 [-Wstringop-overflow=3D]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

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
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    include/linux/fortify-string.h:402:12: warning: writing 1 byte into a r=
egion of size 0 [-Wstringop-overflow=3D]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    include/linux/fortify-string.h:57:29: warning: =E2=80=98__builtin_memcp=
y=E2=80=99 offset 32 is out of the bounds [0, 0] [-Warray-bounds]
    include/linux/fortify-string.h:402:12: warning: writing 1 byte into a r=
egion of size 0 [-Wstringop-overflow=3D]

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 2 warnings, 0 =
section mismatches

Errors:
    arch/mips/loongson2ef/common/machtype.c:34:20: error: no previous proto=
type for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Werror=3Dmissing-proto=
types]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 FAIL, 8 errors, 4 warnings, 0 secti=
on mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/mm/init.c:60:6: error: no previous prototype for =E2=80=98set=
up_zero_pages=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    arch/mips/alchemy/board-gpr.c:61:13: error: no previous prototype for =
=E2=80=98board_setup=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 2 wa=
rnings, 0 section mismatches

Errors:
    fs/proc/task_mmu.c:2130:21: error: 'HPAGE_SIZE' undeclared (first use i=
n this function); did you mean 'PAGE_SIZE'?

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/x86/include/asm/string_32.h:150:25: error: =E2=80=98__builtin_memc=
py=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches

Errors:
    arch/x86/include/asm/string_32.h:150:25: error: =E2=80=98__builtin_memc=
py=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches

Errors:
    include/linux/fortify-string.h:57:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

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
ip22_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/sgi-ip22/ip22-time.c:119:18: error: no previous prototype for=
 =E2=80=98indy_8254timer_irq=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/sgi-ip27/ip27-berr.c:60:5: error: no previous prototype for =
=E2=80=98ip27_be_handler=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/sgi-ip27/ip27-berr.c:82:13: error: no previous prototype for =
=E2=80=98ip27_be_init=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/sgi-ip22/ip22-time.c:119:18: error: no previous prototype for=
 =E2=80=98indy_8254timer_irq=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/sgi-ip32/ip32-berr.c:35:13: error: no previous prototype for =
=E2=80=98ip32_be_init=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 FAIL, 3 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/jazz/irq.c:38:6: error: no previous prototype for =E2=80=98di=
sable_r4030_irq=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/jazz/irq.c:55:13: error: no previous prototype for =E2=80=98i=
nit_r4030_ints=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/jazz/irq.c:128:13: error: no previous prototype for =E2=80=98=
plat_time_init=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 se=
ction mismatches

Errors:
    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: error: no previo=
us prototype for =E2=80=98pci_ide_write_reg=E2=80=99 [-Werror=3Dmissing-pro=
totypes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: error: no previo=
us prototype for =E2=80=98pci_ide_read_reg=E2=80=99 [-Werror=3Dmissing-prot=
otypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 3 warnings, 0=
 section mismatches

Errors:
    arch/mips/loongson32/common/platform.c:71:5: error: no previous prototy=
pe for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 3 warnings, 0=
 section mismatches

Errors:
    arch/mips/loongson32/common/platform.c:71:5: error: no previous prototy=
pe for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/loongson64/dma.c:25:13: error: no previous prototype for =E2=
=80=98plat_swiotlb_setup=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 2 warnings, 0 =
section mismatches

Errors:
    arch/mips/loongson64/dma.c:25:13: error: no previous prototype for =E2=
=80=98plat_swiotlb_setup=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

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
malta_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warning, 0 secti=
on mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 3 warnings, 0 =
section mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warnin=
g, 0 section mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0 =
section mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings=
, 0 section mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 3 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 3 warnings, =
0 section mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

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
mtx1_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/alchemy/board-mtx1.c:53:13: error: no previous prototype for =
=E2=80=98board_setup=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux: section mismatch in reference: at91_poweroff=
_probe+0x80 (section: .text) -> at91_wakeup_status (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: at91_poweroff=
_probe+0x80 (section: .text) -> at91_wakeup_status (section: .init.text)

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux: section mismatch in reference: at91_poweroff=
_probe+0x8c (section: .text) -> at91_wakeup_status (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: at91_shdwc_pr=
obe+0xd8 (section: .text) -> at91_wakeup_status (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: at91_poweroff=
_probe+0x8c (section: .text) -> at91_wakeup_status (section: .init.text)
    WARNING: modpost: vmlinux: section mismatch in reference: at91_shdwc_pr=
obe+0xd8 (section: .text) -> at91_wakeup_status (section: .init.text)

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
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    include/linux/fortify-string.h:57:29: warning: =E2=80=98__builtin_memcp=
y=E2=80=99 offset 32 is out of the bounds [0, 0] [-Warray-bounds]

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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 FAIL, 8 errors, 3 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/ralink/irq.c:86:5: error: no previous prototype for =E2=80=98=
get_c0_perfcount_int=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: error: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

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
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 FAIL, 5 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/rb532/serial.c:48:12: error: no previous prototype for =E2=80=
=98setup_serial_port=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/sni/reset.c:28:6: error: no previous prototype for =E2=80=98s=
ni_machine_restart=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/sni/reset.c:45:6: error: no previous prototype for =E2=80=98s=
ni_machine_power_off=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 FAIL, 7 errors, 3 warnings, 0 secti=
on mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 FAIL, 9 errors, 4 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/ralink/irq.c:86:5: error: no previous prototype for =E2=80=98=
get_c0_perfcount_int=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: error: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/syscall.c:51:16: error: no previous prototype for =E2=
=80=98sysm_pipe=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, =
0 section mismatches

Errors:
    arch/mips/sibyte/sb1250/setup.c:79:5: error: no previous prototype for =
=E2=80=98sb1250_m3_workaround_needed=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/sibyte/sb1250/setup.c:168:13: error: no previous prototype fo=
r =E2=80=98sb1250_setup=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

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
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98request_=
dma=E2=80=99 [-Wmissing-prototypes]
    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98free_dma=
=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =E2=80=
=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =E2=
=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]
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
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 25 wa=
rnings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    ................./arch/sparc/kernel/traps_64.c:253:6: warning: no previ=
ous prototype for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-protot=
ypes]
    ....../arch/sparc/kernel/traps_64.c:2035:6: warning: no previous protot=
ype for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/include/asm/string.h:15:25: warning: =E2=80=98__builtin_memc=
py=E2=80=99 offset 32 is out of the bounds [0, 0] [-Warray-bounds]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
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
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0 section m=
ismatches

Errors:
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98request_=
dma=E2=80=99 [-Wmissing-prototypes]
    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98free_dma=
=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =E2=80=
=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =E2=
=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]

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
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

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
vocore2_defconfig (mips, gcc-10) =E2=80=94 FAIL, 9 errors, 4 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/ralink/irq.c:86:5: error: no previous prototype for =E2=80=98=
get_c0_perfcount_int=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: error: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/mm/fault.c:323:17: error: no previous prototype for =E2=80=98=
do_page_fault=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/mm/init.c:60:6: error: no previous prototype for =E2=80=98set=
up_zero_pages=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:438:5: error: no previous prototype for =E2=
=80=98setup_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:515:5: error: no previous prototype for =E2=
=80=98restore_sigcontext=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:636:17: error: no previous prototype for =E2=
=80=98sys_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:673:17: error: no previous prototype for =E2=
=80=98sys_rt_sigreturn=E2=80=99 [-Werror=3Dmissing-prototypes]
    arch/mips/kernel/signal.c:903:17: error: no previous prototype for =E2=
=80=98do_notify_resume=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset 32 is=
 out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0 section mismatches

Errors:
    include/linux/fortify-string.h:57:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !END=
BR: .text+0x14d439

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0 section mismatches

Errors:
    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset 32 is=
 out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board+kselftest (x86_64, gcc-10) =E2=80=94 FAIL, 1 err=
or, 1 warning, 0 section mismatches

Errors:
    include/linux/fortify-string.h:57:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/lantiq/xway/clk.c:77:15: error: no previous prototype for =E2=
=80=98ltq_ar9_sys_hz=E2=80=99 [-Werror=3Dmissing-prototypes]

Warnings:
    cc1: all warnings being treated as errors

---
For more info write to <info@kernelci.org>

