Return-Path: <linux-next+bounces-9694-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E7D38BAB
	for <lists+linux-next@lfdr.de>; Sat, 17 Jan 2026 03:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1BC303C9AA
	for <lists+linux-next@lfdr.de>; Sat, 17 Jan 2026 02:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA753090DB;
	Sat, 17 Jan 2026 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="xMw1ngSa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A31A275
	for <linux-next@vger.kernel.org>; Sat, 17 Jan 2026 02:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768617043; cv=none; b=q+lIBqeJlAHWCTHMZyYsk2Yn1fU9kIIvsiuFvZVkUpz58SH7xymcpyJsCYoeEDMR97CgTqrwhjJbfJvLHtsfEXgoodWaiO1XzNF7LZPEzUvfE8Wt+VvrQk5LoN5Dh6fy4h5dlt3BKs7Kxq2t34A91qP0M9+8iXQ/6CEcNNuYpeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768617043; c=relaxed/simple;
	bh=+FBTKAbJpjBzg1T88JAdFa4p1CdSfbbjIOKBmJ8HILE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Ev4mkoJt/O12PZh+2RRBo5NU5gVCZdhfo1dy2BTSE6aJAjzQIqjTuAjXEn2TiElOsSJSYxFqNvh0Hexw0iyFoeAeNigl/6qatfPBxSPYvuKDMWxXHp6sXy7n25aIf5jD8jWBEizSvF5DzhuScJpmxGVLlioKQqfNUzlkqINYEHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=xMw1ngSa; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-121a0bcd376so2000703c88.0
        for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 18:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1768617038; x=1769221838; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxihfB02mVi5wsySlui+U2amAT3LyyIwFHtRPjqSpIM=;
        b=xMw1ngSacyGbwwHz5DWM4QoA4eKySGF0C7ML52w5ytozB5RWvoPs8ODJCjJY7fHpss
         Fc3Pcagijl1lTY68O1o4o63pxU3TvMQD73QMOKl8M/vpT5jKo7ZSNtEhEHc+8OD2aHgD
         hqEcYqcL1S3Dp7Z7+YbZzAA7Fu+BpaspEpeWpHP4ynPlIzfb7N+cdwq2A6vfhHfz94Yb
         i1Uzj3Rk6oOVSXdQSkUcVuDblz82OseFignAirMNnyJTUVKbLAo2MTuEvm4/77JuBcjZ
         oxwBcZioHLYFyT+S0sBDpDRPTDDbGBtjqCD2Uf0LcL9TAjuAyof6FgxCt0OYHRaRAmaV
         DLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768617038; x=1769221838;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxihfB02mVi5wsySlui+U2amAT3LyyIwFHtRPjqSpIM=;
        b=pjPQsaS63VTr624mk0iU41SmHYjKbaKmAL0Xq+alE54thjc/zMHmbtdPU25JoclQf2
         cqKX3HoDSCrdaWt1hakuEnYWQMNo2rG54TK29CR10mrBe6rZLqyeB6z9yAy9X21X8I70
         Nex/2/owykBxKIO6YtVCb4B+3Af+5jwqaVQZM28NYgL3aST3pnuoo9EnIsJqJd5xzQ2J
         QsaFsBYlQowaUk8DYw0GDBOozXpyI7LSXzdoOpfPjeuZvcQQP0r2RYOJsazakqlwzR5b
         7Pwt6Y7YEQDBfxFdP/MpQ6f4caJxN9yNXMTcaDGxXIxw75+86S2PQNn0LkG3al3sVHWe
         79xQ==
X-Gm-Message-State: AOJu0YxkevpIlspojGmzHLs9wl+iqAAE7CxYni+WEu4WUZ9n9JWwDLTP
	bqAH7aCsKdCXWzqABIWszSDK17Vob+FmOUF0JWNtS+VuB48USFAbKIYEqGzaJwBwWeKVyz6/of9
	rva0KbTQ=
X-Gm-Gg: AY/fxX6kHDPFFI8RfQov2srsrcE6UCt9+1x+5NbN5JMl7lqDZSG0tb/BX8Y5QNaLo0+
	OYc8DHeuKEsKOAE2fbcItgeSUpykogm96BdlItEKcoYJU8Wj+N+PwDBKxUmOJJTAfltLWr8hUkB
	R2hQdU8mhPRkp8IVRs2helWmylbmF+XltmS4a1hPX1kmvba03/p6lkmNXdx1YPaRjKrCVX3uRAE
	wWhBKhI9KusLnyCMx3wQBQ8/GGSDnZwZxhm5lcEz6uXJ7a/Xr/bO88keEV2ypG0WvbfRu66NrEJ
	mwDQ+4b70uhrzkTDiVoLsuSyHATwLIYQjiVe8JIt50eVf6bfPCpZSL9tH0OLdlUesXH5Nmxshq8
	HDhvP7XtuaXUDURRzGNMV9Lf8QbGVvzmW0Fxokqv0KMM4zH0GxUbOkOYNzrN3rwl6BG7hXeumzR
	58ju92
X-Received: by 2002:a05:7022:6984:b0:11b:9386:7ecd with SMTP id a92af1059eb24-1244a74e3c1mr4212140c88.42.1768617037793;
        Fri, 16 Jan 2026 18:30:37 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm5177974c88.16.2026.01.16.18.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 18:30:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 17 Jan 2026 02:30:37 -0000
Message-ID: <176861703674.4446.46038478713595117@1c5061884604>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
origin: maestro
test start time: 2026-01-16 14:31:43.134000+00:00

