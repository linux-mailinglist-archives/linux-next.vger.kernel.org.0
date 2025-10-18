Return-Path: <linux-next+bounces-8627-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D63BEC548
	for <lists+linux-next@lfdr.de>; Sat, 18 Oct 2025 04:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6AB264E07D2
	for <lists+linux-next@lfdr.de>; Sat, 18 Oct 2025 02:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8D52747B;
	Sat, 18 Oct 2025 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2au/4B2x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E39134CB
	for <linux-next@vger.kernel.org>; Sat, 18 Oct 2025 02:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760754630; cv=none; b=o/fq5z2aWU55gkPTmknQaKEcMfAILAxofSvjznOqDTbNOAPLEcn5+8JzeYBWDk4+hG7AGkuMKrRx1yfRM7i8ZfNM4shD9L/HrvuHygzJ2yhh8JejkiOwmrFKIniM/qx/27qvxRqoPOeUAK4JbS07OlU6+T4hqEXknxRYt/5aX/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760754630; c=relaxed/simple;
	bh=8l3LiK3X5oSxz/qdmi8EKaXHMcDdTv3+2NNZbCd16do=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=WE74ktoczDc3jtQrVy+iZl8VjK0uT1lYBApN3aNv0EeP+kE9zUxCGmWKErWL1wUAnJCdF2fDKg6GWHW2L5IZUNKrZY/7PU8q3QcOkd/jW8WcG/txqKBu+W2jouE4BpN724YwZueRh53TmnjoVQk0OWJPNJR//omsnVR+sb7kIqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2au/4B2x; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-269af38418aso27769635ad.1
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2025 19:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760754627; x=1761359427; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6DcedUafhdoEdw2xOb1YLobLV30qpfMj5l/yAVZQs8=;
        b=2au/4B2xLEGxoKl7p2ZcJ+7MTHVMrbuQoQwNcsjHsEgcPWWCtPTGf7JFGHdwrw9fSo
         n8cqJO33HKqtJXrkcVF3Ihx5tN0m6Cqf0rPL+RhkpugEZ7CBJQ8FIG6RSJRwA77WNTsv
         o21HMGowBzFBi/se7gSgIrc4JAIDmkFY9QnyLEANFMwWVkcJvDfHMVRiLjCuNabNIS2U
         lxa3JKRTaXt3Cl4IbeH3LDTP/hsb+nilAXoIaayOBREY9RooGQ/61bJO6LgJbk1F/UVa
         LkbFXHAxNOi6xpAUL+7/ilzF7O5tx7Q9sVI9BqOToWlTpkEjGmMSs9fcUfrFlIa4WIuS
         2qUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760754627; x=1761359427;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m6DcedUafhdoEdw2xOb1YLobLV30qpfMj5l/yAVZQs8=;
        b=MY44h3p2cIVF6bOyYciEB6oxV2wPt2jJJsNH48NB6YGR0brRMSmLX72oVy4F+yHTpJ
         JD51Prq8tGHWKC3qkAhF0R/oe4Vrq/l+qv0XkV43fANma7l3EVfwLgxCcnk3zz3hNdzI
         Ipgec8OTVQGvgED1OBOgPTuEhKY44LfcjgZnus6H1q2LXZmaDJU/AvKSyYIKCrK6ev4T
         PxgbbejxTpnEdfG21EndKh5pBXH8+MPXBXsT3NLflz59XCFxBzedhrF4CtjnDPSnZdsD
         9qmaDrXw2OIIHCBAXeuJlqiAatxvLJKpUBS8C7XXLCDoLWLQm830W1S7aGEwnr5q+Lg0
         GyCg==
X-Gm-Message-State: AOJu0YxsKyHhGHKXN7R3GEl1xt2IziP0oW4ILykLkSxKTlwbMQqxJFyW
	/zi5OH3a+W6Wz8+wBA9rN4SujxxWd6Ks5YvEQ9DYUtoWBuXSajnf/lV5wfjWozNIoZTVGFRlAeN
	TSe04LYE=
X-Gm-Gg: ASbGncvee5cvmRESlQwy1yFHcMgb3XoozGPtrc9Up4/Eezdcg3BCsOU+Qd8bdvxwFHU
	ZQ6go2zZtR48xZe/EIDjvAlong+qFtfsg3X5zwgl40WVCM5GvU27Edm2vBUo7mhg6jC78/3xwps
	Cyxd3+7+fGGKiI2kEStPJZkrj5qSxIeB9iUqdCZe3v60MirVRv0eyO6NYkiYf3paE5IKG2w3WAJ
	HJYy1GfBErMW8kDw7Rfz81wfTxJxSQQmR4OFBj1Z/U3XfUxPJTs/LL3cQNKSj4yrY6skOhLmNI+
	memzYNfgGcbtEMe36e1MFpQQeAuMgL9O6a7evMaTVBLUkYH6D5UzrAqVG8TEQjA1gjOqb9jbAh2
	NhGlKRgFybmBJNubDvn2zQcKS/97336vjKtVESGmRcDxIM4/2x/k6MQw9lZceWw/Vb5wsIw==
X-Google-Smtp-Source: AGHT+IFFDPla0LNTOF9ev26ZNEGWtRUJjREDzduVQch+eZxRvdwkjhAI7TApmO56mSIqKzIUdMzh+Q==
X-Received: by 2002:a17:902:f610:b0:272:2bf1:6a21 with SMTP id d9443c01a7336-290c9ca72aamr78647605ad.14.1760754627539;
        Fri, 17 Oct 2025 19:30:27 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471da2f9sm9725045ad.62.2025.10.17.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 19:30:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 93f3bab4310d4ff73027cc4f87174284d4977acf
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 18 Oct 2025 02:30:26 -0000
Message-ID: <176075462617.3422.6119498599484864807@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/93f3bab4310d4ff73027cc4f87174284d4977acf/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 93f3bab4310d4ff73027cc4f87174284d4977acf
origin: maestro
test start time: 2025-10-17 23:49:51.841000+00:00

Builds:	   13 ✅    4 ❌    0 ⚠️
Boots: 	   12 ✅    0 ❌    0 ⚠️
Tests: 	 2329 ✅    4 ❌   52 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:68f2e8d85621556c1f2066ee
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: x86-openblocks-iot-vx2
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68f2e6df5621556c1f2051f1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68f2e8e55621556c1f206703
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f2e8e55621556c1f206704
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f2e8e15621556c1f2066fb
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f2e8e15621556c1f2066fc
      history:  > ❌  > ✅  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68f2e97e5621556c1f2068df
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68f2e9875621556c1f206914
      history:  > ✅  > ✅  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f2e9a85621556c1f206a19
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f2e9a85621556c1f206a1a
      history:  > ✅  > ❌  > ✅  
            



This branch has 4 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

