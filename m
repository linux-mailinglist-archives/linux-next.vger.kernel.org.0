Return-Path: <linux-next+bounces-992-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3B3849395
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 06:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42EF81F235C1
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 05:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F08111BD;
	Mon,  5 Feb 2024 05:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="TTQbH4Zs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028F11190
	for <linux-next@vger.kernel.org>; Mon,  5 Feb 2024 05:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707112439; cv=none; b=jLs1T9PqauNbq2QzQsWH5x0mzSPy1L9lMzkD8COVl6DNa+wgJ0DUR7YR/YmUlmMrq3/9YPeb0C0wKVI/onsoWJi6mq9S9g4jxJB05UvwY+VbHfS3kBeVykM4yjD6vM4psSqzn68Zq6XpdQ6mxep4upQje5eiaWMzAWsl3lp3oZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707112439; c=relaxed/simple;
	bh=yZkmwiqgsGRrws5PaT0rrpznNo4Ce4BSfHOBd97h5bc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=OFO4DVqWXhaK8p8WwqZGRyBvTXV9bevx6LfQC+h+CPHJAhbT050QiuqSNP/xluwGsCdVA5amwSpLw56/ecjAbwh7jK1Pn+jRNVmHWtbwLFsk+khsKdMULRyKXQkrSxMo2aIIiIJsDTMKpQZ/7b1D7q2WSd1pzz6W8Dl4E4ppsnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=TTQbH4Zs; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bfd27f6dc0so846370b6e.1
        for <linux-next@vger.kernel.org>; Sun, 04 Feb 2024 21:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1707112434; x=1707717234; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JxMbtn/30JseC/0I6Ng6XsTYBnWPhyWlFBqDg3D3oCw=;
        b=TTQbH4Zs0Upse/FxjgptsmRftDQhPaahGz3W8Fq5fR5gyLyokbAcKHDv0yT+9NS0Rb
         mzN+z7jtevQruQn5fh+sj5l9Llw0ekDjL9KoLhYy+09cZl4tahnQHVnR5F3PGPduqJjJ
         1Ffxk1cSLGAeMIaAohkOr5h0/R/ik4vg9+rXnZU+xR/1ChtX4fFXAiq9Lkn4i7GfB1WM
         WsyP8AP5rw6/tRH145Bix+bLldNjrzDJQn0jZFKjhZP83WgQcnfBktWmgwjAZ0isMZHL
         lVwU2CLl2lT/VoCRqaDCVwUrFffb0gvdQ7sdoK5j6/dHnL5wZbg/aJ1H6ap3tj2XXAQ3
         /vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707112434; x=1707717234;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxMbtn/30JseC/0I6Ng6XsTYBnWPhyWlFBqDg3D3oCw=;
        b=wPFf0lU8qb51XxDr2zfnng9k4P6LTlRMy1QxjlkAbTsRkqV9PZjxiyLEZjRatJC1p2
         1bwJJ8718Bt93q54Tj3ARWLlBsl1IMgwpIQ0q/b9YDA7o9IcjfzTBONiTSIwc1s9Ofk9
         DmjezDhjYPc+BbkpLsYp7/wDpsfhnK/he8+Gts+dbsZLJmJQo1QFeyr2EEj9MHAoCxOb
         NbDVQKp1C1omumAGFNJ4VwhH1lsiTi7maaQAjuVJN6dHk4onLRH/ojwyNIET7R6odTGG
         ndXjUvd6+qJCvkC6MGgXtfOK5mgOzKkDSJGkQvBk9FBqYX+OvY+/MVXopGZ2u8AVhYg6
         VnIw==
X-Gm-Message-State: AOJu0Ywh0Ly4qusLezFk0Z3WlFCx9f+uF2UvkyN9t4FsGzAs2KA+/OAD
	S62iG/OkmRCz6MYHspUve8kh/b680tndLsT9E1kj58Xlgq/vlmU9sG658cWpZIQ1FOiU0Dp8VNx
	3
X-Google-Smtp-Source: AGHT+IHYbVJicoA4Uki+ID7kvXeH9ZnHle8zExksnDoMoPX1G098TSCaRbYcheNX/DW+X17OSo6ZCg==
X-Received: by 2002:a05:6808:10d0:b0:3be:b99e:c4b5 with SMTP id s16-20020a05680810d000b003beb99ec4b5mr18822372ois.49.1707112434140;
        Sun, 04 Feb 2024 21:53:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a21-20020aa780d5000000b006d9c216a9e6sm5608444pfn.56.2024.02.04.21.53.52
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 21:53:52 -0800 (PST)
Message-ID: <65c077f0.a70a0220.8a13b.21c2@mx.google.com>
Date: Sun, 04 Feb 2024 21:53:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20240205
X-Kernelci-Report-Type: build
Subject: next/master build: 48 builds: 7 failed, 41 passed, 41 errors,
 96 warnings (next-20240205)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 48 builds: 7 failed, 41 passed, 41 errors, 96 warnings (=
next-20240205)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20240205/

