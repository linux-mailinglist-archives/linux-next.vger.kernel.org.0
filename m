Return-Path: <linux-next+bounces-8110-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976FB377BF
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 04:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 332867AEA02
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 02:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBF8182B7;
	Wed, 27 Aug 2025 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vmCS59Fm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE112741B0
	for <linux-next@vger.kernel.org>; Wed, 27 Aug 2025 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756261825; cv=none; b=TLb10QgK2OJzKN5iqpPDs0DuDv+Sz3urC+E3iOSMj49TaKCLVhBaabHyRU8FFLCx2yPT7hu0fV+zmC/BJNBKERTmYjzQkb4xbhoZGsc/rX2KxqdT3kav2fW1PnjsoATKjTdYi0wfewvuEze2bNUy2lYlGgPQD/Cp8ZoM4nDMgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756261825; c=relaxed/simple;
	bh=09lwzkoBu2ZCHkMR2x0Hx3tbAV9nDTIXnf3hfh7kklM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=XC5s2crGhr0ZLGjWWcAnSa4S82WxPxbtWVE5yK03mzBaYQFKzx9WrQBEPv6C6gMUGlTnPSCIJnSY2tEtWPpCKh3Y/eMa5t6JXLmomcIhIONGA2t1+eY7XfDuOW8v2l7+cgLraXhw2eHAq4bYpvxKIA+o1YeKNPNr1A3bERnZNHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=vmCS59Fm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-244580523a0so62464245ad.1
        for <linux-next@vger.kernel.org>; Tue, 26 Aug 2025 19:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1756261817; x=1756866617; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQlqJ1GzLyeV/i75EoKpDP2Gd8q0OoD5KtGDMo9wQQ8=;
        b=vmCS59Fmuzk7aFBSU5M5x2xVN1Be8zAJVXqB/IeRv+yIymcXOdtcEKH8C79/nm2wiw
         JZiE2V30R6lUXDmSb3DW5vlVGQscCCln5L1uG9aKfHpoHghaXjr13/co+a74ODHyumJh
         PQ3e5YzLQxaIAXY4XyoWeVRtp7zCLYdM/jHnJ3jGVvW4vlJb0qo8rzCqly2RjtARBOIn
         AtjBxgkVxVcyMdz9v60UCB+bosvGritmznFeaovFwECnVQBU/ac/onrzYp4cBDgoaOou
         9LY39iVstmULoZ2pIvImRVG/AV66+fT42XNwaml/s9J7fcGpF0KTx9HFTG90ytOwHqXk
         XYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756261817; x=1756866617;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQlqJ1GzLyeV/i75EoKpDP2Gd8q0OoD5KtGDMo9wQQ8=;
        b=P+1bG7sW6TTcVBQkbaxeMWdK2rxzRxEOwG9klHac/wrMsvk2UXq4fukOPX1T/cY4o6
         UyA0dtRXLioY2eJsQNZtBNgIbutK0dV5GSyHKfL2wvVQf743qg3gc520r+dZnwNa3qTO
         +6k2yxLmto35SOVCiavfvL2kUUzYE99htfRsv3c/w0yUEMXzopi3gLKgomxiiUwV5FZ8
         OR1xY4YJ3/o4H86hUfK8V/NC3dTa2FLvCH0yOkanijNrz2FRlHqbANqG51RwfWa+XlTt
         63qUgZifLvoFuP3ohO9V7M4QwLB2RPShAjpfBcV6q5HWUU5Ud9iTwRjTmokmUSm1sMlr
         7cAg==
X-Forwarded-Encrypted: i=1; AJvYcCVF0f6d1G6v776V4hkNAXPunjKT685gpwROLm+78BN9Dc6rU5dTGduLsOEASWqrxRbaLuRDbw2JY3dt@vger.kernel.org
X-Gm-Message-State: AOJu0YxW0pOeT2ITxvf3JPZZfyQiKbEB5eCICcCJLbhwCnXo/jNbDPSJ
	U09lkDiQ14YC/eodiug1X71625jhVRoOLnmdIbYuaidePm4MIZyiSrkYqMGS/DaXp3+D30tnG26
	pgzQj
