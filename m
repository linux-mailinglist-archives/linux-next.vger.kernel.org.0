Return-Path: <linux-next+bounces-9664-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 851E5D221FF
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 03:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A1CA301FF4E
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 02:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55CD23A9AD;
	Thu, 15 Jan 2026 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="F/ysE15Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17EB181334
	for <linux-next@vger.kernel.org>; Thu, 15 Jan 2026 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768444220; cv=none; b=tv50tuu/tia09cVCfwxp0TsI7tSADlucC9RLYZN4E9DcojADS4N+pFchlSWS9MkThIK26BWA7Syu3L/UQ4cb6RA1SO8KfcOT4aQOf3wm4zzfFcKf3CQ3l7xpXxjdeEiaXPXFEP6AghNt62P/jCau9ybn+/Yv4Kd+fyRT6pvuxoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768444220; c=relaxed/simple;
	bh=BydbIwRftZj77BPUng6w75bp0varOT1nNHn7csv70vA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=f1YgkvPGojs+rmIGG4GJMIe/ovMXthMEBx0hPJmACBxOOnuUlDfymVw2KaefDpt3tDd3UEMIvKW9HoZDszxwRwSqrWOfNUWJ9Kzt1ZYAA8tRTGVngk97MHKlklNZEHcrT2Q0rFpyK5sf0SUxUnEBLcyg0u3DDhzMqvhzgcGYNR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=F/ysE15Y; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so565374eec.1
        for <linux-next@vger.kernel.org>; Wed, 14 Jan 2026 18:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1768444218; x=1769049018; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x98byXE8xqDhSyWolZjQtYXQYWRcFFu3plY4/IN49zk=;
        b=F/ysE15YZWhLDtJldkjCKvR1gsfC4Q4mIyV4ZcYxqJ3HzWDDV8a1XF+4DvlUQV3s65
         9nNWJwesyKou31VsC0gTvLldp93Tau9/hirr+WM3n0GUvSeKRFGj24Wcxq0BiFiY72Zf
         OBhoukCP4ZLqrVCXDQF02iG5Jf8d1M+2QE1Kp2mzCpSJ15Q22S1Rqy7fUuQLQ+e+zEhM
         pMiSh/pdfQUrVdypmPDF+K0EOh7YOgVVypwUQyViPHOE/Pk+JvSG1E9U87Ru4Qf7U/yp
         5jLQwe94ZWJ8kLWms1oRsqJGhi4wW9eTKVlwMxh17G44C/NlVKVaLW6W45V/IQRIz9V2
         2Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768444218; x=1769049018;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x98byXE8xqDhSyWolZjQtYXQYWRcFFu3plY4/IN49zk=;
        b=PZHeR2NE0bgg3qMDw1HFuBzR3f/XLIhA2TgiWrO0fTXGphJF/AbuVEI515fxy39q0E
         gFfzZ+JuXcW2wXagSy3y3s8vXy3CgYyGWbsBSPg3lxoVpmSUy028kkm4k4qE8NgLOQlN
         1JooWiZSMVQJKkHX6bMbS3zN/v2QCb4Ejjd9ytQtxL9Jgk9E9z6/Z/5NfyGhnYlpMhm3
         IqnNGyID5sh0PwC1qIb0jHKC+W3xiOVQX/jHt6FexurCHxZ3U/4U0SMMm8NL5rO5ECrc
         BOKxWQxLH2RUA2EwM8YK/rB6sASFymxyom8uypimlD6qXVG6gAyebDKZ4dm/bjcXusSZ
         YHDw==
X-Gm-Message-State: AOJu0YyZBn8DK7AUC0HVoB9MQTVgmnUkbKn5aHvUMzhTCw1OxQScS/h8
	FEhZhD+7NKSa72n8CWBo5k7IHVidxpBZKoNNY3cppkgSDjii9bfI981A/C53TZpWZHuLcTmT/ln
	7+FIvVNI=
X-Gm-Gg: AY/fxX7eMAaf29+ZppHfhhawGCgV7WCcWfBNm5iUn2HV9WHkz2NhWrQr2h+yGME+CtO
	eCriF8g0x2714ZwTlfGXByZffwkiQdRqSr5TNzoPNvxvZ7eZyUaEbB91h1JRT5qTPryijHtaAR8
	UpXpoZdwy1s4LK+ynuWi2tv40QKCUTzBhWPq6rHpZCvPSBJon2sQJw8R5edCZesN+F+42EWvLZk
	VmgKkMc/tVG3oyqq+5ThXd90xqdVlsi0kPAmHZ7IBfZqgv9RbpgWy2p9GApKtv5v0JRQYsrm/2P
	iV0/KcHlwE731UYLGJJz3QLEVi4MDaFhXDcEB0ds919UuOUd057mXmCjIBH2HZ0mBMpmY6atVHA
	E7mMdieY+/H1jGr6ympJbGKQ2WIH6AYPjqbzQrVAnWue1s/Ltu8wvFXeNdllcPGPZEhQM85AYYc
	zy6BZV
X-Received: by 2002:a05:7300:7c0c:b0:2b0:5696:26c6 with SMTP id 5a478bee46e88-2b48f105398mr4974792eec.4.1768444217244;
        Wed, 14 Jan 2026 18:30:17 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b175bee31dsm18996887eec.32.2026.01.14.18.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 18:30:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - b775e489bec70895b7ef6b66927886bbac79598f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 15 Jan 2026 02:30:16 -0000
