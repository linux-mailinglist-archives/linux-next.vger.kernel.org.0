Return-Path: <linux-next+bounces-9437-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E33CC5FD9
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 05:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBB0930221BE
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 04:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88942264CD;
	Wed, 17 Dec 2025 04:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="R6h3JC9A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B57224244
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765947546; cv=none; b=Ro+Gy2M+zUbF6P7knwuu1jOcWDvHdIwb32D87mwXwcuLGdsjB03rj3UhM0cY7ZsnN/c+a4LP+4BVRKfw9xR6a3NIrwZBmN5x7jZicSq+If/j9uUlX3STM+8LB70C5sOHtrT3SD90kVCLWVfyaul/5WdfQ96ze55zhUHUsv/DVAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765947546; c=relaxed/simple;
	bh=TvVUk9RU3wMPojtGz9gI2F6Exdynrzhm5cNgKtmnXfU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Icv1LqTJSQiUokeuxAgOWje7dhv/qtzcCV4juKEs93VPLx5tuEtGuBe6vaPpndGrG4xUvbJTWk/anaeBNZdxMsf0etaJykjAg/2nvw/AQ8YJXmMs12MfcCxIteqoYL5J0DeowOAol/X4BQgymmMtwHhLGKQKOrD6kkHnI36cXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=R6h3JC9A; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a12ed4d205so18270095ad.0
        for <linux-next@vger.kernel.org>; Tue, 16 Dec 2025 20:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765947544; x=1766552344; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c0+Re7+nmzL123Nd/18b1ozs1pAde1wA4JRu7yvR10=;
        b=R6h3JC9A5UsBZGWUVmWv/BBvmV2md5jZKyYPKV7a5urbm2hyo7FdZQkk8bqgnLMCss
         nw44dus0vWMmjQ1la8AHFkdUV7OR9dWSv6CZThiml6HEnNPGorChVG4wtplm1uCau8zF
         yx2E560Ytt5YutKZYMq1RGykyzPKnYFuBM0grEGjTzMiAVgRiZ/Y8mJqXFIyh9HTQffP
         aqvW/6DoTGiYLdMjlab6sqWFdB0MKGfLBkJa7epyGQEe4aefFzTo5qWbOjKh3uh38btk
         cbkjZxt6JqXvex1DhoR3yYSUFA/oYPb6Fgcmfy1srovAEqBqx37ZVGPY2fJrqAucb4w+
         jGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765947544; x=1766552344;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9c0+Re7+nmzL123Nd/18b1ozs1pAde1wA4JRu7yvR10=;
        b=t3dgoTYNBaYt8HqyBRjdCCEupig7tgswdwRQCyX51BOtBmw+x61R5wnLdKJ4TC3miV
         RXZB9clD8n3h5hFwPqSvgyIaeshe90G+SpFEMhq5u/l1KCz9K54iINroGgO4UJuWQQgQ
         f6xCLCf9zk5nlRBRoH0g8FsyWiUdQrcpzZTp5tUA7Fb675sTou5lsGZYk1d9toSrGy5s
         EwLiVDvbAJfzEUSiKudAZ5CEQb/XvFuWOs2diWiLwuo1a0UEMgYauLezFupKa9neKJml
         IO/GvbDAQUvr26o6sDMWBh8ZzXjGGafNU9XOQrDndVmW5W6a/mxqdiY+qgKEiRIbPhof
         6N9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqoCLvSEysTI0RgCPLDCwXJ2Zmw39R2JC4mG8BpLKCLEWA2jhWIksZ7VKF5YABODEFJAUDcgiQuvtp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9e6vljlyGhRKB+HW/84xOpWiCKIHTWZ7DLUhegEAqKChZBJGB
	7m4wR0VV5Z4Om9AmnnDyQfa3QbAl2Nq1zmos/7J39YPIT+aFs6zviSh0yczKT+IP/BI=
X-Gm-Gg: AY/fxX65gXMnDLMe7AmOa2ycsHmPET0k1MXO8SlWAKVj+0RT2Om/BrHtovxzXzBTpse
	kgi8IfSwgSQvIS+MZIwPV5IMrMeIOwUBa5vIj1kqVU6l2jPHYx2hoLQA8c5E0urAyUiLEa380M2
	PuH00A6Dzl0el0vCnUMNoeDacKNeGs6nKjMwpJ4T4VJYVnxN5U1NxkpblBopu1LpxvN7+ERcpz6
	mXR8kDXsYdtatHl0kGVe5F5ol61yuannEGeWDoY1cmbRaWHPUkr0yZt3eEmOBJaIcqXkc/+jYOR
	zuWSegIeRPeyPeiYWnYVTJaQlMe4BlB7R1nKaaTpQEWFA3NV73feE5OJxZh4v6+5yMA8szpX4eN
	t5hkveS1XCFudn8St6TijQGNk8GkgBzRikLNStLWG9IFiX8Zt/UqFPqBD5Un8V8aQvbzhvHP+DD
	VRse+s
X-Google-Smtp-Source: AGHT+IH6VpFR/3Ntxcu6zNLF5hnaIJrCbf60OJ1jAgAjbnlyPmiP2yoJyGrEoCH3ka/KRdf6FkN4jA==
X-Received: by 2002:a05:701a:ca07:b0:11b:95fe:beed with SMTP id a92af1059eb24-11f34c10dd6mr11842918c88.38.1765947544454;
        Tue, 16 Dec 2025 20:59:04 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30b799sm58102698c88.17.2025.12.16.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 20:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_initialization_of_?=
 =?utf-8?q?=E2=80=98int_=28*=29=28void_*=29=E2=80=99_from_incompatible_point?=
 =?utf-8?q?er_type=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 17 Dec 2025 04:59:03 -0000
Message-ID: <176594754327.3108.9546235188357594114@77bfb67944a2>





Hello,

New build issue found on next/master:

---
 initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:c537d0d22aa608b88bb407d6e02b6a733d3f78cf
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  12b95d29eb979e5c4f4f31bb05817bc935c52050
- tags: next-20251217

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/irqchip/irq-riscv-aplic-main.c:111:20: error: initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types]
  111 |         .suspend = aplic_syscore_suspend,
      |                    ^~~~~~~~~~~~~~~~~~~~~
drivers/irqchip/irq-riscv-aplic-main.c:111:20: note: (near initialization for ‘aplic_syscore_ops.suspend’)
drivers/irqchip/irq-riscv-aplic-main.c:112:19: error: initialization of ‘void (*)(void *)’ from incompatible pointer type ‘void (*)(void)’ [-Wincompatible-pointer-types]
  112 |         .resume = aplic_syscore_resume,
      |                   ^~~~~~~~~~~~~~~~~~~~
drivers/irqchip/irq-riscv-aplic-main.c:112:19: note: (near initialization for ‘aplic_syscore_ops.resume’)
drivers/irqchip/irq-riscv-aplic-main.c: In function ‘aplic_probe’:
drivers/irqchip/irq-riscv-aplic-main.c:375:17: error: implicit declaration of function ‘register_syscore_ops’; did you mean ‘register_syscore’? [-Wimplicit-function-declaration]
  375 |                 register_syscore_ops(&aplic_syscore_ops);
      |                 ^~~~~~~~~~~~~~~~~~~~
      |                 register_syscore

=====================================================


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-riscv-build-only-69422a0bcbfd84c3cdbdaaa0/.config
- dashboard: https://d.kernelci.org/build/maestro:69422a0bcbfd84c3cdbdaaa0


#kernelci issue maestro:c537d0d22aa608b88bb407d6e02b6a733d3f78cf

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

