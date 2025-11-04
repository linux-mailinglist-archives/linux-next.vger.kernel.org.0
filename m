Return-Path: <linux-next+bounces-8819-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E62C30A0A
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 11:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F49F189B984
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 10:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5942D94A2;
	Tue,  4 Nov 2025 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YTIJQaiH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDD02D9EC7
	for <linux-next@vger.kernel.org>; Tue,  4 Nov 2025 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253948; cv=none; b=uZhBGeErjNvzUQEIawuE88K4mLmy/5accbqVJzu16Co2wtOw5WkeVysLeDhm8J7JXt7tOUWtQFQmIcJcGYB7NzHq6GmJO6Yc89A6fDbLndxmFqsQO2Fv1kgwlZcNK5CN/uTbefQkad95Vwx+lWcwcO8ihJxB9Gs7wgfflaPmYQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253948; c=relaxed/simple;
	bh=b+246kCIKvKViZgcnKIa/bCv41vBI8eLjv6Ot7c0OWA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=olYKH/tF8N4nTjumfN8kStu3LUkRCMYJp8gXnCRlJLcxe4pmqFOS38v4NMS6nBkygIgEQpEnKKNsb1Y8T8toYB1ShRUMm5VxBoDmEkzCXi/PN0wlwZ6EpA9mBA3PEFo299EBuz3fGeNv3RPxDwF7PGwPXvqgySZ+IQmuLayA5zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YTIJQaiH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso430654b3a.1
        for <linux-next@vger.kernel.org>; Tue, 04 Nov 2025 02:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762253946; x=1762858746; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38YtYLLXIxSpGhW1o6dKhYtk6nEpigDTCqSUXy4bhvc=;
        b=YTIJQaiHr/2CexWE01kudr31SYazkKtPu2gMNAW6L9BlWNmKKvlGG/7++xLnpTVfjS
         AYG3MtOSkFZBgE/i7hh8TIHOktY8c+O8EG1ffAGRLNBVN6FPXDgFdt47GmmZNKQ/TyUC
         Q2b+dK9ipDfLTWMOvpNkxBI5t3/cz4279eoHTCpu1gRfcTZRyPvwxN3vgPHOkSgl8Y8c
         I6Hzlm0aHKxkAG03NDUxlRkvBvGcz3j48idpTGFaIcz6imGjreIE5+neLwx2m7yIPRk+
         bXYUh6Mg9td7W/RBx7ANdD3cObZRmEiEa7hmF3pW5HEs63BMhKeFEKMkQGy8jl/kR/pR
         JWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253946; x=1762858746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=38YtYLLXIxSpGhW1o6dKhYtk6nEpigDTCqSUXy4bhvc=;
        b=gRDnsapTYIvaCxAGhy+E7ZEwBAYhPZcsmMJTHXkE+8a5ifx3oQmdAEgvnxh5IU5+RV
         fOLtCA7NY689+R4JZLtjuIUk6UEDw8bY1BnQLW9e212/6Wxg8rP3z50yBPVirmLnEVU8
         8fTrgAAqgGKGZ7hfAZ3IN9OC65L7vEIvmA10ce9HykM2TdQO4xIaB2LdH3THNKdyAYz1
         ihXgX6ktppJiLwGCw6cy98oh5/3DVPFmjc37vn0/xCPmvvnep+U0iuAqhv3m4eHClHKb
         2jnOVitEEkKGZ0UXJpGS7GxBukx/XxfaRSRs2CC9oYRUevXe6jaXB0Kzqk1zA/pkHxny
         0yFg==
X-Forwarded-Encrypted: i=1; AJvYcCXbhjDIbk8yUi0/sDe10Um2rBn8KgRISSrQmAziz4RCiQ2nhxtYVx7wxIUfIi8Yaf9A+3vOPvY6+Y82@vger.kernel.org
X-Gm-Message-State: AOJu0YwuGGac1OPFBYGPlNEQ93Cgsfb9WLgAjn/yfv0l5aNyimJ8rFs/
	l34ooA+7QRAqhKtCl7pE4jceC5Ukuelx5SGqDSa5bARsk8Gk+ifILe75L0s5A74afwg=
X-Gm-Gg: ASbGnctmBbH1p4wRHIMiLahdSjrQtKlmq6edZi8Yh6av0lbo6guro5QrARWf+iwNoCA
	4ECpmr4BVuKsHIPqyll0g79P5tRiDYZiXxxpboGTElnob0/da6stBq6al1i5KCIqKzIfthmplFF
	qwU/OWCTSApJxo2BIOToHfVwaK512xYZpkyRjqpnspJOuU901cUKFIS3EJlB2X9GgsU3aoTET5l
	0LhyFv14HJwEkAe3Jsq8/rY5fU0nvk547RqjxWYnp5vhozuMYLg/XI3dwJTbilz/S3IMvpq4tih
	rOaGVjv1Q4Dd+uEni1qd8vxQ+5N9x0BJqcvgQabpkUoUv0Xck7NJ29CEeLzRJDTIkE/GdB9dfDO
	GC7AoZxAPzRmapCp3iuzT6UjLrms8QiHrgOrSSjFDqzc0XpouC1VdKqVeQxspEHM2z2Xf/A==
X-Google-Smtp-Source: AGHT+IEaCW8CR//NAOXHmykFLAmExRAqALUUcQz5Er/GWgJL6rRlZHEieutLRypaa4365FPi0ATBJA==
X-Received: by 2002:a05:6a00:9291:b0:7ad:11c9:d643 with SMTP id d2e1a72fcca58-7ad11c9d81amr2344243b3a.21.1762253946228;
        Tue, 04 Nov 2025 02:59:06 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6a15af3sm2537224b3a.69.2025.11.04.02.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:59:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) call to undeclared function
 'topology_core_has_smt'; ISO C99 and l...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 04 Nov 2025 10:59:05 -0000
Message-ID: <176225394505.3644.7188826232555976435@efdf33580483>





Hello,

New build issue found on next/master:

---
 call to undeclared function 'topology_core_has_smt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:998dc5815603ae4cd3767a506a6f94b75d982ffc
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  17490bd0527f59d841168457b245581f314b5fa0
- tags: next-20251104


Log excerpt:
=====================================================
drivers/perf/arm_pmu.c:935:17: error: call to undeclared function 'topology_core_has_smt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  935 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
      |                        ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm-mainline-aspeed_g5-6909cacaf21f07610dca06ab/.config
- dashboard: https://d.kernelci.org/build/maestro:6909cacaf21f07610dca06ab

## multi_v5_defconfig on (arm):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-arm-mainline-multi_v5-6909cacef21f07610dca06c7/.config
- dashboard: https://d.kernelci.org/build/maestro:6909cacef21f07610dca06c7


#kernelci issue maestro:998dc5815603ae4cd3767a506a6f94b75d982ffc

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

