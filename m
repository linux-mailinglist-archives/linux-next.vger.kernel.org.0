Return-Path: <linux-next+bounces-7995-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB6B2B710
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 04:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E47EA3BF8C9
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 02:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B2B126F0A;
	Tue, 19 Aug 2025 02:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qsAX6BPz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3CB2E40E
	for <linux-next@vger.kernel.org>; Tue, 19 Aug 2025 02:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755570763; cv=none; b=ceP3KsBAgS4fMGXDNccWIxZxr5Ejbqpg0JZ4ImeRd9NzA9qZ0i52nRfgRrQdozoB0WWF13uowggmnb082Usc81RX0SOoAvXixqVfI3+JOjMwusdHm5G0qC70BGAdizLrKuz7uS261lj7JmLkQn+y6Gd1f+1eGLESIiqQDe8T6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755570763; c=relaxed/simple;
	bh=9XzocCawiFHHdnI+VM1L87C8U0b21gzQjYJCfHwYzlU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=m+o7HRxWH28FJcCYU+MIqe4IV8nR93RjIxJEzDhlIqrzEOhI++llIWOXtE+4qiY+ucsxq1u1J253HD/kEZPtpqTgga2s6lzO0mtIUqRVUJfUJdzRZlTh5CT387VMK2IdxKd0ON3DYOqCwPVrNhAeMqfJ4U4mnwHOHgzTAq7+cvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qsAX6BPz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2445818eb6eso35979875ad.2
        for <linux-next@vger.kernel.org>; Mon, 18 Aug 2025 19:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755570758; x=1756175558; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnsTqU4PU2bdlsgdJNNGwJt84DnvpAY8BySype8Xmx4=;
        b=qsAX6BPzmyQTQXiOfKDxsgFNOyzHHE7lqx31GbaeBDk6GcFxxmHQKrKO1jUCl+eof6
         LaownMdEhZAG03dr3tikzkNZPU173Rl5rJRMJMErmMU+6DmTSPEVba7jtKNCyTRNgILb
         iAmaqxgr2hJor2XTwVrKnl6ssJHPWfbktcR1FBPGVraegsrE45iQeFGbo6YgLXrmg6tZ
         8IiqMJ35rJra9FQ0j9x2HwlhAvvTy4GKGJgMK+4Gn7XwxSSigfd81X3H4NeFgXi5mHsI
         cwkiyLrxk7OCxQBL7iB4JvRkVCd5okVPMg0mhP1rqar/d+RGo1zZunD4kdly5H2Ef8ef
         QW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755570758; x=1756175558;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DnsTqU4PU2bdlsgdJNNGwJt84DnvpAY8BySype8Xmx4=;
        b=Hj5zeqY5AVXe7HolF6nxymdyGW7O+VVw2rtGAzB/pFDBs1l9DcBBWHLmmGbCJaCPYX
         EjOQWLVAKj/acOeFwFK08B2lQ+MPmt5vdi6ifKdTrMgRmjD1KKHq2Qackjil4+Mrep7E
         e1DYzD4HTkAtt8FqnmML8e0x3Y2eTyGlDzjwx/RvR8eQt4UT4QyHpz4FrnFg0xZrBWWn
         0WKiDFs1hs4VPaPbaTNmgWHYpv+Waq96Y4X34i0QzFBq+riqXoEci7jDx4T8pUkzupBI
         C2a2Xomx52f93FJdAWFm6owkWBrelHNfBzAcXbTRbsHIqcCkC8dnkghD0nk8V2k+mev+
         9FGg==
X-Forwarded-Encrypted: i=1; AJvYcCVshxorAjj6AIQMS7TFcTM5T5XebWwq6QjOhpIGY6Wa3kI1sCBqVTKd6OqM9PlwXrUFPL2ussoyw9Bs@vger.kernel.org
X-Gm-Message-State: AOJu0YyjtwL6aNVIJ06Uy+tRq1EpIHFiKHyotiWjC5Jnd0bsiXaT0bWp
	olUsNJfg/ifkFyW16vy35TiF8atMUqZSxFX34+lLlCRBjc41CqnlU8L6XJPbAEICAo8=
X-Gm-Gg: ASbGnctc3CE04LCjtuXi4w8tT3isgmsfh2hVXt4zWbAq/Z9W0+c9sRrzQbbfbJWCbwG
	KtPrjueJe6RqlkUgaqQC+asO64Ni+kU5OWpfrFv4YjzDWnmX9c4mXgIP5tte7SJ3vC3oT6jSf4b
	k/aXbWAtdtHnE1Wcw6QZRQB2VCpuuj0MfJPzq9lYL3fGWpujhutcq4duDSPePA1Lrs90M2/vWp/
	wcm+Zjt5uhubn1AdsL/+1TOveP/PYkl1vNBbS0G2KP6OPIct19i5o2BOy2s12KR8RmXRMlAawyS
	Ypktp2CLkIo3hbRmoxqNi3dfSrrZ23EHN4U+F6U9XKLfTgE7npoufhipS6N8qks1xVrGuC1/VZZ
	T09QpZkjlqcTIKQoDPF9xbXsBVPg=
