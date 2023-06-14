Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76E272F4F7
	for <lists+linux-next@lfdr.de>; Wed, 14 Jun 2023 08:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243236AbjFNGge (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jun 2023 02:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234706AbjFNGgE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jun 2023 02:36:04 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018641BC9
        for <linux-next@vger.kernel.org>; Tue, 13 Jun 2023 23:35:40 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666732027dbso1843b3a.1
        for <linux-next@vger.kernel.org>; Tue, 13 Jun 2023 23:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686724540; x=1689316540;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mvM170m8gEeZOBbSkGKkT3OLm1sVLX/OBMEXcci3EHI=;
        b=flgVL/7/8s7MPPo9xVz/jUG7T/aQNJB1N8fiS2eSlj//jxuRjygYZiClxNTzhYJZ/e
         FlFjZlAchJUYrswxb54v7yknInpyVtJYVQgiPbVjBKCyRJPMLjaEnbCc6FdBly8CYdFB
         OjesOuLJ6tj7lfOMdcitjoK7R+r4/j4Fa6DdL576xE8gH+QedUyttDAKuTqzRlZvQ0tp
         m8D/HMHg9yCvPLrQ3uPIqVzAIvC9E2i3q6e2k+l7HMxI4JQbIcBHkcuQkFc7Achj59gK
         lHqJYW3l4Gz/tJUTpvhL2zpLbqSKSCMXH54e3fTsoo5PwOB0jTrNM+SVMwRkEJ9Fbv4M
         XArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686724540; x=1689316540;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvM170m8gEeZOBbSkGKkT3OLm1sVLX/OBMEXcci3EHI=;
        b=N2Pq7QSfd1OCRKfxnTTAxTFdTqQsrBvv355k6UuDf1bCvKSZeRHf8Hj6OHej1h3xb4
         HglvqUWnEzgxi6F0bwJXSvggphFvRoBWYPB5ssTpSVuSI05WyVY0h3LGPDA+BciWIiPx
         a6oD6UWbox8mtSouC22LP2oZkq/wVQ/5O+7GlC/FMxTql8sf+8bRR8LrQxkEGwhncD0H
         /zn4V6lIZkyapChU+vWoN9ZtwNfVL3rGHEg9jotsLqdguiCw/ar/8YNOeqXnWRW2CKUj
         o3Q1mWrV0WUKT2a3nyZM2sh5WVSVstHZcnaB2/J39Wp7xYBbDwDOCo358kFhLYi4Pv5r
         //Bg==
X-Gm-Message-State: AC+VfDyAjxZjBo1S4mpdAaL6lgNPMH5RQN4W1052Wrzpi4LNEFbrAzH9
        aETSrzVD6rfjsHMTpj+Em1oNcc2f+LLgBU1AF0y1Rw==
X-Google-Smtp-Source: ACHHUZ7A1/2dtMKeWM3JnWDCgX5NPLch37F1ihtUW+TZtvN0kfkGm1eRip3djS3m9ccf1GN7XM87aw==
X-Received: by 2002:a05:6a20:2d9:b0:117:3239:4681 with SMTP id 25-20020a056a2002d900b0011732394681mr867673pzb.18.1686724537716;
        Tue, 13 Jun 2023 23:35:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iy2-20020a170903130200b001b3be9fc73fsm6115646plb.1.2023.06.13.23.35.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 23:35:36 -0700 (PDT)
Message-ID: <64895fb8.170a0220.44fd.c285@mx.google.com>
Date:   Tue, 13 Jun 2023 23:35:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20230614
Subject: next/master build: 205 builds: 10 failed, 195 passed, 65 errors,
 53 warnings (next-20230614)
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

next/master build: 205 builds: 10 failed, 195 passed, 65 errors, 53 warning=
s (next-20230614)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230614/

Tree: next
Branch: master
Git Describe: next-20230614
Git Commit: b16049b21162bb649cdd8519642a35972b7910fe
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
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    cavium_octeon_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-17) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-17): 13 errors
    allmodconfig (gcc-10): 3 errors, 1 warning

arm:
    allmodconfig (clang-17): 13 errors
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-17): 13 errors
    tinyconfig (gcc-10): 1 warning

