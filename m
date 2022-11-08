Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64BD9621CBD
	for <lists+linux-next@lfdr.de>; Tue,  8 Nov 2022 20:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiKHTLg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Nov 2022 14:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiKHTLg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2022 14:11:36 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441EF6C70C
        for <linux-next@vger.kernel.org>; Tue,  8 Nov 2022 11:11:35 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso18779126pjc.0
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2022 11:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pUpe96PPi7zC6uGDQKFNUbNBwpZpBFiX2uqs7bfme/4=;
        b=O3dJ/3vxUoMZGbKI3v6UOt3yYoyBJUfOlJCEWNmtbqFG9NV57YRLUGUpQHODYiq7Jz
         vNCl+gN1XJ4kRkOYaMBVMc2aphi1XGjnASJ0PesMdXxxGMk1Xot9GtmHA32fxzkEYVgJ
         pNaXOjx6HnWWHIQQuWIr9EI4HH9veGC17O04WBksIksugdGt+gX8bSfqkXt8oC/3kMhM
         ot5J39GKXkBHQTzUzN8f1wKb2AQAWoxB2n6TpVLPwuexyeDbihZ7eUkjmO24eMt1QpIC
         kw6wlYD9F+gIjOe689CtUsuHYVcNBPonXUjbh3H5SAYllqVOWSE/oTjhkmfrWKYaZSs2
         ozdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUpe96PPi7zC6uGDQKFNUbNBwpZpBFiX2uqs7bfme/4=;
        b=Yg4oym6N2ApyamrPcT2TTyMHZlpR/euws5qpwLWT4e6XH0wDo1ppAH6ZQg6bozWk/d
         VPvvbILG+j2ZEr60YoUnkaMbMuOjJ8p3i3fxXwWJmVBEj1dXJceDAz2c2F2ijjaqEXsZ
         c9CJEGs6jYIJgsQg9VCzzMjk/l/QK8WCNT6HNyPC3ZA3tJlVb2F/XPabNytntRZ5h0aH
         qiW/nFr/igEjtLs4RK/zit6FFB8e62OQ5M9HXPJlvLdL2b1/unx2RfzSsKIY+tlJ95fI
         J6PHxOEhARtn6S18ea2hVJgHOc2laKTpnzE6CzLUxhNuKAAAeDRwYMXKC/5D6kWAmiJx
         bBbA==
X-Gm-Message-State: ACrzQf0RmxLlZwa4KCMEMXaGSBKXxnLjuX1uMWO7VmFVVkOlnjPP/Y9R
        6um8C18SwjPi9CcZLM5Xpn6/5D9GSKy1FWLl
X-Google-Smtp-Source: AMsMyM4xLnF6l4rhGfOQIsWyED8N2/Bp7OU+HRspdD9k7pFVsEQkd+Rx+msc4mePXA2vluDmxu8nNg==
X-Received: by 2002:a17:90a:ac03:b0:213:9515:c41f with SMTP id o3-20020a17090aac0300b002139515c41fmr61362743pjq.171.1667934694544;
        Tue, 08 Nov 2022 11:11:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902c94d00b00172e19c5f8bsm7369475pla.168.2022.11.08.11.11.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 11:11:33 -0800 (PST)
Message-ID: <636aa9e5.170a0220.acbae.c3f0@mx.google.com>
Date:   Tue, 08 Nov 2022 11:11:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221108
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 12 builds: 7 failed, 5 passed, 7 errors,
 5 warnings (next-20221108)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 12 builds: 7 failed, 5 passed, 7 errors, 5 warnings (nex=
t-20221108)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221108/

Tree: next
Branch: master
Git Describe: next-20221108
Git Commit: b6fc3fddade7a194bd141a49f2689e50f796ef46
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL
    x86_64_defconfig+x86-chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 4 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error
    x86_64_defconfig+x86-chromebook (clang-13): 1 error, 1 warning

Errors summary:

    5    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('voi=
d *' and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_=
t)' (aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned =
int (*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-=
mismatch]
    1    drivers/pwm/pwm-tegra.c:148:53: error: signed shift result (0x3B9A=
CA0000) requires 39 bits to represent, but 'long' only has 32 bits [-Werror=
,-Wshift-overflow]
    1    drivers/cpufreq/acpi-cpufreq.c:970:24: error: variable 'ret' is un=
initialized when used here [-Werror,-Wuninitialized]

Warnings summary:

    4    clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    drivers/cpufreq/acpi-cpufreq.c:960:9: note: initialize the variabl=
e 'ret' to silence this warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

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
=E2=80=94 FAIL, 1 error, 4 warnings, 0 section mismatches

Errors:
    drivers/pwm/pwm-tegra.c:148:53: error: signed shift result (0x3B9ACA000=
0) requires 39 bits to represent, but 'long' only has 32 bits [-Werror,-Wsh=
ift-overflow]

Warnings:
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
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatch=
es

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error,=
 1 warning, 0 section mismatches

Errors:
    drivers/cpufreq/acpi-cpufreq.c:970:24: error: variable 'ret' is uniniti=
alized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/cpufreq/acpi-cpufreq.c:960:9: note: initialize the variable 're=
t' to silence this warning

---
For more info write to <info@kernelci.org>
