Return-Path: <linux-next+bounces-7922-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D013B23E43
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 04:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F581B60293
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 02:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3176FC3;
	Wed, 13 Aug 2025 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="y5UQUCrY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F5E18E25
	for <linux-next@vger.kernel.org>; Wed, 13 Aug 2025 02:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755052235; cv=none; b=UJJanZ8fxEMsWZUQ1fyeGNvwY1NkJ/MJleJiLXrpwigMelv4ImMU/IO8dJtQtJnYf2yUjbXjKmIpp3/IrkcgiS3dDNjnKp23UL+tIS/fgMt94k5rB/NWcUkL2Q1usLdH+7fDbtjPxe4k5Q9GQoaqI44EQkDlgAfQ/Croht2cBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755052235; c=relaxed/simple;
	bh=nl65bsn2LeIPVdCQ7bWLQmpXMQ/yejAlQNglAmv+hNA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=BfOq2b2AYashVFmLaG6d7H9H0XdiulIZ866lSv5w4j3oSiOCGfada8akW7cupofbCPsEzPaRbfg5bHRBhOu0TiCc+vTeIoDeqh0ijNUjtHvuFbkHeH7kZcpCC7z2X6pvr9Uq8PLf6W0FnxSymJfwGyIgfSxquLRmuy2bmVIDm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=y5UQUCrY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b423036a317so3947972a12.3
        for <linux-next@vger.kernel.org>; Tue, 12 Aug 2025 19:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755052231; x=1755657031; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvytqaps9m8P0hRqCyh6E3Grve/JaI9hhJyNe3GfWHY=;
        b=y5UQUCrY5WbBG5V6VdIlsiSmih91My7kebOOAhmX+2LmelWhvWmbQKz7M0Cwd8N58v
         6VY/EdjTFXH+PoAvqQHJyh+qBYcsmT3F24bhvzZ2d2TCAYN3muw2Mwk+uiuava/LkqAw
         QtgnoilNpG9FlvQ4y+cJsC8h4qwrW+gZdXFtOzdGWIHdoTU83plRIty9Vqs+qSPGDFhY
         nQlJUhLRSXOdCL0HGu/3z4mi+2e0sLpMUZ4SRueEPnopvvJxexLw9Pi3OMkQtSJOkdy8
         M9PR6g9MislsMlecw1ngPaknlJBEvFLMruVztvtn52XVVo7tNlrY/I7/OqKy3K+G3XZ9
         KjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755052231; x=1755657031;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hvytqaps9m8P0hRqCyh6E3Grve/JaI9hhJyNe3GfWHY=;
        b=unDnqH7Dbtw1SSxVizTwDcewXyHCF6Jb4fHgh3z0mADQjE/ZN8oisisYNMnRgUHjYT
         AJOURnTKMhVUeexRtVqfEVF5mxkPkdeKJ3VLXJXp+AxB09Oc2L078XPyyavd1t3mgBK7
         UFBe/d+1JZ4C0x8aFqZ3y32m9u7169hnaii/pspEE4/x+crdCUmNNUcbWtvUSQ7N9Yvk
         tpVb3dVK9k6hl8qv0bttDwVT1tofaoUa/8Vzd56nIybsIGFD7glkgiMWxPOqJEVgACBP
         sbrn0VtQ1LchoZgDMQtNlnKICZv6WqzlS4H636k0mhFfww3PAH6+46/uNz0ELXnH+5hR
         4NPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3TB9KRIbd73qO9bzAnkcv3fKR2dOxGm9bm/dfqDMrQoweiJjSIWFoPPOHJ9EgfJpkAJk+ra7VjO9J@vger.kernel.org
X-Gm-Message-State: AOJu0YxZmqNFyAH9cqPaW+hnRymFHjP2IcFcDSw9nujqfbcnUlGTNozp
	Dgu3W2nTVicoDLvwp6XWI8qEN76e4Xn+cXJNRVLvyMm3V+yTdVFLon7SQnuqGzDl2ng=
