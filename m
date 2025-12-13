Return-Path: <linux-next+bounces-9393-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A304CBA35D
	for <lists+linux-next@lfdr.de>; Sat, 13 Dec 2025 03:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8EBD3058A71
	for <lists+linux-next@lfdr.de>; Sat, 13 Dec 2025 02:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CB42DA779;
	Sat, 13 Dec 2025 02:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YrRGtmUk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460891E0083
	for <linux-next@vger.kernel.org>; Sat, 13 Dec 2025 02:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765593079; cv=none; b=jTQG4rUdRv4oCohRcV25pGr4Dmk7jEoTBcTry74dxcI4hd+Ol1/m4OxdHOFHFNNlPk3Vpg5bZshjmx/qKwxhJkuIG5ac9tIe5Q625ngwrYbSJrp7a8gFckz5YKJtExNOtQQ/3DolTlp0Bjsx0Mu0uIaRclpXtETzU61Vk1jo2Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765593079; c=relaxed/simple;
	bh=ABeDIkLoQ+CP9IvXZzxy8pRUPcmW13f0GyPtUmKl32I=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=KSQtOmQC83MtjpbZnjWvcZ95cY89X6MpzbJW40oT/ooyX90Q9CgTscif/8zehWXSYx5dI5byFL1cjCkBDQFHXe6BKNLxQpl6IuZudj3AAwHWmzTv08u5R7l8xMl7KH7j/TcWbQSFeSureZz9mIXeMHxWDVh2varYAYMpYafQjrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YrRGtmUk; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34b75fba315so1001896a91.3
        for <linux-next@vger.kernel.org>; Fri, 12 Dec 2025 18:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765593077; x=1766197877; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWnIeb8Yy8XfqA+8hF1d0yh5UYPVOEYTJE5Dlui3Wg4=;
        b=YrRGtmUkTCFQsLH0eiWlK+rJfAbC2RhOWMfXwOvjE5vxD1tFAwFt94OJYJuDafTACk
         3t8eTT1tBqTC8eUK5uUmU3k1BOe4KSNzJqXLb/OhOID2y8Hxcm0+wuJQWaVTorTDRwTM
         LaMCI3DokCIFaTS97w8hkovS1HEAGwxt41huJt8Q77P8EugVrfBO9OHRawYW1IKXhXhB
         CSMTHbVTF6TqxCIu99bXDL1xMTXvOKq8Qf7d8F/dr5xFzhw4CsCZ/kZrpySoq4CDWXox
         j3l9m9OlKnKSjKx7s/i3qWjYcX997EZ06mS/fAWxus+mcsJyyIvJZ8eqROxKr04xYtc0
         6SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765593077; x=1766197877;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWnIeb8Yy8XfqA+8hF1d0yh5UYPVOEYTJE5Dlui3Wg4=;
        b=jl/hKBzpWG0iNAE/pNvlTQx5T7eTsF96CV7hJ3JhVuzg+yhEZKm6ah0SCRoSsThssQ
         Z8swNSqkJRSNQmvF1U9La26M0RO8XaSQu0lB5DUza+q7A0xEkXDhV/nFL4NzlRcOY+eD
         7JF/igLwslFO04u0VxQc/4BAKs3guc52q8F2svDnKGlt/SoJE4U0OdgnizSSl/inHO/8
         lZTV55eJLAPLYIn5qMsF112ykATW2/XA85VtOy5PiIWyZUGgdFSAhM4IehUoU8YlqPmp
         W1n0F5FQwjM8lKZKxk5PytH/18yhXHXVc54wCsRdBgM3F4PhzN/KWppzya5eZWWz8Mjt
         vqEg==
X-Gm-Message-State: AOJu0YyNUFKAxR2EOh9bpSyXXmwUxi2Ol8kDzI0Uwrwbzktx6EERUKcv
	8uEkAILk7o0AE6XPewVtWMfh1ZE1A9qeTVCGljJ0vJPJumf60SaMaH+UT1CM0M+l3LM=
X-Gm-Gg: AY/fxX5nvA4a/RPMWO7Ai5MFjaDAj1kbkYpLr209N9Lu30Rj0rmi1BcXOKjmaihQg/H
	uP1S7Av9OejqoVRIuq16AXY2kxjz1xcBXPX2EcZ1N5MEc+Z1u5uWtkv3WuTPVRorzDb1S4AVREs
	rd1mlU5LuSZaR13WNrlRYGXBXRl01cSd51o+LOjgfIytLdXBS6VBRQd62kjrguFFWVJQGBAyCVx
	LSBrvxlKwAXVjkh07sVHeRPV1RAL990U18pg7eyKQS7NL6hHqiQpNNSTn/RYWE0Sf8b42Ib8/aL
	atjSwjiP77LyEE7We0lOoXYL2Sgef03m6B3qGyn/xA13V/pep4vEGfWJ5Xh14H+89J3nukouSPD
	jiMUyG3ZePQjPRcnxq6//DAfrG3t1HyF6IkcjRMhJ57D56jYV5bI2txSu9m6jICYvFi7YPi41vt
	eFSTYf
X-Google-Smtp-Source: AGHT+IF0XYYzHTxhiYQ6KVqO68ffK7hmeuSoFTJmtQI7edebMa7mQj+6QWV6Pfc+h25ipi5OYkvSHg==
X-Received: by 2002:a05:7022:2481:b0:11b:9386:a3cc with SMTP id a92af1059eb24-11f354f3919mr3059001c88.45.1765593077322;
        Fri, 12 Dec 2025 18:31:17 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30497fsm22382827c88.15.2025.12.12.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 18:31:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - d9771d0dbe18dd643760431870a6abf9b0866bb0
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 13 Dec 2025 02:31:16 -0000
Message-ID: <176559307622.1219.11293562666594343110@77bfb67944a2>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/d9771d0dbe18dd643760431870a6abf9b0866bb0/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: d9771d0dbe18dd643760431870a6abf9b0866bb0
origin: maestro
test start time: 2025-12-12 01:09:18.291000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  173 ✅    3 ❌    0 ⚠️
Tests: 	14031 ✅  936 ❌ 5117 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693b8c13cbfd84c3cdb465b4
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693b8ccacbfd84c3cdb469ec
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:693b8e25cbfd84c3cdb46b98
      history:  > ✅  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:693b869bcbfd84c3cdb43cef
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:693b77c2cbfd84c3cdb41a43
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6q-sabrelite
  > Config: multi_v7_defconfig+preempt_rt
    - Architecture/compiler: arm/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693b72c6cbfd84c3cdb4156c
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:693b82c8cbfd84c3cdb41f92
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:693bc3d1cbfd84c3cdb4aeee
      history:  > ✅  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:693bc9c2cbfd84c3cdb4b146
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:693b8405cbfd84c3cdb42409
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:693b8653cbfd84c3cdb43b8f
      history:  > ✅  > ✅  > ❌  > ✅  > ❌  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

