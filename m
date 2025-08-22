Return-Path: <linux-next+bounces-8075-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B3B30BD3
	for <lists+linux-next@lfdr.de>; Fri, 22 Aug 2025 04:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C27B1D00207
	for <lists+linux-next@lfdr.de>; Fri, 22 Aug 2025 02:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AE1D2FF;
	Fri, 22 Aug 2025 02:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EgfhCZb5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBDDC120
	for <linux-next@vger.kernel.org>; Fri, 22 Aug 2025 02:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755829862; cv=none; b=ol1U8DDTjZ95nm2cJ0Hp4DNeoXZ/7au/o+Zg4CogSXAdDcxnA9HBAbdgwFytrOcYjKuw7LIAJvY5yjUhde/+MMWlQSemSRqmuK52hVjrVXQ+eo5doZzjo6w99+0WTwMNNATbGu9Dy8F6J3br6R8jMUKiQb8tNP52FKTRmk/h5fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755829862; c=relaxed/simple;
	bh=AFf1gVukhizvzb4ZC8Wc++bEZ4ZB8L2mMU80Xpiy5DU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=dJxNnvDB0MLzkWQ4meYfEIK3PejFGOWvBqVC87htuJrsXx4XUKmZp6N53aSwHsnPZ+iolRV6AqpJYBusiHYNTmfebmq7OimCNIYo60af1Z4t6jr+tby13caFc0965yH97eYduZ9AYxTFxlnJfJpLfASVR9JRbKqs6LUoqLsuqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=EgfhCZb5; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b47174c3b3fso953627a12.2
        for <linux-next@vger.kernel.org>; Thu, 21 Aug 2025 19:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755829858; x=1756434658; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8Kif7/1XekC66Lcps0syujNVJUxBe24w6NFru5r/4E=;
        b=EgfhCZb5jo3Sywgb2WD6pNFJKGKEHxLiVkfyeLE1BArZwF/w4xdrLtBQVZOqbP/wf2
         AoDBb+GJjMgBgKPqzCG2v3ytSYhoQxzH3nGjj+5BXElm6E3fnkRH1SWaEnuvN+HYqdLq
         Xfqv22o1gHUWIqAl+wPvwXNRDjBeyOGYQxL2neN3YnKYOGEnaL0uAllIMI6XyghHkfay
         iilLWXMHWkPY4+LoZK7kx4z21G/Bg96WBtKHd0uQgfQW60KtBzfdkYUy+1tXGUr8ig4A
         GsSDrOGYuYXVf9SSgfaCB32f6WqgWpoEJQVwp/XjyokLWqu1jLgBFe+POyXk8FVNtKW8
         OTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755829858; x=1756434658;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8Kif7/1XekC66Lcps0syujNVJUxBe24w6NFru5r/4E=;
        b=dNYwCm4TUWCNQ+MNAx4AvYp7eL2/E9TP6EYvQlsNSMGOxakUqt9SqkyzX+dD5IgllE
         TaIuf8YT55VJwq+V3cvF02arArPzAWxkBbyTtFWXTa7c5opMlPy7F0AJwPFLmVyx8RHe
         Dz5iY8jL3ulv/zczjY9LVhssNBJgmlwKVVHzK3i8RZRY4pAFci482AdfowaI7AC3X/hx
         N6ogV6ZXOH3GBYBA2Xaw8IJEPywiSP7xcxmAVhTZbopPe8GDZz7mD9bNrGvJY6adQPIw
         DNzMgpEbH6T8H60s5dnlJmmo2w4kqUFLFyxA9Oq+SSeJ91QyKnSLcaU8Fw8EM18M9mFJ
         oAmA==
X-Forwarded-Encrypted: i=1; AJvYcCWwuEpQIvDLCQe/5Cvmegqs0XumJjmByex9UoVH39sb4e9Pf1pcRpWFa7F6uDRk+mhuwbKR152BWqYT@vger.kernel.org
X-Gm-Message-State: AOJu0YwK8igTHXAe5BTMip2FHh1apynPx+4rQjtOuYovkaxvHskENxzk
	1Od7pYIInDQbvkRUi/8SMKTgtbCa4qX4GJtLIVZud84ffN2FKfcPI6IUPuIqYCnqIOz4zMr3OZ+
	RRfDX