X-Google-Smtp-Source: AGHT+IHUdxt9C4rKJUe1ifTrokKh2R8wRH0Z43FDV8Q6TtPKT5VcGbST2M+BQrQOlEVxJ1Z13/7sqA==
X-Received: by 2002:a17:902:d487:b0:240:9ff:d546 with SMTP id d9443c01a7336-245e02c13f3mr11074265ad.6.1755570757929;
        Mon, 18 Aug 2025 19:32:37 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9e063sm93050795ad.34.2025.08.18.19.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 19:32:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 3ac864c2d9bb8608ee236e89bf561811613abfce
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 19 Aug 2025 02:32:36 -0000
Message-ID: <175557075612.144.3622524437951257782@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/3ac864c2d9bb8608ee236e89bf561811613abfce/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 3ac864c2d9bb8608ee236e89bf561811613abfce
origin: maestro
test start time: 2025-08-18 04:40:26.641000+00:00

Builds:	   59 ✅    1 ❌    0 ⚠️
Boots: 	   90 ✅    0 ❌   57 ⚠️
Tests: 	15190 ✅ 5530 ❌ 4466 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
- fluster.debian.v4l2.gstreamer_h264_frext.validate-fluster-results (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b55b233e484a3f9dc1ab
  history:  > ✅  > ✅  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b60e233e484a3f9dc9d9
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc4cf
  history:  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc4ce
  history:  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc4cd
  history:  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc4cc
  history:  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc4cb
  history:  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc4ca
  history:  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc4c9
  history:  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc4c8
  history:  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b58c233e484a3f9dc540
  history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
- fluster.debian.v4l2.gstreamer_h264.validate-fluster-results (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b593233e484a3f9dc5e4
  history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b769233e484a3f9de23e
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b5ec233e484a3f9dc813
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b62b233e484a3f9dcbf2
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b630233e484a3f9dccf9
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b63e233e484a3f9dcd4e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b641233e484a3f9dcd58
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b644233e484a3f9dcd5b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b647233e484a3f9dcd65
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b64b233e484a3f9dce5d
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b667233e484a3f9dcf2b
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b675233e484a3f9dd0f3
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b678233e484a3f9dd137
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b67a233e484a3f9dd13a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b67d233e484a3f9dd13d
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b684233e484a3f9dd152
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b681233e484a3f9dd14b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b68d233e484a3f9dd1ab
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b687233e484a3f9dd156
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b68a233e484a3f9dd1a7
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b691233e484a3f9dd1b1
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8b9233e484a3f9df165
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8be233e484a3f9df17c
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8c3233e484a3f9df17f
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8c8233e484a3f9df185
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8cc233e484a3f9df188
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8d5233e484a3f9df530
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ring-buffer (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8da233e484a3f9df534
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.rlimits (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8df233e484a3f9df539
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.seccomp (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8f0233e484a3f9df699
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.splce (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8e4233e484a3f9df53d
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.sync (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8e8233e484a3f9df680
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timens (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8ec233e484a3f9df696
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.ublk (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8f6233e484a3f9df69c
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.uevent (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8fa233e484a3f9df69f
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.user_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b900233e484a3f9df6a2
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b71b233e484a3f9ddb94
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b833233e484a3f9deef3
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b874233e484a3f9df118
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b899233e484a3f9df149
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b88f233e484a3f9df139
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bb8b233e484a3f9e0dc5
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bb8c233e484a3f9e0dcb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bb94233e484a3f9e1019
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bb95233e484a3f9e1022
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
- kselftest.dt.dt_test_unprobed_devices_sh_sound (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2ba7d233e484a3f9e0669
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bb91233e484a3f9e0de9
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b72a233e484a3f9ddd36
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b9ad233e484a3f9dfc63
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b7b1233e484a3f9dea5c
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bbe0233e484a3f9e128d
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bce8233e484a3f9e1839
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b741233e484a3f9ddf6c
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b788233e484a3f9de6a1
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b731233e484a3f9dde90
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b78c233e484a3f9de6a4
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b7ba233e484a3f9deb28
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b80e233e484a3f9deec8
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b849233e484a3f9df003
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bb90233e484a3f9e0de3
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a2ce75233e484a3f9e5dc3
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3f8233e484a3f9db76c
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b404233e484a3f9db792
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3f1233e484a3f9db758
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b40c233e484a3f9db7a4
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3e9233e484a3f9db744
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bba4233e484a3f9e1194
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bba6233e484a3f9e11a6
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bbaf233e484a3f9e11e4
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bbb2233e484a3f9e11f6
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bbb5233e484a3f9e1208
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3ff233e484a3f9db783
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b41e233e484a3f9db7cb
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb9f233e484a3f9e1062
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bba1233e484a3f9e1074
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bba4233e484a3f9e1197
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bf1b233e484a3f9e2873
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: mt8192-asurada-spherion-r0
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3fa233e484a3f9db774
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b400233e484a3f9db786
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b406233e484a3f9db798
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3f3233e484a3f9db75e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b422233e484a3f9db7d4
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ❌  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b424233e484a3f9db7d7
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ❌  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b42a233e484a3f9db7e3
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ❌  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b42f233e484a3f9db7f1
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b620233e484a3f9dcb37
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b61f233e484a3f9dc9ff
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3fb233e484a3f9db777
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b401233e484a3f9db789
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b653233e484a3f9dcef9
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3f4233e484a3f9db761
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3ed233e484a3f9db74d
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ❌  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b418233e484a3f9db7bf
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b420233e484a3f9db7d1
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb9d233e484a3f9e1056
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bba0233e484a3f9e1068
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2beb3233e484a3f9e24c0
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bba8233e484a3f9e11af
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bc8e233e484a3f9e15e7
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bbb7233e484a3f9e1212
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bbba233e484a3f9e122c
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8365-genio-350-evk
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb18233e484a3f9e0823
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb57233e484a3f9e0c63
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bf7d233e484a3f9e2bc5
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bedf233e484a3f9e27d1
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb58233e484a3f9e0c66
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: mt8395-genio-1200-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b9d3233e484a3f9e00a5
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bc4f233e484a3f9e152b
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2baff233e484a3f9e07ed
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb19233e484a3f9e0829
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb21233e484a3f9e084a
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb32233e484a3f9e0b0a
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb3d233e484a3f9e0b25
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb29233e484a3f9e0a94
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb46233e484a3f9e0b40
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb50233e484a3f9e0c4e
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb59233e484a3f9e0c69
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b50e233e484a3f9dbee5
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3288-rock2-square
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b5c5233e484a3f9dc6ea
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb1a233e484a3f9e082e
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb47233e484a3f9e0b43
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bb51233e484a3f9e0c51
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: rk3399-rock-pi-4b
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2baf4233e484a3f9e07cc
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bde9233e484a3f9e1ec0
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b749233e484a3f9ddf72
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b7be233e484a3f9deb2f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b813233e484a3f9deecb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b84d233e484a3f9df006
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b74d233e484a3f9ddfc5
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b7e0233e484a3f9dec47
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2-Gst1-0.vp80-03-segmentation-04 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b711233e484a3f9dd8bc
  history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b3fc233e484a3f9db77a
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_timer_17c20000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b50d233e484a3f9dbe82
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b419233e484a3f9db7c2
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a2bea8233e484a3f9e2423
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a2ce77233e484a3f9e5dd2
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b43e233e484a3f9db824
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_timer_17c20000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a2b4fb233e484a3f9dbca9
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b5f8233e484a3f9dc95b
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b63b233e484a3f9dcd4b
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b656233e484a3f9dcf05
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a2b671233e484a3f9dcf37
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8b0233e484a3f9df15f
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b8d1233e484a3f9df491
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b904233e484a3f9df6a5
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b73a233e484a3f9dde96
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bb90233e484a3f9e0de6
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b854233e484a3f9df00c
  history:  > ❌  > ❌  > ⚠️  > ❌  > ✅  
            
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bd87233e484a3f9e1a79
  history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bd87233e484a3f9e1a7a
  history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2bd87233e484a3f9e1a7b
  history:  > ❌  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b75a233e484a3f9de222
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b625233e484a3f9dcbdf
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c11b233e484a3f9e3695
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c123233e484a3f9e36e0
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c131233e484a3f9e37db
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c136233e484a3f9e380b
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b64a233e484a3f9dcd67
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ❌  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c121233e484a3f9e36cb
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c134233e484a3f9e37f6
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c136233e484a3f9e380e
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b62c233e484a3f9dcbf4
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b6bc233e484a3f9dd3c6
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: acer-R721T-grunt
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c121233e484a3f9e36ce
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c126233e484a3f9e36fe
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b6b6233e484a3f9dd3b8
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b69a233e484a3f9dd280
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b4ef233e484a3f9dba50
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b617233e484a3f9dc9e7
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b4e8233e484a3f9db9fd
  history:  > ✅  > ✅  > ✅  > ❌  > ⚠️  
            
Hardware: hp-11A-G6-EE-grunt
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c135233e484a3f9e37ff
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b4eb233e484a3f9dba21
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c138233e484a3f9e381a
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a2c138233e484a3f9e3842
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b4f3233e484a3f9dbb73
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b4f0233e484a3f9dbb4e
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a2b76a233e484a3f9de240
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

