Return-Path: <linux-next+bounces-9097-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF8BC71DBA
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 03:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 1921429ADF
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 02:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC1A13A3ED;
	Thu, 20 Nov 2025 02:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PbMuX+4p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF5A14A91
	for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 02:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605894; cv=none; b=fU/j56I0eob1qfOgqvZWrVNet2BPsBLHRM5fadO/xB+uY6lwVZgmG6iqeytci04iufE1gcTobNC/KDdAGBgXmuMRx+26vfGwwWFrmYsAQwwq9dgsXxohhYImJVjeX2T1HGyeMxQP8yOLHFerjCqXvEQAJh6mDnu8a9aAJO7p2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605894; c=relaxed/simple;
	bh=uz2FVHDBLWR0AhHfHTvTtasHTmPHv7KeLYWnnUvA9TQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=PzIGzvb6+O7EwBxyx6/iJu9EtGv5soTa7x2BXmXFE9TXrlnbx6ekU8YdFlGZ6By+LXyFC76PmIN4JIyERJOgTi0R5L0OaTqZU4BIRwW3T34CVYPeVidozdX3qWpnEQ6l1rJ1jczxzUbbsLH5CwMUumDsAvt6Mgy/JfVIAVX8r5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=PbMuX+4p; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2984dfae0acso6551445ad.0
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2025 18:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763605891; x=1764210691; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCNRQ2UJ7+w6ZTxSdINp78pwLnruHYQngdba1u2cAEg=;
        b=PbMuX+4pv0QSKPaVIi+p6ylBq5afErE90z2ermKhaoBrEyvlTx13gtVD1jJ44rFaQU
         4rtV0sK0krTjDuSTlNPvXxpP0pu5iTMic77StCE7WYhrb7YPVdNCni6Wrk1cYf7WrwCG
         gzzqDQUeSJWxhiBd4tZkL8sYxttxMqjIGhHtbnBxgzhaYx+ipP8EffbgQOSFHZfa18Zp
         bZxG/72UC9g/EJ6xetphsVQV98++4rIs+APXtbGEbtQ1ahpfSyEbiJeWQ2h8OoI/8tzq
         YmJMzvudk7Kz4EouzpPnhWdnxVqP8w7uPXkXN9MouvMBLsjvbpmQgw/SQS2ttKOrDk+d
         rqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763605891; x=1764210691;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCNRQ2UJ7+w6ZTxSdINp78pwLnruHYQngdba1u2cAEg=;
        b=Y4ikfg/DodCR8or2QQJxq9LgBPGH0VxATlildv91bdWtfILhdkZymj9I6yF2I2VQVC
         Z3Ru3brThws8ojeVCcqNPKO0zSMFKv79NJDhkXT4nCFEmUtQG/BnPVUBBEiF+z4JPNVz
         ruyMj0ro2fVNsFA3wqp+8XnG8CLBZDTpT5O3RLfOlg3gUvNeIFlDeiaBhlTOw4WyEXbI
         ejoOPb9NTtzzyh4HuGg1wrw9x6Wy8T9lGgJfpFWSB0WAhsxqarYWhRj9c4+veCldM/oD
         5h0HJlXSdYoJ57AWCrClD2BAdS8TTQwtLR8uzB9MrqvhKHLF9Y1pqMWI4x+IvPbnyOpa
         dGJA==
X-Gm-Message-State: AOJu0YzweoHlKi1WIrMa//WNL/SW2+tM5rpe/YBD3UaR4M3QeCf3No2D
	jtHrt55SAYAI6WubgTa8iPC6klI00k9gDGdTxb1jqcbY0kExGazTvFVuDtgndL5YtFZmz/JPMZz
	JtxYi
X-Gm-Gg: ASbGncshEijVJ0r56K0CciC8oWZNrleha7LIwtU+JF6i1gBYXv0CdW2VYyciizisqhd
	2LdtdkPBvaO7Cjlvtze3VYNG98C7ELqzdGoF5EAWlJyEqRq88ctZz3VAx9nPeF6QJ/S4cthhOno
	kglcKs9AplCbu2iyh2wYrGPQgSxI4dSvrrG6y5u1LBpq5O9G6ly8NU7X+ESuZgjbDtWT6bGimZ6
	kCWSnrXTw+xWWOhLOV9/LxMxVScuFnSo0zYi4vpJ9+48biStExPGwFznBl0jMcQ31AZTVPqfwir
	giYes2iHqWS6D2yu4MtUxvY6fV1g0mlDTQMqE1W3Y1vbQo7qLHpIkmwlE3smSXv0s/MWzZUtK8E
	BMjZNK7WAG9u30K4CQ5uab6SKxXonpuv6SYgSNbW6FWcbT+7cwoe/b2H9jdXOXvF7coOeGjEgry
	KCrBBkJd7AVCPHUVQ=
X-Google-Smtp-Source: AGHT+IGKGzKcKlKNocFVbTU67nVOdJOorTiErmQExgAMOOhu5iMN56v3yDmJDQIE8sMsbwko8IhwqQ==
X-Received: by 2002:a05:7022:b90b:b0:11b:b61a:a497 with SMTP id a92af1059eb24-11c9388ef13mr523514c88.37.1763605890997;
        Wed, 19 Nov 2025 18:31:30 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e945sm4636344c88.6.2025.11.19.18.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 18:31:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - fe4d0dea039f2befb93f27569593ec209843b0f5
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 20 Nov 2025 02:31:30 -0000
Message-ID: <176360588981.3071.381645165297177354@f771fd7c9232>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/fe4d0dea039f2befb93f27569593ec209843b0f5/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: fe4d0dea039f2befb93f27569593ec209843b0f5
origin: maestro
test start time: 2025-11-19 04:02:27.453000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  137 ✅   14 ❌    0 ⚠️
Tests: 	12183 ✅ 5802 ❌ 4669 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.futex
      last run: https://d.kernelci.org/test/maestro:691d4bb22fd2377ea9a8d3c5
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh
      last run: https://d.kernelci.org/test/maestro:691d51a72fd2377ea9a924e3
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.futex.futex_run_sh_global_futex_numa_mpol
      last run: https://d.kernelci.org/test/maestro:691d51a72fd2377ea9a924e4
      history:  > ✅  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq
      last run: https://d.kernelci.org/test/maestro:691d4ad12fd2377ea9a8cfb1
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691d4c322fd2377ea9a8db9f
      history:  > ❌  > ✅  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691d4a902fd2377ea9a8c9e8
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:691d4ab72fd2377ea9a8cebe
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:691d4d4d2fd2377ea9a8fcf9
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691d4b9f2fd2377ea9a8d360
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691d4f392fd2377ea9a91781
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691d4b9f2fd2377ea9a8d363
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691d525a2fd2377ea9a9286f
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691d4ba02fd2377ea9a8d369
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691d4e002fd2377ea9a9080c
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691d4da32fd2377ea9a90348
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:691d50072fd2377ea9a918d0
      history:  > ✅  > ✅  > ✅  > ❌  > ✅  
            
Hardware: meson-gxl-s905x-libretech-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691d4ba32fd2377ea9a8d36f
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691d50902fd2377ea9a91b02
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: sun50i-a64-pine64-plus
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:691d4ba52fd2377ea9a8d380
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:691d4f9d2fd2377ea9a91844
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:691d4adf2fd2377ea9a8d044
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:691d4bbd2fd2377ea9a8d497
      history:  > ✅  > ✅  > ❌  > ✅  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

