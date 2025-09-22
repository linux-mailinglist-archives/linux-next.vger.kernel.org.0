Return-Path: <linux-next+bounces-8423-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93943B91059
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 13:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E308423A0E
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6EC305971;
	Mon, 22 Sep 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="aBiee9C2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331701A9FB7
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542348; cv=none; b=nrH3DhR5jygszU0zmGjMQylP0rygJoIuwNyML1NDkhBBJA9QTsl89In1imnZybPGmxEcAzqNGWGWuN7D5S10JgaPQQagFjNArMsNZg+NpBj/KfOjFxjZo7bz5pMMZWpsZFeVzlPUQSX9DXBc9XQjnUNQMWu3PtNjsuAsd3sXWws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542348; c=relaxed/simple;
	bh=rEwZQCl2kLqparyM2Vvi6pKeJ586h+Hlnko9n4oM7Mc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=C20t4vnyIk5xLk1tO0WcJqc6fiO/TjCmSpiaTxRBnOiJg40hSZVJrPVjxnt5GtjGW0JgEvtbPmCFwGE9u7FnpbsI/xSGDsP5wQ+zXA9lHMM2UT8dae1MCHlQY0vYC2W53jeLwdj5dPtIUbSuRjpfd904Bw2QAuBkupGHeKNLIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=aBiee9C2; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b551350adfaso3308810a12.3
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542345; x=1759147145; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQH7pPh1Sjb9Crvn0LF0FKaZmkeW4LiN21oBQrxkEcQ=;
        b=aBiee9C2gRcQNaJFqFAE30EPSmiebsrkFjq1dXZWmTOPSaU9gzoPwTFjOt238+0lxl
         FWFYRSl6uprrgpbJ8YUnmDug7lB6fHm7Ps4AWiQzK9aAAfnLmdRdPNO7+rbBA0dXAL+H
         oW4AbuQnIFnQ4scvn4cgiQv5FWWlcwggOo2wV1xEt6WAt6yvigrMWcTiDvC1WO4wDnwQ
         3AIJlagxvkhmEVcT2uSaxm50V4lZUk3NZyhxa0b4hHA7ggwgqDboSyufOW9huqWKAnw8
         Nw+bai5t/7vn5/EM47RDCOPNbtynBkuOP9j2PJFy1UVKyMcIwCx9jNTmuulnr7zlm6VC
         erFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542345; x=1759147145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQH7pPh1Sjb9Crvn0LF0FKaZmkeW4LiN21oBQrxkEcQ=;
        b=WzTYXoKES9sqfzwfsRvLftutUB1azjOHVossXcHdKHsjLgNRkyws94VzYwWq8RDNDk
         J5lsvQ5vIWYSEmC7zqawQ8pDHl3rSUpHIJhyWDA2ZfBWlGs3rb/8zkohYLC/BoErkmA9
         zGVqOXfPaLvsxDn+lstDxT5evCXiD1vA+TqxuLHIr3shGvHaqPPZg/hYVi7Bw+DZ56/9
         3AGWKYVlgq3vgldmBC+k/3IcIHfHsaLDQpuvxTXuPPXXH5fe8uiJTb7k3ioRYft8uj8Y
         vxxq1nv+En27gZo686KhKrreQRmB0ioaxBNCaiqcsqL5140E5qCKFP9kMCZfiWN30whU
         P7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCW+MIiA7u0VU0XqqlGPfe2jMmtO4lQ6keYJmxBcLQeh4iXu+h4MmNLhYg2zjH/nCIx8PYlYDbztGbG8@vger.kernel.org
X-Gm-Message-State: AOJu0YxHE1wKNuqVhanlhPsXvfKM0Os8ey+NdSHbVCFj1hScb9ANYmTh
	66kZAB6XuAHFEB2ZC/hb5K2fgGF/Og94HZH0F96qwHP4ja+u+LsDYF0p+vs2g7qZnLo=
X-Gm-Gg: ASbGncuTFcZVU0gyv5SHiATI+07HP7jQO17LGpfiJWoxr3GsF8nI8cV3CMaSGCW4EcU
	irtwjHvZdUO+EbsQ/ifsMQne6ZkKYMEcDX59IMLJDmq0Sc6cTs0uH1MG5wimRk2W8WTRNVUzczK
	EFtIBJryv+YNtWs4+rGGst7RXJ2IuepvOjlLG5cm9/JHuc6aNXOsOXwPpk3ArIx8cbp5MrfNIbC
	cjeM0GCFdlasFoHo1RskStaX1tYdXlHGauyTnNc2dla13CRxd82rlJYwkU2q2rci3O0bgEO9p+I
	0RErQAHiFcxXBoC8c02c4OQ/wrfcfhsHYUlKC7xcoG9NJIdBPObIjpOaQpyza9mwCR3i5Q7vhBn
	z1/Dl6tg3KvPajcJL7yTFh/5e1z4=