X-Gm-Gg: ASbGncvKBOL0zKZBJBDsgjM05hLrx1QlebQTZ2r2j4ih+aRdljnOWIIWBFT8ctJq4aO
	aIYFpWvjAmVKw897+Vwkhk25VuLYSvTOGoKDjXYPDV9og4QGt2PwCUB7CvACEdoWbBG9LmlqLup
	zoxJrmZNAkT4OmfXC2tYLpNCQ3BsI7VcnbjdAGLgPGXJzMXBj55R+qSdRTe834peP6bXfKxiCzq
	QQmYJphIgVjXsg3hlE9ZhWfpjg80ZTXGL5IM3wMYotflG1SwCE15mbeu5YIBdmSxYokURjAtLGu
	V3SxKBdGX17wksokJCPPHcGl1UDd7DpVMiYlQbRGAOwHoZ2k9RldQUmi0cAUebN5qzLljz5KAT4
	cD9bVBRK8TS++0O8/
X-Google-Smtp-Source: AGHT+IElJ+FUSBjd9y/e7Sycb/T95NZ3p2798hwXzZ632TLti/kqkecvw+LDj/Q+DTQTFNvMxejwgw==
X-Received: by 2002:a17:902:d551:b0:246:b190:d9e2 with SMTP id d9443c01a7336-246b190e03dmr135690785ad.28.1756261816794;
        Tue, 26 Aug 2025 19:30:16 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24896f9e7e7sm5613465ad.130.2025.08.26.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 19:30:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - d0630b758e593506126e8eda6c3d56097d1847c5
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 27 Aug 2025 02:30:15 -0000
Message-ID: <175626181544.1032.15042874042395272772@16ad3c994827>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/d0630b758e593506126e8eda6c3d56097d1847c5/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: d0630b758e593506126e8eda6c3d56097d1847c5
origin: maestro
test start time: 2025-08-26 09:40:56.917000+00:00