X-Gm-Gg: ASbGncuWObmb1ZJc/vBINXdXaEduyhAxBJsz8feiJw7z4KC2dnVP3vDuIygQMgDBppV
	XpVN404db2UsKQeqIm9uSj5NP9B/wM+dGYxitB+DLZfVL7Gu/bfWcINnIQMZqvWu8AnNIoFHv0R
	RJCioJcUUsUKKj9U13UemHxjX+Fic1aQuMHe8YJAmlQJmCYif4+2N8Mtd189GcmuxkbsdIN6SPm
	Oyi6NApXbsO50k74HmjB+ru3bf28Cm5ZZC6qFc5iW0Np7l2611i6dheb7zk46jqDSk1LQ94cUA1
	dzZexCc9q0GlWKKOIh5WIcC7I7K5emEurfULQ5Y2OVC6Qf4wpy3gb9tYyV6CCSsu9FL2XIhAGwA
	4l8cTAundPMdQPOsr
X-Google-Smtp-Source: AGHT+IGg4waUoxn0kkiaw+pn+2aMCARhNkUwK7NYE9+hWVscahZ8gcmru2lN7ZtU7V3sVzZfY9k0dQ==
X-Received: by 2002:a17:902:fc47:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-2462ee7b309mr21808425ad.23.1755829857885;
        Thu, 21 Aug 2025 19:30:57 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed339fa8sm68536795ad.20.2025.08.21.19.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 19:30:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 22 Aug 2025 02:30:56 -0000
Message-ID: <175582985653.171.9587867701739917831@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7fa4d8dc380fbd81a9d702a855c50690c9c6442c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
origin: maestro
test start time: 2025-08-21 06:45:41.574000+00:00

Builds:	   56 ✅    4 ❌    0 ⚠️
Boots: 	   86 ✅    5 ❌   57 ⚠️
Tests: 	12577 ✅ 4962 ❌ 4644 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8186-corsola-steelix-sku131072
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a6db4d233e484a3fa5353f
  history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8365-genio-350-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb7b233e484a3fa50713
  history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8390-genio-700-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb7d233e484a3fa50716
  history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: mt8395-genio-1200-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb7e233e484a3fa50719
  history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
