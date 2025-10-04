Return-Path: <linux-next+bounces-8557-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE0BB8864
	for <lists+linux-next@lfdr.de>; Sat, 04 Oct 2025 04:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 83700348702
	for <lists+linux-next@lfdr.de>; Sat,  4 Oct 2025 02:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C3D17C21B;
	Sat,  4 Oct 2025 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="u6jLMOhv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B582A1CF
	for <linux-next@vger.kernel.org>; Sat,  4 Oct 2025 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759545012; cv=none; b=T3jvpwqUQAJaJGHCjgoRjJ1C7AZ12WZgptmjnA+dO73XKpgJh3wPExaxaQ13v85DiznTZbuvT9BAW3JXr97OQtyeFm5QcLKXA1XBCmdsYltT79IsyGjkd1O7auE9lC45CQVJepLcd9+f9hbohoSVjbSgEO22jYVjufcjGst10E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759545012; c=relaxed/simple;
	bh=hfusPJaG2ZeIKAuZPioxMivpQZPyfmqO9VFyTMIICeU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Krf+pH/gi6+7U/VF0VUO+j3W4j6thI4wDAuF8OUaoNrn6M1WAZQROKJiSnLp3EZwaLyE0duJ4lFy3clzOtqITIdaCUICYAWK3Ks2SOhfLLluiP6aqtw90wPIQ0okGqmzQJxY51xfqWr6cb6i3VS/n0q/uc+W4ttM0750R2MKZ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=u6jLMOhv; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b554bb615dcso2133443a12.1
        for <linux-next@vger.kernel.org>; Fri, 03 Oct 2025 19:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759545009; x=1760149809; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8Tln6gc5/unrdxl3NXNs8JF0IcJn1+vIqMCIf6xuH8=;
        b=u6jLMOhvyKrDSvCuVWLtabj5Z23WGLHE9gxswivQh25CGrI6QcdhVcoxkG+dbacRck
         MG35doJjDDAriT2LXboQQ9niKHqkMRmh5HJK2uBgJ+bNLAY/DFtY4Um4O1kBM4FpQ5yL
         Pvx5xahQmhaeZCmsd0JHxlXf0XhCTMjpqsV3G/7cJHzI5Z2EqDwpuYmpCnVBMb1goo2h
         UJc79P4ysjIGxtoWYWhELlU+4s3Gv63dtHhdws01Fbl9XOiK3RbEicHHUPKX3EVyetFX
         WfqFuNuHeHcSzoJzUIhnPFj3xOn08vLCMTGaRZn+tz58jSGIjYRc5XXKlT+Z1S9roTiW
         c6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759545009; x=1760149809;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8Tln6gc5/unrdxl3NXNs8JF0IcJn1+vIqMCIf6xuH8=;
        b=IPMgJOVfL9o/VOWVHCDRFaLVNqRMrJ7kFPUXUcuXYeEbtfSmJAn0KkWV/ehh1jxTmm
         jKGQQBpvmCN8pL4FLEEbtXdIu2fcxvThbsrV9LrhUxdwnklA76U/RFWGyWp8xmlCblxu
         +7H8TCdmb0eQPDLSB0x2w9AJFoFIsnVnclKUZIcA9UMExrQ7wh+ZCJQP3qjEtowLnCOt
         PhgBYH6Ipd+ohCukVHyCC/BM0aLvH9YO3OejQzy7UD36yJC8/EVZP5XWX9KJ8oB5UkwD
         qGZZi4IEwWNONWOhKSgV904ASx/YwxfmX4VtUCazJtSdSd/GofZ2YSc8ed+f4Dju+ZGc
         zlnw==
X-Gm-Message-State: AOJu0YzA3KvjiOeXTlZU8aFuFrtqJ7/ghcgRSTUTwPd6PLQZafLToXmD
	DarZVv8BX0nchEC6c2fIDy/E0XRter4u5rIyh7M0vD2RwCc+nVi9800Dbt+87BPvZYqI8OZSSp7
	P4ZUdxRA=
X-Gm-Gg: ASbGncuKaEmqUBy8afKx5vz7lfTq4xt4OGguTEjjD6HLr/ssi45KwGDcBAGottE929r
	JNd0Dm52GPKo7BqbddtG1yoEh70YD2JSVImwCuaXSwaj0KqRZPIxhJBU4UB92dXBfiYySSIRo37
	FH02MRswzWg5St7gtoj7KxeJanxIqAYA3h4HtdRzCfW3txwDjTDGbEbGP6g12JEZ0qtt3/ggpoB
	o2q1YUSXEh66O34eksYjOM02TRYsPHKN2tVrMhHIsujgPJZPL2mdX/y9t/yVaICJPiMf17FaLf1
	wg5Zmu1+eptB6DWYN7HSBLWBm7wfpHbw3+/jVszdMRXReKcjH6i56ER7Tbuza85e9N0cQ8Ln7pc
	fgvKzDrYkkF0CQjKofdEACX6oGSmvN3WqJzHAIW9StvfOiDLXWoo=
X-Google-Smtp-Source: AGHT+IEs0TB/wN5uE4o81iazjBdtWFzajJFfFVP/TNhxwJz3oIZjiAnFYVgo1tY6lF0IFAtDZ/ENJw==
X-Received: by 2002:a17:902:d550:b0:28e:a875:f7d1 with SMTP id d9443c01a7336-28ea875fa77mr12659805ad.10.1759545009315;
        Fri, 03 Oct 2025 19:30:09 -0700 (PDT)
Received: from c325b7c58cb6 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1280c9sm64204875ad.53.2025.10.03.19.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 19:30:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 47a8d4b89844f5974f634b4189a39d5ccbacd81c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 04 Oct 2025 02:30:08 -0000
Message-ID: <175954500815.445.8029796656507648415@c325b7c58cb6>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/47a8d4b89844f5974f634b4189a39d5ccbacd81c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
origin: maestro
test start time: 2025-10-03 12:19:37.077000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  160 ✅   15 ❌    6 ⚠️
Tests: 	13074 ✅  565 ❌ 4134 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68dfcb73841b167e8d3d3562
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68dfcb73841b167e8d3d3563
      history:  > ✅  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_12
      last run: https://d.kernelci.org/test/maestro:68dfc6c0841b167e8d3d191d
      history:  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68dfce11841b167e8d3d3d36
      history:  > ❌  > ❌  > ✅  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm.kvm_kvm_page_table_test
      last run: https://d.kernelci.org/test/maestro:68dfedd6841b167e8d3dd03f
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:68dfc6c0841b167e8d3d190f
      history:  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_23
      last run: https://d.kernelci.org/test/maestro:68dfc6c0841b167e8d3d196a
      history:  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_24
      last run: https://d.kernelci.org/test/maestro:68dfc6c0841b167e8d3d1973
      history:  > ❌  > ✅  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68dfcd2d841b167e8d3d3956
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68dfc6ff841b167e8d3d1a0f
      history:  > ⚠️  > ❌  > ⚠️  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:68dfc6c0841b167e8d3d195c
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:68dfc6c0841b167e8d3d1963
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:68dfc6c0841b167e8d3d1908
      history:  > ✅  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68dfcd64841b167e8d3d3a10
      history:  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68dfcfd4841b167e8d3d4692
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68dfd173841b167e8d3d4f0a
      history:  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

