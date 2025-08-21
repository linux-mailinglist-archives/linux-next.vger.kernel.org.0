Return-Path: <linux-next+bounces-8051-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE9B2EB3E
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 04:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E3E61CC430E
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 02:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F85246763;
	Thu, 21 Aug 2025 02:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="kuPxOTqU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA4245033
	for <linux-next@vger.kernel.org>; Thu, 21 Aug 2025 02:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755743456; cv=none; b=hT9Zhaa4qiy2yiYXryhjrqvrTVRFP//+Asuru0bWA1O9YZSaEyIkPvNwXxPF4E4eqx5/oAsb7eJdimNTCZhRCtc2Fbg1JcMTA1DLM0AA4lveknVFZ+DA8I+c9pFc2N1t1wr2FlJQ3QAaPsDEWWbfZXH/dVhj/K/8c0d7WWzQOAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755743456; c=relaxed/simple;
	bh=8RgIcrqT8SXuJfc+u5ViCTjbCf8tGjRCeuMJdXlmSAw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=FBCO+R0Xvky3eVH+Lvq+GwG2CT14JXq5gVfpJBG8dEMrfMvPk6e1d5M9ZARUoHGbaMX+quFBHPxmJeklUBsGQX9/OxofJs5213G3h7mrwjJfacO38n9AZZGFL/hh1FDh6QNN+6ouNNcSIUlZHIVM7k9HTOg1TwpyYiiVAElQdMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=kuPxOTqU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-244580536efso3662985ad.1
        for <linux-next@vger.kernel.org>; Wed, 20 Aug 2025 19:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755743452; x=1756348252; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pdJYi1T8cYd9uaW1wxlrSKZjUzzGjySadIIMvmQiGA=;
        b=kuPxOTqU2E7Ijv/rti3ZLARts3S8BtTFt3q+zpLL/kSc18V5CvcWfAyqjXLd1Fc+E5
         MVcZ09Lgq1Ewk+K5zvAO8+p3GoDOoVJhpCfl2Fh2E8/lrQB2qAFSjPpCO7F/EoUhVcY0
         vpP7F/Ae4DLuAI1oytgG6l+DWjwQRt6tDXUdIKq3HAQ0+XW1NyEse/mlzbccgIPs7fZH
         6xyLM06XzFEflmyfbiaQYriwLArcTvT9RRAcG5sXZYYHSkz/FrA/xUUGoogjhjyvcu/R
         6qMS4A9O5275ayijbqFtuDB+ZcLRvW4DgEGKon+stD6EemHO7SB+KTLm+4qJCIuH05R7
         O1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755743452; x=1756348252;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7pdJYi1T8cYd9uaW1wxlrSKZjUzzGjySadIIMvmQiGA=;
        b=s0IiXx8y5B7gYIKuyVpFhlKker/pti3GcfjqnL2tajxFjtF+4eoyDh0McrzjTbndRr
         nGIhTfJB6Jmqj2lIdChGaak//fDkDHSuDrXunBVlLWgP7afu0CgwQrph4i7eipRA0cdG
         cr30q/bCqgvfbGrd/sTYRDozpt0ZYZHl6/7aMl+rz/Xb1+xqnwnQII5oWQ3gdHL04RmF
         gwz1XeW/N4IaGm9+O9IB0fP2xSGNMURzHgK204U/NLa2Corr4InAHnTGpcaxmxGVAKUf
         NbHv9E/EsKD/8Ea0DqkCiXZRdCU4nGQUAXfrFHTQop+wzkQWajZD2bWbv+4QAiQy4CxN
         muMA==
X-Forwarded-Encrypted: i=1; AJvYcCXtiB/fBW79S31tbOWj7K6MRzQMdnqx2jagPPZtMnw4fQ2iJFHqiW7EVMiZzD6RjRXpGvEWUQM90dev@vger.kernel.org
X-Gm-Message-State: AOJu0YxTNVtDmRAGZPr8Aj8z+0OvUdsRcKBi+kBRQR1zbaDhQF64Q89f
	jqwIE0ZJs2XWNaVQM+ZIN9dYHKmWXYuguMrCzMfBinyMCGzAduVIMlf/cRx7/IZYY3HAUZ0Mfej
	PPyu/fFo=