X-Gm-Gg: ASbGncs12OehxJqJfTYYSQZ/JvkUdWV4go/+bQMlEWioMJ4f+cuhkUUxeNhXBxy6ReH
	E851zzREA3rDu4Uqj9W7YdJ4+wVXzJo/6wpcWlEXbUVTwPfGMc1JKsWIARIH+nOtIfhhgHeZ124
	FE8sWV/8wnwO2Qx8LFN62Wd5WovB+1+D/suh8s5k00BGULkshDNxpmyNu9OL+iqh2VKaGWS54g1
	Ydvs9jIQi6+B3oXi/muFujL2lNhwdX711bMpOsqxD9u16tnGZqGmOf2XivTdKAN77dYXNJjm+1B
	AmRBfeG/PUucLuvrN2Q2L0gJR5MYh4lCml0qQ8K5UlD5nunYmmApGNL6osFqEgpZjSXu4ls8GJo
	9Q6V4a6VkhGXA/0xQPqQgO0VB3rk=
X-Google-Smtp-Source: AGHT+IEiueWSluUkzZcWIXqGlBB2xs5264dyRDo5KoKzv2qn5Ws/Et1Ew9RVbqh2uP9evigNhK8Jhw==
X-Received: by 2002:a17:903:946:b0:23f:fa2c:3aff with SMTP id d9443c01a7336-2430d2b9cc8mr20462225ad.52.1755052231145;
        Tue, 12 Aug 2025 19:30:31 -0700 (PDT)
Received: from 99cfaf6094a7 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976cb1sm312297635ad.89.2025.08.12.19.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:30:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 13 Aug 2025 02:30:30 -0000
Message-ID: <175505222976.280.16617959115337420644@99cfaf6094a7>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
origin: maestro
test start time: 2025-08-12 04:29:38.015000+00:00

