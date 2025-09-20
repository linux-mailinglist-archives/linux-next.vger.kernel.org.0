Return-Path: <linux-next+bounces-8396-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C236AB8BD7A
	for <lists+linux-next@lfdr.de>; Sat, 20 Sep 2025 04:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74ED11C04045
	for <lists+linux-next@lfdr.de>; Sat, 20 Sep 2025 02:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C153F155C87;
	Sat, 20 Sep 2025 02:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1BSC7Dbt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F81A86352
	for <linux-next@vger.kernel.org>; Sat, 20 Sep 2025 02:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758335500; cv=none; b=MKMLnnghUhEKGnHadfRJCjbhQ8jdyHVXmcpaw4C54Eu/M3FR3yuAJ939Ao8zPdFKnM5flN0N2+XUoq5rRMJ3+6dX37OWzEDwGbKTkIoeWq3KYrOqFRfsdDQ+/MbW/YK2HYHhtYgNxwu6EXXHeKPQs/7Nz46kw2qvXXYlEdRMVL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758335500; c=relaxed/simple;
	bh=4nWQQA8wYv5Mjy+SQ99u898YvhrcaCjZ3+cEpggFOPA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=buivtjpMxTOXT7O+GlLVVREub3ZtJepgsg/ReYqsyFZf+18nJ/9zJkX6wORT53c7/j2DNnpRgjC41HVHqSLzECkDeTnv5bp+XXWx2oSnkdnngokmurtZIKcp6xi5zQKZwYYSfcMotNHvL+ZdfLCl/wAOuBbiZs2jvGbGOeTV4HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1BSC7Dbt; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77b2e3169dcso3747084b3a.2
        for <linux-next@vger.kernel.org>; Fri, 19 Sep 2025 19:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758335498; x=1758940298; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3kjWqltEPAfprzlWKqn3DoaRj32kRQ7AZubMrlagfU=;
        b=1BSC7DbtZ9emYRamGx/oF39Es8gPjyj7kzFdfVlYo/8blQ++6xNjFWeLa7MMi19SPf
         6GS7HLFTZjlWv8QQ7bBPQcLWMJfXKbFMOSSIhT+mKcrVEo+xcVSy237M7CGLCsBBfHvd
         tmiQcGqdjdEllUGbbiQJ5moPagOTufqbmC9vXGwsxnKA98LqBXr3e513yM6Q2CBog3Hw
         Xyn/DUB6TKDMc9KyYG/Il8g+SiZq1RS86614rS4oE5IVMWlW4kfkQdsZ2e6B0z/QVTw9
         iao8/TUYf8IUFzL0dskDQB15j82yTXaxUIB7OVZHEWYU5RGEvL9hWBPMqfoukzw7Ezfc
         ZVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758335498; x=1758940298;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b3kjWqltEPAfprzlWKqn3DoaRj32kRQ7AZubMrlagfU=;
        b=nekWn2HN8+Dde0SPWvLTlOQWpZeycu4awAVyNVeGo4BltL3DuYbP5P7vSnB/wexMCL
         BITFs13stTF852hQj403mej3wTYDf3d+BJKxLlkN/Vbu4s5xJHVMculev0b9HmKFx+9P
         /2kGNHQZes++Tjv8P2q//lMSAWCbyLH4TkgHrTdUysyM+FC9wUt5Qipl7me8w/WTIu6r
         IFMljEgP/v85Ea5WGW5Sp7tPwsOKSh7yGccYCC7bjFeIF737nlizx2ZH82IYWMHB1kPm
         IszLdghLMWCHVz7AhGmmmM10dwzmkCWzGLVHqCtmw4B5kFUO+ujbFQtGIoRZ+0I894oR
         duPA==
X-Gm-Message-State: AOJu0YyUznGGQyaTZYFRAogc64yPOTkOhwJGHcQkLGdeG7KZdOggnJAh
	PzlBykGqrH4isUR7FKKEYh1jq/rLERq5iRTWtMYVad0xgN+Fnci6lNjYJQm0x3YkhUiOacDMnAd
	f8TqjLT8=
X-Gm-Gg: ASbGncszkYVt5yKTR2QfiwjGPRsExJmRO0HviC6q79WxLqNRny0DMPPE5Y8PafvcIlY
	p1HfzJTwSmYOAwJQvZMnWwmx9X4Gb07AwS1z7rLleObPEIURh6DlsyQyfR00HChYuHr//Bn38xL
	Otd3sgj7B5jj4CXhlWVPtRoRMcYCvXC/m82e8IBHkrqTe75/A5eYh4MjzIHr9bOlIPBAub/9g2R
	CtThdZ/4Sb6Sq11OcD/pwMZ5fUqzgh0YCtpAUmaViAYDJMtybPc3REO4E5hlYaK5Erv1cytdYpJ
	Yam9E/VOznp7wIzcm60+0RVsAUsOAP4G5OIipg98S8BE/ALEgkaAx1cIiKOAlhyXoFH7qk5aiRD
	tDa+0yxQWhpwWUVmt
X-Google-Smtp-Source: AGHT+IEeONikrXGG6a8eQNB7aqYyrj3EUaW3nfAZVKNuaCCvzMqNeVFTyFrpmmO8kY5FYWlEOMXxOQ==
X-Received: by 2002:a05:6a21:999c:b0:24e:a19:7e91 with SMTP id adf61e73a8af0-29259631d21mr8489549637.5.1758335498584;
        Fri, 19 Sep 2025 19:31:38 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff448058sm6101204a12.54.2025.09.19.19.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 19:31:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 846bd2225ec3cfa8be046655e02b9457ed41973e
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 20 Sep 2025 02:31:37 -0000
Message-ID: <175833549694.463.15793184848161388205@1dfac204f25d>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/846bd2225ec3cfa8be046655e02b9457ed41973e/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 846bd2225ec3cfa8be046655e02b9457ed41973e
origin: maestro
test start time: 2025-09-19 16:49:43.518000+00:00

Builds:	   56 ✅    0 ❌    0 ⚠️
Boots: 	   68 ✅    7 ❌    8 ⚠️
Tests: 	11946 ✅  550 ❌ 3258 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68cda16275b320799d30d128
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cde39a75b320799d320bcd
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:68cda96675b320799d30f424
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:68cda96675b320799d30f425
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68cdbe1b75b320799d315c7f
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cdc01b75b320799d317073
      history:  > ✅  > ❌  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68cdadcc75b320799d310ace
      history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68cdbe1575b320799d315c43
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cdbf9275b320799d316bfe
      history:  > ✅  > ❌  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68cda98c75b320799d30f4a8
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68cdd3d475b320799d31c34a
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68cdd3da75b320799d31c357
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68cdd4ea75b320799d31c7a4
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68cdd4ea75b320799d31c7a5
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

