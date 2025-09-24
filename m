Return-Path: <linux-next+bounces-8460-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB66B9812E
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 04:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1848A2A7C1A
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 02:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143CA7A13A;
	Wed, 24 Sep 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="WbGkyH2G"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785434BA36
	for <linux-next@vger.kernel.org>; Wed, 24 Sep 2025 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758681021; cv=none; b=vDuIZJbYDjZh5jC+u0NnM6mmXv1SL+MYE5LkZo95qYwAeGCDd3vZPNqS+pHsZUJsdWCHKxbBLUQ833m5i1yaQQ+l7nNGInmfbP5P2sKOzYRRS8U7XJU1PlaflaD6RoWuZZ5+wxgH33M/zE9Ue5YQu/HG7efbfpYanJ79zTKpEHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758681021; c=relaxed/simple;
	bh=JVMDLuF53YvZxcp0L6fKAXHwHwPb8AAiO1rR4x6ngLE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=d5AwP8sLiTLfzuKGmKuDX2U2JcZ8Iak9CgTDZASsOovLuEROBb0h+FFjcxHl4pM8nEiA+5EDwrXRm+7PJiuuE9v9omta1baDqBn4DTHx+0y9r1Kw/PCRm6S8MO+Biig8bhP3/nWpIYkUdXqrp0kaWv/Y/G3FGrnL8roemOKFHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=WbGkyH2G; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b54c86f3fdfso413361a12.1
        for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 19:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758681018; x=1759285818; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVEhKjgPJik36Hg6Yg/lgMPMoWEE1nUrs+nYSyyQuFo=;
        b=WbGkyH2GQWiXKM8OSRN8DZBdy+ju+F8JRYDg8bbgLC0Twm47E8JDU1kpZnUWdlkbGX
         9xN3PGS9lnsU51aNYCEabF2cuERo8Cd0/wWJMBtlZcyNNueG8IetFppmg5MXg4PRn8Pv
         wCRf+/QCOxcacGO7NVzgodBurC2yxeeU7EKDqcPkKkk8D7BM+8m4cqbYebYBEvGyMzgB
         by8eSNC/wNLPkaP/ZVHaJAlAP38TT6W444Lk66kbmopEvfA0kyZEkr9i8J8nmB9w/xMQ
         TwSVIP3lP7k5yPqmSVzWGOK0eIVVoDVyQg3rQRf6M78KKw3wC7F6PTfk44iwfePQRbtd
         gqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758681018; x=1759285818;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kVEhKjgPJik36Hg6Yg/lgMPMoWEE1nUrs+nYSyyQuFo=;
        b=i7Tsd1FhkuqpMEnnnXE3sK2F+7Z0+4o0tIsVzT/QZUEGNp6kcKFnzzS1OD0WxNZ50N
         q9MaeiGwPUDGyR3R4dMWExXMN0pq5sxlVuvsB5xQnXaYdEmaHTZfPRdFIJaK8CWed165
         2+CYzjma6ynUU6W5Gp/xijKrNVF7iLFNRg5+TDA9IOx7Vw9xyLKTJI1sB/xi2v70y4PI
         g+LmJDzkqS6S26nWuPSjw7PVih/2YDTACbSMwhO7LWxr4XWMQnKa010lQWS8QD7g5V2t
         DNW1hSMEMAsuGPt7TsexuYpuUFdbymc0pFhBh8uK/+NCp5RCl3mrEgUoBJsaBHT898s9
         8k+w==
X-Gm-Message-State: AOJu0YyOEw3wKq2T3PjNJiMJ4BRL5haCkUgTrSDAjYcdbdjpXBUZdTEl
	oLGMmvvw148eRTDc7oHdgW7WTlPWG3UYSFmbAyOwTbXHc/udaX+JHCkP8YTz/G8YL1tdTx3qRfU
	Z9FOW
X-Gm-Gg: ASbGncviJVzPVS1pSyej3p51b/T5pkzuO3b/enl03f1n+2FDUxaHN/H+hrm2IDfmj1J
	HLdPUhH1tztMthJiaX+9y+/xEmnW9MpGZCUr9PmS0vOjCoAp90KZy5Ka5vYTkCSBH7K8XQcXU8c
	dj60lXD3+MiikMotw9Grn/Yrw1Oi0Zsny13rlfT4vwRG+2KEN8SbqVgia4zJUuv8/HXmDa82kJT
	BcFsYxyMJdPNJ7EKDPyEc4EijW3qvCri4DburTGCXjoegmD6sFSCLuUaMoegix9kMnptrheaNyI
	KVTGxjdNjAag0kUhSzYm/hlAPX79/m6cJEFb9x4smhWSi1yxFcO7Ea23N/gU+Zefaa7hacTSZp0
	t4v2mK5gqdbHK5AvP
X-Google-Smtp-Source: AGHT+IH4QKzBtm/yyna9sCAn0M+V6etBO6bq95ldwkrHnpX54f08ZgJfZLCoOnipIcYGHO96gM2DZQ==
X-Received: by 2002:a17:903:3d07:b0:26e:43dd:ae77 with SMTP id d9443c01a7336-27ec1396fa5mr9360315ad.24.1758681018141;
        Tue, 23 Sep 2025 19:30:18 -0700 (PDT)
Received: from 68eb32e5e239 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698019821dsm175317785ad.64.2025.09.23.19.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ce7f1a983b074f6cf8609068088ca3182c569ee4
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 24 Sep 2025 02:30:17 -0000
Message-ID: <175868101692.258.6801285026177235853@68eb32e5e239>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ce7f1a983b074f6cf8609068088ca3182c569ee4/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ce7f1a983b074f6cf8609068088ca3182c569ee4
origin: maestro
test start time: 2025-09-23 17:22:14.145000+00:00

Builds:	   58 ✅    0 ❌    0 ⚠️
Boots: 	  160 ✅    7 ❌    6 ⚠️
Tests: 	12334 ✅  542 ❌ 3380 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:68d3209e75b320799d3abba5
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d3221e75b320799d3acbcf
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d320b075b320799d3abc46
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d322b875b320799d3ad163
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_18
      last run: https://d.kernelci.org/test/maestro:68d31c6e75b320799d3ab67f
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68d3000d75b320799d3a97f8
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68d31b2875b320799d3ab508
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:68d2f09c75b320799d3a7383
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:68d2f54175b320799d3a8dc2
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68d320ad75b320799d3abc24
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68d3219c75b320799d3abdf0
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68d3242775b320799d3ad661
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68d31ed975b320799d3aba64
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.pkvm
      last run: https://d.kernelci.org/test/maestro:68d3000075b320799d3a97cb
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68d2f0ad75b320799d3a73c4
      history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68d3000e75b320799d3a97fe
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d3011e75b320799d3a9821
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68d3011e75b320799d3a9822
      history:  > ✅  > ❌  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

