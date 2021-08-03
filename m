Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE793DF893
	for <lists+linux-next@lfdr.de>; Wed,  4 Aug 2021 01:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbhHCXjN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Aug 2021 19:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbhHCXjN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Aug 2021 19:39:13 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3466C061757
        for <linux-next@vger.kernel.org>; Tue,  3 Aug 2021 16:39:01 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id a20so1037089plm.0
        for <linux-next@vger.kernel.org>; Tue, 03 Aug 2021 16:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uJex2GxiP3L71jQtt+JjK5YiwYrMsMCoEZV3V5u/uic=;
        b=bXeas9S9jcnHvha1I59YjNjh05+oD0BpPkuKaXtZkCW81ReWhtY2saVrLQLKL8hLNm
         8aakwT7joPCJ162sgmlLlzpCYvb0f4y9nuXDHYh5pz6oCLk4diFxNdKjLfZwhIyu/L+d
         CaskjHc4Jp/B+3Y0vLuqDREyr3WWV0FJQ4Um6JRCYAdwVlO/x0dBF4+uSMUm+mSdWb3H
         HW/LQxvZBeCivEiJxCqTZGSuADTCcy9/l/gJ091edXnpCd2tRkysExwDzqltc1y8yoQU
         rqsnrV+g5/MEfTm67ur8fIHzRQV4tWtYD7CeBCyebdj13RI9hZnBF3XgUB5JWnVY4VdY
         1Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uJex2GxiP3L71jQtt+JjK5YiwYrMsMCoEZV3V5u/uic=;
        b=s/ruLAtOpG/ysShodvdpQwdeEBvC88x+JpkzPHHm7UMc+ljgvkfbQwZri25gsow4n/
         yna+VrwUVpMaNpDk68FlAWDoCbV7rBmH5HdsI7e40CITC+9b5kfWoRREbfKNr7xuMuZT
         yEeXftPsY1xfwrN4me4Yg28SmKXwKIyezHW023o8UhaOdBj2Ot9hN8e2w/7knuT9Avqd
         jhtTeL+jX1P3WMgMC8O6DExQ5dyxephEx/L9ETf0uHlgMOPXAGMiIeD3oUYPglosMBmM
         YH1Og7/bWWZKIE6haMgrqArpEAxTs9SgZRo2fMlwHn02S6y55NLf1uSRDcfqlpLan/5d
         q6oA==
X-Gm-Message-State: AOAM531UBZz1FivEh16iDxjMH/UN+p3nZ5sWmkqnOz+9Z00gWtafJEtz
        n8l3P3GqOkLWFHzeEMiC46eDkYTWH8FCyGJE
X-Google-Smtp-Source: ABdhPJyzEdpJwrFCaNTFqrNCdjDuzGAsfoCO7AiMBPHiB52gZbDfZLzSqU/MYWLVHZVBTfKploqabw==
X-Received: by 2002:a17:90a:987:: with SMTP id 7mr6525493pjo.115.1628033940680;
        Tue, 03 Aug 2021 16:39:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 21sm302378pfh.103.2021.08.03.16.38.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 16:39:00 -0700 (PDT)
Message-ID: <6109d394.1c69fb81.e8481.1b12@mx.google.com>
Date:   Tue, 03 Aug 2021 16:39:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210803
X-Kernelci-Report-Type: build
Subject: next/master build: 213 builds: 9 failed, 204 passed, 26 errors,
 175 warnings (next-20210803)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 213 builds: 9 failed, 204 passed, 26 errors, 175 warning=
s (next-20210803)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210803/

Tree: next
Branch: master
Git Describe: next-20210803
Git Commit: c3f7b3be172b39d90b4c5cb87a2231cc6c2c8dcf
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    tinyconfig: (gcc-8) FAIL

arm64:
    allmodconfig: (gcc-8) FAIL

mips:
    bcm63xx_defconfig: (gcc-8) FAIL
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL
    rbtx49xx_defconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

riscv:
    nommu_k210_defconfig: (gcc-8) FAIL
    nommu_k210_sdcard_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-8): 2 warnings
    tinyconfig (gcc-8): 4 errors

