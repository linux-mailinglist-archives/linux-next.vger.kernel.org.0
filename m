Return-Path: <linux-next+bounces-8025-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C23BB2D1E6
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 04:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B149A4E5E8E
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 02:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655D11F416B;
	Wed, 20 Aug 2025 02:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kXnxdpGS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AFE53A7
	for <linux-next@vger.kernel.org>; Wed, 20 Aug 2025 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755657034; cv=none; b=ttp1yCrSTefQTm19iY9CpMZ44PXGI9ibExEjee01o+FiC+2E8ep+prZzWSXdGPhyU8oXD6e40qricEzeyIjDQnx5NCBrWChGjiXZ4Lbgt/EJNnumedCevfrQtC1+ykR+RAlurtQAI4pBgLqfJhBXYmK5PAF4QtRQRAW2Zgbm9j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755657034; c=relaxed/simple;
	bh=4nVdmQmDwyhSzvK1lj3jJWUpmpp23Fjbg9V3L6GJMH8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=fr/75BB7YwCZs4zxWhUBWhtxAEeel+xG9eXU0zeYPwEOqkV5MRV7uN3q0Opxe7GTGh6ADPfTpOVVbjjetZTZ0MXxel9A37zrvwVgTiq9ceqMRh+1gzPZjZHVzqWUhCRtO7xNk/lEDzxKqu6bWRFgX5Ix8MdiwYDpQz4UJCfrIsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kXnxdpGS; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b47174aec0eso4005320a12.2
        for <linux-next@vger.kernel.org>; Tue, 19 Aug 2025 19:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755657031; x=1756261831; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkTZXtUq/a+OWOQ5cD/IiDh5Kg/KWOv5sGYmliisUY8=;
        b=kXnxdpGShVLAN6ZvbnJvngajuiNXZt/mr/K6zCG+C6ugHHSRUP9lXJi+lDsiQcCnw0
         kIZTxgFHH9mrqOjpEamo9G1UzfeJwaRb+8bQT+CZk7aQ7gKNreakEXOppfXgvbo36c4R
         D9hJRgdFpT/z5bjjryEyCpC8b27xqnrbU8tmQhzgyNemZfS005jOO9+C+E8rsz58GH5Q
         BFSxSlKFSWj35V6rzF+VBmiGZzPnxPkZdfsOjBdQM8e4SHiGsTvsYnvmj5qsvhUqLEQD
         cmITYOPZZ4GWb+Bjg6YzeV55XqWDUZleJIry6QKi/B4edM4+3JPGj9ppT2H0qni2pxKJ
         RcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755657031; x=1756261831;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zkTZXtUq/a+OWOQ5cD/IiDh5Kg/KWOv5sGYmliisUY8=;
        b=kQqIf8+wm3Os+xssANVBAJXUStYuiHKJe5Jdl4gru+45tSmzsuHs9ZTpgXK1Jf7a1W
         yderSh0AniEql/XdhqdJAjWUADKHPGGSknoghq3NZE8V+ZQyza7+ULhKUsjrlpBqLf7H
         ZRdDvsTqn2SwIm7QC6JyU2wQM7pKzE2uxfVB7CfhoLKBJPOADYuFnkx9YbIax5gVA+/B
         SgA0OnigScgjfMtdaofevgnOkQ+HD2eJBn5CZef1r7TNxE79ILGW28fxYDYdhATxI7aH
         haYXrTI5HGSUPYB9rhnH4Wr4oCbPhoyUbcbfY93JsYT/rR3NGig4/RYo7S03Nl3FcM66
         MjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUp8td9TRh7CkAnvlmXvbLXSZYjghmMdFeByUFw6Z2cz5O47/t5yXKpOryUwKBnpZngqw9BdKju0ej@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYaAgAM2SAlj3joqDLartUPq2KyUETBghOVmGMwhwU63vcNuY
	JDaIIaRyLlqfuwYWj9jS6Y3NSxHJnX3iM65dkX6FgaEsKibG7XdzsBK9q8hwm0DM+y7RKaiRZcE
	C6SJR
X-Gm-Gg: ASbGnctz6046iaRMMpQutmirZ6KFiwzdPVLhL/xngRQvS/qfow0nBsgYVIoez/7tHN4
	Baqwo7GyiiuLyLDWc+YxO2grpwQH2CSeJi0+zg2bUPZUm/aHAzGRlCYXmDDaucV5SSWpTf0dCcN
	NPI75ZQat/NXJJvJWUp/EBBm+EZmgxxInUaqAUbmsqXGlLFgMQ/LOLiFavCSL3bbYzFVUv8Xq28
	mLuOTm3hSw/JblTNZsmSqxb8OGeMDLunAOAXQnazpgzUuXG3CvxXixGKA30tPyiH7GSJ6fXLyvC
	iilwmCH/gNU6Wq/27Xd0s++O2rN51ttcBUOtUN4hlILrAoIKgng1nJldgOblARCIkhoVRyCjvkY
	+Uyfu1yBegt3/AqMg