Builds:	   54 ✅    6 ❌    0 ⚠️
Boots: 	   99 ✅    8 ❌   73 ⚠️
Tests: 	10926 ✅  295 ❌ 4768 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8f76eecc04770cdf021a
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8f45eecc04770cdf00e4
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.cpufreq.suspend.cpufreq_main_sh (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8ee1eecc04770cdef950
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8ee7eecc04770cdefa31
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8ddfeecc04770cdef0cb
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8f25eecc04770cdefc94
  history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8ee0eecc04770cdef93e
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8ebbeecc04770cdef6f9
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8f3ceecc04770cdeff44
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8edaeecc04770cdef863
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8f16eecc04770cdefba5
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: bcm2711-rpi-4-b
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ae2b5deecc04770ce01952
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90feeecc04770cdf07de
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.lsm.shardfile-lsm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ae31c5eecc04770ce01d77
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: bcm2837-rpi-3-b-plus
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9269eecc04770cdf0fe7
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90cbeecc04770cdf0744
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.proc.shardfile-proc (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9ac5eecc04770cdf31e3
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.ptrace.shardfile-ptrace (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9a39eecc04770cdf31b5
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8f36eecc04770cdefe7e
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de1eecc04770cdef0dd
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9048eecc04770cdf054c
  history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8fd8eecc04770cdf0349
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad955aeecc04770cdf2aa6
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9482eecc04770cdf2517
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8f2deecc04770cdefd89
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: hp-x360-14-G1-sona
- kselftest.exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de1eecc04770cdef0e3
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad902deecc04770cdf0470
  history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a1eecc04770cdf061d
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.exec.shardfile-exec (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8f45eecc04770cdf000b
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad927beecc04770cdf107c
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.clone3.shardfile-clone3 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad954ceecc04770cdf294a
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sun50i-a64-pine64-plus
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad931deecc04770cdf151a
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.alsa.shardfile-alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad91b5eecc04770cdf0982
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9105eecc04770cdf081e
  history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
- kselftest.uevent.shardfile-uevent (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad940deecc04770cdf1fc7
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad940deecc04770cdf1fc5
  history:  > ❌  > ❌  > ❌  > ✅  
            
- kselftest.uevent.uevent_uevent_filtering_global_uevent_filtering (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad940deecc04770cdf1fc6
  history:  > ❌  > ❌  > ❌  > ✅  
            
- kselftest.user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9105eecc04770cdf0821
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.user_events.shardfile-user_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad944ceecc04770cdf2187
  history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-cb317-1h-c3z6-dedede
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de5eecc04770cdef10a
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8bdeeecc04770cdee9cb
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8bedeecc04770cdeea73
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8bf0eecc04770cdeea8e
  history:  > ✅  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: acer-cbv514-1h-34uz-brya
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de5eecc04770cdef10d
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8bdaeecc04770cdee9b6
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8bdeeecc04770cdee9ce
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de6eecc04770cdef110
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: acer-cp514-2h-1130g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de6eecc04770cdef113
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: acer-cp514-2h-1160g7-volteer
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de6eecc04770cdef116
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: acer-R721T-grunt
- rt-tests.pmqtest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8be1eecc04770cdee9e9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8beeeecc04770cdeea79
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: asus-C433TA-AJ0005-rammus
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de6eecc04770cdef119
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: asus-C436FA-Flip-hatch
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de7eecc04770cdef11c
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: asus-C523NA-A20057-coral
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8dd3eecc04770cdef053
  history:  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de7eecc04770cdef11f
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: asus-CM1400CXA-dalboz
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de9eecc04770cdef137
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90aceecc04770cdf066a
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90faeecc04770cdf07bd
  history:  > ❌  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.landlock (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90feeecc04770cdf07db
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9100eecc04770cdf07ea
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: beaglebone-black
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8765eecc04770cdeddf9
  history:  > ⚠️  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.acct (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8773eecc04770cdede34
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8774eecc04770cdede37
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8777eecc04770cdede44
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.capabilities (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8778eecc04770cdede47
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.clone3 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8778eecc04770cdede4a
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.coredump (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8779eecc04770cdede4d
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad877aeecc04770cdede50
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.dt (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8780eecc04770cdede72
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.fchmodat2 (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8783eecc04770cdede7e
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.futex (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8783eecc04770cdede81
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.kcmp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8784eecc04770cdede84
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.mqueue (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8785eecc04770cdede87
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.proc (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8786eecc04770cdede8d
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.ptrace (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8785eecc04770cdede8a
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.signal (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8788eecc04770cdede96
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.timers (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8787eecc04770cdede90
  history:  > ⚠️  > ⚠️  > ❌  > ⚠️  > ⚠️  
            
- kselftest.tmpfs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8788eecc04770cdede93
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.vdso (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8789eecc04770cdede99
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.gpio (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85b4eecc04770cdedbb5
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ipc (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85b6eecc04770cdedbb8
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.landlock (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85b8eecc04770cdedbbb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.lsm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85baeecc04770cdedbbe
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.memfd (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85bbeecc04770cdedbc1
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85c0eecc04770cdedbc7
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a1eecc04770cdf061a
  history:  > ⚠️  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b4eecc04770cdf0694
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.breakpoints (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90baeecc04770cdf06bb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90bceecc04770cdf06d3
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c3eecc04770cdf0706
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.futex (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90caeecc04770cdf0738
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.signal (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90ceeecc04770cdf0756
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.timers (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90cdeecc04770cdf074d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.efivars (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90f8eecc04770cdf07a7
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90f9eecc04770cdf07ad
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90ffeecc04770cdf07e4
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9101eecc04770cdf07ed
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: dell-latitude-5300-8145U-arcada
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de7eecc04770cdef122
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: dell-latitude-5400-4305U-sarien
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de8eecc04770cdef125
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: dell-latitude-5400-8665U-sarien
- kselftest.cpufreq.hibernate (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8dcdeecc04770cdef01a
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de8eecc04770cdef128
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: hp-14b-na0052xx-zork
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8deaeecc04770cdef143
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: hp-x360-12b-ca0010nr-n4020-octopus
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de8eecc04770cdef12e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8be0eecc04770cdee9e0
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8bedeecc04770cdeea70
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8bf0eecc04770cdeea8b
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: hp-x360-14a-cb0001xx-zork
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8dd7eecc04770cdef07a
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8debeecc04770cdef146
  history:  > ❌  > ⚠️  > ❌  > ❌  > ⚠️  
            
Hardware: hp-x360-14-G1-sona
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8dd4eecc04770cdef05f
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8ddbeecc04770cdef0a1
  history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8de8eecc04770cdef12b
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt+x86-board)
  last run: https://d.kernelci.org/test/maestro:68ad8befeecc04770cdeea88
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: imx6dl-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8766eecc04770cdeddfc
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8774eecc04770cdede3b
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad877beecc04770cdede53
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx6q-sabrelite
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad875deecc04770cdeddd1
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- ltp (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad878ceecc04770cdedeb2
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.cyclicdeadline (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86eeeecc04770cdedd8c
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.cyclictest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86f1eecc04770cdedd8f
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86f2eecc04770cdedd92
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.pmqtest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86f3eecc04770cdedd95
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.ptsematest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86f4eecc04770cdedd98
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.rtla-osnoise (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86f7eecc04770cdedd9e
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.rtla-timerlat (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86f9eecc04770cdedda1
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.rt-migrate-test (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86f6eecc04770cdedd9b
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.signaltest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86faeecc04770cdedda4
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.sigwaittest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86fbeecc04770cdeddab
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- rt-tests.svsematest (multi_v7_defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad86fceecc04770cdeddae
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8767eecc04770cdeddff
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8775eecc04770cdede3e
  history:  > ⚠️  > ❌  > ⚠️  > ❌  > ❌  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad877ceecc04770cdede56
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-evk
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90aeeecc04770cdf0679
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b4eecc04770cdf0697
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90bdeecc04770cdf06d6
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c3eecc04770cdf0709
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90fbeecc04770cdf07c3
  history:  > ⚠️  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90fdeecc04770cdf07d2
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a1eecc04770cdf0620
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90afeecc04770cdf067c
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b4eecc04770cdf069a
  history:  > ⚠️  > ✅  > ✅  > ✅  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90bdeecc04770cdf06d9
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90fbeecc04770cdf07c6
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.pkvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90fdeecc04770cdf07d5
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
Hardware: lenovo-TPad-C13-Yoga-zork
- kselftest.cpufreq.suspend (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8dd7eecc04770cdef07d
  history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.iommu (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8debeecc04770cdef149
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a3eecc04770cdf0629
  history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b0eecc04770cdf067f
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b6eecc04770cdf06a3
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ✅  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90beeecc04770cdf06e2
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c5eecc04770cdf0715
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: meson-gxl-s905x-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a6eecc04770cdf063b
  history:  > ⚠️  > ✅  > ⚠️  > ✅  > ⚠️  
            
- kselftest.capabilities (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90baeecc04770cdf06c1
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c6eecc04770cdf0718
  history:  > ❌  > ⚠️  > ❌  > ❌  > ❌  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a4eecc04770cdf062f
  history:  > ⚠️  > ✅  > ✅  > ⚠️  > ✅  
            
- kselftest.alsa (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b1eecc04770cdf0685
  history:  > ⚠️  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b7eecc04770cdf06a9
  history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68adadb3eecc04770cdf51f6
  history:  > ⚠️  > ❌  > ❌  > ❌  > ❌  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c6eecc04770cdf071b
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ❌  
            
- kselftest.kvm (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90fceecc04770cdf07cc
  history:  > ❌  > ⚠️  > ⚠️  > ❌  > ❌  
            
Hardware: mt8186-corsola-steelix-sku131072
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68ad8874eecc04770cdee02d
  history:  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9405eecc04770cdf1f82
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad940aeecc04770cdf1fa9
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8195-cherry-tomato-r2
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad868feecc04770cdedc6d
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8365-genio-350-evk
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a1deecc04770cdee339
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a21eecc04770cdee354
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a24eecc04770cdee36f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a29eecc04770cdee38a
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a34eecc04770cdee405
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a38eecc04770cdee420
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a3beecc04770cdee43b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: mt8395-genio-1200-evk
- kselftest.cpufreq (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90cfeecc04770cdf075f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c8eecc04770cdf072f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a1eeecc04770cdee33f
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a25eecc04770cdee375
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a29eecc04770cdee390
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a39eecc04770cdee426
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a3ceecc04770cdee441
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: qemu
- boot (x86_64_defconfig+lab-setup+x86-board+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad8deceecc04770cdef152
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
Hardware: rk3399-gru-kevin
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a1feecc04770cdee342
  history:  > ⚠️  > ✅  > ✅  > ✅  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a26eecc04770cdee378
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a40eecc04770cdee45f
  history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a8eecc04770cdf0641
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b7eecc04770cdf06ac
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c0eecc04770cdf06eb
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c6eecc04770cdf0720
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a8eecc04770cdf0644
  history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a1feecc04770cdee348
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a23eecc04770cdee363
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a27eecc04770cdee37e
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a2beecc04770cdee3af
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a2feecc04770cdee3cb
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a36eecc04770cdee414
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a3aeecc04770cdee42f
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a33eecc04770cdee3f9
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.signaltest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a3deecc04770cdee44a
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a40eecc04770cdee465
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a44eecc04770cdee480
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-kingoftown
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86c4eecc04770cdedd1f
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86c6eecc04770cdedd25
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86c8eecc04770cdedd2b
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86cbeecc04770cdedd31
  history:  > ⚠️  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86cdeecc04770cdedd38
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad868beecc04770cdedc5e
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad868feecc04770cdedc71
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad8694eecc04770cdedc83
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad869beecc04770cdedc95
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad8688eecc04770cdedc4c
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86a0eecc04770cdedca9
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86a6eecc04770cdedcbb
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93f4eecc04770cdf1edc
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93f6eecc04770cdf1eee
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93f8eecc04770cdf1f06
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93faeecc04770cdf1f18
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93fceecc04770cdf1f2a
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9401eecc04770cdf1f67
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9404eecc04770cdf1f79
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93ffeecc04770cdf1f3c
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9406eecc04770cdf1f8b
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9408eecc04770cdf1fa0
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad940beecc04770cdf1fb2
  history:  > ✅  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: sc7180-trogdor-lazor-limozeen
- boot (defconfig+arm64-chromebook+kcidebug+lab-setup)
  last run: https://d.kernelci.org/test/maestro:68ad8877eecc04770cdee039
  history:  > ✅  > ✅  > ❌  > ✅  
            
- fluster.debian.v4l2.gstreamer_h264 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86c5eecc04770cdedd22
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h264_frext (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86c7eecc04770cdedd28
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_h265 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86caeecc04770cdedd2e
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp8 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86cceecc04770cdedd35
  history:  > ❌  > ❌  > ❌  > ❌  > ⚠️  
            
- fluster.debian.v4l2.gstreamer_vp9 (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86ceeecc04770cdedd3b
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad868ceecc04770cdedc61
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.hibernate (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad8691eecc04770cdedc74
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.cpufreq.suspend (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad8695eecc04770cdedc86
  history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.dmabuf-heaps (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad869ceecc04770cdedc98
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.dt (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad8688eecc04770cdedc4f
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.exec (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86a1eecc04770cdedcac
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.iommu (defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y)
  last run: https://d.kernelci.org/test/maestro:68ad86a7eecc04770cdedcbe
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- rt-tests.cyclicdeadline (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93f4eecc04770cdf1edf
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93f6eecc04770cdf1ef1
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pi-params (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93f8eecc04770cdf1f09
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.pmqtest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93fbeecc04770cdf1f1b
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.ptsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93fdeecc04770cdf1f2d
  history:  > ✅  > ⚠️  > ✅  > ⚠️  
            
- rt-tests.rtla-osnoise (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9402eecc04770cdf1f6a
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
- rt-tests.rtla-timerlat (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9404eecc04770cdf1f7c
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.rt-migrate-test (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad93ffeecc04770cdf1f3f
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.signaltest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9407eecc04770cdf1f8e
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.sigwaittest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad9409eecc04770cdf1fa3
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- rt-tests.svsematest (defconfig+arm64-chromebook+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad940beecc04770cdf1fbe
  history:  > ✅  > ✅  > ✅  > ⚠️  
            
Hardware: stm32mp157a-dhcor-avenger96
- boot (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8768eecc04770cdede02
  history:  > ✅  > ✅  > ✅  > ⚠️  > ⚠️  
            
- kselftest.alsa (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad8776eecc04770cdede41
  history:  > ❌  > ❌  > ❌  > ⚠️  > ⚠️  
            
- kselftest.device_error_logs (multi_v7_defconfig)
  last run: https://d.kernelci.org/test/maestro:68ad877deecc04770cdede5d
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.ftrace (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85b0eecc04770cdedbb2
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.mm (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85beeecc04770cdedbc4
  history:  > ❌  > ❌  > ⚠️  > ⚠️  > ⚠️  
            
- kselftest.zram (multi_v7_defconfig+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad85cfeecc04770cdedbf0
  history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: sun50i-a64-pine64-plus
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90a5eecc04770cdf0635
  history:  > ✅  > ⚠️  > ✅  > ⚠️  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
- kselftest.arm64 (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90b8eecc04770cdf06b2
  history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
- kselftest.dt (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90c7eecc04770cdf0726
  history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
- kselftest.perf_events (defconfig+arm64-chromebook+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad9101eecc04770cdf07f0
  history:  > ❌  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: sun50i-h6-pine-h64
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:68ad90aaeecc04770cdf0660
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
- rt-tests.cyclictest (defconfig+preempt_rt)
  last run: https://d.kernelci.org/test/maestro:68ad8a23eecc04770cdee366
  history:  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

