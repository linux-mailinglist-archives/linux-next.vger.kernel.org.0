Return-Path: <linux-next+bounces-8864-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 881F1C38DED
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 03:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44CC53B3819
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 02:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B527D27E;
	Thu,  6 Nov 2025 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="hl37XPb5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3015695
	for <linux-next@vger.kernel.org>; Thu,  6 Nov 2025 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762396230; cv=none; b=JGBQrSF2mLEwH9Ywb6ee9XWRuyKp5LDGmeVIBqtHikPWpxMWjasIOyAisDKAp6pM969Nse45O9VMvLruGh039Nt4Bs/hq9pDKzdMRzBuVAE7nEWAJUkkPoYZKjFmWG1UwWPTwI3cboBKAwnsAgB9y+oljEVmbJJL4uRki3RHNTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762396230; c=relaxed/simple;
	bh=rolrt8DYpq83a43IzB8bUehKvLp0gorVPK/NHnwuQco=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=kKdWJpP1ZSAKGktbQW8rLpDnBnLvrXwPLpE1qcBzr2IfWRY5uGZ1kXYTPudth7H2rQLJclLakaDT4k6I1JZ/eVlCePqSbuUTCQUJ56M6X6dDzEhuvgNH/8rYd7EskkQO4BGwUXfn2XdF5kwJdR1SWauqcONThmjVpKlnmzoAOxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=hl37XPb5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7af6a6f20easo542929b3a.0
        for <linux-next@vger.kernel.org>; Wed, 05 Nov 2025 18:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762396227; x=1763001027; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/89TK+m9dKy6rEAd4V16353CT4rnzIzXr06h3cOtmq4=;
        b=hl37XPb5oqGP3x/MlfXns1XpBDDRW+XZBnsJlHuReeftEMnufucmEq94Nl7G2R/2Wv
         qw4tNpJaTbb13xu9Uu6jnija5/N2NtqmN9mEDqpBhF+qTCIMJjNkA+RNZjYY/DyppWOy
         Z6EWAdm6tfcwfXpo/Xpg/KuDKc6VrmMhmc8vMwK+9YMO/0isSJNtvpaV68jhULeU/noB
         7Njyud6KpQw9/pDSD6VD30O09uGOFWNhvrxZhGUi5W7MPhO3jAhLya7T6HuJVpDMl9Ti
         /iJyTeiwHEWN1Qn5LnqnNCc/9cdqqaCvqefTRboUbUyGxXLdmIluL0P1e4BZtyGEKgaR
         CXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762396227; x=1763001027;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/89TK+m9dKy6rEAd4V16353CT4rnzIzXr06h3cOtmq4=;
        b=g1NSNVb9EcVlDthTsFWHXez48+vbycVgSpXvxJzHvyuTC/CCRcfrRyUzN/80yJqyLR
         Gfx+wmOhhzlp/TpPGNZCcZU1dXCfxDy5sN1Kf5y4t7yOJ/jyiY2A3JQWZPeWZpD+L9AN
         HbnzMaxbEhZnflNbCOusBPYzKX5/Vi01z/4+yCdGhSpHU9424V6TpZpT8Bd1VIsm8kS0
         7eBcGRw6aYD1ULV2ZWL9VDiop4SZi5ZYwWtakefdNowhLtm85c3gH6S/IIES3xwbjFSa
         RP9XGRy0uLzM0yqLoiwASJNSPPZzil3QzIKcMftJD2krHM5q4g9uwDmWhm7WDF+75iu4
         erXA==
X-Gm-Message-State: AOJu0YygKwUxXQVRM4y5cPtHFT0A5sMnwoocYxuEcA4B20eBxn/3HrZi
	PLORFgnhZW4RdkOQuHEMq4Vs5Xc1uprvKkuC14aZbee6NPM51me5Ep/dxOC2AqnU8c6mfPKZlHK
	DE8Cd
X-Gm-Gg: ASbGncvxiCUzny3SKYt2tMVQ7NTm59W8X1JojlVjvIRqnrrjtU/P7dUbB/H64CI6P8V
	GNbBzjdWNRFXH91cRmslUMwc76Ko1on3MQDvR4CIZJm85jPoUJ24mXB5Y0jv4OxnK7gjTtY9mDq
	IicWQCJPmXOz5FxIJfIeKroOS+2HL0EMdW8QuOdCoVll94moRybicwVbIaaixpQHDVbDT8fHOBB
	nQaRXFENl6kf0jS0VWr+d6g9pYP+it5YvBFryNhdYvU6Q54678H4t1SuKQO+rBzidUpKr8Lqkhv
	EOZhebcpWIz8iKvuuZY/RbXIFBQUBw66ihaY4rmRSS7xEdZ5F6tinnRqryhQSwb5Ia63YxWJ2eF
	HBnlrawSuzKfswaqSUufb7ad4fFZRSwHlqLU2ibRcvVZKNdzzXPeuC2Iw7hF6nQTVXu0uaixzY9
	QHLyqV
X-Google-Smtp-Source: AGHT+IGEG/ggOQuj56vUtJLQSlT01bOriczeeG9qMG0k4NrWm7vE+Hghv1OT3wM/nG6OC0VrmCqXtA==
X-Received: by 2002:a05:6a00:3e15:b0:7aa:81fc:a83a with SMTP id d2e1a72fcca58-7ae1cc60757mr7202244b3a.6.1762396227241;
        Wed, 05 Nov 2025 18:30:27 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af82204ecbsm846421b3a.38.2025.11.05.18.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 18:30:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 84d39fb9d529f27d2f3d295430d1be0abdae7a6d
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 06 Nov 2025 02:30:26 -0000
Message-ID: <176239622580.4404.11314453735736345763@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/84d39fb9d529f27d2f3d295430d1be0abdae7a6d/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 84d39fb9d529f27d2f3d295430d1be0abdae7a6d
origin: maestro
test start time: 2025-11-05 06:27:09.766000+00:00

Builds:	   41 ✅   13 ❌    0 ⚠️
Boots: 	   94 ✅   38 ❌    0 ⚠️
Tests: 	10494 ✅ 5759 ❌ 3472 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: hp-x360-14a-cb0001xx-zork
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690af91ff21f07610dcd698a
      history:  > ✅  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:690af900f21f07610dcd67c4
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:690af900f21f07610dcd67fa
      history:  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:690af900f21f07610dcd6847
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:690af900f21f07610dcd67ec
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-cp514-3wh-r0qs-guybrush
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690af91df21f07610dcd6978
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:690af7c8f21f07610dcd64d3
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.iommu
      last run: https://d.kernelci.org/test/maestro:690af91af21f07610dcd6957
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:690af8faf21f07610dcd6761
      history:  > ❌  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:690afb00f21f07610dcd9316
      history:  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:690afa7af21f07610dcd7f7b
      history:  > ✅  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:690afb35f21f07610dcd9bbc
      history:  > ✅  > ❌  > ✅  
            



This branch has 13 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

