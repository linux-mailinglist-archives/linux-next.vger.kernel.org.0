Return-Path: <linux-next+bounces-9082-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5DDC6C623
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 03:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 2BD142C12A
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 02:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C32B217705;
	Wed, 19 Nov 2025 02:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="x0KzKtZk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1127FD4A
	for <linux-next@vger.kernel.org>; Wed, 19 Nov 2025 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519424; cv=none; b=plETYaNfOiq9PPa6UMIS5CXaehizewJdGFGb3j2esINGVgypjzIrVMwSGv7MGo/8bbDq6H0rL6kmGLTg+SqjPnOVpJHD6nFjQVntf2Dl8MiNmenh08n3Qj5iPrQ+OXObRETgxzNUGP+gt8h/HP3XlKdfBBT8O4wOjITY/J3TFQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519424; c=relaxed/simple;
	bh=w4kcu2IELv2n0VD8O+wruTzUnUOUhvRMDv4Q5WPO1qo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=J3L1p9q5FOWkJj4I/Zdgnf/+H5R0V9YHoI1GUuwgPxgzBmbbnHla3lPCWll6MIT7lmDyGfiddgHJseeFoEm6sNk961X9P757A28cz+MNDZw3MZrq6DAyX74r5Fhh31cSy5JkJ64ycbvRRKhh2CIzwhX/4XQy9JNbf9DNQDfPcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=x0KzKtZk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29516a36affso75160105ad.3
        for <linux-next@vger.kernel.org>; Tue, 18 Nov 2025 18:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763519420; x=1764124220; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVVLAK+Wjl5w3jU0ipV9OYaj7rcZim/nGO0jKKQ5MoI=;
        b=x0KzKtZkdgbTJ0l5ZpDylKxzrUr9MoJfUEeF6VDntSdGGX7B49esj5RwJjqVNO3kC/
         1UZAQGzHsrLnd/TVFpwDZJ1qX6bmAQMKwBfYfWtfLR8dFeUqWFiqmhg1jql8dm0UtMIP
         oXvzVywCVh56yiPJTgfN88C0rPW1IOb6Ti8Bi+G2q5i5x/SeO/dDwQ/5dgenbEa1+jW3
         V9JX67FX/AkPnN4sZJmC+sIOseo4pJupTiPNtJIxzXB1ZTp+4WbSg54UFrsezfWOp8fD
         fv99TlqeqzUcrWulDXTg+ddSLsptOkDmdxj5za5Fu0gUgPxQt8nTCtrtKfT/GZqEn7/S
         AlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763519420; x=1764124220;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zVVLAK+Wjl5w3jU0ipV9OYaj7rcZim/nGO0jKKQ5MoI=;
        b=mHkM/TSwN7n5KrR4kU3wMN8OY4nXMANe8nJ0RjlbMifzGU+vwf8HucJjAEdD2WjD/D
         aM4JhkcHBGogmna5h6xv1q6X667rqM9Cgwj87diDzYeNL3AG17KAAC9VQIzli9ZBFcmK
         ol7LLogd57jlIuYdQUNO1CLb4IMKoWx/R7vh9eSn6sMGnl/cVyGVOJCzrmvs0G+cFTQI
         mzvb5TM0IrL1EHxSsoRgrfq1cpJT+AolMLPalPAWqlX9rtWaBOv29PZjOyW1aXcah4bN
         pX6UISOO+3TSGEcPxYoTqySbJTlyxUA0ReU92JeZPSillZDVkitTRGYL7pZ6y/Pnu9id
         OOrQ==
X-Gm-Message-State: AOJu0Yxpsaw13X7KMON1sdYIKeQLNP7iRlk/qr1Vir63YCOueffB4HgS
	KemYyyFYScq1eO+6Z/a0/j0XBJ7dWynPvI+T7INkGivsdytvDNwrMcI4GNPHli8sGb6MT4RaxP1
	2s7kU
X-Gm-Gg: ASbGncuXt38Oif0r6ONU6T3TpUW3QogBwYFwlUpNc4CFA0qfZ/Ut4VrFP137D2KW2Tk
	PxMdDADl8/LEBVQ8bUx2uniNxMI4RT+M9DsYvUikCmumI107MFWfJfArUHXglUkj89ILTPz98u1
	6SJ2cyyqpnNE4fLcUOSosPdDqaJWjsF6eyTnRtCrP1chmzWxvkqfLWQQbzmTwdyjt7hCwKgHRgF
	cnh8ZdF/Fy5YDfHr2euyzxdzw/z3vHsUr0teSpEIr64W6+llWtDYVs7OxkcVTKGKNc902zOv8+l
	I+uDlh9Uuksjbba3x3OvKNy38nT0e/lej14DN0JxMcB5qnFkyRtgmQhpiIHY4ltzct5wCLikFYC
	05kMNtYvj6mj+/IaQ1HpD6GEhC1OOaxMshuBQQ1w9QYEzjeE+//r0V3Xu/ViDnBKkoyhMWA8xv9
	MXR2T7
X-Google-Smtp-Source: AGHT+IH1x6PuKNlcd0ZEXGnIy8KdZqdFRiLjclVEyQ6/5YYpnOftgX+RDqV5epSuijioHj8+ujAxrw==
X-Received: by 2002:a05:7022:6896:b0:119:e569:f273 with SMTP id a92af1059eb24-11b411fadfbmr7215774c88.28.1763519419861;
        Tue, 18 Nov 2025 18:30:19 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b86afe12esm56031162c88.6.2025.11.18.18.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 18:30:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 187dac290bfd0741b9d7d5490af825c33fd9baa4
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 19 Nov 2025 02:30:18 -0000
Message-ID: <176351941841.2611.13010973705934819601@f771fd7c9232>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/187dac290bfd0741b9d7d5490af825c33fd9baa4/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 187dac290bfd0741b9d7d5490af825c33fd9baa4
origin: maestro
test start time: 2025-11-18 04:56:11.815000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  132 ✅   17 ❌    0 ⚠️
Tests: 	12126 ✅ 5742 ❌ 4603 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691c0ab32fd2377ea9a5e722
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691c0ba52fd2377ea9a5eb46
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691c10ae2fd2377ea9a62404
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691c1bf42fd2377ea9a65dc2
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691c23142fd2377ea9a670df
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691c1bf52fd2377ea9a65dc5
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691c20062fd2377ea9a66d9f
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691c1bf62fd2377ea9a65dcb
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691c24b62fd2377ea9a677a0
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691c1bf62fd2377ea9a65dd1
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691c6fec2fd2377ea9a70bba
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691c1bf82fd2377ea9a65dda
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691c20272fd2377ea9a66dc5
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:691c0d872fd2377ea9a5f039
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691c153c2fd2377ea9a64426
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:691c0d912fd2377ea9a5f0c6
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691c0f592fd2377ea9a60f76
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:691c0d7c2fd2377ea9a5efbf
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691c0eb52fd2377ea9a5fae9
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:691c0d8e2fd2377ea9a5f08c
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691c0f572fd2377ea9a60eaa
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691c12582fd2377ea9a62c5a
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

