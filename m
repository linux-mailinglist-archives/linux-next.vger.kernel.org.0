Return-Path: <linux-next+bounces-9188-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31BC8132D
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 505B63A1D7F
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1ACB30DEDC;
	Mon, 24 Nov 2025 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="hjjE+21C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBCD30DD08
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996347; cv=none; b=X+ymSHvnDRYejV2QW/pTRD9OwqrguHhcs4F+fsJ6XTqvq0wgQBiWF71KWaamcoSA5JSgOlfxd3ABBpy9Gt8XBDiNEaf/0gMwaCaBBvJdqUH2hRRaJe2mIkuuZsXwzAXTO338BwDd+ItFzYYsDqopUTt2rNqP9urjBxIQc9UEnfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996347; c=relaxed/simple;
	bh=EYCo3wbfHfmFQa02o2RM6yKpAm+wUjGxK4y/z4rDtRQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=sUp+aKLLeeg3UOPPNvEcxr7yeNGG2bpRN5SM7s49nJsgiOiVuKdzlBPkxiaSbGYYvmfuLLFSLdTiZMDtPp3sC9FjMkJCGTwrn6YNxtUk48AgtScw/O2GhMJIpTmNavAbp6Fdi9lw3YY5Y2rSoJWlO6CSVDe7CXdVeMKEGCurjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=hjjE+21C; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so5216033b3a.2
        for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 06:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763996344; x=1764601144; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv6QicMlocvWNqzZyLpAtw1qAxWRLCWMymXPN2jh/1g=;
        b=hjjE+21CLovmfHmeZQbQnyFH6YerpD+7Qjzysv1uMVO5Xb5S5WVTiwi6K6a9TekaIu
         ChnruSeQMcMytHBPQfwmxItdILzocB/o42bU+irfPYi3ABHn7KXZjCWgpJHz015Ms+lv
         ZxC4KKVT40N5X+hypemYcsLssVEb2+ZXHOJXKbfjpVx/CHArW9EOl5npi7/nefE7S7/N
         271VWz/mpQr8goMm+NIMH1YhB70SiBgLnO8bABRzTgAFuNyjMA8DQYgp7HCHWkYFVpms
         TCKfyyXmkVOv2OmyEgHU1HhSA92FSfA9eiQTMBZ3pdVs4j/BPcR/fl+uAvHmf953WFjq
         bpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996344; x=1764601144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dv6QicMlocvWNqzZyLpAtw1qAxWRLCWMymXPN2jh/1g=;
        b=SoC2FjlG0kuVnoh1PZgIm1ykn+k7+TlkhgMybChgg6n3ZvX2Hx1sgBoWx42iZ2SFU6
         ykyMmTQj1sx/aG1MRgcIZibrRymyAwXWyo+/C6aEu1nLsAy5ZJBm3Nwp0gS5E+COcybX
         F77K4ca3evu/X2UBeULkGJt73dVJxonPuAH+85GLtRLLxkaMcWXGkN1A3Le1BhbIWJTL
         93mW3VDnK07ztF4/oXsTL/8UWE297UyEW66AoKBWETIgTFr/4yF58rL7qD6Ib05qz90a
         ZUMPkV5jJFQWlFvyD7cVzSEDxELYHvmLo7X8FxY5v52fTu35/HpeWft7hjJaaQacjaxv
         Hngw==
X-Forwarded-Encrypted: i=1; AJvYcCU/8aMckj2loIGiY21AbxpjvTUG7v4wnY4ZEeLXa+b9Ndu2WAWz1hobdrDU8xqdrbNiW21ZFAR7WxFf@vger.kernel.org
X-Gm-Message-State: AOJu0YwB4jFCat09Ni5yyYMXZPu1iHs+soWktKKHwsaTpjBP0qKaW82i
	Fnj6+WuddEx3Ivg4qwbd8+4bw+6zVogR7bCMfdv/ex0RajKL2pg9QIv9J4JNiF+msNIRqTIEdkG
	3nVg9