X-Google-Smtp-Source: AGHT+IHFLDlPUqXlFqRm4EJDPyAhOKyiDG5EifBvqbEW2P+7fzOZPuCaPUKqnZrlY+hXfVx351YteA==
X-Received: by 2002:a17:90b:33c8:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-33097ff7032mr16457362a91.12.1758542345339;
        Mon, 22 Sep 2025 04:59:05 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ee4741086sm6811321a91.6.2025.09.22.04.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_implicit_declaration_o?=
 =?utf-8?q?f_function_=E2=80=98F=E2=80=99_=5B-Werror=3Dimplicit-function-de?=
 =?utf-8?q?=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 22 Sep 2025 11:59:03 -0000
Message-ID: <175854234340.873.16561535782920336667@1dfac204f25d>





Hello,

New build issue found on next/master:

---
 implicit declaration of function ‘F’ [-Werror=implicit-function-declaration] in arch/x86/kvm/emulate.o (arch/x86/kvm/emulate.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ec1d28aaff2a1b8f5b95187d16e2791bddbb5367
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bf2602a3cb2381fb1a04bf1c39a290518d2538d1
- tags: next-20250922


Log excerpt:
=====================================================
arch/x86/kvm/emulate.c:4091:9: error: implicit declaration of function ‘F’ [-Werror=implicit-function-declaration]
 4091 |         F(DstMem | SrcNone | Lock,              em_inc),
      |         ^
arch/x86/kvm/emulate.c:4091:9: error: initializer element is not constant
arch/x86/kvm/emulate.c:4091:9: note: (near initialization for ‘group5[0].flags’)
arch/x86/kvm/emulate.c:4092:9: error: initializer element is not constant
 4092 |         F(DstMem | SrcNone | Lock,              em_dec),
      |         ^
arch/x86/kvm/emulate.c:4092:9: note: (near initialization for ‘group5[0].intercept’)
arch/x86/kvm/emulate.c:3993:21: error: field name not in record or union initializer
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                     ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:21: note: (near initialization for ‘group5[0].pad’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                     ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:30: error: conversion from ‘long long unsigned int’ to ‘unsigned char’ changes value from ‘220676381741154496’ to ‘192’ [-Werror=overflow]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:36: error: field name not in record or union initializer
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                    ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:36: note: (near initialization for ‘group5[0].pad’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                    ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: error: initialization of ‘unsigned char’ from ‘int (*)(struct x86_emulate_ctxt *)’ makes integer from pointer without a cast [-Werror=int-conversion]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: note: (near initialization for ‘group5[0].pad[1]’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: error: initializer element is not computable at load time
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: note: (near initialization for ‘group5[0].pad[1]’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro ‘I’
 4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
      |         ^
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
 4090 | static const struct opcode group5[] = {
      |                                       ^
 4091 |         F(DstMem | SrcNone | Lock,              em_inc),
      |         {
arch/x86/kvm/emulate.c:3993:22: error: ‘union <anonymous>’ has no member named ‘flags’
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                      ^~~~~
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:3993:30: error: initialization of ‘int (*)(struct x86_emulate_ctxt *)’ from ‘long long unsigned int’ makes pointer from integer without a cast [-Werror=int-conversion]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
  CC      mm/highmem.o
arch/x86/kvm/emulate.c:3993:30: note: (near initialization for ‘group5[0].u.execute’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:3993:37: error: ‘union <anonymous>’ has no member named ‘u’
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                     ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:3993:49: error: excess elements in union initializer [-Werror]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:3993:49: note: (near initialization for ‘group5[0].u’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro ‘I’
 4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
      |         ^
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
 4090 | static const struct opcode group5[] = {
      |                                       ^
 4091 |         F(DstMem | SrcNone | Lock,              em_inc),
      |         {
arch/x86/kvm/emulate.c:4095:9: error: braces around scalar initializer [-Werror]
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:4095:9: note: (near initialization for ‘group5[0].check_perm’)
arch/x86/kvm/emulate.c:3993:21: error: field name not in record or union initializer
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                     ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:21: note: (near initialization for ‘group5[0].check_perm’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                     ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:30: error: initialization of ‘int (*)(struct x86_emulate_ctxt *)’ from ‘long long unsigned int’ makes pointer from integer without a cast [-Werror=int-conversion]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:30: note: (near initialization for ‘group5[0].check_perm’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                              ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:36: error: field name not in record or union initializer
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                    ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:36: note: (near initialization for ‘group5[0].check_perm’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                    ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: error: excess elements in scalar initializer [-Werror]
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:3993:49: note: (near initialization for ‘group5[0].check_perm’)
 3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
      |                                                 ^
arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro ‘I’
 4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
      |         ^
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
 4090 | static const struct opcode group5[] = {
      |                                       ^
 4091 |         F(DstMem | SrcNone | Lock,              em_inc),
      |         {
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
arch/x86/kvm/emulate.c:4090:39: error: missing braces around initializer [-Werror=missing-braces]
  CC      crypto/gcm.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d130d075b320799d36f202

## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d130d375b320799d36f209


#kernelci issue maestro:ec1d28aaff2a1b8f5b95187d16e2791bddbb5367

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

