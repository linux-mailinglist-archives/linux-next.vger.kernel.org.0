Return-Path: <linux-next+bounces-8384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 576C0B87B98
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 04:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFE511CC1582
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 02:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1F125FA0F;
	Fri, 19 Sep 2025 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="WqSPq1WU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4FC25BEF2
	for <linux-next@vger.kernel.org>; Fri, 19 Sep 2025 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758249019; cv=none; b=mUFU99pu7avTWP9WHY/PqlGy4f/TkctCXgrIjaIWTA43aW2blUMFv6kihtvTLS/x3N6XOY97lK7QJoUsydyQlpWZFCSdr1rBH7xZ5Ysb+nrIlXT3o7s8MCl72z4XPls7T1CieORc3EuZ26cXWfYQ9sMrPY1O9+FeACL5TvRTS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758249019; c=relaxed/simple;
	bh=LyojuV3f6Bx/jfEoRrGn+oYRV3mAEoGDs9bo2BvfFSY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ZXDhsIGL2WoJYTyeQObHLnhfoyEpUmv8E+5C0cDnLKL2LtE0E39bdvjO6PDSbraLBnmNEO8kVIeZ4jQwxW/8afvN6/AHyJIngVVHo0Vxmn8j4pCrJgunmykcItE61cvGV9UmJsLc/LmYjj5F0qSe4RrbaKffrHqfTXDDLHwuwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=WqSPq1WU; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-329a41dc2ebso1247983a91.3
        for <linux-next@vger.kernel.org>; Thu, 18 Sep 2025 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758249017; x=1758853817; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY+vAzNKqVhVC3gSc7Cf82/lIz1g92fk5f25bncxFm0=;
        b=WqSPq1WUYVCD6Pd3Ke+zSmgl5uBqy7C2v8ZKx0uw3bT120PIcQqDzWvZ7zRwixE+hX
         2WX6ICumticQfY990WnroEtotSkQiYx01DI4oavdmgdAx8e8DnojOnt5wvRuMiuqSmGu
         AmMQmBlYwcIwmO2AT2waBbN9wVcAE9Tc+3lswiPvPMnsKRI4Thisrm8DL9YYHWhC3cuf
         fRfePHjvvhfJ1NuX2Ia8cSrtVpPTRLvOpxeVOfy58Kr2k7Ma+Gf15wNgcj0OB2+bsfnv
         bU+QCfRAqj5N3brkTw8OfrQ9Y8bnDQooSoCVpy3fk+f+aXzkGeleY8U3xtLhpWH/PB73
         HzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758249017; x=1758853817;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zY+vAzNKqVhVC3gSc7Cf82/lIz1g92fk5f25bncxFm0=;
        b=duam/yciagXCL4PhvKOl+y6j4Mu5Q70djnfc99vQJaNimYrMf0ecDzZGjDL13qLLRN
         6x03SKFzpOILUOkmvvhk0P/pu8TmYcULxtaJ/MuWl7zzFKyrnfEfIXUya2u3ID5w6qTX
         bwmTJdVHzkIAWsNB5c2b8esvcdRfoVirkE+VyyvY3fYVdUg68z/QoWx6oiB0+jNQye4/
         wwR5+E+H/mAn9lXkBudjehfnXLROrRkI3Hrlmk5QNEcwVtFxOZ7KymLzScC8+UeXJFl2
         bA+W5MqE+maef0Q0RQgcC90hhVG/6sbvSictkEEae/+b0mPSYqO7fFKA11ufg5fSTWRq
         201g==
X-Gm-Message-State: AOJu0YwGyPTSbWJYaVAYj3wpWuyvjAS3IOj3sC2afyF2F7wPPl8hKAp2
	n468snrN16FhhFpWAKomRR0ue/7KcgaRu77ujsbJRaHHqifLVQQlJlsi4bbjjqXsezzarGIP++m
	jhFHTitQ=
X-Gm-Gg: ASbGncuh7e7+IRdBZGpoRqr2VRSSfjD40OSubPtrMUJbxs0Kz7Z5XZBW06EyiVuByh/
	cvvwUNsMdpxeLHS5hEIXRsUJIry3AxaZs0Oxpvj1us+rTT3Z1sDlZm6MjSLKASgziggoj7qOK83
	TWJZ7G205tZ2o2+cFZa+oF41qzayU84gdyjhpt2CmrMFZGGhT9ZY0vAPWoeZIPN+kcuRVuKA27i
	OgFsDbanpzuyRdLf3D9q0FfIIMrsRj6wA7FuQsZNljDg/hdAiueXCHKxE1sTkLfmDom7AR652My
	Syv4BaN2rI6d2riLAQk8VZaKoMti9aC4ra1vs1177Kr6HUn68/9pXOXU6tUNK9Bl1k76Me+QrF3
	Pjr816GG2n2uBl40n
X-Google-Smtp-Source: AGHT+IG9SIcitJ2/1Q6dEnyFA/59Ip+IsTLOLjfX5tu+bqLmTaWrGLcejT4C/tNpkdS1O28AUkiB9g==
X-Received: by 2002:a17:90b:5585:b0:330:84dc:d129 with SMTP id 98e67ed59e1d1-33098387b2bmr1832146a91.36.1758249017216;
        Thu, 18 Sep 2025 19:30:17 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306061ab62sm3896343a91.5.2025.09.18.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:30:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 19 Sep 2025 02:30:15 -0000
Message-ID: <175824901535.273.2991322123085238834@1dfac204f25d>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/8f7f8b1b3f4c613dd886f53f768f82816b41eaa3/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
origin: maestro
test start time: 2025-09-18 17:59:43.453000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  154 ✅   10 ❌    8 ⚠️
Tests: 	11624 ✅  546 ❌ 2999 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68cc5a2475b320799d2e707e
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cc5b9a75b320799d2e7deb
      history:  > ✅  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68cc523f75b320799d2e550d
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68cc52fc75b320799d2e5698
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68cc574175b320799d2e6851
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68cc574175b320799d2e6852
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68cc5a2f75b320799d2e70f1
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68cc5ebb75b320799d2e9925
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68cc4e3875b320799d2e5004
      history:  > ⚠️  > ⚠️  > ⚠️  > ❌  > ⚠️  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68cc589875b320799d2e6b82
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68cc541475b320799d2e5881
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68cc52fa75b320799d2e5692
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68cc52c875b320799d2e5615
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

