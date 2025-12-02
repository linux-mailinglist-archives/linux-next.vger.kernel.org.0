Return-Path: <linux-next+bounces-9293-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D8C99E27
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 03:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E2A43A4C9D
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 02:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ABB18BC3D;
	Tue,  2 Dec 2025 02:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="E0hYs5bg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28110255F52
	for <linux-next@vger.kernel.org>; Tue,  2 Dec 2025 02:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764642798; cv=none; b=HUcRtfpwQH42pcRr7TSKiMI9ePMsC0DvpAfmb/4+WQ7TrMCxJF0E9LogH4nuXKZ5iDT+auPb0C/Xd/InUBanu+a/CxLpC7uF9QoQo3w/u9FWIE6597VjaF0Xq4dajVCm8N801U5JrxdgNIxAO9xT6gXzYZXnoCih2igb2Ww5vOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764642798; c=relaxed/simple;
	bh=fqjP9DRTWz8CBDZr/4e5D4n1UH3p7w1IpBXcN/2EWMM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=np3WKTKVzRAOkt/v88qW12PIr2Y6mSYTsDBz7BAQJib4ykUTagjRwsw99BprdL8VVLGyHH2fiihmIzyaJ1XJ9RjdKJz6fhIvhKB17Nql+5dOACBtwpvVZO4D+EutV8imud85AT0E+6wps8J1FOyDMlF6CFjSusrfCe1kThdZARQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=E0hYs5bg; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b98983bae80so4603174a12.0
        for <linux-next@vger.kernel.org>; Mon, 01 Dec 2025 18:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764642796; x=1765247596; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flEP6obKq5B8wJxxZdjNnPCf+bD8vgMiv4B3WMWTLJk=;
        b=E0hYs5bg+uQL4+oVqJ67X1LJ9lWHR2+jfNFDjhpA5s21T3EVsPi5RAw2fR+/RHiiu6
         wQIFvA6lBxPB5IgH1Dz8AOrPani6gWrkypjurlr/SdwV7RDQYJpFcCWMh4i+pP3iowWD
         HAGYxpO4JDrgHD2M4/okbst+OAuPvAHgFlsmUuiaR8Im65+3sdEl1pPcQp1e9/K7CFbX
         0sHk8pHqOIMZ4weYtPkjJq3WLq4YHi2jH8gbqMlIzgyn1/1LOWx+KErNrhamkZ6qrvFo
         0wsdZXpgI3ndOYuXmtlJ2abml1wwhOfNtjNXihGPx00bc8bm2m5Op1IV1IAyH69SxZH3
         cfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764642796; x=1765247596;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flEP6obKq5B8wJxxZdjNnPCf+bD8vgMiv4B3WMWTLJk=;
        b=DAOfbSL0oW4ixKGn+JTygJeuEscgkgEOzjC+PqHSsvJWP07F2ZO0eZA15IVavjUo7M
         wQk5qj+lUEekVzVMJ6DPVImwjk+dAjDdD8W2I5PU0yuY7MRrGd9kYhFL67ZpKE2G3OuM
         Ulw32Kl5EG+b5VkCE/DwyYtf/CPZ1gru+tlTGrYT8HOPrF9sQTnYINAofgGInj58qKs7
         QJFAQ6n5yEcXNvo5TqYH0P+NirH4se9wb5Aj03qEhMziWH0enyW2qR6NRBBsTrKoxFeq
         Sxqyiq2BkOCT2wVj6f7Mt8UytRT8SBr/01rp1T2Mf9wRSb61FRzDL5pGH9dOaCfXAcnQ
         o41g==
X-Gm-Message-State: AOJu0YyQnk8Fmtr10L2GLOIcxfNx7TkG2ZJ6baZUXscxoe2BAAwAjY7B
	AzNp3xz6FmbGl6DQAOncmlxjvScLeqrGoqYMMK4zsresZ8R/WH74kUfQSLbzM0jhoUIyiUaQEZM
	T9Yu3DO8=
X-Gm-Gg: ASbGnctgyu9bcU6+w13vCgLvuH78n/v99Kx5CvJwFYjrVynu7fmO866354mcawFa5dJ
	/fgfJASkCJ2euMBx5zO4UU0clZGaMXioHJjxdrylFR3iZgmEwtjM8XFp1MuM7kFGjmFvfM6tZZi
	Q/k6CJiEVBg8yRSWRgdYjGBEUMzh+DGwLSOFenpsDNaG8TfoI00TweTrv28JsIO7qhB6o22LUoL
	t0fyJyO9dGCGlNM2OE2wFmqPiVaYQHlQxNC3H3YidUdB32MPVfOYkt5mnIal1MH9iw0kZfsevu+
	mxSucytInxemgxXOw/LRJ0rY7O9fsLORfkuG/JEcLkJ042ZqPh0jwKelfr/l0fVdDS/OmslyLNu
	M6m64WBKqc+qfASpypiTtcHJM3IgHXQM9uoSnrlf/CvAPLKUFcG/YwBWkGzvQnhVqb8z1YsGIt0
	nK67sj