X-Gm-Gg: ASbGnctNCoif15JC/UJqfkho/uZIfdqG4J0NHk52rUXdtjFk4D9jDGTG0Wx/LG5ecV2
	y0tI85/Bi8oes/RjDf45NYX5e5OycFvf4YH5RbEAG0X0ZHCmvsTGwsynpVe9ziCVwvE25slFk8h
	g23SefJul42k+ySJYQa3K09CexJjB/kUbClrgli+WPcsTZ2KgQRX0aXnwJdhqhIlBAP6wzuYxIm
	xnjv/qHJo25VZCSBzCaOUmkhldry/Ug/swruS08KVzCi2kZMCsvwKKVYZdUhmLVgncToaTccOHJ
	FjHYtceqXI6d0iEYc5gqHsKf33QK57i0Gh1VTVl2SGhTIpzTV4tKgc+l+8gIDOTtCRTzd624GVa
	AITh75oFtCevDKeHeN15wXgg6guI=
X-Google-Smtp-Source: AGHT+IHIVEkQvCZHHkfuyxzuko+e3zoa0hlWtE79BUFWRBwl5S+T5Pyjt/AMLmks55cAXkAktAqS4A==
X-Received: by 2002:a17:903:2f0c:b0:240:a53:dd37 with SMTP id d9443c01a7336-245febff389mr11859065ad.21.1755743451584;
        Wed, 20 Aug 2025 19:30:51 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed36b027sm39822165ad.54.2025.08.20.19.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 19:30:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 5303936d609e09665deda94eaedf26a0e5c3a087
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 21 Aug 2025 02:30:50 -0000
Message-ID: <175574345025.117.18188156051426862121@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/5303936d609e09665deda94eaedf26a0e5c3a087/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 5303936d609e09665deda94eaedf26a0e5c3a087
origin: maestro
test start time: 2025-08-20 04:41:35.840000+00:00

