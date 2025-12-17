Return-Path: <linux-next+bounces-9438-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F8CC5FDC
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 05:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3CF3301DE02
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 04:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75793224244;
	Wed, 17 Dec 2025 04:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="gjGIyKWU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E568F224B0E
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 04:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765947548; cv=none; b=aNiGUi+e4lvIr6rf5vMEoeoqNxelEbXN7Ir4rQtkmzhQNop4/O7YJW39AQO41sL/A+yHYOMkjlILg3xQc3a9Kb3MtXW0106FhXZENNKdF5pqwjjS5gvfVCpBIx3jSex7TCm81lye/8nP8qMVvuTOND+/rdVw3k5r7kbwW0QfZls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765947548; c=relaxed/simple;
	bh=2rjZ51Vjdxk+txEo87MW63UU7GVDR4jpXeIFmeA0kOc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=no9zVbQpmLaQaDtHLbhTaTr+v+4nIwccum3H38GkP9+lV/l/BT0cdFqboZKLvX7mnhKNeuhQbg+rVm36Z+OV05f8JXQESDRYR/ApfkXD3x3TTTsQBlVEhJslZtOqSWRZtCHsJjoGCTI+RBVi6hzZHlYJTEkF4CxVX/x9bf84b/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=gjGIyKWU; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso4153878a12.0
        for <linux-next@vger.kernel.org>; Tue, 16 Dec 2025 20:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765947546; x=1766552346; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBrg7Q8Znv4r+TiPh36klQqmUa7ldZYP8Xo+HQPHlb4=;
        b=gjGIyKWU2EmRnWFvdH6dH6xObscBybgTP9ltpw8WZcxK2VlbzoNxGY4w1xto9hzMjw
         DvSD9I7YLZpjxjVgvRRXXjxYhqunpNKX0Xc+kAxSq50qnhFokTT5JmdB1Tl9HtgOw1Uz
         /OzAx7Sn67xqWYfY7kYY/dgP0Cg6dAqo1WQW9xF0gfU9otdNnACTHgG6egwdjAUUbJu3
         Ose71Q+f0SMD0u1Jz2vyZ6+MUUW0SmIDLqFTfNOBJ+FxTdLTtlO/Fwvk8OXedY2we5pC
         lRTLgNGg6b02tYGHtIFKNtLfTfqgZn4g0cptyZJJ1ptBnEZPocWVFshCkFRugnrR3ZF1
         mTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765947546; x=1766552346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBrg7Q8Znv4r+TiPh36klQqmUa7ldZYP8Xo+HQPHlb4=;
        b=vhPkF0pe/dghQvfYNZmSifhdf/iiJ6DbWqv+n2XB+l6B1F5aYTlVwA40FSBBJjK4ea
         M+cZCZmL9ayw0GNBDAwSiplJIhmlMfPUHoohM6kXRirUDa1nBlRb1sRfI+8AvAPRXYX+
         V4rBRNE1dsXjXmu0q47gYAp/GUj6OJZKnJk4p55xfxrW4KWtsAXxWZSVWDsnN6/+96k9
         P8pkLRo0lEjacShK9toc+DdcMT8CBs0S9jISyW0ncYLEqbH84l1u4mvZix7GSjm/qmlH
         cWnTL+3rKYlvyxCsTV1rUL1+4k+YZh+IzXyFgaWll4VOIvMEXHBFyNGxlcocwx0kbNyP
         4lQA==
X-Forwarded-Encrypted: i=1; AJvYcCWFBry94blPJiykDL4gGgODd0x6WC+OXVcZ1sTgvSHyJe0o0updfdde5rQBW8fdaFr3AZPBNFmd3uV6@vger.kernel.org
X-Gm-Message-State: AOJu0YzGOvsfUNllMdpCQ7vQU21/Pa2ys4hGFVqpsZ02CPQzDQ6Eqgo6
	E8CRALEpa8Ow4oEOvyNrLP80yua/DyAwpFdyNy7r2QD6Fay9iTAS4AtcT73X9OCOTT8=
X-Gm-Gg: AY/fxX6vbVzHyeh2jP+DPfpHI3YLmkPTlBg8FLKLRtbW3H0E5xbTHWSsrsN4l9efbGR
	xB0VLpQVk+Yvnz4/uvrxdMx1coOjnP8FwRXCUJp2sfzPpePxqZjQ3tGGApwGMt04bpXxRBvGBeK
	+ywVyLdYuO7bf3bgYFowZIm2BvYBb5s6GxGuuieEw7NdGjwX2NOgsvbTHJ6j/SWoiM4XxlSPUE9
	UjdzDbtMfZryDkY6q8mSWkQ0O9beQ1L5OHe7GuAeoD3Cs1dGRPyHlZWnpPni4WNDu7W8W/2OXmd
	cuoAghC/RBNKf9UzKIbsiCrY69KX94xNSqbz/Sr4H2TVzPqCeU+eKz+L/qPlTI54Cetk/F6h8vk
	mXNgzjdu3DBGhGujrCpzA38DMGI93smEz4cv5w1mA8OtHclz6gV4u9j7R158qZAsuHrmd5eJikG
	FdDfir
X-Google-Smtp-Source: AGHT+IHYy6TyAlFopXPufQBE1gewJ7kye+X47uFRCWdMX+ULvifQW3rCWBn4TdxZ35bmuKJ2ysXLpA==
X-Received: by 2002:a05:7301:5407:b0:2ac:2d2f:8ea with SMTP id 5a478bee46e88-2ac2f399f88mr8191467eec.0.1765947545938;
        Tue, 16 Dec 2025 20:59:05 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm22088844eec.0.2025.12.16.20.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 20:59:05 -0800 (PST)
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
Date: Wed, 17 Dec 2025 04:59:05 -0000
Message-ID: <176594754466.3108.13726691997450676710@77bfb67944a2>





Hello,

New build issue found on next/master:

---
 initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ed08c10e7ce8b2654d125d029bb2aac6dc72096d
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

## defconfig+allnoconfig on (riscv):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-riscv-defconfig-694229a2cbfd84c3cdbdaa14/.config
- dashboard: https://d.kernelci.org/build/maestro:694229a2cbfd84c3cdbdaa14


#kernelci issue maestro:ed08c10e7ce8b2654d125d029bb2aac6dc72096d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