X-Google-Smtp-Source: AGHT+IFh93XmAEG08cbpfHhmIwIG8BrsxpBC+VS9uxRIbbxDkWBD6ndKArUrX8eXnzwjIz+1gpPBYw==
X-Received: by 2002:a05:7300:818e:b0:2a4:6bb6:c84a with SMTP id 5a478bee46e88-2a719536b13mr32822664eec.6.1764642796163;
        Mon, 01 Dec 2025 18:33:16 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9655ceb04sm49250113eec.1.2025.12.01.18.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 18:33:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 02 Dec 2025 02:33:15 -0000
Message-ID: <176464279489.3080.514257227443218047@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
origin: maestro
test start time: 2025-12-01 03:41:30.121000+00:00

Builds:	   44 ✅   10 ❌    0 ⚠️
Boots: 	   65 ✅    0 ❌    0 ⚠️
Tests: 	14236 ✅ 1143 ❌ 5771 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_svs_1100bc00
      last run: https://d.kernelci.org/test/maestro:692d1a63f5b8743b1f6e37bf
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-pcie
      last run: https://d.kernelci.org/test/maestro:692d1ddbf5b8743b1f6e6738
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb-hub
      last run: https://d.kernelci.org/test/maestro:692d1ddbf5b8743b1f6e6737
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_33800000
      last run: https://d.kernelci.org/test/maestro:692d1ddaf5b8743b1f6e66d0
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:692d28d3f5b8743b1f6e70f2
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:692d2979f5b8743b1f6e7181
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:692d1a63f5b8743b1f6e380b
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:692d1994f5b8743b1f6e32e3
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:692d1ae3f5b8743b1f6e40b7
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692d15c5f5b8743b1f6e17d8
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:692d8249f5b8743b1f6eefed
      history:  > ❌  > ❌  > ❌  > ⚠️  > ❌  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692d15c5f5b8743b1f6e17de
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:692d198ef5b8743b1f6e3201
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:692d198ef5b8743b1f6e3239
      history:  > ❌  > ❌  > ✅  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:692d198ef5b8743b1f6e328d
      history:  > ✅  > ✅  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:692d198ef5b8743b1f6e322b
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:692d1e03f5b8743b1f6e68b7
      history:  > ❌  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:692d1ddaf5b8743b1f6e6701
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_1
      last run: https://d.kernelci.org/test/maestro:692d1ddaf5b8743b1f6e66c8
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_2
      last run: https://d.kernelci.org/test/maestro:692d1ddaf5b8743b1f6e66c7
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-proc-ramdisk.proc_read
      last run: https://d.kernelci.org/test/maestro:692d1e2ef5b8743b1f6e6987
      history:  > ✅  > ❌  > ✅  
            
Hardware: qemu
  > Config: defconfig+preempt_rt
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:692d1206f5b8743b1f6e11c1
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.cyclictest
      last run: https://d.kernelci.org/test/maestro:692d1207f5b8743b1f6e11c7
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692d1207f5b8743b1f6e11cd
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.pmqtest
      last run: https://d.kernelci.org/test/maestro:692d1208f5b8743b1f6e11d3
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.ptsematest
      last run: https://d.kernelci.org/test/maestro:692d1209f5b8743b1f6e11d9
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:692d120af5b8743b1f6e11e5
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:692d120af5b8743b1f6e11eb
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:692d1209f5b8743b1f6e11df
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:692d120bf5b8743b1f6e11f1
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.sigwaittest
      last run: https://d.kernelci.org/test/maestro:692d120bf5b8743b1f6e11f7
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:692d120cf5b8743b1f6e11fd
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:692d2364f5b8743b1f6e6e99
      history:  > ❌  > ✅  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692d15c4f5b8743b1f6e17d0
      history:  > ✅  > ⚠️  > ✅  
            

### NEW BUILD ISSUES
- Issue: maestro:ce1c65862af14252fd16691d2f1397e0a5827d32 | version: 1
  Build: maestro:692d0f81f5b8743b1f6e0fde
  Comment:  ‘sev_tio_present’ defined but not used [-Werror=unused-function] in drivers/crypto/ccp/sev-dev.o (drivers/crypto/ccp/sev-dev.c) [logspec:kbuild,kbuild.compiler.error]
  First seen: 2025-12-01 04:36:30.547317+00:00
  Culprit: code


This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

