Return-Path: <linux-next+bounces-9435-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F3ECC5C5B
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 03:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28FDE30115CE
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 02:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A8D7D07D;
	Wed, 17 Dec 2025 02:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0ntWWPhM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00093A1E67
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 02:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765938627; cv=none; b=i/0VRfcXcEb39qY9AMpZ1U76xqqp3iIGdGz7RpnwxfAFBdMsmQzOw+R77Wwl1OmMchvrUsGWx07M/5hEer7scsJtk8Qk00ucE6Ai30pCUo/wogWNNHpZnT8y9ws7hdDaEInoFicC96I06W7suoi/TMqVQK2CC2S+3h1jrDK2KvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765938627; c=relaxed/simple;
	bh=oiKZkf81YIvtXuRiZse/MPAnA8NApg4FWVWnCY3D9qE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=n/RsY25Iqi/leAyr047iK84TnhtGwo/SZtziP09VHKyKEzNPBfORQsgJ0gBDsu2BaQKEJGa4X8V3izZ9Oh623xR5WGaNSr2PfJB8KelILn/Legcbcwf2AE2sOl0SwH43WMu2nToPh9fpI7AHgy6DVSteHxpmWajda/Qtz1T3C9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0ntWWPhM; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso4078506a12.0
        for <linux-next@vger.kernel.org>; Tue, 16 Dec 2025 18:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765938625; x=1766543425; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlD6Dsxaoc+n2WZEyfSULHj6k3v1r+6YJEMVsdCk4+M=;
        b=0ntWWPhMgM2xShY63XnqUipYutWjpGZfRTAQpTfSCeE2mjSrxXLyufZesVbweGrakU
         nVD1GIj/I7dniBB0E6ynkga7XzWltlhT9MzXFuu29ZdOhkamgdygiI283DLyN5+p7+8Q
         to+EqnHKZtQBK5jU4lfCy+GXOi5VqFWnu04lODJGbR2mZFMY82kKYJe9IbLBUHQip5kz
         9kuBQ0xRb97M3px1uL2KZBOxDm4cl/AH+fdve60vVXcwBispDEiz1M19IMhRTxhJxY+2
         6u79agsuX8MdUVq7Bi01V8wUmeiUdhiAQog0lZKHtifvOvUaJO28kP6FWFfXe66FHM+S
         4T5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765938625; x=1766543425;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jlD6Dsxaoc+n2WZEyfSULHj6k3v1r+6YJEMVsdCk4+M=;
        b=lTB1YyKd//iIriPYn/aezALStlfSaQiXflyIsYdjvhH48T3dgSciooEvTOgfwXxb/N
         3yoyLDRHdvix+SbAs16Cau8V1dV2mAt43s5IJFA8tJGd+lIBJaAHZ4oEeZ5xDEMPyzkE
         PkaYuPM/1Q3h8g8D9K8YasiujzRQkG19YFnY2cRpchsFEiOwge+i1QRc2/T5MVF8e2UT
         d8M3eiyfmfr6+LpB2yWKFHCHijZaNBYePkp/0M2xlSQe8QWBBSf6kB9AwvvZNDQRerDS
         R2VBRzw9qPUSFAC/JHvQRX/bWablefcGvOlG2EDQmCJGpJNe7BBeJgBivtGd6wAZ4sS8
         ZciA==
X-Gm-Message-State: AOJu0YybKlfPzpsEy+MMM3DeIwS1Jiz80s1W5spOadpsNtrb75AdIRAj
	y+yDKQTugdN7ecb26lIIZix6GhvcgF+pIRQQmkL8dh8VKJM3Fb3f9ILZtIvl85uKEIC1sOr1If2
	A7WelOC0=