X-Google-Smtp-Source: AGHT+IFF/3U4qqUNLCbit1mJtbcOi7qkP01sDX/TLfdfyXW3CJrcV7wka0l/3YfEm/RwJPXRDwVUMw==
X-Received: by 2002:a05:6a20:258a:b0:240:2371:cffd with SMTP id adf61e73a8af0-2431b7b40c2mr2136721637.7.1755657030692;
        Tue, 19 Aug 2025 19:30:30 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640d508esm946613a12.58.2025.08.19.19.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 19:30:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 886e5e7b0432360842303d587bb4a65d10741ae8
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 Aug 2025 02:30:29 -0000
Message-ID: <175565702944.80.3604977280541985668@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/886e5e7b0432360842303d587bb4a65d10741ae8/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 886e5e7b0432360842303d587bb4a65d10741ae8
origin: maestro
test start time: 2025-08-19 06:46:12.542000+00:00

Builds:	   59 ✅    1 ❌    0 ⚠️
Boots: 	   88 ✅    0 ❌   57 ⚠️
Tests: 	13918 ✅ 5435 ❌ 4324 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8195-cherry-tomato-r2
- fluster.debian.v4l2.gstreamer_av1_chromium.validate-fluster-results (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a42441233e484a3fa0654e
  history:  > ✅  > ✅  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp8.validate-fluster-results (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a424e1233e484a3fa068a4
  history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4265c233e484a3fa08bd9
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4265d233e484a3fa08bdf
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4265d233e484a3fa08be2
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42663233e484a3fa08bfd
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4266b233e484a3fa08cba
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42670233e484a3fa08cd6
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42692233e484a3fa08def
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4269f233e484a3fa08eff
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42447233e484a3fa0656f
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42449233e484a3fa0657b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4244e233e484a3fa065e0
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42450233e484a3fa065ec
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.zram (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42456233e484a3fa06615
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429c4233e484a3fa0aabe
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429cc233e484a3fa0aaf9
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429cd233e484a3fa0aafc
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429cf233e484a3fa0ab08
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429cf233e484a3fa0ab0b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d0233e484a3fa0ab0e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d0233e484a3fa0ab11
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d0233e484a3fa0ab14
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d4233e484a3fa0ab2c
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d6233e484a3fa0ab38
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d6233e484a3fa0ab3b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d7233e484a3fa0ab3e
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d7233e484a3fa0ab41
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d8233e484a3fa0ab4e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d8233e484a3fa0ab44
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429da233e484a3fa0ab57
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d8233e484a3fa0ab51
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d9233e484a3fa0ab54
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429da233e484a3fa0ab5a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c1233e484a3fa0a18c
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c1233e484a3fa0a18f
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c2233e484a3fa0a192
  history:  > ❌  > ❌  > ⚠️  > ❌  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c2233e484a3fa0a195
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c3233e484a3fa0a198
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c3233e484a3fa0a19e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.ring-buffer (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c4233e484a3fa0a1a1
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.rlimits (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c4233e484a3fa0a1a4
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.seccomp (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c6233e484a3fa0a1b0
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.splce (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c5233e484a3fa0a1a7
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.sync (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c5233e484a3fa0a1aa
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.timens (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c6233e484a3fa0a1ad
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.ublk (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c7233e484a3fa0a1b3
  history:  > ❌  > ❌  > ⚠️  > ❌  > ⚠️  
            
- kselftest.uevent (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c7233e484a3fa0a1b6
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.user_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c7233e484a3fa0a1b9
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4264f233e484a3fa08a89
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42664233e484a3fa08c03
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4266c233e484a3fa08cc7
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42671233e484a3fa08cdc
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42683233e484a3fa08db3
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42699233e484a3fa08eed
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a426a5233e484a3fa08f11
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a426a2233e484a3fa08f05
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42446233e484a3fa0656c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42448233e484a3fa06572
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4244f233e484a3fa065e6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42450233e484a3fa065ef
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
- kselftest.dt.dt_test_unprobed_devices_sh_sound (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a42d79233e484a3fa0bb08
  history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4244a233e484a3fa06581
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4244c233e484a3fa06590
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42651233e484a3fa08b8d
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42660233e484a3fa08bee
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42667233e484a3fa08ca8
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42675233e484a3fa08ced
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42689233e484a3fa08dda
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42655233e484a3fa08b9f
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42660233e484a3fa08bf1
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42653233e484a3fa08b93
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42668233e484a3fa08cae
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42678233e484a3fa08cf3
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4268c233e484a3fa08de0
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4244b233e484a3fa0658a
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a429e5233e484a3fa0aba3
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422c8233e484a3fa05957
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422cb233e484a3fa05969
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4275f233e484a3fa092ad
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42762233e484a3fa092bf
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42772233e484a3fa0933d
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42775233e484a3fa0934f
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: mt8186-corsola-steelix-sku131072
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422c9233e484a3fa0595a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422cf233e484a3fa0597e
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4275a233e484a3fa0928c
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4275d233e484a3fa0929e
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42760233e484a3fa092b0
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42763233e484a3fa092c3
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42779233e484a3fa09364
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a429e7233e484a3fa0abac
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422d4233e484a3fa05999
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422d4233e484a3fa0599c
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422d7233e484a3fa059a8
  history:  > ❌  > ❌  > ⚠️  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422d9233e484a3fa059b4
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_h264_frext.validate-fluster-results (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a42475233e484a3fa06682
  history:  > ✅  > ❌  > ✅  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422da233e484a3fa059b7
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422dc233e484a3fa059c9
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422c3233e484a3fa0593c
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422c7233e484a3fa0594e
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422ca233e484a3fa05960
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422c0233e484a3fa0592a
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ✅  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422cd233e484a3fa05972
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422bd233e484a3fa05916
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c104000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e3233e484a3fa05d92
  history:  > ✅  > ❌  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c105000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e3233e484a3fa05d91
  history:  > ✅  > ❌  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c106000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e3233e484a3fa05d90
  history:  > ✅  > ❌  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c107000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e3233e484a3fa05d8f
  history:  > ✅  > ❌  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c108000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e3233e484a3fa05d8e
  history:  > ✅  > ❌  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c109000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e3233e484a3fa05d8d
  history:  > ✅  > ❌  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10a000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e3233e484a3fa05d8c
  history:  > ✅  > ❌  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_1c10b000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e3233e484a3fa05d8b
  history:  > ✅  > ❌  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423e4233e484a3fa05e2b
  history:  > ✅  > ❌  > ✅  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422d1233e484a3fa05984
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422d4233e484a3fa05996
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42758233e484a3fa0927c
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4275b233e484a3fa09292
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42761233e484a3fa092b6
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42764233e484a3fa092c9
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42767233e484a3fa092db
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: mt8365-genio-350-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42726233e484a3fa0910c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4272a233e484a3fa09127
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42733233e484a3fa0915f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4273c233e484a3fa09195
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42727233e484a3fa0910f
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4272f233e484a3fa09147
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42733233e484a3fa09162
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42738233e484a3fa0917d
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42754233e484a3fa09254
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: mt8395-genio-1200-evk
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42680233e484a3fa08d12
  history:  > ❌  > ❌  > ⚠️  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42695233e484a3fa08eb9
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42727233e484a3fa09112
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4272b233e484a3fa0912f
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4272f233e484a3fa0914a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42734233e484a3fa09165
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42738233e484a3fa09180
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42741233e484a3fa091b6
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42746233e484a3fa091f8
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4273d233e484a3fa0919b
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4274b233e484a3fa09221
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42754233e484a3fa09257
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42444233e484a3fa06566
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3288-rock2-square
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429c0233e484a3fa0aaa0
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42734233e484a3fa09168
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4274b233e484a3fa09224
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42755233e484a3fa0925a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: rk3399-rock-pi-4b
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42728233e484a3fa09118
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a4272c233e484a3fa09135
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42730233e484a3fa09150
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42657233e484a3fa08ba5
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42668233e484a3fa08cb1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4268e233e484a3fa08de4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42657233e484a3fa08ba8
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422df233e484a3fa059d8
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp8.VP8-TEST-VECTORS-GStreamer-VP8-V4L2-Gst1-0.vp80-03-segmentation-04 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a425d0233e484a3fa083f8
  history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422c4233e484a3fa0593f
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_timer_17c20000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423f4233e484a3fa060c3
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422d1233e484a3fa05987
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a42774233e484a3fa09349
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a422e1233e484a3fa059e1
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_timer_17c20000 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a423dd233e484a3fa05cb8
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429c5233e484a3fa0aac7
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429ce233e484a3fa0ab05
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d2233e484a3fa0ab1d
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a429d5233e484a3fa0ab35
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a428c0233e484a3fa0a189
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42654233e484a3fa08b99
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4244c233e484a3fa0658d
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42690233e484a3fa08dec
  history:  > ❌  > ⚠️  > ❌  > ✅  > ❌  
            
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42454233e484a3fa0660d
  history:  > ✅  > ❌  > ✅  > ✅  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42564233e484a3fa0736b
  history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42564233e484a3fa0736c
  history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42659233e484a3fa08bd0
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4241c233e484a3fa06325
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425df233e484a3fa0851c
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425f6233e484a3fa08672
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425fc233e484a3fa086a4
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4243a233e484a3fa06508
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425e5233e484a3fa085e5
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425fd233e484a3fa086a7
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4243b233e484a3fa0650e
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4243b233e484a3fa06511
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: acer-R721T-grunt
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425e3233e484a3fa085d0
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425eb233e484a3fa08618
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42425233e484a3fa06404
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4243f233e484a3fa0653a
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42425233e484a3fa06407
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4241e233e484a3fa0633d
  history:  > ✅  > ✅  > ❌  > ⚠️  > ✅  
            
- kselftest.cpufreq.hibernate.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42533233e484a3fa06e1e
  history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425fb233e484a3fa08698
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a4241a233e484a3fa06314
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42421233e484a3fa06358
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425fe233e484a3fa086b3
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a425ff233e484a3fa086b9
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a42429233e484a3fa0642f
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

