Return-Path: <linux-next+bounces-8578-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50969BC7329
	for <lists+linux-next@lfdr.de>; Thu, 09 Oct 2025 04:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CFC619E3547
	for <lists+linux-next@lfdr.de>; Thu,  9 Oct 2025 02:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6A47E0E8;
	Thu,  9 Oct 2025 02:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="TmwPVduw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A47910957
	for <linux-next@vger.kernel.org>; Thu,  9 Oct 2025 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759977020; cv=none; b=LzahTtcSQiR8/+j2EeVgxUZcqBGHMqHwb4K4yJ2zwtLsXKOcd8Gv/NTVb1Fo74Ghnqf1qpRbDKOD25PMo1hD21ikM5aB72Zo5ZStz3quEpsF1jXZI0XHOjgzTUEC2E/Z3pd7LB2V08QuDEtDl7c4GBMIublCRQ33ozXBejzEhms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759977020; c=relaxed/simple;
	bh=lsFP7b4NpOL/Y3pwuHeqY6Nw1wYoSFBr5Z8gcJJ82Mo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=REgWhYi5apiT5aKuR1yUDq0LNF0dxi6s53T2Pt7/PUKVl8PC5O2Ki8meHFWRPsErSvF26QsYTsVt0m7xPhoXwjwVxiXXo+j+HG4eSDwaiByqTVzNLNHYw7UiDsa9hVI/zNAIZNQ8RVtDtW2MR0nYcoxvC9v+KNpUlMeuPF+t7Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=TmwPVduw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27d2c35c459so3203755ad.0
        for <linux-next@vger.kernel.org>; Wed, 08 Oct 2025 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759977018; x=1760581818; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDUBVvCugQ+UmoEPV0dh96cg8e7GnagSEEEhb7+YoHM=;
        b=TmwPVduwgxwV0/Dm9Q389Bv0HVFhwvrFAsYunZJCRFXcbfY5NDH+cKVR4akadpvOvR
         ZBi+EPdw5Y10ShhkQKrfUkzKLcH1bU4Ywpma/b5BFyfA20ocmct19gy14bFrkwtlhVyN
         uZNPDN1X8tAgUDH8ERfr8ZA1wG1auQbAZe7CvlOun1ena1s2R7WPbLiOBgckQYLZ8MuR
         +gONJsqhD+apLSlHn9uETKVUYulgE5YNREaN2x6fp3t2Crvw+cIG58TJ3nsc9pduK8cx
         RlCMgDb7OCqsiXdQbQsFlFrzLjMfUXwH2V88WeZEdOpsC/AyJQIi/bkt5GQYd6L58Vhy
         kauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759977018; x=1760581818;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yDUBVvCugQ+UmoEPV0dh96cg8e7GnagSEEEhb7+YoHM=;
        b=UZ+CEvP3Ahohxu22Y2IHXQUxALsHuExL47u5K8GvZqJy0XVmX/CNWpin6mNPvGOA/b
         lOUH2+aH/YpX1q8f7XS+KpZvHSRge456H2S3x/HjpL+T/ReqNG9mYOXrJcRhmQDSl/lo
         ePoamc/4Js1IFC+BRPT2C1zQCxHQXe2LFIcmYRKbe/Eqw8T2+166atBsGJeN/s0cTB84
         y2S7jcBZ2+h9jDtoZPL+9Tfm7hdQjuuc9Gvf9WkSsNUomfHSYJjusu+lV19bwkzmMDl0
         GI5SHbuUM3E/6QYZTqgiOD4MYPGOKTGz2sieYNAYzsaqWfEWC8Pe3i3DIHHWvcjYVaX6
         ElZw==
X-Gm-Message-State: AOJu0Yy0cXtYe5+/eL3gLKKfpRKhml3/f+prSZaJuW7yBxPpvE6SKlOu
	PoqmIvj81BX7O+ktDWaXhW5opCDXaC21uSkhytTOXvpSB70NJVqeo9Z+KX9Qni10qdFgvlBozza
	APKqt