Builds:	   58 ✅    2 ❌    0 ⚠️
Boots: 	   76 ✅    6 ❌   63 ⚠️
Tests: 	 5305 ✅  476 ❌ 3050 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2837-rpi-3-b-plus
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55f1e233e484a3fa2a642
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d86233e484a3fa29fb4
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.proc.shardfile-proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56a60233e484a3fa2bce1
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.ptrace.shardfile-ptrace (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56717233e484a3fa2baa5
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d5d233e484a3fa29ea6
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55ef0233e484a3fa2a605
  history:  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.clone3.shardfile-clone3 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56084233e484a3fa2b043
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8186-corsola-steelix-sku131072
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a572e9233e484a3fa2c0db
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8365-genio-350-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d54233e484a3fa29e67
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8390-genio-700-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d54233e484a3fa29e6a
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d55233e484a3fa29e6d
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556bb233e484a3fa28c2c
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a557c3233e484a3fa28f00
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a5579b233e484a3fa28cea
  history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556bb233e484a3fa28c2f
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a557a4233e484a3fa28cf0
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a5584f233e484a3fa28f4d
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5656d233e484a3fa2b741
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55e64233e484a3fa2a11a
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.uevent.shardfile-uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56a4d233e484a3fa2bcd5
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56849233e484a3fa2bb73
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.user_events.shardfile-user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56a4e233e484a3fa2bcdb
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558c1233e484a3fa290f4
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.cpufreq.suspend.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55aaa233e484a3fa29a8d
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d0233e484a3fa2917c
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55990233e484a3fa2939a
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559c8233e484a3fa297a7
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d0233e484a3fa29176
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55995233e484a3fa293ad
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a6a233e484a3fa2992c
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d0233e484a3fa29179
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559df233e484a3fa29817
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5599f233e484a3fa293ba
  history:  > ✅  > ❌  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d1233e484a3fa2917f
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559cd233e484a3fa297bb
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559ab233e484a3fa293e7
  history:  > ✅  > ✅  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d1233e484a3fa29182
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559ea233e484a3fa29854
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559b5233e484a3fa295cd
  history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d1233e484a3fa29185
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559e3233e484a3fa2983a
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a3d233e484a3fa29904
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d2233e484a3fa29188
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559d1233e484a3fa297f2
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a68233e484a3fa29920
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d2233e484a3fa2918b
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559e1233e484a3fa2982d
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a14233e484a3fa298e4
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d5233e484a3fa291a3
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a03233e484a3fa298b8
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559d5233e484a3fa297fa
  history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d2233e484a3fa2918e
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559f3233e484a3fa29869
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55987233e484a3fa2938d
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d3233e484a3fa29191
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55ae6233e484a3fa29b62
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55b37233e484a3fa29b6d
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d3233e484a3fa29194
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a6d233e484a3fa29934
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a83233e484a3fa29a7d
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d6233e484a3fa291af
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a71233e484a3fa29999
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a53233e484a3fa29914
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d4233e484a3fa2919a
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a70233e484a3fa2993a
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a5c233e484a3fa2991a
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d6233e484a3fa291b2
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559ea233e484a3fa2984e
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a0b233e484a3fa298c0
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: hp-x360-14-G1-sona
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d3233e484a3fa29197
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559fc233e484a3fa298a3
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55992233e484a3fa293a0
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d7233e484a3fa291b5
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559e5233e484a3fa29848
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
- kselftest.iommu.shardfile-iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55a69233e484a3fa29926
  history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d67233e484a3fa29ee2
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.acct (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d68233e484a3fa29ee8
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d68233e484a3fa29eeb
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d6c233e484a3fa29f06
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d72233e484a3fa29f2d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d75233e484a3fa29f42
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d82233e484a3fa29f99
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d86233e484a3fa29fb7
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5683b233e484a3fa2bb16
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5683d233e484a3fa2bb22
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56842233e484a3fa2bb43
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56844233e484a3fa2bb4f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.zram (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56849233e484a3fa2bb76
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555f0233e484a3fa28ad9
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555f9233e484a3fa28b0c
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555f9233e484a3fa28b0f
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fb233e484a3fa28b1b
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fc233e484a3fa28b1e
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fc233e484a3fa28b21
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fc233e484a3fa28b24
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fd233e484a3fa28b27
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55600233e484a3fa28b40
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55602233e484a3fa28b4c
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55603233e484a3fa28b4f
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55603233e484a3fa28b52
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55603233e484a3fa28b55
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55604233e484a3fa28b5b
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55604233e484a3fa28b58
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55606233e484a3fa28b64
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55605233e484a3fa28b5e
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55605233e484a3fa28b61
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55606233e484a3fa28b67
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5574e233e484a3fa28cb5
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5574f233e484a3fa28cb8
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5574f233e484a3fa28cbb
  history:  > ❌  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55750233e484a3fa28cbe
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55750233e484a3fa28cc1
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55751233e484a3fa28cc7
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ring-buffer (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55752233e484a3fa28cca
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.rlimits (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55752233e484a3fa28ccd
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.seccomp (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55754233e484a3fa28cd9
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.splce (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55753233e484a3fa28cd0
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.sync (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55753233e484a3fa28cd3
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.timens (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55754233e484a3fa28cd6
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.ublk (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55755233e484a3fa28cdc
  history:  > ❌  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.uevent (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55755233e484a3fa28cdf
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.user_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55756233e484a3fa28ce2
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d5d233e484a3fa29ea3
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d6d233e484a3fa29f0c
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d73233e484a3fa29f33
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d76233e484a3fa29f4a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d7d233e484a3fa29f77
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d84233e484a3fa29fa8
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d88233e484a3fa29fc6
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d87233e484a3fa29fbd
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5683b233e484a3fa2bb13
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5683c233e484a3fa2bb19
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56843233e484a3fa2bb49
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56844233e484a3fa2bb52
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6dl-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555f1233e484a3fa28adc
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fa233e484a3fa28b12
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fe233e484a3fa28b2a
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55601233e484a3fa28b43
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: imx6q-sabrelite
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555ea233e484a3fa28ab5
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- ltp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55608233e484a3fa28b76
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclicdeadline (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55877233e484a3fa28f56
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55878233e484a3fa28f59
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55878233e484a3fa28f5c
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55879233e484a3fa28f5f
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5587a233e484a3fa28f62
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5587b233e484a3fa28f78
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5587c233e484a3fa29009
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5587a233e484a3fa28f75
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5587c233e484a3fa2900c
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5587d233e484a3fa2900f
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5587e233e484a3fa29012
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: imx6q-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555f1233e484a3fa28adf
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fa233e484a3fa28b15
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fe233e484a3fa28b2d
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a55601233e484a3fa28b46
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
Hardware: imx8mp-evk
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d69233e484a3fa29ef1
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d6e233e484a3fa29f0f
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d77233e484a3fa29f4d
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d7d233e484a3fa29f7b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5683e233e484a3fa2bb28
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56840233e484a3fa2bb37
  history:  > ❌  > ⚠️  > ❌  > ❌  > ⚠️  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d5d233e484a3fa29ea9
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d6a233e484a3fa29ef4
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d6e233e484a3fa29f12
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d77233e484a3fa29f50
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d7e233e484a3fa29f7e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5683f233e484a3fa2bb2b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56841233e484a3fa2bb3a
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d5f233e484a3fa29eb2
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d6a233e484a3fa29ef7
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d70233e484a3fa29f1b
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d78233e484a3fa29f59
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d7f233e484a3fa29f87
  history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d61233e484a3fa29ec4
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d6a233e484a3fa29efa
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d5f233e484a3fa29eb8
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d70233e484a3fa29f21
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d79233e484a3fa29f5f
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d80233e484a3fa29f8d
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5683f233e484a3fa2bb31
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a572e9233e484a3fa2c0d8
  history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b2233e484a3fa28be8
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b4233e484a3fa28bfc
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b6233e484a3fa28c0e
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556af233e484a3fa28bd6
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b9233e484a3fa28c20
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55aac233e484a3fa29a95
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55aaf233e484a3fa29aa7
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab2233e484a3fa29ab9
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab4233e484a3fa29acb
  history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab7233e484a3fa29add
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55abc233e484a3fa29b01
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55abe233e484a3fa29b15
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab9233e484a3fa29aef
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac1233e484a3fa29b27
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac3233e484a3fa29b39
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac6233e484a3fa29b4b
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: mt8186-corsola-steelix-sku131072
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c2233e484a3fa28c59
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c4233e484a3fa28c65
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c6233e484a3fa28c71
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c7233e484a3fa28c7a
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b2233e484a3fa28beb
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b4233e484a3fa28bff
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b7233e484a3fa28c11
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b0233e484a3fa28bd9
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b9233e484a3fa28c23
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556ad233e484a3fa28bc7
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556bc233e484a3fa28c35
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556bf233e484a3fa28c47
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55aad233e484a3fa29a98
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab0233e484a3fa29aaa
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab2233e484a3fa29abc
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab4233e484a3fa29ace
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab7233e484a3fa29ae0
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55abc233e484a3fa29b04
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55abe233e484a3fa29b18
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab9233e484a3fa29af2
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac1233e484a3fa29b2a
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac3233e484a3fa29b3c
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac6233e484a3fa29b4e
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68a572ea233e484a3fa2c0e1
  history:  > ✅  > ✅  > ✅  > ⚠️  > ❌  
            
- fluster.debian.v4l2.gstreamer_av1 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c0233e484a3fa28c50
  history:  > ❌  > ⚠️  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_av1_chromium (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c1233e484a3fa28c53
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c3233e484a3fa28c5f
  history:  > ❌  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c5233e484a3fa28c6b
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c6233e484a3fa28c6e
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c7233e484a3fa28c77
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c8233e484a3fa28c80
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b3233e484a3fa28bf3
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b5233e484a3fa28c05
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b8233e484a3fa28c17
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.devices-probe (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b0233e484a3fa28bdf
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556ba233e484a3fa28c29
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556ae233e484a3fa28bcd
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556bd233e484a3fa28c3b
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556c0233e484a3fa28c4d
  history:  > ⚠️  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55aae233e484a3fa29a9e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab0233e484a3fa29ab0
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab3233e484a3fa29ac2
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab5233e484a3fa29ad4
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ab8233e484a3fa29ae6
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55abd233e484a3fa29b0a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55abf233e484a3fa29b1e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55aba233e484a3fa29af8
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac2233e484a3fa29b30
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac4233e484a3fa29b42
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac7233e484a3fa29b54
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8365-genio-350-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56152233e484a3fa2b17e
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56156233e484a3fa2b199
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5615a233e484a3fa2b1b4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5615e233e484a3fa2b1cf
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56169233e484a3fa2b24b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56165233e484a3fa2b230
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8390-genio-700-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d89233e484a3fa29fcc
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d8a233e484a3fa29fd2
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d7b233e484a3fa29f6b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d82233e484a3fa29f9c
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56153233e484a3fa2b181
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56156233e484a3fa2b19c
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5615a233e484a3fa2b1b7
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5615e233e484a3fa2b1d2
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56162233e484a3fa2b1f9
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5616a233e484a3fa2b24e
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5616e233e484a3fa2b26c
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56166233e484a3fa2b233
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56171233e484a3fa2b28d
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56175233e484a3fa2b2a8
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56179233e484a3fa2b2cd
  history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: mt8395-genio-1200-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d8a233e484a3fa29fcf
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d7b233e484a3fa29f6e
  history:  > ❌  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d83233e484a3fa29f9f
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56153233e484a3fa2b184
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56157233e484a3fa2b19f
  history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5615b233e484a3fa2b1ba
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5615f233e484a3fa2b1d5
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56162233e484a3fa2b1fc
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5616a233e484a3fa2b251
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5616e233e484a3fa2b26f
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56166233e484a3fa2b236
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56172233e484a3fa2b290
  history:  > ✅  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56175233e484a3fa2b2ab
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56179233e484a3fa2b2d0
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558e1233e484a3fa2920d
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: rk3288-rock2-square
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555ec233e484a3fa28abb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56153233e484a3fa2b187
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5615f233e484a3fa2b1d8
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56172233e484a3fa2b293
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a5617a233e484a3fa2b2d3
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: rk3399-rock-pi-4b
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56154233e484a3fa2b18a
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a56158233e484a3fa2b1a5
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d63233e484a3fa29eca
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d71233e484a3fa29f24
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d81233e484a3fa29f90
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d63233e484a3fa29ecd
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556cb233e484a3fa28c8f
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556cd233e484a3fa28c95
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556b3233e484a3fa28bf6
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556bd233e484a3fa28c3e
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68a55ac2233e484a3fa29b33
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sc7180-trogdor-lazor-limozeen
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68a556ce233e484a3fa28c98
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555f2233e484a3fa28ae2
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fb233e484a3fa28b18
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68a555fe233e484a3fa28b30
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a5574d233e484a3fa28cb2
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d60233e484a3fa29ebe
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56840233e484a3fa2bb34
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d81233e484a3fa29f96
  history:  > ⚠️  > ❌  > ✅  > ❌  > ❌  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56844233e484a3fa2bb55
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a56849233e484a3fa2bb70
  history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a55d65233e484a3fa29ed9
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558b1233e484a3fa29070
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558b9233e484a3fa290b2
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
- rt-tests.cyclicdeadline (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d19233e484a3fa29d52
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d1f233e484a3fa29d82
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d30233e484a3fa29e16
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d36233e484a3fa29e46
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d7233e484a3fa291bf
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ❌  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d1f233e484a3fa29d85
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d8233e484a3fa291c5
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558d8233e484a3fa291c8
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: acer-R721T-grunt
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d1d233e484a3fa29d70
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d25233e484a3fa29db8
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558c2233e484a3fa29103
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558c5233e484a3fa2911b
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558dc233e484a3fa291e9
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558c3233e484a3fa29106
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558bc233e484a3fa290ca
  history:  > ✅  > ❌  > ⚠️  > ✅  > ✅  
            
- kselftest.cpufreq.hibernate.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a559f5233e484a3fa29885
  history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d34233e484a3fa29e3a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.cpufreq (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558b7233e484a3fa290a3
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558bf233e484a3fa290e5
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d38233e484a3fa29e55
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d21233e484a3fa29d97
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d39233e484a3fa29e5b
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558bf233e484a3fa290e8
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558c7233e484a3fa2912a
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68a558c4233e484a3fa2910f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68a55d32233e484a3fa29e28
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