arm64:
    allmodconfig (gcc-8): 2 errors, 7 warnings
    allmodconfig (clang-10): 46 warnings
    defconfig (clang-12): 7 warnings
    defconfig (clang-10): 8 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 7 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 8 warnings

arm:
    allmodconfig (clang-10): 63 warnings
    multi_v5_defconfig (clang-12): 3 warnings
    multi_v5_defconfig (clang-10): 3 warnings
    multi_v7_defconfig (clang-12): 6 warnings
    multi_v7_defconfig (clang-10): 6 warnings

i386:

mips:
    bcm63xx_defconfig (gcc-8): 4 errors
    rbtx49xx_defconfig (gcc-8): 4 errors
    rm200_defconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 4 errors

riscv:
    nommu_k210_defconfig (gcc-8): 4 errors
    nommu_k210_sdcard_defconfig (gcc-8): 4 errors
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    x86_64_defconfig (clang-10): 2 warnings

Errors summary:

    6    kernel/user.c:225:36: error: =E2=80=98struct user_struct=E2=80=99 =
has no member named =E2=80=98epoll_watches=E2=80=99
    6    kernel/user.c:203:31: error: =E2=80=98struct user_struct=E2=80=99 =
has no member named =E2=80=98epoll_watches=E2=80=99
    6    kernel/user.c:189:31: error: =E2=80=98struct user_struct=E2=80=99 =
has no member named =E2=80=98epoll_watches=E2=80=99
    6    kernel/user.c:141:28: error: =E2=80=98struct user_struct=E2=80=99 =
has no member named =E2=80=98epoll_watches=E2=80=99
    1    ./../include/linux/compiler_types.h:328:38: error: call to =E2=80=
=98__compiletime_assert_1869=E2=80=99 declared with attribute error: FIELD_=
PREP: value too large for the field
    1    ./../include/linux/compiler_types.h:328:38: error: call to =E2=80=
=98__compiletime_assert_1862=E2=80=99 declared with attribute error: FIELD_=
PREP: value too large for the field

Warnings summary:

    45   1 warning generated.
    10   drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninit=
ialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    10   drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' t=
o silence this warning
    8    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6:=
 warning: variable 'ret' is used uninitialized whenever 'if' condition is f=
alse [-Wsometimes-uninitialized]
    8    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9:=
 note: initialize the variable 'ret' to silence this warning
    6    2 warnings generated.
    3    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-rc4-next-20210803/kernel/drivers/media/tuners/tuner-types=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    net/netfilter/ipset/ip_set_hash_ipportnet.c:249:39: warning: varia=
ble 'port' is uninitialized when used here [-Wuninitialized]
    2    net/netfilter/ipset/ip_set_hash_ipportnet.c:249:29: warning: varia=
ble 'port_to' is uninitialized when used here [-Wuninitialized]
    2    net/netfilter/ipset/ip_set_hash_ipportnet.c:167:45: note: initiali=
ze the variable 'port_to' to silence this warning
    2    net/netfilter/ipset/ip_set_hash_ipportnet.c:167:36: note: initiali=
ze the variable 'port' to silence this warning
    2    drivers/staging/r8188eu/hal/usb_halinit.c:1303:19: warning: equali=
ty comparison with extraneous parentheses [-Wparentheses-equality]
    2    drivers/staging/r8188eu/hal/usb_halinit.c:1303:19: note: remove ex=
traneous parentheses around the comparison to silence this warning
    2    drivers/staging/r8188eu/hal/rtl8188e_rf6052.c:344:13: warning: exp=
licitly assigning value of variable of type 'u32' (aka 'unsigned int') to i=
tself [-Wself-assign]
    2    drivers/staging/r8188eu/hal/odm.c:1634:27: warning: equality compa=
rison with extraneous parentheses [-Wparentheses-equality]
    2    drivers/staging/r8188eu/hal/odm.c:1634:27: note: remove extraneous=
 parentheses around the comparison to silence this warning
    2    drivers/staging/r8188eu/core/rtw_wlan_util.c:1309:34: warning: equ=