X-Gm-Gg: ASbGnctc7UjgGV2kv/5JouB0c9Wz6qk0ISdUgk/B2E/NbLuFLqaS99VefbURfz2pfAv
	iWAWzPGHmLdFs+PgoLTfF+t995pULOIbUMRnJQgLIK3rQ7E6w5l9o1D0Dwt7CUbN7V5p2HqiAR9
	b78pWyIr+Rku5Seo5zm3xFhWkTmSToPytP3nAoWJC7GVwZhoJs20qSRWJiOlqxv0Tgg+aPkVtlB
	tmHipmq4kktboVIBmXRi2aJ3HluCNx39oQy9duyK0VRLsq0dPHS+LXiBAtKdqpBe9oSWxKf5fzD
	mosuNCCB1SHBCrAUZiJ5ITVQAmeqjj1AkUBjuLLmmDbWMh8FMZk8gt+1+0dJJ7Q2SdphSWRPAJJ
	loC+YhxBPUUm92QZzjmRuSzATomWOUFnarWCiEhRM
X-Google-Smtp-Source: AGHT+IESjv6yZa7Hp2eI4rjod+/hTEyU6PjywqMdrpT9b28QaH8IYWJXQwIT53DPGLjR3Tqtrqamzg==
X-Received: by 2002:a17:903:247:b0:264:a34c:c6d with SMTP id d9443c01a7336-29027344965mr68093835ad.37.1759977017789;
        Wed, 08 Oct 2025 19:30:17 -0700 (PDT)
Received: from d76c3c94e839 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f95bd3sm11309645ad.119.2025.10.08.19.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 19:30:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 09 Oct 2025 02:30:16 -0000
Message-ID: <175997701656.1152.9949551952359337750@d76c3c94e839>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/7c3ba4249a3604477ea9c077e10089ba7ddcaa03/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
origin: maestro
test start time: 2025-10-08 12:20:19.272000+00:00

Builds:	   60 ✅    0 ❌    0 ⚠️
Boots: 	  168 ✅   13 ❌    5 ⚠️
Tests: 	13690 ✅  556 ❌ 4257 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68e67a629512ca5274592c49
      history:  > ✅  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68e67c219512ca52745941be
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:68e674119512ca5274591b67
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_23
      last run: https://d.kernelci.org/test/maestro:68e674119512ca5274591bc6
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_24
      last run: https://d.kernelci.org/test/maestro:68e674119512ca5274591bcd
      history:  > ✅  > ❌  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.tpm2
      last run: https://d.kernelci.org/test/maestro:68e67c489512ca527459421d
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e663479512ca527458bea5
      history:  > ✅  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e672a59512ca5274591425
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_21
      last run: https://d.kernelci.org/test/maestro:68e674119512ca5274591bb3
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:68e674119512ca5274591bbf
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:68e674119512ca5274591b60
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68e67c3c9512ca52745941e1
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68e6713e9512ca527459114c
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68e663429512ca527458be8f
      history:  > ❌  > ✅  > ✅  > ❌  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: defconfig+kcidebug+x86-board
    - Architecture/compiler: i386/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68e65cc69512ca527458b36b
      history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ❌  
            
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68e67a6b9512ca5274592ca6
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68e67c189512ca52745941b6
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68e6713f9512ca5274591152
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_12
      last run: https://d.kernelci.org/test/maestro:68e674119512ca5274591b75
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68e660799512ca527458b805
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68e663a19512ca527458c082
      history:  > ❌  > ✅  > ❌  > ❌  > ✅  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68e6636d9512ca527458bfeb
      history:  > ❌  > ✅  > ❌  
            
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.kvm
      last run: https://d.kernelci.org/test/maestro:68e67c3d9512ca52745941e4
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+arm64-chromebook+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.ipc
      last run: https://d.kernelci.org/test/maestro:68e67c3a9512ca52745941d2
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.uevent
      last run: https://d.kernelci.org/test/maestro:68e67c4a9512ca5274594223
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68e67d619512ca5274594630
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering
      last run: https://d.kernelci.org/test/maestro:68e67d619512ca5274594631
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

