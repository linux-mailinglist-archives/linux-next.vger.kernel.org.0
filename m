Return-Path: <linux-next+bounces-9254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E31C90A36
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 03:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8E613A92A6
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 02:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B9E1E8342;
	Fri, 28 Nov 2025 02:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jd/HAdjL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4A136B
	for <linux-next@vger.kernel.org>; Fri, 28 Nov 2025 02:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764297068; cv=none; b=en6AfpqVTcCkkw/6SoUTDwy3Tyiz5r+Z0vO1eZ/cBktS+WOOoR7kVwPVIV2d7yP+oUPUin10kcVLbb3NsdKsUqVWzwYyd7YHrZU39R2/k1ngtd2W7fKM1gueC051NXof4yzXeSxJypjWrurRKtwZIRWVEQHAsXX3j7UjZb/gWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764297068; c=relaxed/simple;
	bh=jjj38EWXENvFmQ35pscjsC1YmfqzAoE8NHHS5OKWfS4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=K9yJ8HKP+tQeFLsX+nhahp9Rhj6gTWM1/FNZCwn9BOcviF/+xgh2wUoicvArrhyvY3q6T+hBQOxfl/0g0oUhTIe1M+S1ZeBUxpxptRRJQmftu2hfI0JL2h+h8r7Ve+aoRycgHYDfkyxuSHAzCMwrhfZZqjqmH/aQn25KANdVepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=jd/HAdjL; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bb2447d11ceso818653a12.0
        for <linux-next@vger.kernel.org>; Thu, 27 Nov 2025 18:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764297065; x=1764901865; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4puPqdyJKJE4e64W+G0O4zynJo+1dLLus0Q9jY3P4E=;
        b=jd/HAdjLtBNDzmDtRG11hJmuDCrVRFUHDkVxOIEEjMBM04qNvp5eY//S7k767UtYnV
         +vsTrJrc8WE9V1yMD2eAGirGRmBQ/1IZ1jluQNOXAdEiCwwfAoJrKR9fXmG5/RnWlM0y
         i+cvZ2UyTtTGFVn7NW4v7X9yavhSOOGaVQsXV2M9gVjoL7V3wlA9h/CCPvRCHbL05fFl
         uZMMXzt76AeliqV3DHU3jznDdd6BJGnTE7/xn9sJyiCyrDKQFSOWpPsRWlRw/pt7ZTWf
         CYcTr419hWI/+PpeCM+INlTL2xiK6uTHASbBvIP5BzY+UI8IRloYTiVPE//kVXfUUi5D
         la1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764297065; x=1764901865;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4puPqdyJKJE4e64W+G0O4zynJo+1dLLus0Q9jY3P4E=;
        b=uSdzuXtAuWOAqAmQgjtPwsbPtAlM5uIGd1nsxtfSKf8X9YmOWhY5PYn+Gnu+1Zc894
         DHxjWkDp/zOrWLnUQXKxoGrlCvheeR1ARXqPE5YosCwdQy2vYE5KDBU07i38w4DuPvGX
         wsszUZaaMwILorFy5ebPZRU7n3wB8SeUetiktVJuym9jCKcBIey974Keo1c2zEnOyNDu
         ZvOogTIua8rc+rHCFMKeG05XORpfvKUU1C9gJsDJRIS0viB87D1QV9bEus6rgiyXNYwq
         Xqe0oG08uCc2f868e0PmqX75JOt+dp1VLs6IcigmqJ7vuvrXb9SUTn2Vcmey5dZMwkd4
         hZBw==
X-Gm-Message-State: AOJu0YwzTZZg4Sn2zAPFC8Cb7XwjgpZSCMvgEGn2qNudF+OWOY58mWdk
	SOMlqnNjOmrrgPZpgREqLpXBwRZNZ9tje1ak8PYens0WJ8jj5T9KmK3JJjPbO2SXmmhmLlIPvq1
	zM3lN
X-Gm-Gg: ASbGncvdtkuA8sIDKqNs/KQmwTtf/eCNzwvUJBeaOrKIg9jseHw8EVNUPfA2iGGx11F
	GaiBcgOl7VB28nqaqmnujDRs7pQjaGNnzX++MlhC2Jvp9cOJpMqdO/TfDjCu0rEmfbMNSXf02pS
	zGkyc7MdU88znyRO2OUHrH53mEwD+E/cLc4/clpX5KSpYGZtC592CmpYUJOhB2YLigk75c+9V9x
	cZ3UyixEM0fWPK+EQi/l+SwN+opNqBbs/LEL1wOSabssh0TMoJx+vn2V8x36fpKz/apxDkxkamY
	DP095cvNWOsyyGOUaaUFhage7v2ehCK1DemGuCQ8KTxg+3szgNxaf5cDRXQp15J+gvhXPaO7y6l
	rQ2NvA2C07HHOqp1vS534IEyxDsNJGRAVi73Js1kjdh7cuRxMg7s+DOwYEje788p5bOXWJ+xA6g
	fTYWMR
X-Google-Smtp-Source: AGHT+IFj5R1ASPmTQ19yXUbLnHUtXpdWoNiD/UiJE5LVwvEyHVNpei3a/ocfaLHrtYZGJHqZTVyiSw==
X-Received: by 2002:a05:7300:6c1f:b0:2a4:809d:9a8b with SMTP id 5a478bee46e88-2a94174db43mr10101798eec.20.1764297064810;
        Thu, 27 Nov 2025 18:31:04 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9653ca11esm11347916eec.0.2025.11.27.18.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 18:31:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 28 Nov 2025 02:31:04 -0000
Message-ID: <176429706383.1137.918777827522484490@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/ef68bf704646690aba5e81c2f7be8d6ef13d7ad8/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
origin: maestro
test start time: 2025-11-27 03:47:18.757000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	   61 ✅    0 ❌    0 ⚠️
Tests: 	10877 ✅  596 ❌ 5235 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:6927d139f5b8743b1f6454ff
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:6927d139f5b8743b1f6454d7
      history:  > ❌  > ❌  > ❌  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:6927d139f5b8743b1f64550d
      history:  > ❌  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:6927dc97f5b8743b1f647f5e
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6927e111f5b8743b1f64c007
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-pcie
      last run: https://d.kernelci.org/test/maestro:6927df71f5b8743b1f64aa97
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb-hub
      last run: https://d.kernelci.org/test/maestro:6927df71f5b8743b1f64aa96
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:6927df71f5b8743b1f64aa60
      history:  > ✅  > ❌  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_33800000
      last run: https://d.kernelci.org/test/maestro:6927df70f5b8743b1f64aa2d
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_1
      last run: https://d.kernelci.org/test/maestro:6927df70f5b8743b1f64aa25
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_2
      last run: https://d.kernelci.org/test/maestro:6927df70f5b8743b1f64aa24
      history:  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6927db3df5b8743b1f6474d8
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6927dcbcf5b8743b1f648111
      history:  > ✅  > ❌  > ✅  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

