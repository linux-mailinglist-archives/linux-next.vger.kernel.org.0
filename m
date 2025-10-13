Return-Path: <linux-next+bounces-8583-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C1BD137C
	for <lists+linux-next@lfdr.de>; Mon, 13 Oct 2025 04:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD7E18947E8
	for <lists+linux-next@lfdr.de>; Mon, 13 Oct 2025 02:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160C716132F;
	Mon, 13 Oct 2025 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IN00/ehs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135C315E8B
	for <linux-next@vger.kernel.org>; Mon, 13 Oct 2025 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760322614; cv=none; b=Kcg/XOp4Gn/5kmomFC4ZWzMiGWdDJckqN16v2nr8/707eZ6xG6PueeJe2tkINDStW5q+vkBXov4Z4rC5qM7QR4aA87QuukO2XcqiT6cNZZ96nvkPpcABX7wdzwy9zV+n7s4g1WZOOqfoFvCDDTdiNkZ/0zR0/mGW4kMISeAWbFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760322614; c=relaxed/simple;
	bh=bBLr6QBkj7U+BixwG4FsGGCJscMfTDZkwe/8k07lzpA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Z3AuaGD3+GiRTYjt46MKFWENyfip6g2P6sB0loU78Qil0n9Mk9Jr6XTz4yZLkCq4MlUmh7+OwpwkFiAXxLsrDdyCnQnpLQ5ZzUFutN7l3ITLih/uFLGjDwCEqvvTpHJ14Jg+yT4ZPoQbG655SzUK8B9I/m1ExSwDg47Q2MLIsl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=IN00/ehs; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b609a32a9b6so2240682a12.2
        for <linux-next@vger.kernel.org>; Sun, 12 Oct 2025 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760322611; x=1760927411; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmc3Q2mvyrvxRyV1fEOURXX5g3HRIkvjnoYu2vUVdNk=;
        b=IN00/ehstSdPAJum0WK8JkVMLO1cnJM/V2UBw9S6Mk+ElbJ9YlNz5Czm6WIdxk1Woh
         qd1U25uJagJtmNUMyhQOoyZIxkomggJ1rLPWN19bclddBfMoG0S7reXn+cp8+9Jqikks
         i6n11NTWDSC/o/bw0CqEWR+uhb5zu49KPv33Tj8mRhwyiGTtniK3XENSDFqCv5xyUCB9
         wt6uVsNCER7eUy84J0UxpDCpgEdlYe1KP9/5NCvlJRXOLaq5stlR17MxQtRP8b4rEXnD
         lDEdG+u1fZv196L3YiWvZN1lMNzVyb0Jh8zO8koFtIl3L4YlTNb5p2EgwXuuKfVzaTBf
         y7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760322611; x=1760927411;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wmc3Q2mvyrvxRyV1fEOURXX5g3HRIkvjnoYu2vUVdNk=;
        b=SAr94+kWFR2kfQd2JtRzbPzs40gvI/OExI6WTcoDuVdUqJt1A+sqVEcNoMBnGOddMf
         gnxdMwj6XzdXIuc6a4bhQe6CWgEJwj7qhO7z3liJU+jC437+mvwywOXk9UvM6UDycMIT
         F38lGTdfyH/ND0n+32M/yhMzljU4VVJbM1pwas02g+HWvxudZCXT0ip01Kt6cwxCiI97
         ubSk8rd5KFh9xF+93RkdmvPtKpWyUpe3WcfGUrN1jE+lraqSUa5ciSmKfNhfaMDP6HUI
         skrBAYHL1R5xI5GQdm/ocVRgtsljzXqBKPpUzRcqLGjKIofGjPofuV4dcKfWUC1ZxOVU
         5jDw==
X-Gm-Message-State: AOJu0YwX9iH6AULba93gPexHBY8+2uBY0oNH6Ao243O2kkrRI0/cjhX2
	Z3id/E8fuLIf7tCwo09rj3qVN6T0gwvwzQ7N7cXDvGnTxCDdgSLy8tic/UrfyXZjwESHlVzclMA
	dtpGp
X-Gm-Gg: ASbGncuqTjsJxqWdOSVM2+DadOfiA3xSiCWqt9iuOL+RTsd8F6JqX1ea02IvtZTe5/g
	gLPSS3UFhngnIAjdfY0PKY+2PXlskv9c48+KtRpZZGTJ8V9yU9amU7mA+ErxaWq1jqYT4H1lhd4
	qkxQZUhbrkDFenvxkEKK48io6gNQ9pgQX7sXM6ytDAovDrzo55MnWJ5WwLqtRpoun0TnXAh/mR+
	Qhz7+RcFiP2w82tDnotwkrMiNFLjEvXZPXu/TPXHbTOnL1UgdDMpo+K648zj5Av/3aIOeM/MRzP
	/QZ23anmZ1BAVQhEh91ASqBM0fue1rg+cIUzdzor5qDVz9duQ+w7+RJcuvK+VO7zZG3KI2SQlRp
	zo2b2QglcjWFvylFV9Zt/7RxOeN17KTdH2k90ifopN4vq5Q==
X-Google-Smtp-Source: AGHT+IG/8EkelpUS6YDkXomz1tmyJwxbFGGQ++ZlXMtZGpbJKm4Botwt+Twt4mrbHJ5q5BbCqUUzBg==
X-Received: by 2002:a17:903:3c2c:b0:270:b6d5:f001 with SMTP id d9443c01a7336-2902723faa2mr228722175ad.23.1760322611165;
        Sun, 12 Oct 2025 19:30:11 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6f08sm117335785ad.26.2025.10.12.19.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 2b763d4652393c90eaa771a5164502ec9dd965ae
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 13 Oct 2025 02:30:10 -0000
Message-ID: <176032260973.1102.7480128800660437557@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/2b763d4652393c90eaa771a5164502ec9dd965ae/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 2b763d4652393c90eaa771a5164502ec9dd965ae
origin: maestro
test start time: 2025-10-12 18:08:57.632000+00:00

Builds:	   47 ✅    0 ❌    0 ⚠️
Boots: 	  131 ✅    7 ❌    0 ⚠️
Tests: 	11072 ✅  271 ❌ 4018 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68ebfd4a9512ca52745b1ad4
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68ec5ebc9512ca52745ca9ad
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68ec609e9512ca52745cbfde
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68ebfbba9512ca52745b1837
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68ebfdee9512ca52745b1ecf
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68ebfdee9512ca52745b1ed0
      history:  > ❌  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68ec5ec09512ca52745ca9cb
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68ec61509512ca52745cc269
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68ec1e039512ca52745bb6a1
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68ebfb999512ca52745b17e4
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68ec0af89512ca52745b7a45
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68ec0ec39512ca52745b8748
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68ebfdf09512ca52745b1ed6
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:68ebfb929512ca52745b17d2
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