Tree: next
Branch: master
Git Describe: next-20240205
Git Commit: 23e11d0318521e8693459b0e4d23aec614b3b68b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm:
    spitz_defconfig: (gcc-10) FAIL

i386:
    i386_defconfig+debug: (gcc-10) FAIL

sparc:
    sparc64_defconfig+debug: (gcc-10) FAIL
    sparc64_defconfig+kselftest: (gcc-10) FAIL

x86_64:
    x86_64_defconfig: (gcc-10) FAIL
    x86_64_defconfig+kselftest: (gcc-10) FAIL
    x86_64_defconfig+x86-board+kselftest: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-10): 1 warning
    haps_hs_smp_defconfig (gcc-10): 2 warnings
    nsimosci_hs_defconfig (gcc-10): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-10): 2 warnings
    vdk_hs38_smp_defconfig (gcc-10): 1 warning

arm64:
    defconfig+CONFIG_ARM64_16K_PAGES=3Dy (gcc-10): 1 warning

arm:
    collie_defconfig (gcc-10): 1 warning
    spitz_defconfig (gcc-10): 1 error

i386:
    i386_defconfig+debug (gcc-10): 1 error, 1 warning

mips:
    decstation_64_defconfig (gcc-10): 11 warnings
    decstation_r4k_defconfig (gcc-10): 9 warnings
    ip22_defconfig (gcc-10): 6 warnings
    jazz_defconfig (gcc-10): 5 warnings
    loongson1b_defconfig (gcc-10): 1 warning
    loongson1c_defconfig (gcc-10): 1 warning
    pic32mzda_defconfig (gcc-10): 1 warning

riscv:

sparc:
    sparc32_defconfig (gcc-10): 6 warnings
    sparc64_defconfig+debug (gcc-10): 6 errors, 21 warnings
    sparc64_defconfig+kselftest (gcc-10): 30 errors, 21 warnings

x86_64:
    x86_64_defconfig (gcc-10): 1 error, 1 warning
    x86_64_defconfig+kselftest (gcc-10): 1 error, 1 warning
    x86_64_defconfig+x86-board+kselftest (gcc-10): 1 error, 1 warning

Errors summary:

    4    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:157: unde=
fined reference to `__ubsan_handle_shift_out_of_bounds'
    3    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:177: unde=
fined reference to `__ubsan_handle_shift_out_of_bounds'
    2    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclo=
ck_gettime.c:362: undefined reference to `__ubsan_handle_type_mismatch_v1'
    2    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclo=
ck_gettime.c:326: undefined reference to `__ubsan_handle_type_mismatch_v1'
    2    include/linux/fortify-string.h:57:29: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]
    2    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:247: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'
    2    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:217: unde=
fined reference to `__ubsan_handle_shift_out_of_bounds'
    2    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:197: unde=
fined reference to `__ubsan_handle_shift_out_of_bounds'
    2    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:181: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'
    2    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:174: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'
    2    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:161: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'
    2    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:154: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'
    1    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/li=
nux/build/../arch/sparc/vdso/vclock_gettime.c:353: more undefined reference=
s to `__ubsan_handle_type_mismatch_v1' follow
    1    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/li=
nux/build/../arch/sparc/vdso/vclock_gettime.c:317: more undefined reference=
s to `__ubsan_handle_type_mismatch_v1' follow
    1    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/li=
nux/build/../arch/sparc/vdso/vclock_gettime.c:220: more undefined reference=
s to `__ubsan_handle_type_mismatch_v1' follow
    1    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/li=
nux/build/../arch/sparc/vdso/vclock_gettime.c:200: more undefined reference=
s to `__ubsan_handle_type_mismatch_v1' follow
    1    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/li=
nux/build/../arch/sparc/vdso/vclock_gettime.c:177: more undefined reference=
s to `__ubsan_handle_shift_out_of_bounds' follow
    1    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclo=
ck_gettime.c:180: undefined reference to `__ubsan_handle_type_mismatch_v1'
    1    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclo=
ck_gettime.c:160: undefined reference to `__ubsan_handle_type_mismatch_v1'
    1    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset =
32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]
    1    drivers/char/apm-emulation.c:91:2: error: redeclaration of enumera=
tor =E2=80=98SUSPEND_NONE=E2=80=99
    1    arch/x86/include/asm/string_32.h:150:25: error: =E2=80=98__builtin=
_memcpy=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bou=
nds]
    1    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:363: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'
    1    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:327: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'
    1    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:221: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'
    1    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:201: unde=
fined reference to `__ubsan_handle_type_mismatch_v1'

Warnings summary:

    5    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype fo=
r 'syscall_trace_enter' [-Wmissing-prototypes]
    4    cc1: all warnings being treated as errors
    4    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    3    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype f=
or 'arc_kprobe_handler' [-Wmissing-prototypes]
    2    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =
=E2=80=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-p=
rototypes]
    2    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototy=
pes]
    2    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-=
prototypes]
    2    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-protot=
ypes]
    2    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for=
 =E2=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype=
 for =E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototyp=
e for =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-protot=
ypes]
    2    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype=
 for =E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototyp=
