Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBA83AB38A
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 14:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhFQM3b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 08:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFQM3b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 08:29:31 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86616C06175F
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 05:27:23 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d7so3829406edx.0
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=dasXWH3vbrqnz/8qFPE8sSbqVTMnmvkZjNS38SkXCrY=;
        b=rMVybnc9cMfNAJTSJ3678hWH2pTH4ZqIVZO6v0GnLeoPZa45+UdxLsLgJhDvK1BKBh
         4KFaIdXmg/y3CoCMpyezLqLhS2W4lpWLJf7kJoJNXJ3TWrviLgZ5dCi4YVkbKbiRhv5C
         eQ7fKauGGuHgDi4UuMrJ7OUKIugUdhZMTwMVRAnKtJq8fPYWG+I7CZcF51nR3wvYWG79
         5kFT1o8W+fZiRlAuwZtDzeZRYvkdKYlFbWrpdK7Juj5oYUzeFvEyzyzqJJBBAGMKLd69
         UDnO0jTfx0U0l1RN22x+aVehvQu/xsSOdtwqzsgt2OACNmtHe61oHLZvfSYTob1s2Lfx
         Te9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=dasXWH3vbrqnz/8qFPE8sSbqVTMnmvkZjNS38SkXCrY=;
        b=HOsQt0gJ6f+Mp3Ie9dJEc/gtPHhUgHD1kjTIIZyc94FRKkSHm9GQraHWOlpt0JHj6p
         gJ2zVAuMlUqvPYXyFFiLJc4Ak3VytSLjCiMOIuNGXBEhXN186XWTBSLh2WP8uD2iCYaD
         ONPJ9uBODfM8So2u95qlkMDqJmIhw9cAShUPOEmtEISttzDPAyds4Z2Xiwyoo8e3wHbN
         suFq3ls1/4n62COPOTAjSwU0hWXyyT3U+PMY+7wuqUZXudm62RqwpSXlU6neiyD3vQ1E
         A1566mar9AKXMa140+AcSSF6wMsFLza2xnYp/UtEOQ7kzHXMQFNQyVtipqgVxOWrTxLV
         /4oQ==
X-Gm-Message-State: AOAM533Ta64ltViqQPbyOI1rMXf5eGpgabfxfbpy3SjM8cfyy/qrSZaO
        aXtW47WGXmvPqm48zNPzL4bfJavCV6qwnsOrr/nKnfji+hvBv+FY
X-Google-Smtp-Source: ABdhPJxUi/pHyLtsU8asHCjI4InTgxNRLnMu+BNiB4Vb2VcCk/8JhUCa2i6SBHHHaLrM+om6DdvTSbbiiC8Moq2lnhg=
X-Received: by 2002:a05:6402:220d:: with SMTP id cq13mr6102680edb.52.1623932841150;
 Thu, 17 Jun 2021 05:27:21 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 17 Jun 2021 17:57:10 +0530
Message-ID: <CA+G9fYsn-3rZXkHTtH33Oo0y97nfgkQmR_Echbu_-=WAbfo4Ug@mail.gmail.com>
Subject: [next] [clang] s390: clang: error: unable to execute command:
 Segmentation fault (core dumped)
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next 20210617 tag following s390 builds failed with clang-10,
clang-11 and clang-12.

Regressions found on s390:

 - build/clang-11-tinyconfig
 - build/clang-11-allnoconfig
 - build/clang-12-allnoconfig
 - build/clang-12-defconfig
 - build/clang-10-tinyconfig
 - build/clang-11-defconfig
 - build/clang-10-allnoconfig
 - build/clang-12-tinyconfig
 - build/clang-10-defconfig