Builds:	   53 ✅    2 ❌    0 ⚠️
Boots: 	  156 ✅    3 ❌    0 ⚠️
Tests: 	13528 ✅ 1941 ❌ 1674 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:696a5647b2a19cc73ab55db4
      history:  > ✅  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:696a5670b2a19cc73ab55e4e
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+arm64-chromebook+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:696a5d89b2a19cc73ab5826a
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller0_14001000
      last run: https://d.kernelci.org/test/maestro:696a6313b2a19cc73ab59234
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dsi_14014000
      last run: https://d.kernelci.org/test/maestro:696a6313b2a19cc73ab59231
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58
      last run: https://d.kernelci.org/test/maestro:696a6313b2a19cc73ab59229
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11008000_anx7625_58_aux-bus_panel
      last run: https://d.kernelci.org/test/maestro:696a6313b2a19cc73ab59228
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14008000
      last run: https://d.kernelci.org/test/maestro:696a6314b2a19cc73ab5926c
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_14009000
      last run: https://d.kernelci.org/test/maestro:696a6314b2a19cc73ab5926b
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ovl_1400a000
      last run: https://d.kernelci.org/test/maestro:696a6313b2a19cc73ab59219
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400b000
      last run: https://d.kernelci.org/test/maestro:696a6313b2a19cc73ab5920e
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1400c000
      last run: https://d.kernelci.org/test/maestro:696a6313b2a19cc73ab5920d
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:696a5a95b2a19cc73ab5790c
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:696a5a95b2a19cc73ab5790d
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a20b2a19cc73ab57120
      history:  > ❌  > ✅  > ✅  
            
Hardware: acer-R721T-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a33b2a19cc73ab572e2
      history:  > ❌  > ✅  > ✅  
            
Hardware: asus-C433TA-AJ0005-rammus
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5981b2a19cc73ab569b1
      history:  > ❌  > ✅  > ✅  
            
Hardware: asus-C523NA-A20057-coral
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a59ddb2a19cc73ab56db6
      history:  > ❌  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a59cdb2a19cc73ab56cde
      history:  > ❌  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.vdso
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab5837a
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.vdso.vDSO_vdso_test_abi
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab5837f
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-3445-7520c-skyrim
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a2ab2a19cc73ab57211
      history:  > ❌  > ✅  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a93b2a19cc73ab578bc
      history:  > ❌  > ✅  > ✅  
            
Hardware: hp-14b-na0052xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5ab8b2a19cc73ab57abe
      history:  > ❌  > ✅  > ✅  
            
Hardware: hp-14-db0003na-grunt
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a0eb2a19cc73ab5701b
      history:  > ❌  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a59a0b2a19cc73ab56b6d
      history:  > ❌  > ✅  > ✅  
            
Hardware: hp-x360-14-G1-sona
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a599bb2a19cc73ab56a98
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:696a5670b2a19cc73ab55e9b
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:696a5670b2a19cc73ab55e40
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a5db2a19cc73ab5744a
      history:  > ❌  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:696a7b76b2a19cc73ab5ba13
      history:  > ❌  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:696a7c5cb2a19cc73ab5bb76
      history:  > ❌  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a6451b2a19cc73ab59cf7
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a63e3b2a19cc73ab597b9
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8192-asurada-spherion-r0
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a637eb2a19cc73ab594f3
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a6356b2a19cc73ab5932b
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a63cab2a19cc73ab59629
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a6360b2a19cc73ab593e7
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:696a59b4b2a19cc73ab56c18
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:696a59b4b2a19cc73ab56c19
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5926b2a19cc73ab565d9
      history:  > ❌  > ✅  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a5fb2a19cc73ab575bf
      history:  > ❌  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a596eb2a19cc73ab568a6
      history:  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a73b2a19cc73ab576b7
      history:  > ❌  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a01b2a19cc73ab56f34
      history:  > ❌  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5957b2a19cc73ab5671a
      history:  > ❌  > ✅  > ✅  
            
Hardware: acer-n20q11-r856ltn-p1s2-nissa
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a596db2a19cc73ab567ea
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5300-8145U-arcada
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a5eb2a19cc73ab5750e
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5b80b2a19cc73ab57e6a
      history:  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5aa9b2a19cc73ab579ae
      history:  > ❌  > ✅  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696a5a8fb2a19cc73ab57805
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_BOOTTIME
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab5839e
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab58392
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC_COARSE
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab5838a
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_MONOTONIC_RAW
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab5838e
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_PROCESS_CPUTIME_ID
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab58386
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_REALTIME
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab583a2
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_REALTIME_COARSE
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab58396
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_TAI
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab5839a
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - kselftest.vdso.vDSO_vdso_test_abi__vdso_clock_getres_CLOCK_THREAD_CPUTIME_ID
      last run: https://d.kernelci.org/test/maestro:696a5e21b2a19cc73ab58382
      history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
      - ltp
      last run: https://d.kernelci.org/test/maestro:696a646fb2a19cc73ab59e79
      history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.JVT-AVC_V1-GStreamer-H-264-V4L2SL-Gst1-0.BANM_MW_D
      last run: https://d.kernelci.org/test/maestro:696a63cbb2a19cc73ab596ec
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:696a6297b2a19cc73ab58f47
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:696a6297b2a19cc73ab58f46
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:696a6297b2a19cc73ab58f45
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:696a6297b2a19cc73ab58f44
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:696a6297b2a19cc73ab58f42
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:696a6297b2a19cc73ab58f41
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_rdma_1c002000
      last run: https://d.kernelci.org/test/maestro:696a6296b2a19cc73ab58e7e
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:696a6296b2a19cc73ab58e49
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:696a6296b2a19cc73ab58e48
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:696a6296b2a19cc73ab58e47
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:696a6296b2a19cc73ab58e46
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:696a6296b2a19cc73ab58e45
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:696a59d8b2a19cc73ab56d1e
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:696a59d8b2a19cc73ab56d1f
      history:  > ✅  > ❌  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