e for =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototy=
pe for =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype f=
or =E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype =
for =E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype =
for =E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson32/common/platform.c:71:5: warning: no previous =
prototype for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototyp=
e for =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototyp=
e for =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous protot=
ype for =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =
=E2=80=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =
=E2=80=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =
=E2=80=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =
=E2=80=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =
=E2=80=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype fo=
r =E2=80=98which_prom=E2=80=99 [-Wmissing-prototypes]
    2    WARNING: unmet direct dependencies detected for PADATA
    1    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offse=
t 32 is out of the bounds [0, 0] [-Warray-bounds]
    1    kernel/dma.c:88:6: warning: no previous prototype for =E2=80=98fre=
e_dma=E2=80=99 [-Wmissing-prototypes]
    1    kernel/dma.c:70:5: warning: no previous prototype for =E2=80=98req=
uest_dma=E2=80=99 [-Wmissing-prototypes]
    1    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =
=E2=80=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]
    1    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous protot=
ype for =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-pic32-evic.c:164:5: warning: no previous proto=
type for =E2=80=98pic32_irq_domain_xlate=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for =
=E2=80=98__ucmpdi2=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/lib/cmpdi2.c:6:11: warning: no previous prototype for =
=E2=80=98__cmpdi2=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype=
 for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototyp=
e for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-time.c:119:18: warning: no previous protot=
ype for =E2=80=98indy_8254timer_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-gio.c:398:12: warning: no previous prototy=
pe for =E2=80=98ip22_gio_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-gio.c:249:6: warning: no previous prototyp=
e for =E2=80=98ip22_gio_set_64bit=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-berr.c:89:6: warning: no previous prototyp=
e for =E2=80=98ip22_be_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-berr.c:113:13: warning: no previous protot=
ype for =E2=80=98ip22_be_init=E2=80=99 [-Wmissing-prototypes]
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
    1    ......../arch/sparc/kernel/traps_64.c:2035:6: warning: no previous=
 prototype for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    1    ......................................................../arch/spar=
c/kernel/traps_64.c:253:6: warning: no previous prototype for =E2=80=98is_n=
o_fault_exception=E2=80=99 [-Wmissing-prototypes]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype f=
or =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 11 warning=
s, 0 section mismatches

Warnings:
    WARNING: unmet direct dependencies detected for PADATA
    WARNING: unmet direct dependencies detected for PADATA
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
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/irqchip/irq-pic32-evic.c:164:5: warning: no previous prototype =
for =E2=80=98pic32_irq_domain_xlate=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
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
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 FAIL, 6 errors, 21 warnin=
gs, 0 section mismatches

Errors:
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:197: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:157: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:217: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:177: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:157: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/linux/b=
uild/../arch/sparc/vdso/vclock_gettime.c:177: more undefined references to =
`__ubsan_handle_shift_out_of_bounds' follow

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

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 FAIL, 30 errors, 21 w=
arnings, 0 section mismatches

Errors:
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:161: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:201: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:154: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclock_ge=
ttime.c:160: undefined reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:247: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/linux/b=
uild/../arch/sparc/vdso/vclock_gettime.c:200: more undefined references to =
`__ubsan_handle_type_mismatch_v1' follow
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:197: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:157: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:181: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:221: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:174: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclock_ge=
ttime.c:180: undefined reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:247: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/linux/b=
uild/../arch/sparc/vdso/vclock_gettime.c:220: more undefined references to =
`__ubsan_handle_type_mismatch_v1' follow
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:217: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:177: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:161: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:327: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclock_ge=
ttime.c:326: undefined reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclock_ge=
ttime.c:326: undefined reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:154: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/linux/b=
uild/../arch/sparc/vdso/vclock_gettime.c:317: more undefined references to =
`__ubsan_handle_type_mismatch_v1' follow
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:157: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:181: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:363: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclock_ge=
ttime.c:362: undefined reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: /tmp/kci/linux/build/../arch/sparc/vdso/vclock_ge=
ttime.c:362: undefined reference to `__ubsan_handle_type_mismatch_v1'
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:174: undefined=
 reference to `__ubsan_handle_type_mismatch_v1'
    sparc64-linux-gnu-ld: arch/sparc/vdso/vclock_gettime.o:/tmp/kci/linux/b=
uild/../arch/sparc/vdso/vclock_gettime.c:353: more undefined references to =
`__ubsan_handle_type_mismatch_v1' follow
    /tmp/kci/linux/build/../arch/sparc/vdso/vclock_gettime.c:177: undefined=
 reference to `__ubsan_handle_shift_out_of_bounds'

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    ......................................................../arch/sparc/ker=
nel/traps_64.c:253:6: warning: no previous prototype for =E2=80=98is_no_fau=
lt_exception=E2=80=99 [-Wmissing-prototypes]
    ......../arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prot=
otype for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
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

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/char/apm-emulation.c:91:2: error: redeclaration of enumerator =
=E2=80=98SUSPEND_NONE=E2=80=99

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
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]

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
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warn=
ing, 0 section mismatches

Errors:
    include/linux/fortify-string.h:57:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]

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

---
For more info write to <info@kernelci.org>

