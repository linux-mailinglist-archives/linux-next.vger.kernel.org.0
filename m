Return-Path: <linux-next+bounces-9222-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EB909C87D42
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 03:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27036353CF1
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 02:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B461C8611;
	Wed, 26 Nov 2025 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uC8cUHnF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109DE1799F
	for <linux-next@vger.kernel.org>; Wed, 26 Nov 2025 02:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764124305; cv=none; b=TGLsEq0J1Qc8KMQAFrV0GUNGO+xat3btE7RhCecMtSf/khGRIo6IUMS/4RnXg5CFyEwOj5iF7KShEHaH5nUhN6ek5TGErI/6406vZrPH2ZAqEh4F1CDJD23jEByyCGJkBISucTwNWl7C4ooRo3wPMjWmoaEOdGSSDX3tVhu/gVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764124305; c=relaxed/simple;
	bh=wHKfqPok020Jkm771owUISGdsnnn6uhwmZyTiNjfJfU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Ai3uxEOxNjMP7GRPeKamGjwigMVP8OwFPkeVQP6yiwIb0ObsUWt38BQgZrV/dd7feuZp/rIjy9k1SmF/SCpO9HCS6VR38giepbTQcMlDHVI/f2rWzrIATy7XgmflMFtKaNAgtTfkz5VOZFmQ1QxX7Y4MB2zkcJ5Wwf7W5ZsC1rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uC8cUHnF; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3436a97f092so7701843a91.3
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 18:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764124303; x=1764729103; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W21KYjomIOYUA2W9lAGb0h7pPyH4I3oo4gxh2HSdNPA=;
        b=uC8cUHnFYMpZgascFZu8FuC5Aq9GGqudeJ+kZ+SNU+Zp+6GtpOIEGeXpN1c+paNwhf
         eadqI7217iwIukUqd+n8LJ3Z0LEWRF/KXZpKRM6E6UnxlIMsouudtO2wmAcpV8znLE1a
         wBgf4kJXgFwDhkVmK0BFL/K1sB0Vyuo7Q0KvpORHvIcKDG77Kra7JYO3K0Tl5ccHJDBA
         rbSWAbGEzCMIh29uiEEQwDXKw6BEFm2TqxVSK+dpg+tyzkHajqFbJ6DpE/N7is53vMKn
         h9VMCLUraSClnb05JVMX/U5QYzxyezkDvdmhZH+ooEzLT3Tv9xLSwGxSzvbp8LxgFdQe
         5GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764124303; x=1764729103;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W21KYjomIOYUA2W9lAGb0h7pPyH4I3oo4gxh2HSdNPA=;
        b=QZXdAnbJEujT6GAHeMf8J0EJqTxAV+B8CdQF4S5tG6Rq3izA84cYHfrBZ2uOi03gpL
         hn6u1ZD6XFlfQ4s8xBop0FoOnDpVbOf4xERHvSFfeDyAU1uy25L1EJW/DGZtRI6lE/Ig
         ckDB9uembOiMCu0z4AiTTXyinjfjZdVk303j6yPEQR17TyqM+OZPQErilOtBo9t9yobU
         DqTXbe/UzxEhMUCvLzNjs3gwDBaTFBSMJhd5uOh3PO9PwsxIlP9+HOeIKXMfJsX8dgMl
         l7Flw86mhzHnq6hW5R0u8XPHFV72B5y0oFUFtZWSb/klmrh1AVgF7/nv1zlbR4AIPg2W
         8PiQ==
X-Gm-Message-State: AOJu0YwoKcQPL9G7J0j5YJXBCiqkYbShZr1nZ6BCS5GL2KJM/WZRfPB0
	2rWlTdX4XC3ZcVAV6SfqzPpbB8Q5M+lqrk3KdY7K/TU7IPSOVi/1U5GaeoRtzu7HD5W2y9qTFKD
	4c8pg
X-Gm-Gg: ASbGnctKjOwfPFPOohdtChJYClQDkAJKnzXGGqcYFAR+J4e2oO9w2SwoSZEFaJr1J24
	/pslkb53O+o1Cy5bV0Gdj9bYbSF07gaPUhXKnZeh87rd4eRAHyYtOBo4cisHutGArgVjtS/ltMT
	PBndMq7Pc1k7aXBzynOoNBOU7SIlMTvKjK25fNcJTATQ2zutA9weZ48jPil5/8lnutiTSpLVcms
	9fmWVTMzO1dEH+sAbgJGFx9sXumTxukwXHNjeRVR0VVn++z6NpKhOtagoHo/GdF4aBayNvA6ADs
	UxgVaNCg6NBU99BTNoRWANEyz2JGy3tS+kSfceV/VwcB948FKs4nvGhYNwf8Qi2Lg/KP7N/D2jo
	nXcqZ9ks61z+oKpg95WZR4DcRI5+/BE529MKBrBt/UKJ+mdTCmUHgRxUYtoZEPiXPvKTdO256/t
	nfGkUg/l1xB1C+V88=
X-Google-Smtp-Source: AGHT+IGPlbPKN+hom3BeSF9M8QOwjWey7yNX9Gb2kfuuw4TEJKy8q/JI/VdIuDv7OXKECG+oE+86TQ==
X-Received: by 2002:a05:7022:2522:b0:11c:b3ad:1fe1 with SMTP id a92af1059eb24-11cb3ed2767mr4154978c88.11.1764124303103;
        Tue, 25 Nov 2025 18:31:43 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93db4a23sm91226821c88.2.2025.11.25.18.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 18:31:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 92fd6e84175befa1775e5c0ab682938eca27c0b2
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 26 Nov 2025 02:31:42 -0000
Message-ID: <176412430210.216.17779188383204667497@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/92fd6e84175befa1775e5c0ab682938eca27c0b2/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 92fd6e84175befa1775e5c0ab682938eca27c0b2
origin: maestro
test start time: 2025-11-25 10:03:23.552000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	   59 ✅    0 ❌    0 ⚠️
Tests: 	 8533 ✅  515 ❌ 3888 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:6925900cf5b8743b1f60a531
      history:  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-pcie
      last run: https://d.kernelci.org/test/maestro:69258e41f5b8743b1f60a1d1
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-usb-hub
      last run: https://d.kernelci.org/test/maestro:69258e41f5b8743b1f60a1d0
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:69258e41f5b8743b1f60a19a
      history:  > ✅  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_pcie_33800000
      last run: https://d.kernelci.org/test/maestro:69258e41f5b8743b1f60a169
      history:  > ✅  > ❌  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:69258a2bf5b8743b1f607c67
      history:  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:69258ba7f5b8743b1f608873
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:69258d00f5b8743b1f6099a2
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_1
      last run: https://d.kernelci.org/test/maestro:69258e41f5b8743b1f60a162
      history:  > ✅  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000_usb-hub_2
      last run: https://d.kernelci.org/test/maestro:69258e41f5b8743b1f60a161
      history:  > ✅  > ⚠️  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