Builds:	   59 ✅    1 ❌    0 ⚠️
Boots: 	   87 ✅    0 ❌   57 ⚠️
Tests: 	14463 ✅ 4443 ❌ 5365 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689acd81233e484a3f8ceda8
  history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689adfae233e484a3f8d9ce9
  history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ae0bd233e484a3f8da449
  history:  > ✅  > ✅  > ❌  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ae0bd233e484a3f8da44a
  history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd9d233e484a3f8cee78
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.landlock (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689adfa6233e484a3f8d9cb7
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689adfa8233e484a3f8d9cc3
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ac92d233e484a3f8cd462
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- ltp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ac98a233e484a3f8cd52e
  history:  > ❌  > ❌  > ⚠️  > ✅  > ✅  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ad03d233e484a3f8d1134
  history:  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd8b233e484a3f8cee2e
  history:  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdec233e484a3f8cf03e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ace1c233e484a3f8cf2ef
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
- kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689aca7b233e484a3f8cd8b2
  history:  > ❌  > ✅  > ❌  > ❌  
            
- kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689aca7c233e484a3f8cd902
  history:  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689aca7b233e484a3f8cd8a3
  history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdac233e484a3f8ceea5
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd8f233e484a3f8cee3d
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ad040233e484a3f8d1146
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdb1233e484a3f8ceeb1
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdce233e484a3f8cef17
  history:  > ❌  > ⚠️  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdf9233e484a3f8cf1b4
  history:  > ❌  > ❌  > ✅  > ⚠️  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd93233e484a3f8cee4f
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ace19233e484a3f8cf2e5
  history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd90233e484a3f8cee43
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acda5233e484a3f8cee93
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdb3233e484a3f8ceeb7
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdd5233e484a3f8cef24
  history:  > ⚠️  > ❌  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdff233e484a3f8cf1c6
  history:  > ⚠️  > ❌  > ⚠️  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:689adfa4233e484a3f8d9ca8
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689ae081233e484a3f8da276
  history:  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca2a233e484a3f8cd7d9
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca35233e484a3f8cd7eb
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca41233e484a3f8cd7ff
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca20233e484a3f8cd7c7
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca14233e484a3f8cd7b1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af61e233e484a3f8dc05e
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af623233e484a3f8dc082
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af626233e484a3f8dc0a9
  history:  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af628233e484a3f8dc0bb
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af62b233e484a3f8dc0cd
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: mt8186-corsola-steelix-sku131072
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689ae082233e484a3f8da279
  history:  > ✅  > ⚠️  > ✅  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689acd7a233e484a3f8cece3
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689acaa5233e484a3f8cda01
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca2c233e484a3f8cd7dc
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca36233e484a3f8cd7ee
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca42233e484a3f8cd802
  history:  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca22233e484a3f8cd7ca
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca51233e484a3f8cd814
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca17233e484a3f8cd7b4
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca64233e484a3f8cd83d
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca75233e484a3f8cd84f
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af61a233e484a3f8dc03d
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af61c233e484a3f8dc04f
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af628233e484a3f8dc0be
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af62b233e484a3f8dc0d0
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: mt8192-asurada-spherion-r0
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689ae083233e484a3f8da27c
  history:  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca2e233e484a3f8cd7df
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca38233e484a3f8cd7f1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca44233e484a3f8cd805
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca23233e484a3f8cd7cd
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689ae083233e484a3f8da27f
  history:  > ✅  > ⚠️  > ✅  
            
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca7f233e484a3f8cd91c
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca83233e484a3f8cd91f
  history:  > ❌  > ❌  > ⚠️  > ❌  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca9e233e484a3f8cd9fb
  history:  > ❌  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689acaa1233e484a3f8cd9fe
  history:  > ❌  > ⚠️  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689acf01233e484a3f8cff59
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689acab7233e484a3f8cda10
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca30233e484a3f8cd7e2
  history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca3a233e484a3f8cd7f4
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca47233e484a3f8cd808
  history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca58233e484a3f8cd81a
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca1b233e484a3f8cd7ba
  history:  > ❌  > ⚠️  > ❌  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca6a233e484a3f8cd843
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca7b233e484a3f8cd8d3
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af618233e484a3f8dc031
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af61d233e484a3f8dc055
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af61f233e484a3f8dc067
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af624233e484a3f8dc0a0
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af62c233e484a3f8dc0d6
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af62e233e484a3f8dc0e8
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
Hardware: mt8365-genio-350-evk
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acc6f233e484a3f8ce0d9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689accee233e484a3f8ce482
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689accc5233e484a3f8ce419
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acd1d233e484a3f8ce72c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- kselftest.cpufreq.suspend (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ace44233e484a3f8cf3d3
  history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ad7c1233e484a3f8d576c
  history:  > ❌  > ❌  > ✅  > ❌  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acc93233e484a3f8ce3bf
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689accdc233e484a3f8ce446
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689accf1233e484a3f8ce485
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd80233e484a3f8ced9a
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acde3233e484a3f8cf02d
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ace13233e484a3f8cf2dd
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acc39233e484a3f8cde99
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689ad092233e484a3f8d185e
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acc76233e484a3f8ce267
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acc96233e484a3f8ce3c2
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689accb1233e484a3f8ce3f0
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689accdf233e484a3f8ce451
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689accf4233e484a3f8ce489
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acd0d233e484a3f8ce60e
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acd22233e484a3f8ce732
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acd36233e484a3f8ce836
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca11233e484a3f8cd7ab
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acc99233e484a3f8ce3d0
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acd10233e484a3f8ce615
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acd24233e484a3f8ce7f9
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acd38233e484a3f8ce8fe
  history:  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd96233e484a3f8cee5c
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdb4233e484a3f8ceeba
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdd8233e484a3f8cef27
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ace03233e484a3f8cf2be
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd96233e484a3f8cee5f
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:689ae083233e484a3f8da282
  history:  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca27233e484a3f8cd7d3
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689acd95233e484a3f8cee54
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca3c233e484a3f8cd7f7
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca1c233e484a3f8cd7bd
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca5b233e484a3f8cd81d
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af619233e484a3f8dc034
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af620233e484a3f8dc06a
  history:  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af62f233e484a3f8dc0eb
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca29233e484a3f8cd7d6
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca34233e484a3f8cd7e8
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca3f233e484a3f8cd7fa
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca4b233e484a3f8cd80e
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:689aca1e233e484a3f8cd7c4
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af617233e484a3f8dc025
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af61e233e484a3f8dc05b
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689af62d233e484a3f8dc0dc
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ac932233e484a3f8cd46b
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ac94c233e484a3f8cd4a3
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ac958233e484a3f8cd4c2
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:689ac964233e484a3f8cd4da
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ad03a233e484a3f8d1120
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ad040233e484a3f8d1141
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ad049233e484a3f8d134e
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd91233e484a3f8cee49
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ad022233e484a3f8d103b
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acd99233e484a3f8cee6b
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:689acce7233e484a3f8ce476
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9ee233e484a3f8cd64d
  history:  > ✅  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc5a233e484a3f8d8a44
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc5c233e484a3f8d8a5d
  history:  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc68233e484a3f8d8adf
  history:  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc6b233e484a3f8d8af7
  history:  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc6e233e484a3f8d8b0f
  history:  > ✅  > ⚠️  > ⚠️  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9fc233e484a3f8cd6d6
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc6b233e484a3f8d8afa
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca0a233e484a3f8cd765
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: acer-R721T-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9eb233e484a3f8cd632
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f2233e484a3f8cd674
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f9233e484a3f8cd6b6
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9ff233e484a3f8cd6fa
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca06233e484a3f8cd73e
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca0d233e484a3f8cd780
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc52233e484a3f8d89c4
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc55233e484a3f8d89ef
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc58233e484a3f8d8a32
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc5a233e484a3f8d8a4a
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc5d233e484a3f8d8a63
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc63233e484a3f8d8a93
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc66233e484a3f8d8acd
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc60233e484a3f8d8a7b
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc69233e484a3f8d8ae5
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc6c233e484a3f8d8afd
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc6e233e484a3f8d8b15
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9ef233e484a3f8cd65c
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca0b233e484a3f8cd76b
  history:  > ❌  > ⚠️  > ❌  > ⚠️  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9e9233e484a3f8cd620
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f7233e484a3f8cd6a4
  history:  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f9233e484a3f8cd6be
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca0d233e484a3f8cd786
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca0b233e484a3f8cd771
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f1233e484a3f8cd66b
  history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
- kselftest.cpufreq.hibernate.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acce3233e484a3f8ce467
  history:  > ❌  > ✅  > ❌  > ❌  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f8233e484a3f8cd6ad
  history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689acdfb233e484a3f8cf1bb
  history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9ed233e484a3f8cd641
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f3233e484a3f8cd683
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9fa233e484a3f8cd6c7
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca01233e484a3f8cd709
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca08233e484a3f8cd74d
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca0e233e484a3f8cd78f
  history:  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc53233e484a3f8d89ca
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc56233e484a3f8d89f5
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc58233e484a3f8d8a38
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc5b233e484a3f8d8a50
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc5e233e484a3f8d8a69
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc64233e484a3f8d8abb
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc67233e484a3f8d8ad3
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc60233e484a3f8d8a81
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc6a233e484a3f8d8aeb
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc6c233e484a3f8d8b03
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc6f233e484a3f8d8b1b
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc56233e484a3f8d8a14
  history:  > ✅  > ⚠️  > ✅  
            
Hardware: hp-14-db0003na-grunt
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9ec233e484a3f8cd63e
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f3233e484a3f8cd680
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9fa233e484a3f8cd6c4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca00233e484a3f8cd706
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca07233e484a3f8cd74a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca0e233e484a3f8cd78c
  history:  > ❌  > ⚠️  > ❌  > ❌  > ⚠️  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f1233e484a3f8cd671
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca06233e484a3f8cd73b
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc54233e484a3f8d89d3
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc59233e484a3f8d8a41
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc5c233e484a3f8d8a5a
  history:  > ✅  > ⚠️  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f4233e484a3f8cd689
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f1233e484a3f8cd66e
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9f8233e484a3f8cd6b0
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc65233e484a3f8d8ac1
  history:  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc68233e484a3f8d8ad9
  history:  > ✅  > ⚠️  > ✅  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:689adc61233e484a3f8d8a87
  history:  > ✅  > ⚠️  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689ac9ed233e484a3f8cd64a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:689aca0f233e484a3f8cd798
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

