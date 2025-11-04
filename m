Return-Path: <linux-next+bounces-8818-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D8C30A07
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 11:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75D08189B268
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 10:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4697B2DAFDF;
	Tue,  4 Nov 2025 10:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="rXnAQ/F7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A546A2D9499
	for <linux-next@vger.kernel.org>; Tue,  4 Nov 2025 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253947; cv=none; b=VrUZmX6Xh1578+b+DExWYupCDNgCVZPnwMtn17gWNlv8/+i6HBwYjFP3zbn9JglmXEun4WZV+O/efwA9Dl6+TP02l5TuhJpJ65L+i66C578NWHYerlt0zNyi3b/5KJU8SqrM2RJMVXVbBGAReMVeBVAo1KN9VN5vnw1do06YYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253947; c=relaxed/simple;
	bh=X9D2ZMejeOuJYhiaf+iM2vDRfimhm1I5uplt40ZcrtE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=BdHNSw4l9Cup31bnaElP1tFuL9Fx6iup5hJ5QHI50OpnD4q8AhOGQpRlvPBT27wl3My7mIUGVqHC+lBBh7ezfYPSc7PIluIp9X7FlaBrFBMPb8v0blrB7gJzd6cL0T9m3GLo+7k5Qgc+KFSAKSwIWApVtNwne2loZKReUWd18ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=rXnAQ/F7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-28a5b8b12a1so56933895ad.0
        for <linux-next@vger.kernel.org>; Tue, 04 Nov 2025 02:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762253945; x=1762858745; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wjm/T/q4UFVx0GR2qhWDjx2Kam+zJ27u+3ToK37WMgQ=;
        b=rXnAQ/F7+L3sl4FehDdpwNF9vPSMCEvEv+svPddB0flgma9tAuZVrCz1h8a4L9SbSE
         rn4KLAuzhUu1iQUMQ8gOQQ9U5m+qoAjMNyKq/6z+Gf43fBIPtG3xpaGlMR/fnuqrIXI+
         34lZ99s7aWP5QMNsVGIF+Nx/wBq29rPSOUgaSlfylq7nHVxy/LD4QwEaJ6m1wEP9enC4
         BhZ50QHqkVU/BSMeScph4lLTsbZKGHij0Cxtax32n+e6E5iNppsUQBtLfTY0jlZtMk9t
         JZh+G1nZ2V3a/joGaQOFlAp19wJLYQEp8FRS2dRhoYfkV2X8gFJF/PxdilFkdhgfChXT
         WBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253945; x=1762858745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wjm/T/q4UFVx0GR2qhWDjx2Kam+zJ27u+3ToK37WMgQ=;
        b=nfiMAQrtTGLX719H0tC6FG2APBaiWGDGfQLLB2b2phIN3qe+UyPsFdD9GDo/islTqc
         PDot8RCl00a+E/UtAJSM+jvgdL+2gCHAUq0LDvBfudfmsMjBlGCVnT8LhgdAoNfPKYU7
         F4mK+VbM/jNOS7ppObBoE82dMuCotjH1prDflrO/gwruuxcQkA+SaTgZqWFAp/tEVqpC
         PHqPSF/emYQl8/HxjsBrUYMtXpnI+EX4zR79oAieqEzOI2EcgRIZdkGJ7IlsWKex9F8a
         JGzuXhDZy5/HhwYhSDqnkD7zFpraYL0MNOPjjqYPDl6bC6tAnyw1W5ZMIuSFI9wefQ1F
         I22Q==
X-Forwarded-Encrypted: i=1; AJvYcCUb/1YcD7I7FA7GyCrlmq7Qq/U6w5gGtA7rZhd/fPwZWy5MzON2PwfY0JYW4zgQbxZhHSZXko91bLOD@vger.kernel.org
X-Gm-Message-State: AOJu0YxbfbanhRJ0X5oy/MlROz3lFfHYx8HGk/RY3mkzOaOhV/WQF9yh
	1dSVxriMZrh9r9uCy4kwrFIFpFwJrlX/lOfjQDu7YWMbdiVB6s7rMzM/9JyK5oKc61qXmyp11sI
	bc15u
X-Gm-Gg: ASbGncsNqQ+VIfbiF1uaxu6vI7VaF2P4cHqgxuubpk4PyidBpyKhIa/YZs0hs5iH2u+
	K02OErbFPK0fRydcSVFA/Ah55zmMU65o7b564Pnp7aaKg0rl1ZKSOWONCjUak/CosKJQLpeQDeM
	t+uctScmGKj1wQz9q0I9CxGgjB1qJWgoi26uSWNtBgznyNd3RJUMh2oafF4SntjIVFX5oF9x7g8
	ApyNxEYBN5c5uhokmuAhMD70eIUkhjIamAnBMQp4MUCNBG1ITigL4F0mpZCfyPunyjd3WaamszS
	DkpYFsDM+xnU9WYoFruJrNFp2C2LPnQyaY0KnfH7sHKFSkzqhQ9yF4NwldlZh6HKVHSkCqwFbEQ
	VFA4PSe6fRU/FPY8IsbFe6H5pNw7YkQ4SzWZtH9kCMOBDRMKSpU5YSkQlAZM/2MEuOFScSQ==
X-Google-Smtp-Source: AGHT+IEE3tpjnfYLy2MvsRp9gnymo9WNb/VqOccqW6Wx2eS51Tu6VZ5UcpgFdCxGUETRUfl0FydykA==
X-Received: by 2002:a17:902:f651:b0:295:1277:7920 with SMTP id d9443c01a7336-2951a43ebb3mr216891085ad.28.1762253944862;
        Tue, 04 Nov 2025 02:59:04 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7afefsm22519275ad.111.2025.11.04.02.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:59:04 -0800 (PST)
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
 =?utf-8?q?f_function_=E2=80=98topology=5Fcore=5Fhas=5Fsmt=E2=80=99=3B_did_y?=
 =?utf-8?q?ou_=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 04 Nov 2025 10:59:03 -0000
Message-ID: <176225394342.3644.6412596085150396269@efdf33580483>





Hello,

New build issue found on next/master:

---
 implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  17490bd0527f59d841168457b245581f314b5fa0
- tags: next-20251104


Log excerpt:
=====================================================
drivers/perf/arm_pmu.c:935:24: error: implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration]
  935 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
      |                        ^~~~~~~~~~~~~~~~~~~~~
      |                        topology_core_cpumask
  CC      drivers/iio/adc/bcm_iproc_adc.o
  CC      drivers/devfreq/governor_simpleondemand.o
  CC      drivers/memory/tegra/tegra124.o
  CC      drivers/memory/brcmstb_dpfe.o
cc1: some warnings being treated as errors
  CC      drivers/memory/tegra/tegra20-emc.o

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig+CONFIG_SMP=n on (arm):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm-SMP-6909cb01f21f07610dca0839/.config
- dashboard: https://d.kernelci.org/build/maestro:6909cb01f21f07610dca0839


#kernelci issue maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

