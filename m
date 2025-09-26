Return-Path: <linux-next+bounces-8506-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0BABA4BAF
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 18:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 553B51C22CEC
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 16:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2894F30C10A;
	Fri, 26 Sep 2025 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="x6vV564S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC8F30C0E2
	for <linux-next@vger.kernel.org>; Fri, 26 Sep 2025 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758905948; cv=none; b=UW2Ik33r5PW/AlKotCWmtPSMvNeQjH9L+a/6ccu7Xg0Fyz++buEWY2qTcEF2WxpfjHotjNHERV0vhHXskKU9ZS4/fVPrAezd1N12ldXExPshzwNzPzK0TZzx5PWf0nBl/9dWueUSAPdMrOl6cs3+9xFBa3moYTdt4Qkt64oNiMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758905948; c=relaxed/simple;
	bh=ZDbPNNwTc2xllQRq1upDRo55Uwg02Ak3IPmyPJuzBbA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=G9R1VWvNAuCZLQqMc2KDUIE2Nh5KcuIv7oqDIc6nwmdT/gskQKdE3C0Z6i74JZxurZtuisbGOy0XxItzib88MRKrnPd0CkpIxmN5AnLZXILZd2ksDG0OwRjhdF35cWeczD9Mv6G9sZd9UeDtd9jypwOBQW5QSQbDME3A4Koj754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=x6vV564S; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso2139321a12.1
        for <linux-next@vger.kernel.org>; Fri, 26 Sep 2025 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758905946; x=1759510746; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wF9E9YK/j++mNxViwWRBp72k3luVN6k0tCP2GBCao=;
        b=x6vV564SolIQ39T0Kzd22EYnsC+kMrHH5kbj9hm4oHy0AAOyZy0wdIeQhxYaZdF8Q/
         Rgv2X3I8JhGoYLme9OgdsSKrEyi3g9VM5GY0TDYlNh87Ix71Q+EVPc9++dDpCFxrO7kf
         szA9g8pylgzKSNZ16EXflYOBTYyy0svzaxkMZDUficUcMJatixJ9ZpQOEOiFvASOWsNB
         wWsP5uATRgM1WvOLzMWu4ST9JgJz42Knrq50chcsH/gccNRDq57S71qij/FWyIlAik6L
         VPtqq7axmha2LWmv6prrxAnkGLZpPh2U6KaHhN9P3Wf3W52d96dQFsAEbOeA3fvV9Od3
         WsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758905946; x=1759510746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P9wF9E9YK/j++mNxViwWRBp72k3luVN6k0tCP2GBCao=;
        b=pVSY4VZ2h+1+aBWVlf+cr+Py5AZoBKDv3w5VfNjUzEfE/3KvQlC7SpykjlCyGDmlqN
         zs7bDzLDr+FKVCXW0bZXoT9a+fw0BFYgDlPxY+3FhwTAjOAf/uCX9CZ/V6GtRxc15xTF
         1IB66iRDcYrW0c59y94r1wVp8YR28yOq9awrea2hl4PDbTr+rP/0HXJej1L6l8qWHxsy
         MjQCQapW/HC5TI6j2HFmeztBzupBXxFPYEXIb2m9NRcm50KZZnXRmXRiy5GIKa3+7vfK
         +yJnF0mhNsS/MrPl+v9+YR4FCZiAcCGZYsDwZqh9x9h1zKbZgHMnIHTWyMI16VeMV7tb
         7ISg==
X-Forwarded-Encrypted: i=1; AJvYcCXbiJbwL3Eojptf3CJPVitx3LgnS/CRzHPDAkYyZ5tw+n3tcgPBB99Pixc69scJM3qYEyk2A4pxaBys@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/0M+TRy/opRKG1aSgBt4FEVdxEvQLxl+tKv1LUCScO9dv9aBq
	a3pFdsJq3FeSNo/x05PDQTRXOSUf4Tu6cvuTL2y9nhYZhtbDSD2g3bARd/Ef96rxQXc=
X-Gm-Gg: ASbGncs+V7ixivsOexunZ0unVZqe/Ke9Li3Orr/KhCyRzw7ettYeegiGfPk7FJCFwE1
	j3Z/az3LePirRkr7Oj6MGcuqcESauXFsr45VuYoY/Cuv9hkbwK0HpdP3/omXAw0U7hiLekkK6A/
	zVM4FRdBDMTe3mZGijWmmvyPsgOUD8u4Th+T8B0LXzu48EEulNvQMJcovhKck58qI/8P8eyHAg5
	5QbGqlp3KrHBrpy65z5Jc9cdHYNiwnp7XvrcWOpxf0a0z9fKLL1wjj/pzkjQApmYvtLcqRIsuFK
	ty6VZGqJAb1OFvS8EAXyj3NHQmFNIg5ASnOYum2iQGOVQqUF7hVEIs8MRcYqp/vTuTGVY3G+keK
	3EqPXcWSbRNG5/UM9
X-Google-Smtp-Source: AGHT+IGdKydcAVudfo8tRjb74df6pGgrnXhjaVHzSaErxWrZA+8R5urcxY7HAacsddXeHVITgfN0qA==
X-Received: by 2002:a17:903:3d10:b0:269:74bf:f19a with SMTP id d9443c01a7336-27ed49df3f7mr104309095ad.11.1758905945942;
        Fri, 26 Sep 2025 09:59:05 -0700 (PDT)
Received: from 1e895cdadf47 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm57601085ad.138.2025.09.26.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 26 Sep 2025 16:59:03 -0000
Message-ID: <175890594349.36.5014274970333071394@1e895cdadf47>





Hello,

New build issue found on next/master:

---
 undefined reference to `pm_hibernation_mode_is_suspend' in vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f
- tags: next-20250926


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: undefined reference to `pm_hibernation_mode_is_suspend'

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b

## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e


#kernelci issue maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