ality comparison with extraneous parentheses [-Wparentheses-equality]
    2    drivers/staging/r8188eu/core/rtw_wlan_util.c:1309:34: note: remove=
 extraneous parentheses around the comparison to silence this warning
    2    drivers/staging/r8188eu/core/rtw_sta_mgt.c:156:13: warning: compar=
ison of address of 'psta->lock' not equal to a null pointer is always true =
[-Wtautological-pointer-compare]
    2    drivers/staging/r8188eu/core/rtw_security.c:1457:26: warning: equa=
lity comparison with extraneous parentheses [-Wparentheses-equality]
    2    drivers/staging/r8188eu/core/rtw_security.c:1457:26: note: remove =
extraneous parentheses around the comparison to silence this warning
    2    drivers/staging/r8188eu/core/rtw_security.c:1214:24: warning: equa=
lity comparison with extraneous parentheses [-Wparentheses-equality]
    2    drivers/staging/r8188eu/core/rtw_security.c:1214:24: note: remove =
extraneous parentheses around the comparison to silence this warning
    2    drivers/staging/r8188eu/core/rtw_pwrctrl.c:222:21: warning: equali=
ty comparison with extraneous parentheses [-Wparentheses-equality]
    2    drivers/staging/r8188eu/core/rtw_pwrctrl.c:222:21: note: remove ex=
traneous parentheses around the comparison to silence this warning
    2    drivers/staging/r8188eu/core/rtw_mlme.c:1641:28: warning: address =
of array 'pmlmepriv->assoc_ssid.Ssid' will always evaluate to 'true' [-Wpoi=
nter-bool-conversion]
    2    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:114:10: warning: i=
mplicit conversion from enumeration type 'enum mt76_cipher_type' to differe=
nt enumeration type 'enum mcu_cipher_type' [-Wenum-conversion]
    2    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:114:10: warning: i=
mplicit conversion from enumeration type 'enum mt76_cipher_type' to differe=
nt enumeration type 'enum mcu_cipher_type' [-Wenum-conversion]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    #warning This code requires at least version 4.6 of GCC
    1    kernel/trace/trace_osnoise.c:1461:8: warning: =E2=80=98main=E2=80=
=99 is usually a function [-Wmain]
    1    kernel/trace/trace_events_hist.c:4611:13: warning: stack frame siz=
e of 1392 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3328 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame siz=
e of 1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame si=
ze of 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    1    drivers/soc/ixp4xx/ixp4xx-npe.c:710:17: warning: format =E2=80=98%=
x=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but arg=
ument 5 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long =
unsigned int=E2=80=99} [-Wformat=3D]
    1    drivers/soc/ixp4xx/ixp4xx-npe.c:710:17: warning: format =E2=80=98%=
x=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but arg=
ument 4 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long =
unsigned int=E2=80=99} [-Wformat=3D]
    1    drivers/soc/ixp4xx/ixp4xx-npe.c:705:18: warning: format =E2=80=98%=
x=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but arg=
ument 5 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long =
unsigned int=E2=80=99} [-Wformat=3D]
    1    drivers/soc/ixp4xx/ixp4xx-npe.c:705:18: warning: format =E2=80=98%=
x=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but arg=
ument 4 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long =
unsigned int=E2=80=99} [-Wformat=3D]
    1    drivers/soc/ixp4xx/ixp4xx-npe.c:696:18: warning: format =E2=80=98%=
x=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but arg=
ument 5 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long =
unsigned int=E2=80=99} [-Wformat=3D]
    1    drivers/soc/ixp4xx/ixp4xx-npe.c:696:18: warning: format =E2=80=98%=
x=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but arg=
ument 4 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long =
unsigned int=E2=80=99} [-Wformat=3D]
    1    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame =
size of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_relocate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-=
1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5536 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    1    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    crypto/wp512.c:782:13: warning: stack frame size of 1192 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-rc4-next-20210803/kernel/sound/soc/intel/boards/snd-soc-i=
ntel-hda-dsp-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-rc4-next-20210803/kernel/drivers/clk/keystone/pll.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-rc4-next-20210803/kernel/drivers/clk/keystone/gate.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-rc4-next-20210803/kernel/crypto/cast_common.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    /tmp/sm4-ef4939.s:1088: Warning: ignoring changed section attribut=
es for .data..cacheline_aligned
    1    /tmp/sm4-ec8b06.s:1088: Warning: ignoring changed section attribut=
