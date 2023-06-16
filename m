Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED5E73279B
	for <lists+linux-next@lfdr.de>; Fri, 16 Jun 2023 08:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjFPGbi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Jun 2023 02:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344028AbjFPGbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Jun 2023 02:31:18 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C571732
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 23:30:54 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b512309d18so2486445ad.3
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 23:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686897053; x=1689489053;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=81Prze69r5spKX7Bs3Jz73xmtPg4qobllCwn7bcVYNM=;
        b=WwGlUcRr3YuEX3H8hl16SHcuxZ3ybfpL+Pi/aAncuVz7EHPrjAbJBCARNDWpu3ST1M
         nrby+UjQ458WM+JLwmGCi/J7pzQCeWAxtl8KqquefprguIPJal6yjlE7i8o2DmqwnvSu
         x8FaPQdQtC8RAUl9meaOdA5c3ISDtJq0Lqx/RjIr3y81wRwSuUewc/cO6m4YI4/pCUHo
         JeEnIhJ80qiu0OIaEBYSrZuBRxIaKtInOJZmxdXWrbK3n2G4H/3UM7SWPtnzbsGtjtdc
         2wYDR6rxhzcvCxJVXf2Bg9Q2yhElWGDsm31LLBoJa0g33sXSTHHYbqw4IzTO2y6MSiOP
         xmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686897053; x=1689489053;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81Prze69r5spKX7Bs3Jz73xmtPg4qobllCwn7bcVYNM=;
        b=cbeXPzR9asZxRr2qndTUkaNIfQeAJOwVQUTHvs+Dd7xXF2Q9bfZzF+KVgcb++z8HFV
         HiV1NryEZjvlfw+1HvgPeHWW1gAGArmeVVAU/Klx3xRR8JWlGNAgtKy1G0kVQyEQ7LvS
         EB5OIZMcykHu2podxCrQifDjRt3dlA/eKnU4mflvJ40Q4DRF8mRRinx62STlwn0O9kap
         s00/YBIcwiRUxu9WK+pZ9MhWjgdBRFWRSNglTITq76SV7uusA1H7T+0nHtcjgA4CqaL5
         X0Ysylp/dTQA5XcZYZtmvjha0JrMNE4fVMpeDSBhkRyOaOTEgKuwvRYEmafxnkUof44/
         FhGQ==
X-Gm-Message-State: AC+VfDzbVGL7g+ZBqR4wkqZN/2bMeUNFn0PnCKVRZ4VoPCsKxFnVqGCD
        AmqMP46pJsg7uF7hoI7RbMdArV+jcNTvXTfIi7gadA==
X-Google-Smtp-Source: ACHHUZ5Z4oIcfJUXIvi14vaOukhoY3fWtqsuZ3+y6cB8Ehmnks/YzXt0+0qtb8jQi/G9OPL5n2uVGw==
X-Received: by 2002:a17:903:2593:b0:1b1:8900:5211 with SMTP id jb19-20020a170903259300b001b189005211mr1033968plb.28.1686897051834;
        Thu, 15 Jun 2023 23:30:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902d51000b001af98dcf958sm15071855plg.288.2023.06.15.23.30.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 23:30:51 -0700 (PDT)
Message-ID: <648c019b.170a0220.d3a48.f6f5@mx.google.com>
Date:   Thu, 15 Jun 2023 23:30:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20230616
Subject: next/master build: 204 builds: 10 failed, 194 passed, 54 errors,
 49 warnings (next-20230616)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 204 builds: 10 failed, 194 passed, 54 errors, 49 warning=
s (next-20230616)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230616/

Tree: next
Branch: master
Git Describe: next-20230616
Git Commit: f7efed9f38f886edb450041b82a6f15d663c98f8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-17) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    allmodconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-17) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (gcc-10): 3 errors, 1 warning
    allmodconfig (clang-17): 13 errors

arm:
    allmodconfig (clang-17): 13 errors
    allmodconfig (gcc-10): 2 errors
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-17): 1 error
    tinyconfig (gcc-10): 1 warning

mips:
    fuloong2e_defconfig (gcc-10): 1 error
    ip27_defconfig (gcc-10): 2 errors
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 2 warnings

