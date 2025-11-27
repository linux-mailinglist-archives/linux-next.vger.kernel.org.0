Return-Path: <linux-next+bounces-9239-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A89C8CABD
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 03:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 485D235123F
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 02:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311CD21CC68;
	Thu, 27 Nov 2025 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RvFyiw19"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4296C1F12F8
	for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764210640; cv=none; b=JxwgY8wBE5MqzNhCgPzJkg2CqSLe4LuNJHEt3TrDFAd2NDkI12XUWHqPdZhNdFUTC/wfWN2ubCJuvyWLlKEySNZ2HRPW8ZYmAhPzrXfXPhUurXBy0Up+uYOyOaKWydm3ODIoy9tyXPzUEzjYoK80HE17aKlPqV6lDq4pWIh1BNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764210640; c=relaxed/simple;
	bh=xzYcpHFkOrJ36wxYIyvRKXyBwdxZFCu2xzVN6EhaS10=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=c9EE0yN1qdPhtg9FhoOu8mVljqaKlAvVBHNWqIXJWFpAAdPLDcnj81q4MwCywSkHQwolbU2n6wKxcP4JLNhXg2bNzI4nexlvnGK3Lfyd7bacZTyh1VatOGCexB2zPFWCZ8uvjk4pjenqQbDEN4R6V3on96UFXTp29s1xHB7G/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=RvFyiw19; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so221811a12.3
        for <linux-next@vger.kernel.org>; Wed, 26 Nov 2025 18:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764210637; x=1764815437; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICYl38MBWduJIFj/48EfaB/QrVVieCQ1P1jj23XnOLY=;
        b=RvFyiw196BzLPUsDGbQc7brmdBPBV9YVVUn0I7BVss1tmeSt/SoWOL3/9YP9wpZX7t
         BPVFkATWFc2XuA++4NVmhTmbiZws5/CkPxefxZwc209w+oHqJZSYruFmKBCQD0zS8yQ/
         U2bqwQ1EZqm6vXBoz3kVsjrwZruh96+/qFj3IO8rV+/1+Cmlrf2ySfAkUb5ly9fmfwQ3
         0t3mAEC5gf+QghgLFg+rM31QydwPgVLFKGG6CIva/6zDAbXtZnhx+9GVJrD0vNN+kiYA
         +av7k1skknYf/KoGB1cSl065bm8sU1i4uAr5WOyjDTwMmsOylHC/mYWT0jEGUcQU8vKG
         s/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764210637; x=1764815437;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICYl38MBWduJIFj/48EfaB/QrVVieCQ1P1jj23XnOLY=;
        b=R1ydSFLG7VuXet+YJ5ZektEV+4e+KQsWttj1YLVdFKt2rRtgZU51XmDUBOH35Uain3
         6bZo6humkRL0+GUPahKappsPy4Zv94Q3IOt1N3BC69J56ys1tz5UqJBKVOeU8l1LHYlX
         GXYPgGBcR0PG0dKHbRdC4mhylrSz6IsHpS79+CsSHwVQt+GgL4VyFUN37zAU/PaK9qze
         Iea9qz1YK15Esgsk+klaCMqF2m3HepxVefaaFquSmYaEUCZ3HMkJHsFIFADDMOliIzLC
         VR5yY7Pe9qVI6TTTwQL3DPu8hcDtj0ERx5uF//SGlVDFgvzQXeCj7j7ty4wSuYxIdNAg
         qoDw==
X-Gm-Message-State: AOJu0YwLn1w2ovu0gWc7bTeiS1t9hHrLZ0M33UmypK5L/mOKBJMhvhgY
	moX8nRG/qJ+CuCzY+Lp8O6Jo5V3F0+0kX05SU9L+Gt9wBWlo1Qa45jinqNrh6nrnDiw=
X-Gm-Gg: ASbGncupj0fHK5wEXk1GzbH0T8DG04Be1cjjPhR6xLjKSb5UzKcGFLr+siYPE5Bbiz0
	ADhgiJV6y4C7J58CU1ws/1mwv0Sq2RIbCfYUyzP7P5xiUOkNA3cshCyg4WC1Aq6VXVeYDXpBjxs
	cjsNmdCF4/+7x7MWntzvYdeZ5igtFwZHUw8uEKekdpM4Pu9GSWQmPUNIM/e25o5tzm+xNVseYjK
	WD72zYsUiOGBC71WjVk5KLHwxkAtSCNxvo8iEdrhGrGwVldcX/u6pj96w2D9lapVoxw+5vTO9bM
	gxgp1907i5sMihkjt9VodOLdllhNYkqbnBg3/UW5dAkahJQnd8s44d859/mbKLuwUW+N1BKEdOT
	2KiI/DeNDhi30QmiXl2UMxdOpfGTWxegxrfzSJkHaEbiBA/PhdL6yzKqqiAdWJw+cyRMeHkyWUq
	WfU2ri
X-Google-Smtp-Source: AGHT+IE0US6zSKoG3sx9irzBqWnj9SBef2xn4G1hqeYckNQO8kyelqTmh7F2ED4xpothOqcuidK/Cg==
X-Received: by 2002:a05:7301:1014:b0:2a4:3593:4664 with SMTP id 5a478bee46e88-2a9413bc7a6mr5184471eec.0.1764210637292;
        Wed, 26 Nov 2025 18:30:37 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965b1ceeesm1485384eec.5.2025.11.26.18.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 18:30:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 663d0d1af3faefe673cabf4b6b077149a87ad71f
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 27 Nov 2025 02:30:36 -0000
Message-ID: <176421063616.677.15827047960428627653@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/663d0d1af3faefe673cabf4b6b077149a87ad71f/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 663d0d1af3faefe673cabf4b6b077149a87ad71f
origin: maestro
test start time: 2025-11-26 03:47:08.966000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	   60 ✅    0 ❌    0 ⚠️
Tests: 	 9034 ✅  512 ❌ 4243 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:692688e1f5b8743b1f626853
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:69268da8f5b8743b1f6289ae
      history:  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-pcie
      last run: https://d.kernelci.org/test/maestro:69268bb1f5b8743b1f62839d
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb-hub
      last run: https://d.kernelci.org/test/maestro:69268bb1f5b8743b1f62839c
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:69268bb1f5b8743b1f628366
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_33800000
      last run: https://d.kernelci.org/test/maestro:69268bb1f5b8743b1f628335
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_1
      last run: https://d.kernelci.org/test/maestro:69268bb1f5b8743b1f62832d
      history:  > ✅  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_2
      last run: https://d.kernelci.org/test/maestro:69268bb1f5b8743b1f62832c
      history:  > ✅  > ⚠️  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69268796f5b8743b1f625c81
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:692688f5f5b8743b1f626bb0
      history:  > ✅  > ❌  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