- kselftest.dt.dt_test_unprobed_devices_sh_soc_0_geniqup_8c0000_i2c_888000_bridge_8_aux-bus_panel (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c718233e484a3fa4de0f
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.dt.dt_test_unprobed_devices_sh_sound (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c718233e484a3fa4ddaa
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
- kselftest.dt.dt_test_unprobed_devices_sh_sound (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c71e233e484a3fa4df02
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca62233e484a3fa5054f
  history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbb1233e484a3fa50804
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a705f7233e484a3fa56835
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.landlock (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca5b233e484a3fa50519
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca5b233e484a3fa5051c
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.lsm.shardfile-lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a70272233e484a3fa561f3
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca5c233e484a3fa50525
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ❌  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca5d233e484a3fa50528
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: bcm2837-rpi-3-b-plus
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6d6fb233e484a3fa52d8b
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbf7233e484a3fa508da
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.proc.shardfile-proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6dcd9233e484a3fa5369f
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.ptrace.shardfile-ptrace (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6dc61233e484a3fa5365b
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4d6233e484a3fa4d36d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4de233e484a3fa4d3a0
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4df233e484a3fa4d3a3
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e0233e484a3fa4d3af
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e1233e484a3fa4d3b2
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e1233e484a3fa4d3b5
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e2233e484a3fa4d3b8
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e2233e484a3fa4d3bb
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e7233e484a3fa4d3df
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e8233e484a3fa4d3e2
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e8233e484a3fa4d3e5
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e9233e484a3fa4d3e8
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e9233e484a3fa4d3ee
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e9233e484a3fa4d3eb
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4eb233e484a3fa4d3f7
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4ea233e484a3fa4d3f1
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4ea233e484a3fa4d3f4
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4eb233e484a3fa4d3fa
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7bc233e484a3fa4ea19
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7bc233e484a3fa4ea1c
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7bd233e484a3fa4ea1f
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7bd233e484a3fa4ea22
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7bd233e484a3fa4ea60
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7be233e484a3fa4eb20
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ring-buffer (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7bf233e484a3fa4eb23
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.rlimits (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7bf233e484a3fa4eb26
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.seccomp (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7c1233e484a3fa4eb32
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.splce (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7c0233e484a3fa4eb29
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.sync (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7c0233e484a3fa4eb2c
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timens (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7c1233e484a3fa4eb2f
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ublk (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7c1233e484a3fa4eb35
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.uevent (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7c2233e484a3fa4eb38
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.user_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7c2233e484a3fa4eb3b
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb96233e484a3fa507b7
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbc0233e484a3fa50834
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbcd233e484a3fa5085c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbd5233e484a3fa50871
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbe2233e484a3fa5089e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbf4233e484a3fa508ce
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbfb233e484a3fa508ee
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbf9233e484a3fa508e5
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca53233e484a3fa504ec
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca54233e484a3fa504f2
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca5c233e484a3fa50522
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca5d233e484a3fa5052b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4d6233e484a3fa4d370
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4df233e484a3fa4d3a6
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e2233e484a3fa4d3be
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e6233e484a3fa4d3d6
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: imx6q-sabrelite
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4d1233e484a3fa4d349
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- ltp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4ee233e484a3fa4d409
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.cyclicdeadline (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4cc233e484a3fa4d326
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.cyclictest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4cc233e484a3fa4d32b
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.pi-params (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4cd233e484a3fa4d32e
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.pmqtest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4cd233e484a3fa4d331
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.ptsematest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4ce233e484a3fa4d334
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-osnoise (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4cf233e484a3fa4d33a
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-timerlat (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4cf233e484a3fa4d33d
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.rt-migrate-test (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4ce233e484a3fa4d337
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4cf233e484a3fa4d340
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.sigwaittest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4d0233e484a3fa4d343
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6c4d0233e484a3fa4d346
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6q-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4d7233e484a3fa4d373
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4df233e484a3fa4d3a9
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e3233e484a3fa4d3c1
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e6233e484a3fa4d3d9
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: imx8mp-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb97233e484a3fa507ba
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbb5233e484a3fa50814
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbc1233e484a3fa50837
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbd5233e484a3fa50874
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbe3233e484a3fa508a1
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca56233e484a3fa50501
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca59233e484a3fa50510
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb99233e484a3fa507bd
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbb6233e484a3fa50817
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbc2233e484a3fa5083a
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbd6233e484a3fa50877
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a74473233e484a3fa63b67
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca57233e484a3fa50504
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca5a233e484a3fa50513
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb9d233e484a3fa507c9
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbb7233e484a3fa5081c
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbc5233e484a3fa50844
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbd9233e484a3fa50880
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbe8233e484a3fa508ad
  history:  > ❌  > ❌  > ⚠️  > ❌  > ⚠️  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cba6233e484a3fa507e0
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbb8233e484a3fa5081f
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cce1233e484a3fa50b94
  history:  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.capabilities (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbcf233e484a3fa50862
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.clone3.shardfile-clone3 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ce99233e484a3fa5175e
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbe9233e484a3fa508b0
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cba0233e484a3fa507cf
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbba233e484a3fa50822
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbda233e484a3fa50886
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbea233e484a3fa508b3
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca58233e484a3fa5050a
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a6db4c233e484a3fa5353c
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59c233e484a3fa4d4b8
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59f233e484a3fa4d4ca
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a1233e484a3fa4d4dc
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59a233e484a3fa4d4a6
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a3233e484a3fa4d4ee
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc00233e484a3fa508fd
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc04233e484a3fa5090f
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc07233e484a3fa50921
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc0a233e484a3fa50934
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc0e233e484a3fa5094e
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc16233e484a3fa50976
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc1a233e484a3fa5098c
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc11233e484a3fa50964
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc1d233e484a3fa509a9
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc20233e484a3fa509bb
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc23233e484a3fa509cd
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: mt8186-corsola-steelix-sku131072
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5ab233e484a3fa4d527
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5ad233e484a3fa4d533
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5af233e484a3fa4d53f
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5b0233e484a3fa4d548
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59d233e484a3fa4d4bb
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59f233e484a3fa4d4cd
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a1233e484a3fa4d4df
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59a233e484a3fa4d4a9
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a4233e484a3fa4d4f1
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c598233e484a3fa4d497
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a6233e484a3fa4d503
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a9233e484a3fa4d515
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc01233e484a3fa50900
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc05233e484a3fa50912
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc08233e484a3fa50924
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc0b233e484a3fa5093b
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc0e233e484a3fa50951
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc17233e484a3fa5097d
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc1a233e484a3fa5098f
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc12233e484a3fa50967
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc1e233e484a3fa509ac
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc21233e484a3fa509be
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc23233e484a3fa509d4
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a6db4e233e484a3fa5355a
  history:  > ✅  > ✅  > ⚠️  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5aa233e484a3fa4d51e
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5ab233e484a3fa4d521
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5ac233e484a3fa4d52d
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5ae233e484a3fa4d539
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5ae233e484a3fa4d53c
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5af233e484a3fa4d545
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5b1233e484a3fa4d565
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59d233e484a3fa4d4c1
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a0233e484a3fa4d4d3
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a2233e484a3fa4d4e5
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59b233e484a3fa4d4af
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a5233e484a3fa4d4f7
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c599233e484a3fa4d49d
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a7233e484a3fa4d509
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5aa233e484a3fa4d51b
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc02233e484a3fa50906
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc06233e484a3fa50918
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc09233e484a3fa5092b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc0c233e484a3fa50941
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc10233e484a3fa5095b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc18233e484a3fa50983
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc1b233e484a3fa50997
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc13233e484a3fa5096d
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc1f233e484a3fa509b2
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc22233e484a3fa509c4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc24233e484a3fa509da
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8365-genio-350-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf1233e484a3fa511c7
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf5233e484a3fa511e2
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf9233e484a3fa511fd
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdfc233e484a3fa5121c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce09233e484a3fa51276
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce0c233e484a3fa51291
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce04233e484a3fa5125b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbfc233e484a3fa508f4
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbfd233e484a3fa508fa
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbde233e484a3fa50892
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbf1233e484a3fa508c2
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf2233e484a3fa511ca
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf5233e484a3fa511e5
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf9233e484a3fa51200
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdfd233e484a3fa5121f
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce00233e484a3fa51241
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce09233e484a3fa51279
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce0d233e484a3fa51294
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce04233e484a3fa5125e
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce11233e484a3fa512af
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce14233e484a3fa512ca
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce18233e484a3fa512e5
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: mt8395-genio-1200-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbfc233e484a3fa508f7
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbdf233e484a3fa50895
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbf2233e484a3fa508c5
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf2233e484a3fa511cd
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf6233e484a3fa511e8
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf9233e484a3fa51203
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdfd233e484a3fa51222
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce01233e484a3fa51244
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce09233e484a3fa5127c
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce0d233e484a3fa51297
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce05233e484a3fa51261
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce11233e484a3fa512b2
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce15233e484a3fa512cd
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce19233e484a3fa512e8
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c663233e484a3fa4d95f
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf2233e484a3fa511d0
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdfd233e484a3fa51225
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce12233e484a3fa512b5
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce16233e484a3fa512d0
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6ce19233e484a3fa512eb
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: rk3399-rock-pi-4b
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf3233e484a3fa511d3
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cdf7233e484a3fa511ee
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cba9233e484a3fa507e7
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbc9233e484a3fa5084d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbdb233e484a3fa50889
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbeb233e484a3fa508b6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbaa233e484a3fa507ea
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5b5233e484a3fa4d57a
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59e233e484a3fa4d4c4
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a0233e484a3fa4d4d6
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a5233e484a3fa4d4fa
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c701233e484a3fa4db0a
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a8233e484a3fa4d50c
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.iommu.shardfile-iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c70c233e484a3fa4dd93
  history:  > ✅  > ✅  > ❌  > ✅  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc1f233e484a3fa509b5
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-lazor-limozeen
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5b5233e484a3fa4d57d
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5b6233e484a3fa4d583
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c59e233e484a3fa4d4c7
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a1233e484a3fa4d4d9
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c5a6233e484a3fa4d4fd
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c6fd233e484a3fa4da46
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a6c7c5233e484a3fa4ec39
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a6cc11233e484a3fa50961
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4d7233e484a3fa4d376
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e0233e484a3fa4d3ac
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e3233e484a3fa4d3c4
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a6c4e7233e484a3fa4d3dc
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7bb233e484a3fa4ea16
  history:  > ❌  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7be233e484a3fa4eb1d
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7c3233e484a3fa4eb46
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cba3233e484a3fa507d6
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cde6233e484a3fa511bd
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cd0d233e484a3fa50bb8
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbee233e484a3fa508bc
  history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca5e233e484a3fa50530
  history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
- kselftest.uevent.shardfile-uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb6a233e484a3fa50705
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb6a233e484a3fa50703
  history:  > ❌  > ✅  > ❌  > ❌  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cb6a233e484a3fa50704
  history:  > ❌  > ✅  > ❌  > ❌  
            
- kselftest.user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6ca62233e484a3fa50552
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.user_events.shardfile-user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cc6c233e484a3fa50aa4
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6cbad233e484a3fa507f8
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c634233e484a3fa4d6fd
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c643233e484a3fa4d83c
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c720233e484a3fa4df44
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c653233e484a3fa4d8c1
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c74c233e484a3fa4e1c6
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7ad233e484a3fa4e58a
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c652233e484a3fa4d8bb
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c871233e484a3fa4f905
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c8ad233e484a3fa4fe1c
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf40233e484a3fa51b8c
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf50233e484a3fa51c3a
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf53233e484a3fa51c52
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf55233e484a3fa51c6a
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c652233e484a3fa4d8be
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c867233e484a3fa4f6fd
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c65a233e484a3fa4d902
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c871233e484a3fa4f856
  history:  > ✅  > ❌  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf40233e484a3fa51b8f
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c653233e484a3fa4d8c4
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7a9233e484a3fa4e492
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7ff233e484a3fa4ef37
  history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c653233e484a3fa4d8c7
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c878233e484a3fa4f9de
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c8a7233e484a3fa4fc5f
  history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: acer-R721T-grunt
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf3e233e484a3fa51b7a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf46233e484a3fa51bc2
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c654233e484a3fa4d8ca
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7b5233e484a3fa4e90c
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7f2233e484a3fa4edd3
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c654233e484a3fa4d8cd
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c895233e484a3fa4fb65
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c903233e484a3fa501b7
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c645233e484a3fa4d84c
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c654233e484a3fa4d8d0
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7ff233e484a3fa4ee4b
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c837233e484a3fa4f2c6
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c648233e484a3fa4d864
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c657233e484a3fa4d8ea
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7b1233e484a3fa4e712
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7be233e484a3fa4eb0a
  history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c645233e484a3fa4d84f
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c655233e484a3fa4d8d3
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7a5233e484a3fa4e3c7
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7b6233e484a3fa4ea01
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c655233e484a3fa4d8d6
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c8ab233e484a3fa4fd27
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c912233e484a3fa502a7
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c63e233e484a3fa4d757
  history:  > ❌  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c655233e484a3fa4d8d9
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c831233e484a3fa4f1dc
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c85a233e484a3fa4f640
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf54233e484a3fa51c5e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c63a233e484a3fa4d730
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c641233e484a3fa4d774
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c658233e484a3fa4d8f6
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c84b233e484a3fa4f47f
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c842233e484a3fa4f3c5
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c656233e484a3fa4d8df
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c8c2233e484a3fa50027
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c945233e484a3fa503a5
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf42233e484a3fa51ba1
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf52233e484a3fa51c4f
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c641233e484a3fa4d777
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c649233e484a3fa4d873
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c659233e484a3fa4d8f9
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7af233e484a3fa4e64e
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c73c233e484a3fa4e05f
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c646233e484a3fa4d858
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c656233e484a3fa4d8dc
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c895233e484a3fa4faa2
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c8bb233e484a3fa4ff0d
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a6cf52233e484a3fa51c4c
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c659233e484a3fa4d8fc
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c7b5233e484a3fa4e84b
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a6c811233e484a3fa4f0fe
  history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