mips:
    cavium_octeon_defconfig (gcc-10): 1 error, 1 warning
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
    x86_64_defconfig+x86-chromebook+kselftest (gcc-10): 3 warnings
    x86_64_defconfig+x86_kvm_guest (gcc-10): 3 warnings

Errors summary:

    4    drivers/scsi/aacraid/commsup.c:1786:15: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1785:15: error: array index 2 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1784:15: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1347:18: error: array index 4 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1346:18: error: array index 6 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1345:18: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1330:19: error: array index 4 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1329:50: error: array index 5 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1329:19: error: array index 6 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1328:18: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1288:21: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1286:20: error: array index 3 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    drivers/scsi/aacraid/commsup.c:1166:17: error: array index 1 is pa=
st the end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), ca=
st to '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
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
    1    drivers/ata/pata_octeon_cf.c:835:7: error: implicit declaration of=
 function =E2=80=98of_property_read_reg=E2=80=99; did you mean =E2=80=98of_=
property_read_s32=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    ERROR: modpost: "efx_tc_netevent_event" [drivers/net/ethernet/sfc/=
sfc.ko] undefined!
    1    ERROR: modpost: "efx_tc_netdev_event" [drivers/net/ethernet/sfc/sf=
c.ko] undefined!

Warnings summary:

    10   vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    6    vmlinux.o: warning: objtool: .altinstr_replacement+0x1899: redunda=
nt UACCESS disable
    3    kernel/umh.c:497:12: warning: =E2=80=98proc_cap_handler=E2=80=99 d=
efined but not used [-Wunused-function]
    2    vmlinux.o: warning: objtool: .altinstr_replacement+0x1e72: redunda=
nt UACCESS disable
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x1a40: redunda=
nt UACCESS disable
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x18ad: redunda=
nt UACCESS disable
    1    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redu=
ndant UACCESS disable
    1    kernel/umh.c:497:12: warning: 'proc_cap_handler' defined but not u=
sed [-Wunused-function]
    1    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x775c: sta=
ck state mismatch: cfa1=3D4+368 cfa2=3D4+360
    1    drivers/misc/lkdtm/lkdtm.o: warning: objtool: bad call to elf_init=
_reloc_text_sym() for data symbol .rodata
    1    cc1: some warnings being treated as errors
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
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 13 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1166:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1286:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1288:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1328:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1329:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1329:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1330:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1345:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1346:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1347:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1784:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1785:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1786:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 13 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1166:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1286:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1288:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1328:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1329:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1329:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1330:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1345:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1346:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1347:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1784:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1785:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1786:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 13 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1166:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1286:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1288:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1328:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1329:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1329:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1330:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1345:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1346:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1347:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1784:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1785:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1786:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
allmodconfig (x86_64, clang-17) =E2=80=94 FAIL, 13 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    drivers/scsi/aacraid/commsup.c:1166:17: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1286:20: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1288:21: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1328:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1329:19: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1329:50: error: array index 5 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1330:19: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1345:18: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1346:18: error: array index 6 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1347:18: error: array index 4 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1784:15: error: array index 1 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1785:15: error: array index 2 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]
    drivers/scsi/aacraid/commsup.c:1786:15: error: array index 3 is past th=
e end of the array (that has type 'u8[1]' (aka 'unsigned char[1]'), cast to=
 '__le32 *' (aka 'unsigned int *')) [-Werror,-Warray-bounds]

Warnings:
    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x775c: stack st=
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
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches

Errors:
    drivers/ata/pata_octeon_cf.c:835:7: error: implicit declaration of func=
tion =E2=80=98of_property_read_reg=E2=80=99; did you mean =E2=80=98of_prope=
rty_read_s32=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

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
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
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
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/umh.c:497:12: warning: 'proc_cap_handler' defined but not used [=
-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/umh.c:497:12: warning: =E2=80=98proc_cap_handler=E2=80=99 define=
d but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/umh.c:497:12: warning: =E2=80=98proc_cap_handler=E2=80=99 define=
d but not used [-Wunused-function]

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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1899: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1899: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18ad: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1a40: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1899: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1e72: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1899: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1899: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1e72: redundant UA=
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
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1899: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
