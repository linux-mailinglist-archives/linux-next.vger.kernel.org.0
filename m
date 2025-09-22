Return-Path: <linux-next+bounces-8424-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0199CB9105C
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 13:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B745E423D81
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F43305E2F;
	Mon, 22 Sep 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="givVbHgc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D0279DC6
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542348; cv=none; b=g+Bss3D0wtis1QrqbdEUqvqPs1YHNm3Ec/8WiVc5Iqs1Sw7LmUsnRTx+rl+cEb9OoWOtEVQhmOBddqwya/sry+6V4y8gRIxljufzhiJ2jg9nxr+o26FBF/Nc97hC4nBPdweE1Uj6m3puMj65ZK8jgiXpSw49TGiZYiM7qBNrhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542348; c=relaxed/simple;
	bh=rEwZQCl2kLqparyM2Vvi6pKeJ586h+Hlnko9n4oM7Mc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IDB97E6qamysGvWvkFpgC3tX4nU5UeY7kupkjHs6PGMnKiWgI04/K9c/CLyXD1lAwIq57lcqGMpfA9j+03N4ZVPXsIGDFmNjRe+It2wpyhEoEa+FlUODpAaW8yAmoXVNXp7Fe3Gqk5cMTeolaE6t4ARbRjBaZw8VNwjjFc9bOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=givVbHgc; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4f7053cc38so3171428a12.2
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542346; x=1759147146; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQH7pPh1Sjb9Crvn0LF0FKaZmkeW4LiN21oBQrxkEcQ=;
        b=givVbHgcKj/0enHurta9qzIMFCfx/jNh/4DsICJbnpOuWZWnh/cTseT6B046nMhzyF
         CFA0m+h/QdlW6WX8/+On7CktKzAr43RXfsBDw1z58+QisZTIXp+r+iyIRnSewCSsb9zJ
         csPAM3hKqwnKmXbHbuLaanA7C1UvsmAP/s7/KrWUiZMO7iUJOhb3aLblZDH4+Kj4ik5q
         LtkqHj56a8LnjE0q2DkZKR3YoSlZNzMGBzOqTaylW09I5Aroh6/o+VicUf5oxLRNN+sT
         zp5rmWktNMBEOSYKF6OvFy413bCFXSrGDrcf+xmRKfulozFJqO/7ZB5Q7FgafGvWt1w5
         s7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542346; x=1759147146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQH7pPh1Sjb9Crvn0LF0FKaZmkeW4LiN21oBQrxkEcQ=;
        b=VhpNt8j+FmKcdTsO8hyxzF83RFuJVZ0DtpFD1GMqGEXFKS/nCNYD5vBFBx8H0zdo3X
         OfHG2VGeMasBSdrPf3uU4ooOXZrNvRUCR1lW0n/RFSz35g4+DUUS8PfedbYxgyPQ0a9v
         pNAgH7OfLg82a88OS1T+DtnIddsvPNVfifOfm2vazE/IPsEF59ibPUUCVJwumHunTbE6
         3/XHO+shKmNNe2Vd2YnoB+zD9TV0r7EOpwYbmyJLRMG0wqNGeVoCar8scghgbDa0h2zH
         32oOj1t4utWXbzn5oMvBmQawyNn/zEig5xkj0IcHbE6PrYf70SFisvljUQVBSYnbBQKx
         PhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe5rEFs3qXuzuoNE6UxTFOhwgDZs3MPflTkHvdJ4xFVoVvjugvsWgw/g7G8jU2/ZiUvBcV3vbvAsMw@vger.kernel.org
X-Gm-Message-State: AOJu0YyWCk7HZka+N8EyQ9ZCFVsAanyGMTDf9E3BHs/YoL3o9BRRoEb/
	+X8LldUuwcOmFPJ318f6mYrAqtcLwXsAvgKKR1l5qXoZGQDFVWLV0yqJH89/c0xGgHc=
X-Gm-Gg: ASbGncv+YXjDwlTKK7sL3CvPoZa24Q8aKnVYKd4PrrOleiX/dqsV0hBfpkFdB01b5tM
	F9gKvU0Wwg7xCH3dtQhi/F2v1Fiig2nmbK1RiLGpH44A3tbMP/lJRo7EDJvXYyJAYh1LDS22prt
	ursCNbh2oLVaWmqJcLeFGeu215POycO0WxncCR8CUABnGTOFJqO1KjCGYXKQfiMWJ/TnaqNno3e
	Y68EfvS1IajClZgVmyzJ6nT1Q1wEpSqBCOKNjKovfl5KkJvnlF+EYY0pUiOh6V82mvxU+Sv9tG8
	riQEEojEN3Dj1MIwFOmKxFDL+3axsYYDnh2guDvsfXf5j631LSg5Tam1BjEu1/Ezegr2L4Gm1h3
	4+2dT9T49XbfHwX2J
X-Google-Smtp-Source: AGHT+IGcree0ZMf3YB3uRs9Rg0qxg1gCxlMaY6C6+lUh2ItTw4KZ8WnTFp5oIpU9E0oyVPDlvmn+MQ==
X-Received: by 2002:a17:902:f686:b0:25c:b1d6:c41a with SMTP id d9443c01a7336-269ba434d24mr154065215ad.11.1758542346081;
        Mon, 22 Sep 2025 04:59:06 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980303456sm131919635ad.96.2025.09.22.04.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:05 -0700 (PDT)
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
Date: Mon, 22 Sep 2025 11:59:04 -0000
Message-ID: <175854234379.725.11726275319419663408@166871acc15a>





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

