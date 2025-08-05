Return-Path: <linux-next+bounces-7856-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC80B1ADC1
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 07:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A81C617D65D
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 05:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385A5217F34;
	Tue,  5 Aug 2025 05:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ek/M3ws3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F199634
	for <linux-next@vger.kernel.org>; Tue,  5 Aug 2025 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754373548; cv=none; b=RCWb1rTUhkLHYvE8b83CWhTfWF7XFKSNjSuagqccykaYOR1nN4V/F4xOTERAoJPun+/ZHLhnlEl062Nskvs/JmMilxS2isw7/e9B4bD+xXqdEK23e/FA3hA15P4lAKjJPCINA5gdnLnfncyc9/QCAeHToW2sWH/99s5nY5ryPV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754373548; c=relaxed/simple;
	bh=PsHxA5qYLNfYn3Ntg2UdobfFyiyOtVnT3rYc6relMsU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=hWaNNwAp7YdV1xyb+cxGSuFejC7DobWmaAH8sdePGe9msb8IyxAzVgevbJcLhHQXXW8lNB3OygpKPYicGt9fPxkj99WwaAVRetZ4bO3Jl4GANZ6lqpvsWMfMuIVPJ5Il2rjtY9VZXaToc4vZHeu28vK7k0LX0aMmYuSY6jE9buc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ek/M3ws3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76b6422756fso6065962b3a.2
        for <linux-next@vger.kernel.org>; Mon, 04 Aug 2025 22:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1754373545; x=1754978345; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72FlBR8B/06WvSFn3arGkV91t1Crr+n+D2Jq2Led2/8=;
        b=ek/M3ws3uDO/1CSSvUNauhXkebTFrTO6ixj+NvzyrSooArf3IcahVoaVJmqVtXWrTG
         YJ2xeksfcr0GBe66+iDf4IiTkkNdtAER7z2O2gAWzTONEZL9J7rqjtK1IMHQ82ZpvCsa
         yZn0QZVz+0LECVxnQAjETPDacmkW42JNIS1zufirGv1QgZ5DEyFo7DHOsju0oKbrbctG
         7Tzl5ux1jDSOCvS4AMRpHld2UrzWyXFyZP1PDymY/Cbu5DKWBwC4fPQ4x7WrC6DJOa8r
         ATW15oLrLABLPoPPtlQcEM3nsQdSb5Wsyz2aRGgT7FmS/mmREwuR8ePsSkrAWZvtpVIn
         PY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754373545; x=1754978345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72FlBR8B/06WvSFn3arGkV91t1Crr+n+D2Jq2Led2/8=;
        b=qj+5QlOxClu+lxALCTRb297exmiG1RuZoOp2Bs+XwU/a4MrDpJrhhxa1qDiNbxODaf
         zxLCgwyOozi2kvMxKFmiMb4GGwzBV1HNBsLtvnELJtv264/Ahu0/52Yb2j77lMmwNb8h
         anjC2v8lx236mzoMn0BKTifse+W4xbcDmAqUq3d0K0d55Ozwp0sCB6BkqQc8tIyu5FGh
         rQp63Bn7PWO9IaqoXhV1TP7bhlD2NPQAo1hLDcpZebaKvsdxWk2319VfNeuNb+wjZq+8
         iLXxqFKhSIyxKSOKIa2EH0tq5/QGiP7qDP/iiQCQima3pQK8gSCJEGXposn+11QBvygf
         NnJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL0+lFkXvbfYO1g3O1mR5Y7zDtaWH+Yn+ICuON0z01s/tBaguJVF84cIlVDWaTgTA7PFCfYSMVYyf1@vger.kernel.org
X-Gm-Message-State: AOJu0YwTTnWEmUdQ5+aJPhMktqMXZ7bdXUxPEUrmyAzXP8lYBM2PMx+/
	buD96T17nTDi8Pc3POeBSM3lwDHfZKFUEhPres49thnZZME5gf7k8U6pi3nIimdKmGE=
X-Gm-Gg: ASbGnctAxDVlBpgYpnXWJfPm4T5mw5IBIBEocVS8kcoQkT+c17lz+f1K8ThvR2wazfo
	kSoX6idAGaAMVJhPa44Y/MdcWJ6TB0X4ITU0GC5IuJfaF3MOgkYlnkFsOYVenyoUcukrUpCbAtu
	ovk17Ujg70mgK1Z13dNL6WEJU639BL7ePBiy7VU0aY8lgGY8txPjf41rbqCI0z6xHa3h7ma3yp7
	GWDOFD6IGX/WANOzNEwq1epeno/AsJKBG5+C8RUJgw1PUFfw5xascsD+5JcAj2CJ9RTo5bhKidm
	mzqbnkYjf8zOkxgjmKT4Y4MGip4yQzz7G7UGtKVmkW/swSjV3mN8A3/b8hqhhTpBS3efdLMiXTI
	DOyV+tZnjWzxlGSWj
X-Google-Smtp-Source: AGHT+IG3RL7ptDva00+qEgfxzM6EESJNf/FpVXY6H5HgG5ct1fGYSEvfhYrM41Vb2WNUE5ShyTKtrA==
X-Received: by 2002:a05:6a00:88a:b0:748:33f3:8da8 with SMTP id d2e1a72fcca58-76bec303299mr14889217b3a.5.1754373545593;
        Mon, 04 Aug 2025 22:59:05 -0700 (PDT)
Received: from 508e4dbc6f9f ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf606978bsm6284528b3a.89.2025.08.04.22.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [REGRESSION] next/master: (build) the frame size of 1448 bytes is
 larger than
 1024 bytes [-Werror=fr...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 05 Aug 2025 05:59:04 -0000
Message-ID: <175437354419.1010.14815981800290011272@508e4dbc6f9f>





Hello,

New build issue found on next/master:

---
 the frame size of 1448 bytes is larger than 1024 bytes [-Werror=frame-larger-than=] in drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.o (drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:4d4120bf99fecc5f852604382b7c406b99440116
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
- tags: next-20250805


Log excerpt:
=====================================================
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:608:1: error: the frame size of 1448 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
  608 | }
      | ^
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_init.o
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c: In function ‘dcn10_log_hubp_states’:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:447:1: error: the frame size of 1156 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
  447 | }
      | ^
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/irq_service.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce80/irq_service_dce80.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce110/irq_service_dce110.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce120/irq_service_dce120.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn10/irq_service_dcn10.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn20/irq_service_dcn20.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:689185f279d5d217e5430785


#kernelci issue maestro:4d4120bf99fecc5f852604382b7c406b99440116

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