es for .data..cacheline_aligned
    1    /tmp/sm4-e8dd6f.s:1074: Warning: ignoring changed section attribut=
es for .data..cacheline_aligned
    1    /tmp/sm4-826859.s:651: Warning: ignoring changed section attribute=
s for .data..cacheline_aligned
    1    /tmp/sm4-5f7af5.s:788: Warning: ignoring changed section attribute=
s for .data..cacheline_aligned
    1    /tmp/sm4-0240f7.s:1074: Warning: ignoring changed section attribut=
es for .data..cacheline_aligned

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 section=
 mismatches

Errors:
    ./../include/linux/compiler_types.h:328:38: error: call to =E2=80=98__c=
ompiletime_assert_1862=E2=80=99 declared with attribute error: FIELD_PREP: =
value too large for the field
    ./../include/linux/compiler_types.h:328:38: error: call to =E2=80=98__c=
ompiletime_assert_1869=E2=80=99 declared with attribute error: FIELD_PREP: =
value too large for the field

Warnings:
    kernel/trace/trace_osnoise.c:1461:8: warning: =E2=80=98main=E2=80=99 is=
 usually a function [-Wmain]
    drivers/soc/ixp4xx/ixp4xx-npe.c:696:18: warning: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 4 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long unsi=
gned int=E2=80=99} [-Wformat=3D]
    drivers/soc/ixp4xx/ixp4xx-npe.c:696:18: warning: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 5 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long unsi=
gned int=E2=80=99} [-Wformat=3D]
    drivers/soc/ixp4xx/ixp4xx-npe.c:705:18: warning: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 4 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long unsi=
gned int=E2=80=99} [-Wformat=3D]
    drivers/soc/ixp4xx/ixp4xx-npe.c:705:18: warning: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 5 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long unsi=
gned int=E2=80=99} [-Wformat=3D]
    drivers/soc/ixp4xx/ixp4xx-npe.c:710:17: warning: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 4 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long unsi=
gned int=E2=80=99} [-Wformat=3D]
    drivers/soc/ixp4xx/ixp4xx-npe.c:710:17: warning: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 5 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98long long unsi=
gned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 63 warnings, 0 secti=
on mismatches

Warnings:
    kernel/trace/trace_events_hist.c:4611:13: warning: stack frame size of =
1392 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    /tmp/sm4-5f7af5.s:788: Warning: ignoring changed section attributes for=
 .data..cacheline_aligned
    crypto/wp512.c:782:13: warning: stack frame size of 1192 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    net/netfilter/ipset/ip_set_hash_ipportnet.c:249:29: warning: variable '=
port_to' is uninitialized when used here [-Wuninitialized]
    net/netfilter/ipset/ip_set_hash_ipportnet.c:167:45: note: initialize th=
e variable 'port_to' to silence this warning
    net/netfilter/ipset/ip_set_hash_ipportnet.c:249:39: warning: variable '=
port' is uninitialized when used here [-Wuninitialized]
    net/netfilter/ipset/ip_set_hash_ipportnet.c:167:36: note: initialize th=
e variable 'port' to silence this warning
    2 warnings generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6: warn=
