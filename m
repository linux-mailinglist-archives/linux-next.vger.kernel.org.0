Return-Path: <linux-next+bounces-8593-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 861BEBD9D5B
	for <lists+linux-next@lfdr.de>; Tue, 14 Oct 2025 15:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ADE13B396F
	for <lists+linux-next@lfdr.de>; Tue, 14 Oct 2025 13:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F350331353C;
	Tue, 14 Oct 2025 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wcRsY4RW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA0C34BA51
	for <linux-next@vger.kernel.org>; Tue, 14 Oct 2025 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450347; cv=none; b=mrEDEwYRc4Y4G2n3Ksk/HLM+iYY/QwdqwXJj7x/D92JoojUm6BuuM0MB5BsrEu3lZkEZnrE3o/+l+303VbV9zP788wmOk0S1tt7aRWC63fldyDvgcQBhl105nqNA2U+/c/8qS8vC3K/pEssOQ1dnfIF1VL1nWIXAM8k3HogiErU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450347; c=relaxed/simple;
	bh=lkROTrodmbJSenAHhGyFx9tlNI/DtQVmO3ov5vNaSOw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=sv/tVbs7FY3EIHhkNQ3tBmR9PYTee3V5ajPitLkNrNT5k/yP9DGmHkAmP+q3K3vt/MvsYZRnipZ0XW3ikqeRWMd8tTxbvscgTQvkNKq9ZnoyVKRK5TvOb3dloahkou2EQGCQ5YMztX8zn+IMBM5LtNLGhk7LqoRcc5Rr8XaLXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wcRsY4RW; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7811a02316bso3774351b3a.3
        for <linux-next@vger.kernel.org>; Tue, 14 Oct 2025 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760450345; x=1761055145; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjDMkAdvYR8QDIHBBK4om/FkCI8uG8FuR3An+D9afrc=;
        b=wcRsY4RWr6Re6pTH1iXH3PeLVL0oVR9SMDf6JDCmrX1pL0zekbDyQtlraTNJTLYV3+
         gVhYFsMyrqiMwZNpy79pPo1p2lUy1EX5Q91d3QlCFGOjxbZ9WCCG3A+6t+RmjqHi0KF6
         qdD60pSi8guksKYImn7l144dCbFA7uaceQ3tiwAaRP+GCcLBhrRCMYt/fDxWk6kw6Fqz
         NzM8QZK68cOWTuueSj3o9xZgmYYN60rFwF9gr0xary9O+zCzGgYyDHGQvGzBZzB1wnPq
         2ts0JQuwAP//iP3yzBgkiY+e2rmDFpSDgmV5m82E1GrHfqr39HnFGwGlVKh/2dHd0G7l
         bSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760450345; x=1761055145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yjDMkAdvYR8QDIHBBK4om/FkCI8uG8FuR3An+D9afrc=;
        b=YtYYkE+ZX8JRvew4bLS/pJ9YkoA3a6khziAqEm4eMVS2swT009bGbgVylnLwhhXZpe
         rlvRwFLBuYLrCO3jSw9ImWcoD7xWtzzMspKynAxV3AM+EZ0aqiJzdErZNX1566f0oI3K
         +IUvFZ0RcH3Fe7YNCzvLZlMww+W4vCG2GF5MTckFH2IsRmBathpkXVvt9zMQYLERwyCD
         r3nh3zhpbMIM87SoAOf4Uk3rQg3IUGKbUG9MCrfCduDQysfxYGhZh7ZtE0yZiBAeQNt7
         oecJeOvd1eqHo0iXZCISxecBNUmvYbJU7rWLY9JQ/uqHxT+WRiLD8kNQmRamHsYiMHyA
         ZrqA==
X-Forwarded-Encrypted: i=1; AJvYcCV1DBoGPbJ/yddR9Z0fMTd7vSUhcDBMWSSWNPGe3o3HmCvMZks6/0vLhJ8Mnh7Ds+odQ4RprPMOnsAa@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8WdL7OYGGle0yeJdb7nZ/6fJnQNW1oaYgHKeBvU2y6ZZXuud
	XvOf6YwimPZ7+Ojh5ecbM++rw25LOpng+Ix06Q5hqE0+3SbKNmIgjKz5mrDuFhGLvFI=
X-Gm-Gg: ASbGnctov/vb9gWyC4EldfKwcdwCZZexw4v7jBc1H8X+TiaMUAIgKEVF82Qi9pL3nzo
	2L8N7yFZ1u5z+Du5OelU5tcqN2AARbhr9d/XtEIqkdQl1FWEqKemyijr9kHYtPUD+YByLM+iarc
	hdJBo29uw8lWVuXo43/89t10FGESyLqOf4xLew6qaE0hndhQg27i2pzww1bssoF+AOSF3riZs0F
	R3Us/vrqrn48Ox5Hnkrzjn2J0x0MfQjq46EkSswyzV21w9E4U8cwAUiGhiu+BmkGmYS4c+JMj1N
	ar+POwPqzNFOWfTqPuJYEZIbMtrFk5Rb4WQFwc8IW92AsMTsDN9CE7VxeI7Y1rTVBN/OVDRiWrL
	MlSq7r9fqA+1xLAuFTf9z05cMhqGBmXcH0wsLXPdV9+55y1ECePhMl4te
X-Google-Smtp-Source: AGHT+IHKzaxS6OOgrxr6QVGgtKNaoeHtnl0XB/OBdOYkzQrDQ8GVUCdJHn166jkKWPW3xC8+VHh/Vw==
X-Received: by 2002:a17:903:2381:b0:28e:7ab2:811c with SMTP id d9443c01a7336-290272e4bc1mr334054785ad.45.1760450345071;
        Tue, 14 Oct 2025 06:59:05 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9e0sm165414065ad.120.2025.10.14.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) undefined reference to
 `devm_backlight_device_register' in vmlinux...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 14 Oct 2025 13:59:04 -0000
Message-ID: <176045034384.1788.868853922191153052@15dd6324cc71>





Hello,

New build issue found on next/master:

---
 undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  13863a59e410cab46d26751941980dc8f088b9b3
- tags: next-20251014


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_create_backlight':
/tmp/kci/linux/drivers/gpu/drm/panel/panel-visionox-rm69299.c:343: undefined reference to `devm_backlight_device_register'

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-16k_pages-68ee4f14a6dc7c71db9fda21/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f14a6dc7c71db9fda21

## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-64k_pages-68ee4f17a6dc7c71db9fda24/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f17a6dc7c71db9fda24

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-mainline-big_endian-68ee4f32a6dc7c71db9fda39/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f32a6dc7c71db9fda39

## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-randomize-68ee4f1fa6dc7c71db9fda2a/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f1fa6dc7c71db9fda2a

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-chromebook-kcidebug-68ee4f2ba6dc7c71db9fda33/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f2ba6dc7c71db9fda33

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-kselftest-16k_pages-68ee4f23a6dc7c71db9fda2d/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f23a6dc7c71db9fda2d

## defconfig+arm64-chromebook+preempt_rt on (arm64):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm64-preempt_rt_chromebook-68ee4f3aa6dc7c71db9fda3f/.config
- dashboard: https://d.kernelci.org/build/maestro:68ee4f3aa6dc7c71db9fda3f


#kernelci issue maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