x86_64:
    allmodconfig (clang-17): 13 errors, 2 warnings
    allnoconfig (gcc-10): 3 warnings
    tinyconfig (gcc-10): 1 warning
    x86_64_defconfig (gcc-10): 3 warnings
    x86_64_defconfig+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+crypto (gcc-10): 3 warnings
    x86_64_defconfig+debug (gcc-10): 3 warnings
    x86_64_defconfig+ima (gcc-10): 3 warnings
    x86_64_defconfig+kselftest (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+x86_kvm_guest (gcc-10): 3 warnings

Errors summary:

    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    3    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    3    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    drivers/remoteproc/stm32_rproc.c:646:16: error: format =E2=80=98%z=
x=E2=80=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument =
4 has type =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
    1    drivers/remoteproc/stm32_rproc.c:125:16: error: format =E2=80=98%x=
=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argu=
ment 4 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=
=80=99} [-Werror=3Dformat=3D]
    1    drivers/remoteproc/stm32_rproc.c:122:15: error: format =E2=80=98%x=
=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argu=
ment 5 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=
=80=99} [-Werror=3Dformat=3D]
    1    clang: error: linker command failed with exit code 1 (use -v to se=
e invocation)
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    ERROR: modpost: "efx_tc_netevent_event" [drivers/net/ethernet/sfc/=
sfc.ko] undefined!
    1    ERROR: modpost: "efx_tc_netdev_event" [drivers/net/ethernet/sfc/sf=
c.ko] undefined!
    1    ERROR: modpost: "__aeabi_uldivmod" [sound/soc/loongson/snd-soc-loo=
ngson-i2s-pci.ko] undefined!
    1    ERROR: modpost: "__aeabi_ldivmod" [sound/soc/loongson/snd-soc-loon=
gson-i2s-pci.ko] undefined!

Warnings summary:

    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    8    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    6    vmlinux.o: warning: objtool: .altinstr_replacement+0x18a3: redunda=
nt UACCESS disable
    3    kernel/umh.c:497:12: warning: =E2=80=98proc_cap_handler=E2=80=99 d=
efined but not used [-Wunused-function]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x1e7c: redunda=
nt UACCESS disable
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x1a4a: redunda=
nt UACCESS disable
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b7: redunda=
nt UACCESS disable
    1    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redu=
ndant UACCESS disable
    1    kernel/umh.c:497:12: warning: 'proc_cap_handler' defined but not u=
sed [-Wunused-function]
    1    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x7762: sta=
ck state mismatch: cfa1=3D4+368 cfa2=3D4+360
    1    drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to elf_init=
_reloc_text_sym() for data symbol .rodata
    1    cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 3 errors, 1 warning, 0 section=
 mismatches

Errors:
    drivers/remoteproc/stm32_rproc.c:122:15: error: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 5 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=
=99} [-Werror=3Dformat=3D]
    drivers/remoteproc/stm32_rproc.c:125:16: error: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 4 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=
=99} [-Werror=3Dformat=3D]
    drivers/remoteproc/stm32_rproc.c:646:16: error: format =E2=80=98%zx=E2=
=80=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 ha=
s type =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 13 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 13 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section =
mismatches

Errors:
    ERROR: modpost: "__aeabi_uldivmod" [sound/soc/loongson/snd-soc-loongson=
-i2s-pci.ko] undefined!
    ERROR: modpost: "__aeabi_ldivmod" [sound/soc/loongson/snd-soc-loongson-=
i2s-pci.ko] undefined!

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-17) =E2=80=94 FAIL, 13 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1170:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1290:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1292:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1332:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1333:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1334:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1349:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1350:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1351:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1788:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1789:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1790:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

Warnings:
    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x7762: stack st=
ate mismatch: cfa1=3D4+368 cfa2=3D4+360
    drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to elf_init_relo=
c_text_sym() for data symbol .rodata

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redundant=
 UACCESS disable
    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to copy_io=
vec_from_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
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
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
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
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

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
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or direc=
tory

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
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "efx_tc_netevent_event" [drivers/net/ethernet/sfc/sfc.k=
o] undefined!
    ERROR: modpost: "efx_tc_netdev_event" [drivers/net/ethernet/sfc/sfc.ko]=
 undefined!

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/umh.c:497:12: warning: =E2=80=98proc_cap_handler=E2=80=99 define=
d but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/umh.c:497:12: warning: =E2=80=98proc_cap_handler=E2=80=99 define=
d but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/umh.c:497:12: warning: 'proc_cap_handler' defined but not used [=
-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/umh.c:497:12: warning: =E2=80=98proc_cap_handler=E2=80=99 define=
d but not used [-Wunused-function]

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
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18a3: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18a3: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b7: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1a4a: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18a3: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 war=
nings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1e7c: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18a3: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18a3: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18a3: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