Build log:
------------
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=s390
CROSS_COMPILE=s390x-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang'
PLEASE submit a bug report to https://bugs.llvm.org/ and include the
crash backtrace, preprocessed source, and associated run script.
Stack dump:
0.Program arguments: /usr/lib/llvm-12/bin/clang -cc1 -triple
s390x-unknown-linux-gnu -S -disable-free -disable-llvm-verifier
-discard-value-names -main-file-name core.c -mrelocation-model pic
-pic-level 2 -pic-is-pie -fno-delete-null-pointer-checks -mllvm
-warn-stack-size=2048 -mframe-pointer=none -relaxed-aliasing
-fmath-errno -fno-rounding-math -no-integrated-as
-mconstructor-aliases -target-cpu zEC12 -target-feature +soft-float
-mbackchain -mpacked-stack -msoft-float -mfloat-abi soft
-fno-split-dwarf-inlining -debug-info-kind=limited -dwarf-version=4
-debugger-tuning=gdb -nostdsysteminc -nobuiltininc -resource-dir
/usr/lib/llvm-12/lib/clang/12.0.1 -dependency-file
kernel/sched/.core.o.d -MT kernel/sched/core.o -isystem
/usr/lib/llvm-12/lib/clang/12.0.1/include -include
/builds/linux/include/linux/compiler-version.h -include
/builds/linux/include/linux/kconfig.h -include
/builds/linux/include/linux/compiler_types.h -I
/builds/linux/arch/s390/include -I ./arch/s390/include/generated -I
/builds/linux/include -I ./include -I
/builds/linux/arch/s390/include/uapi -I
./arch/s390/include/generated/uapi -I /builds/linux/include/uapi -I
./include/generated/uapi -D __KERNEL__ -D __PACK_STACK -D
CONFIG_AS_CFI_VAL_OFFSET=1 -D CC_USING_NOP_MCOUNT -D CC_USING_FENTRY
-I /builds/linux/kernel/sched -I ./kernel/sched -D
KBUILD_MODFILE=\"kernel/sched/core\" -D KBUILD_BASENAME=\"core\" -D
KBUILD_MODNAME=\"core\" -D __KBUILD_MODNAME=kmod_core
-fmacro-prefix-map=/builds/linux/= -O2 -Wall -Wundef
-Werror=strict-prototypes -Wno-trigraphs
-Werror=implicit-function-declaration -Werror=implicit-int
-Werror=return-type -Wno-format-security
-Werror=unknown-warning-option -Wno-sign-compare -Wno-frame-address
-Wno-address-of-packed-member -Wno-format-invalid-specifier -Wno-gnu
-Wno-unused-const-variable -Wdeclaration-after-statement -Wvla
-Wno-pointer-sign -Wno-array-bounds -Werror=date-time
-Werror=incompatible-pointer-types -Wno-initializer-overrides
-Wno-format -Wno-sign-compare -Wno-format-zero-length
-Wno-pointer-to-enum-cast
-Wno-tautological-constant-out-of-range-compare -std=gnu89
-fno-dwarf-directory-asm -fdebug-compilation-dir
/home/tuxbuild/.cache/tuxmake/builds/current -ferror-limit 19 -pg
-mfentry -mnop-mcount -mrecord-mcount -fwrapv -fno-signed-char
-fwchar-type=short -fno-signed-wchar -fgnuc-version=4.2.1
-vectorize-loops -vectorize-slp -o /tmp/core-eaad47.s -x c
/builds/linux/kernel/sched/core.c
1.<eof> parser at end of file
2.Code generation
3.Running pass 'Function Pass Manager' on module
'/builds/linux/kernel/sched/core.c'.
4.Running pass 'SystemZ DAG->DAG Pattern Instruction Selection' on
function '@trace_event_raw_event_sched_switch'
 #0 0x00007f7227e2e693 llvm::sys::PrintStackTrace(llvm::raw_ostream&,
int) (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xd12693)
 #1 0x00007f7227e2c9b0 llvm::sys::RunSignalHandlers()
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xd109b0)
 #2 0x00007f7227e2ecff (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xd12cff)
 #3 0x00007f722f7cb140 __restore_rt
(/lib/x86_64-linux-gnu/libpthread.so.0+0x14140)
 #4 0x00007f7227dba772 llvm::LLT::print(llvm::raw_ostream&) const
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xc9e772)
 #5 0x00007f72284a850b