Message-ID: <176844421615.3525.5372767836546700348@1c5061884604>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/b775e489bec70895b7ef6b66927886bbac79598f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: b775e489bec70895b7ef6b66927886bbac79598f
origin: maestro
test start time: 2026-01-14 04:56:33.492000+00:00

Builds:	   53 ✅    2 ❌    0 ⚠️
Boots: 	  154 ✅    0 ❌    0 ⚠️
Tests: 	15331 ✅ 2424 ❌ 4177 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696737d5b2a19cc73aad1387
      history:  > ✅  > ✅  > ❌  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696737f6b2a19cc73aad1585
      history:  > ✅  > ✅  > ❌  
            
Hardware: asus-C433TA-AJ0005-rammus
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69673721b2a19cc73aad0823
      history:  > ✅  > ✅  > ❌  
            
Hardware: asus-C436FA-Flip-hatch
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967394fb2a19cc73aad1f40
      history:  > ✅  > ✅  > ❌  
            
Hardware: asus-C523NA-A20057-coral
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967375fb2a19cc73aad0d30
      history:  > ✅  > ✅  > ❌  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696737c4b2a19cc73aad11a8
      history:  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69673854b2a19cc73aad1c90
      history:  > ✅  > ✅  > ❌  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696737fdb2a19cc73aad167d
      history:  > ✅  > ✅  > ❌  
            
Hardware: hp-14b-na0052xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967382ab2a19cc73aad1a27
      history:  > ✅  > ✅  > ❌  
            
Hardware: hp-14-db0003na-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696737aeb2a19cc73aad1085
      history:  > ✅  > ✅  > ❌  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696737cfb2a19cc73aad1287
      history:  > ✅  > ✅  > ❌  
            
Hardware: hp-x360-14-G1-sona
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69673793b2a19cc73aad0eb1
      history:  > ✅  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:69672cf2b2a19cc73aacd5ee
      history:  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:696732efb2a19cc73aaceb52
      history:  > ✅  > ✅  > ❌  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696737ddb2a19cc73aad147f
      history:  > ✅  > ✅  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967496bb2a19cc73aad71ce
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696747c2b2a19cc73aad5987
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8192-asurada-spherion-r0
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967472ab2a19cc73aad577a
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad496b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696746a7b2a19cc73aad5378
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69674728b2a19cc73aad56a0
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69674c3cb2a19cc73aad8086
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:696737ffb2a19cc73aad16b8
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:696737ffb2a19cc73aad16b9
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967372cb2a19cc73aad09cb
      history:  > ✅  > ✅  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967373cb2a19cc73aad0b45
      history:  > ✅  > ✅  > ❌  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69673748b2a19cc73aad0c12
      history:  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967379cb2a19cc73aad0f99
      history:  > ✅  > ✅  > ❌  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967372bb2a19cc73aad08f8
      history:  > ✅  > ✅  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967370fb2a19cc73aad0709
      history:  > ✅  > ✅  > ❌  
            
Hardware: acer-n20q11-r856ltn-p1s2-nissa
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69673804b2a19cc73aad174d
      history:  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5300-8145U-arcada
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69673812b2a19cc73aad1843
      history:  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696738b7b2a19cc73aad1db7
      history:  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:6967384cb2a19cc73aad1bab
      history:  > ✅  > ✅  > ❌  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69673825b2a19cc73aad1963
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:69672cf2b2a19cc73aacd63b
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:69672cf2b2a19cc73aacd5e0
      history:  > ❌  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:696747c2b2a19cc73aad5a68
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:696737cbb2a19cc73aad11e4
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:696737cbb2a19cc73aad11e5
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:69673849b2a19cc73aad1ac6
      history:  > ❌  > ✅  > ✅  > ⚠️  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:69673605b2a19cc73aad018e
      history:  > ❌  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:696745b2b2a19cc73aad4a30
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:696745b2b2a19cc73aad4a2f
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:696745b2b2a19cc73aad4a2e
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:696745b2b2a19cc73aad4a2d
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:696745b2b2a19cc73aad4a2c
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:696745b2b2a19cc73aad4a2b
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad497e
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad497d
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad497c
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad497b
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad497a
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad4979
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad4978
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:696745b2b2a19cc73aad49f9
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad494a
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad4949
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad4948
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:696745b1b2a19cc73aad4947
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: qemu
  > Config: defconfig+preempt_rt
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:696730bdb2a19cc73aacdd0c
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.cyclictest
      last run: https://d.kernelci.org/test/maestro:696730bfb2a19cc73aacdd0f
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:696730c1b2a19cc73aacdd1f
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.pmqtest
      last run: https://d.kernelci.org/test/maestro:696730c3b2a19cc73aacdd22
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.ptsematest
      last run: https://d.kernelci.org/test/maestro:696730c5b2a19cc73aacdd25
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:696730cbb2a19cc73aacdd57
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.sigwaittest
      last run: https://d.kernelci.org/test/maestro:696730cdb2a19cc73aacdd5a
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:696730cfb2a19cc73aacdd5d
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