X-Gm-Gg: ASbGncu4i5mxmnVptahsMxohrIQAkvwsHC4PzrWl/SItgGt1iuoAWM/iW6HVwKAeVLi
	ElMHMo2cE+y+e1pUni465eBghrnu4V/ukK+/OTZYpk3NmyiktFyljtxwbVfrRKhlI62RubjXD7G
	m3MNiaiqdk+PvgYppYFYYmJodNoA1M/6shAXcjnoHo6r0jn9+iF+WUzPUZlph5CJ5R6gWCIDwZ6
	dfQbyRxKCKqPytPqSHTz7AX60ti2I1lvBox+2pTt9kO7TT+c2KURBSWMzw07BM1LtmhfubASUuU
	QpzNFfH6rh838Houhya+bYfJyUGFIztx2sJ7fGkerjCnmc2u4UDEeMN0+EfSDK+LUcDKwkQkOoB
	q4JkXLYN8yfUC1uHSyE/BcL66m2IeAjVtwA87RiwTyljTuQ1geG/1zYEVYQXt8TRUOIgv0MHyxs
	BDmNi5
X-Google-Smtp-Source: AGHT+IEcD1trdqbQc69BpMtP07XzKrL5FxEsJvdGMtrXzOAwZdyZ5P6FgeXOFwPwpZPHzq6sPYhugg==
X-Received: by 2002:a05:7022:301:b0:119:e569:fba0 with SMTP id a92af1059eb24-11c9d717b91mr6102020c88.15.1763996344103;
        Mon, 24 Nov 2025 06:59:04 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e945sm68165405c88.6.2025.11.24.06.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in vmlinux.unstripped
 (scripts/Makefile.vmlinux:72) [logspec:kbuil...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 24 Nov 2025 14:59:03 -0000
Message-ID: <176399634273.129.10917573478902375918@f771fd7c9232>





Hello,

New build issue found on next/master:

---
 in vmlinux.unstripped (scripts/Makefile.vmlinux:72) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:c00f35c84d5655a6e8aec309bdb4a82398243097
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  422f3140bbcb657e1b86c484296972ab76f6d1ff
- tags: next-20251124


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_create_backlight':
/tmp/kci/linux/drivers/gpu/drm/panel/panel-visionox-rm69299.c:343:(.text+0x4b0): undefined reference to `devm_backlight_device_register'

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-16k_pages-6924699cf5b8743b1f5eec35/.config
- dashboard: https://d.kernelci.org/build/maestro:6924699cf5b8743b1f5eec35

## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-64k_pages-692469a0f5b8743b1f5eec38/.config
- dashboard: https://d.kernelci.org/build/maestro:692469a0f5b8743b1f5eec38

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-big_endian-692469a4f5b8743b1f5eec3b/.config
- dashboard: https://d.kernelci.org/build/maestro:692469a4f5b8743b1f5eec3b

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-mainline-big_endian-692469bdf5b8743b1f5eec52/.config
- dashboard: https://d.kernelci.org/build/maestro:692469bdf5b8743b1f5eec52

## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-randomize-692469a8f5b8743b1f5eec3f/.config
- dashboard: https://d.kernelci.org/build/maestro:692469a8f5b8743b1f5eec3f

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromebook-kcidebug-692469b4f5b8743b1f5eec4c/.config
- dashboard: https://d.kernelci.org/build/maestro:692469b4f5b8743b1f5eec4c

## defconfig+arm64-chromebook+preempt_rt on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-preempt_rt_chromebook-692469c5f5b8743b1f5eec58/.config
- dashboard: https://d.kernelci.org/build/maestro:692469c5f5b8743b1f5eec58

## defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromebook-69246a08f5b8743b1f5eecb6/.config
- dashboard: https://d.kernelci.org/build/maestro:69246a08f5b8743b1f5eecb6


#kernelci issue maestro:c00f35c84d5655a6e8aec309bdb4a82398243097

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