ing: variable 'ret' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9: note=
: initialize the variable 'ret' to silence this warning
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:114:10: warning: implic=
it conversion from enumeration type 'enum mt76_cipher_type' to different en=
umeration type 'enum mcu_cipher_type' [-Wenum-conversion]
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:114:10: warning: implic=
it conversion from enumeration type 'enum mt76_cipher_type' to different en=
umeration type 'enum mcu_cipher_type' [-Wenum-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5536 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/staging/r8188eu/core/rtw_mlme.c:1641:28: warning: address of ar=
ray 'pmlmepriv->assoc_ssid.Ssid' will always evaluate to 'true' [-Wpointer-=
bool-conversion]
    1 warning generated.
    drivers/staging/r8188eu/core/rtw_pwrctrl.c:222:21: warning: equality co=
mparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/core/rtw_pwrctrl.c:222:21: note: remove extrane=
ous parentheses around the comparison to silence this warning
    1 warning generated.
    drivers/staging/r8188eu/core/rtw_security.c:1214:24: warning: equality =
comparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/core/rtw_security.c:1214:24: note: remove extra=
neous parentheses around the comparison to silence this warning
    drivers/staging/r8188eu/core/rtw_security.c:1457:26: warning: equality =
comparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/core/rtw_security.c:1457:26: note: remove extra=
neous parentheses around the comparison to silence this warning
    2 warnings generated.
    drivers/staging/r8188eu/core/rtw_sta_mgt.c:156:13: warning: comparison =
of address of 'psta->lock' not equal to a null pointer is always true [-Wta=
utological-pointer-compare]
    1 warning generated.
    drivers/staging/r8188eu/core/rtw_wlan_util.c:1309:34: warning: equality=
 comparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/core/rtw_wlan_util.c:1309:34: note: remove extr=
aneous parentheses around the comparison to silence this warning
    1 warning generated.
    drivers/staging/r8188eu/hal/odm.c:1634:27: warning: equality comparison=
 with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/hal/odm.c:1634:27: note: remove extraneous pare=
ntheses around the comparison to silence this warning
    1 warning generated.
    drivers/staging/r8188eu/hal/rtl8188e_rf6052.c:344:13: warning: explicit=
ly assigning value of variable of type 'u32' (aka 'unsigned int') to itself=
 [-Wself-assign]
    1 warning generated.
    drivers/staging/r8188eu/hal/usb_halinit.c:1303:19: warning: equality co=
mparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/hal/usb_halinit.c:1303:19: note: remove extrane=
ous parentheses around the comparison to silence this warning
    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame size of =
1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame size of=
 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    1 warning generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 46 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.
    /tmp/sm4-826859.s:651: Warning: ignoring changed section attributes for=
 .data..cacheline_aligned
    net/netfilter/ipset/ip_set_hash_ipportnet.c:249:29: warning: variable '=
port_to' is uninitialized when used here [-Wuninitialized]
    net/netfilter/ipset/ip_set_hash_ipportnet.c:167:45: note: initialize th=
e variable 'port_to' to silence this warning
    net/netfilter/ipset/ip_set_hash_ipportnet.c:249:39: warning: variable '=
port' is uninitialized when used here [-Wuninitialized]
    net/netfilter/ipset/ip_set_hash_ipportnet.c:167:36: note: initialize th=
e variable 'port' to silence this warning
    2 warnings generated.
    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:114:10: warning: implic=
it conversion from enumeration type 'enum mt76_cipher_type' to different en=
umeration type 'enum mcu_cipher_type' [-Wenum-conversion]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6: warn=
ing: variable 'ret' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9: note=
: initialize the variable 'ret' to silence this warning
    1 warning generated.
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:114:10: warning: implic=
it conversion from enumeration type 'enum mt76_cipher_type' to different en=
umeration type 'enum mcu_cipher_type' [-Wenum-conversion]
    1 warning generated.
    drivers/staging/r8188eu/core/rtw_mlme.c:1641:28: warning: address of ar=
ray 'pmlmepriv->assoc_ssid.Ssid' will always evaluate to 'true' [-Wpointer-=
bool-conversion]
    1 warning generated.
    drivers/staging/r8188eu/core/rtw_pwrctrl.c:222:21: warning: equality co=
mparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/core/rtw_pwrctrl.c:222:21: note: remove extrane=
ous parentheses around the comparison to silence this warning
    1 warning generated.
    drivers/staging/r8188eu/core/rtw_security.c:1214:24: warning: equality =
comparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/core/rtw_security.c:1214:24: note: remove extra=
neous parentheses around the comparison to silence this warning
    drivers/staging/r8188eu/core/rtw_security.c:1457:26: warning: equality =
comparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/core/rtw_security.c:1457:26: note: remove extra=
neous parentheses around the comparison to silence this warning
    2 warnings generated.
    drivers/staging/r8188eu/core/rtw_sta_mgt.c:156:13: warning: comparison =
of address of 'psta->lock' not equal to a null pointer is always true [-Wta=
utological-pointer-compare]
    1 warning generated.
    drivers/staging/r8188eu/core/rtw_wlan_util.c:1309:34: warning: equality=
 comparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/core/rtw_wlan_util.c:1309:34: note: remove extr=
aneous parentheses around the comparison to silence this warning
    1 warning generated.
    drivers/staging/r8188eu/hal/odm.c:1634:27: warning: equality comparison=
 with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/hal/odm.c:1634:27: note: remove extraneous pare=
ntheses around the comparison to silence this warning
    1 warning generated.
    drivers/staging/r8188eu/hal/rtl8188e_rf6052.c:344:13: warning: explicit=
ly assigning value of variable of type 'u32' (aka 'unsigned int') to itself=
 [-Wself-assign]
    1 warning generated.
    drivers/staging/r8188eu/hal/usb_halinit.c:1303:19: warning: equality co=
mparison with extraneous parentheses [-Wparentheses-equality]
    drivers/staging/r8188eu/hal/usb_halinit.c:1303:19: note: remove extrane=
ous parentheses around the comparison to silence this warning
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3328 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-rc4-next-20210803/kernel/crypto/cast_common.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-rc4-next-20210803/kernel/drivers/clk/keystone/gate.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-rc4-next-20210803/kernel/drivers/clk/keystone/pll.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-rc4-next-20210803/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-rc4-next-20210803/kernel/sound/soc/intel/boards/snd-soc-intel-=
hda-dsp-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/user.c:141:28: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:189:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:203:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:225:36: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section=
 mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.
    /tmp/sm4-e8dd6f.s:1074: Warning: ignoring changed section attributes fo=
r .data..cacheline_aligned
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6: warn=
ing: variable 'ret' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9: note=
: initialize the variable 'ret' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section=
 mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.
    /tmp/sm4-ef4939.s:1088: Warning: ignoring changed section attributes fo=
r .data..cacheline_aligned
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6: warn=
ing: variable 'ret' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9: note=
: initialize the variable 'ret' to silence this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-rc4-next-20210803/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 PASS, 0 er=
rors, 7 warnings, 0 section mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.
    /tmp/sm4-0240f7.s:1074: Warning: ignoring changed section attributes fo=
r .data..cacheline_aligned
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6: warn=
ing: variable 'ret' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9: note=
: initialize the variable 'ret' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 8 warnings, 0 section mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.
    /tmp/sm4-ec8b06.s:1088: Warning: ignoring changed section attributes fo=
r .data..cacheline_aligned
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6: warn=
ing: variable 'ret' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9: note=
: initialize the variable 'ret' to silence this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-rc4-next-20210803/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

Warnings:
    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pmu_cac=
he_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu_ev_h=
w_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6: warn=
ing: variable 'ret' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9: note=
: initialize the variable 'ret' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    drivers/pci/syscall.c:25:6: warning: variable 'dev' is used uninitializ=
ed whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/pci/syscall.c:18:21: note: initialize the variable 'dev' to sil=
ence this warning
    1 warning generated.
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:702:6: warn=
ing: variable 'ret' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c:683:9: note=
: initialize the variable 'ret' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 4 errors, 0 warnings, 0=
 section mismatches

Errors:
    kernel/user.c:141:28: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:189:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:203:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:225:36: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 4 errors, 0 warn=
ings, 0 section mismatches

Errors:
    kernel/user.c:141:28: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:189:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:203:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:225:36: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    kernel/user.c:141:28: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:189:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:203:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:225:36: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 section mis=
matches

Errors:
    kernel/user.c:141:28: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:189:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:203:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:225:36: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 section mi=
smatches

Errors:
    kernel/user.c:141:28: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:189:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:203:31: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99
    kernel/user.c:225:36: error: =E2=80=98struct user_struct=E2=80=99 has n=
o member named =E2=80=98epoll_watches=E2=80=99

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_re=
locate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---
For more info write to <info@kernelci.org>