X-Gm-Gg: AY/fxX6fWcBkwyRDgBz2nCz4sMBfUYfn1/IbIDsNT0MnymMIe54Z/3gMkeAXuGVcJv4
	JzpsURQfiOrqnD3sXCI44FKT1BFohIcDz6nlKENeQNi/WC+BX1fItFuPkQ50A5PIR+4Kxx/WZro
	nAO+PNdC85gv2f8+w9g+ep7qYZVYfzm/we28HAcCZtESxpFClw1BhwTMarhmTHnJI6EIAwOYxn1
	QsSnpuJMOija/ixKjLaIFfLGBiJz5y02hHNRRSVOU91/GkPxsfTIDQQeYXX+K9n5a7m5JoDy/r6
	IpS2GaMKwcUkrYwsk8yYyvirgao/Us0kQ4tKI0LYxTbkPkPraLY70ktsQA5bUzlkr/FtcXCg8/s
	7WabAcaIdz0j7ZQgXVflcDySia54vRhNAvoNy79u+zfaijxTkl1os2eQCzbecRJzEi0pYJ1kjmZ
	kttbPs
X-Google-Smtp-Source: AGHT+IEK+6L/8wZJOFLHklkrqjeoC8QV54wXSA3GhBeFZ6Ah6Bs5zXKFJzWPxeZ2jHesQ8i26Zi9SA==
X-Received: by 2002:a05:7301:7d07:b0:2ae:582b:db80 with SMTP id 5a478bee46e88-2ae582bdc8dmr1895990eec.9.1765938624778;
        Tue, 16 Dec 2025 18:30:24 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f0545f8sm2002477eec.26.2025.12.16.18.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:30:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 563c8dd425b59e44470e28519107b1efc99f4c7b
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 17 Dec 2025 02:30:24 -0000
Message-ID: <176593862373.3062.6406725933820833004@77bfb67944a2>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/563c8dd425b59e44470e28519107b1efc99f4c7b/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 563c8dd425b59e44470e28519107b1efc99f4c7b
origin: maestro
test start time: 2025-12-16 02:29:06.835000+00:00

Builds:	   40 ✅   14 ❌    0 ⚠️
Boots: 	  159 ✅    3 ❌    0 ⚠️
Tests: 	12565 ✅  897 ❌ 4746 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.timers
      last run: https://d.kernelci.org/test/maestro:6940ce79cbfd84c3cdbaba08
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:6941820acbfd84c3cdbc932b
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_9
      last run: https://d.kernelci.org/test/maestro:6941820acbfd84c3cdbc92cf
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:6940d211cbfd84c3cdbad3cf
      history:  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6940d3fdcbfd84c3cdbaeacd
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:6941820acbfd84c3cdbc92d7
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:6941e611cbfd84c3cdbd21b6
      history:  > ❌  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6941f4abcbfd84c3cdbd2bd9
      history:  > ✅  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6941ad49cbfd84c3cdbcca44
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6940ce6ecbfd84c3cdbab97f
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6940d252cbfd84c3cdbad533
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6940d215cbfd84c3cdbad3f9
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6940d3dbcbfd84c3cdbae6e0
      history:  > ❌  > ✅  > ❌  > ✅  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:6940d218cbfd84c3cdbad414
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:6940d435cbfd84c3cdbaedfa
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: meson-sm1-s905d3-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6940ce6dcbfd84c3cdbab970
      history:  > ❌  > ✅  > ❌  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:efd5e2937b906561246dc835406f3fd74dd15d9d | version: 1
  Build: maestro:6940c4b8cbfd84c3cdba9ce1
  Comment:  in expansion of macro ‘min’ in fs/fuse/file.o (fs/fuse/file.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-12-16 02:40:34.030749+00:00
  Culprit: code
- Issue: maestro:efd5e2937b906561246dc835406f3fd74dd15d9d | version: 1
  Build: maestro:6940c4bfcbfd84c3cdba9ce7
  Comment:  in expansion of macro ‘min’ in fs/fuse/file.o (fs/fuse/file.c) [logspec:kbuild,kbuild.compiler.note]
  First seen: 2025-12-16 02:40:34.030749+00:00
  Culprit: code


This branch has 12 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