llvm::SelectionDAGBuilder::visitInlineAsm(llvm::CallBase const&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x138c50b)
 #6 0x00007f722848ade7
llvm::SelectionDAGBuilder::visit(llvm::Instruction const&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x136ede7)
 #7 0x00007f72285198b9
llvm::SelectionDAGISel::SelectBasicBlock(llvm::ilist_iterator<llvm::ilist_detail::node_options<llvm::Instruction,
false, false, void>, false, true>,
llvm::ilist_iterator<llvm::ilist_detail::node_options<llvm::Instruction,
false, false, void>, false, true>, bool&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x13fd8b9)
 #8 0x00007f722851926a
llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm::Function const&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x13fd26a)
 #9 0x00007f7228516fa6
llvm::SelectionDAGISel::runOnMachineFunction(llvm::MachineFunction&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x13fafa6)
#10 0x00007f7229f07742 (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x2deb742)
#11 0x00007f722813b09e
llvm::MachineFunctionPass::runOnFunction(llvm::Function&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x101f09e)
#12 0x00007f7227f5619d
llvm::FPPassManager::runOnFunction(llvm::Function&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xe3a19d)
#13 0x00007f7227f5bb83 llvm::FPPassManager::runOnModule(llvm::Module&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xe3fb83)
#14 0x00007f7227f567ef
llvm::legacy::PassManagerImpl::run(llvm::Module&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xe3a7ef)
#15 0x00007f722e092be6
clang::EmitBackendOutput(clang::DiagnosticsEngine&,
clang::HeaderSearchOptions const&, clang::CodeGenOptions const&,
clang::TargetOptions const&, clang::LangOptions const&,
llvm::DataLayout const&, llvm::Module*, clang::BackendAction,
std::unique_ptr<llvm::raw_pwrite_stream,
std::default_delete<llvm::raw_pwrite_stream> >)
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1614be6)
#16 0x00007f722e32bd9f (/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x18add9f)
#17 0x00007f722d487054 clang::ParseAST(clang::Sema&, bool, bool)
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0xa09054)
#18 0x00007f722ea20268 clang::FrontendAction::Execute()
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1fa2268)
#19 0x00007f722e9adcf1
clang::CompilerInstance::ExecuteAction(clang::FrontendAction&)
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1f2fcf1)
#20 0x00007f722ea83282
clang::ExecuteCompilerInvocation(clang::CompilerInstance*)
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x2005282)
#21 0x0000000000413352 cc1_main(llvm::ArrayRef<char const*>, char
const*, void*) (/usr/lib/llvm-12/bin/clang+0x413352)
#22 0x00000000004116ce (/usr/lib/llvm-12/bin/clang+0x4116ce)
#23 0x00000000004114de main (/usr/lib/llvm-12/bin/clang+0x4114de)
#24 0x00007f7226c50d0a __libc_start_main
(/lib/x86_64-linux-gnu/libc.so.6+0x26d0a)
#25 0x000000000040e88a _start (/usr/lib/llvm-12/bin/clang+0x40e88a)
clang: error: unable to execute command: Segmentation fault (core dumped)
clang: error: clang frontend command failed due to signal (use -v to
see invocation)
Debian clang version 12.0.1-+rc1-1
Target: s390x-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/local/bin
clang: note: diagnostic msg:
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
clang: note: diagnostic msg: /tmp/core-86ba67.c
clang: note: diagnostic msg: /tmp/core-86ba67.sh
clang: note: diagnostic msg:

********************
make[3]: *** [/builds/linux/scripts/Makefile.build:272:
kernel/sched/core.o] Error 254

ref:
https://builds.tuxbuild.com/1u4ZMVtVqiZtUcCrP9YE89mx9iU/

Build:
--------
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 7d9c6b8147bdd76d7eb2cf6f74f84c6918ae0939
    git_short_log: 7d9c6b8147bd (\Add linux-next specific files for 20210617\)
    kconfig: defconfig
    target_arch: s390
    toolchain: clang-12

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
