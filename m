Return-Path: <linux-next+bounces-8668-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE22BF461E
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 04:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2987A3A8DAF
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 02:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E53D1F8691;
	Tue, 21 Oct 2025 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="u+G0H6jS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CDB1643B
	for <linux-next@vger.kernel.org>; Tue, 21 Oct 2025 02:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761013810; cv=none; b=TSdW3ziAn1z5wLX6ZV7oVwI5ARHzjAQUj1RYoOdtxXq8ymlttPmQ09yMX7v74dauo51WkTYNfQaSYks9reivYWw0T8AP9wDQEcakwoQm8m6ISUu52ZOUQ0ydv6KHPs6pDSx+C8L4VHlf+ToBzOhNpk/SRZ5ydoPZJNHlZwWRuEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761013810; c=relaxed/simple;
	bh=tZC6jtwS/YD+5FVBdS8XkoqbgwuwytfYEidt5e5LTR0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=jDSZC8XCKpIGwysM2UmT7Z8eb4LQyi9uSzcq1bWVp+mePc9ulfo3LNjx5/2G6qnrZruBsAmtleDt9gZHr1sr8VkE+87C0vPPwAOjCM9jOR7jVDwfGdBn5l8AUEvgCcsBys34ngJJL63SYRQ3QwtMqThW/Y7Vc/0KvEaMzR8tU04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=u+G0H6jS; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f343231fcso3410249b3a.3
        for <linux-next@vger.kernel.org>; Mon, 20 Oct 2025 19:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761013807; x=1761618607; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4Ymh64turACu3dg2KX4jkerTJJ9Ia+DDpUjTl0/qk8=;
        b=u+G0H6jSG8361HeG8PyaxOLU/T1Ogt+fWYgY9LQIJR/WLqeOS1gbN4pJ6IHB16a5Ru
         qwzK3DV1vA4UIv7KRV0aaQWnWPlAnSb0JSGxFSfPB7rEVZmO/IgrdCeXlZ8YE+1kPaVv
         eF5weNH4sQ5NCBcOxP8oNB/zis+2lmQq7BpomQ5XcFYcXx0w1jIKbUbKKHELXsaRt4yO
         prur8gD5QRx8l/P2uN7md4/hXhIOXbSI/hsg2SoF7PjgTAwLBdxyqvrs+YwD+oVKv+gS
         OSmx2dcH7pEadWaAFf9YXeYHXDdQNfGSrD7eaJYr7DfBkeFLnxxyK/PNGp63P0c3/l3u
         uiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761013807; x=1761618607;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4Ymh64turACu3dg2KX4jkerTJJ9Ia+DDpUjTl0/qk8=;
        b=GfyvRK3RzB0jVHHPdK+vzY7BSy1Z9FVoDoqWuAK+fUGYiqAG/GINpLegoYH/JapUmo
         tBGBgvPeTGUUVy28bQKD11fe+K2mUbHrVtoL9GXq2Uj9/K7pPzslQ5KYyfd40rbouKfH
         9ZHK+Q4nKZ/Bb53vLP6jGzBnmPeJw4Nt3/W68PUkThJVqCGeU2VLeoUhQ0QgMN7XaD5c
         TlQ+u1X9AEUeEK8pc32faeQ02X0wkEzjkfF7QvO4So6kvc0tQg9QLK/w+mn4lVnGdHlx
         vWr/arTlmT7FnDOr9kgSR0+ldyRNAsyoKV33h3YUdKNOhJYD+Watz5OqLNKLjD05cGI/
         ClRA==
X-Gm-Message-State: AOJu0YwCA1F+iVdsauz3LS55ACpqAHTi4YLlNmJ+sIz25ZKFxwRk6yu0
	7fkDvz/dnrit1+mKHRU24loyZR5469UmkFom4Lq6JcrWepRAaoewIDt0qHgcrUYfmER7Zzk1cfg
	5aXxP3h8=
X-Gm-Gg: ASbGncsatydBD5GnTq/EoiLdZVqNcow0OM3RseG6gXcPk7iWK2UHd9Auqmk94/WeALl
	X03VMe6YGMmxZ6IFk0fca5a2oF7wVCSCvhV/S9tKtTEORCfoehI9y6ZXA9VS/T+W8vWb1XsfKYO
	LqyDM5RqBdp2kqamfmqde6d6v/otAOpqAMOSX9p13fWAN6T3pfbnSz1LRkQi+7VpoqLOLsHxtWM
	bEKCYKs/0QgGxZeIbnk3ZXFErLpCpw18VocnjUd4BAGJ/2mDRXHPov1T91LP9hUhclOwxeJwe8C
	nLlzGlwMDh4+Y/h9r8gmKgrd2JkRSfRnGd4ZOE9RXqZm0wBfmRvwKcJDKEQayDTHIS/whxtjvuu
	xruY7H8LrBmzKmc0WXhJ9QIBB+dw6lqagwKNThYIfExvPiizaK5knyK6w1rK/nB2Hq4t/5H1Pk+
	F8qDun
X-Google-Smtp-Source: AGHT+IG6XiwalBZI+HF+6FSEn1dOOBMyBSNJ4jVON0f2nwHMWIe/E/2yBcMPHLtYBrsNRUALDi6lDg==
X-Received: by 2002:a05:6a00:2e85:b0:781:457:49dc with SMTP id d2e1a72fcca58-7a220d396f9mr17526080b3a.30.1761013807259;
        Mon, 20 Oct 2025 19:30:07 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff39437sm9603207b3a.27.2025.10.20.19.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 19:30:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 606da5bb165594c052ee11de79bf05bc38bc1aa6
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 21 Oct 2025 02:30:06 -0000
Message-ID: <176101380587.4803.5529748509749601619@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/606da5bb165594c052ee11de79bf05bc38bc1aa6/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 606da5bb165594c052ee11de79bf05bc38bc1aa6
origin: maestro
test start time: 2025-10-20 04:11:08.300000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  142 ✅    6 ❌    0 ⚠️
Tests: 	 6766 ✅  249 ❌ 1474 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68f5bbd19533132a1892e140
      history:  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_utimer-test_global_wrong_timers_test
      last run: https://d.kernelci.org/test/maestro:68f5bf199533132a1892f631
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_display-subsystem
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930084
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_ldb
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930082
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_ssi_2028000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a1893005f
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_audmux_21d8000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930058
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930057
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_1000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930056
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930055
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_130000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930045
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_134000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930044
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_120000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930043
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2400000
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a18930064
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a1893003f
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_utimer-test_global_wrong_timers_test
      last run: https://d.kernelci.org/test/maestro:68f5c09e9533132a1892f7dd
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_display-subsystem
      last run: https://d.kernelci.org/test/maestro:68f5c4129533132a189303d5
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_ldb
      last run: https://d.kernelci.org/test/maestro:68f5c4129533132a189303d3
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_ssi_2028000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a189303b1
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_audmux_21d8000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a189303aa
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a189303a9
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_1000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a189303a8
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a189303a7
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_130000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a18930397
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_134000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a18930396
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_2204000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a18930395
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_120000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a18930394
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2400000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a18930392
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2800000
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a18930391
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a1893038d
      history:  > ✅  > ❌  > ❌  > ❌  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_audio-codec-bt-sco
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932eb8
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_funnel
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932eaa
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_hdmi-connector
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932ea9
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_native-hdmi-connector
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932ea8
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_snvs_30370000_snvs-powerkey
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e8a
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_snvs_30370000_snvs-rtc-lp
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e89
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_tmu_30260000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e84
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30660000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e81
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30670000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e80
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30690000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e7f
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e79
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e78
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_dma-controller_30bd0000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e76
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_ethernet_30bf0000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e73
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a40000_codec_1a
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e6b
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_spba-bus_30800000_can_308c0000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e64
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_dma-controller_30e00000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e5c
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_dma-controller_30e10000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e5b
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_audio-controller_30ca0000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e58
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_easrc_30c90000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e57
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_sai_30c20000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e56
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_sai_30c30000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e55
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_display-bridge_32fc4000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e4f
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_display-controller_32fc6000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e4d
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_dsi_32e60000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e4c
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_hdmi_32fd8000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e4a
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_phy_32fdff00
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e47
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ddr-pmu_3d800000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e46
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_38000000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e3d
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_38008000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e3c
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_npu_38500000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e37
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e32
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb-phy_382f0040
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e34
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_38300000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e31
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_38310000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e30
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-bt-sco
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e2f
      history:  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e2c
      history:  > ✅  > ❌  > ❌  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_i2c_7ffa0000_hdmi-transmitter_70
      last run: https://d.kernelci.org/test/maestro:68f5d1aa9533132a18930a67
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_i2c_7ffa0000_hdmi-transmitter_71
      last run: https://d.kernelci.org/test/maestro:68f5d1aa9533132a18930a66
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_4000000_can_4e08000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932285
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_4000000_m4fss_5000000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932280
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_r5fss_78000000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932271
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_rtc_2b1f0000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893226f
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_temperature-sensor_b00000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893226c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_can_20701000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893226a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_crypto_40900000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932269
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_adc_49
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893225b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893225a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_rtc_32
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932258
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_sensor_48
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932257
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20010000_eeprom_57
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932254
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20010000_sensor_4f
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932253
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mailbox_29000000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893224d
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mmc_fa20000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893224a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932248
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_interrupt-controller_20000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932246
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_34000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932245
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_38000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932244
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pwm_23000000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932243
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pwm_23010000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932242
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_serial_2850000_bluetooth
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893223e
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spi_20110000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893223d
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spi_20110000_tpm_1
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893223c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spinlock_2a000000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893223b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e000000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893222d
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e010000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893222c
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e020000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893222b
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e030000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893222a
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e0f0000
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a18932229
      history:  > ✅  > ✅  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:68f5ef859533132a1893220d
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.hibernate
      last run: https://d.kernelci.org/test/maestro:68f5bc529533132a1892e2af
      history:  > ✅  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.hibernate.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f5c0999533132a1892f7d1
      history:  > ✅  > ✅  > ❌  
            
Hardware: dell-latitude-5400-8665U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f5bc5a9533132a1892e2fe
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f5be389533132a1892f451
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68f5c1099533132a1892f99b
      history:  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:68f5ee9a9533132a18932180
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kernelci_sleep
      last run: https://d.kernelci.org/test/maestro:68f5bc469533132a1892e23a
      history:  > ❌  > ✅  
            
Hardware: dell-latitude-5400-4305U-sarien
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f5bc5a9533132a1892e2fb
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f5c12f9533132a1892fa87
      history:  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68f5bf9d9533132a1892f67f
      history:  > ✅  > ⚠️  > ✅  
            
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200_usb-port_1
      last run: https://d.kernelci.org/test/maestro:68f5c2089533132a1893004a
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200_usb-port_1
      last run: https://d.kernelci.org/test/maestro:68f5c4119533132a1893039c
      history:  > ✅  > ⚠️  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_ethernet_30bf0000_mdio_ethernet-phy_1
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e71
      history:  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_etf_28c04000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e44
      history:  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_etr_28c06000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e3f
      history:  > ✅  > ⚠️  > ⚠️  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_28c03000
      last run: https://d.kernelci.org/test/maestro:68f5f98e9533132a18932e3e
      history:  > ✅  > ⚠️  > ⚠️  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68f5bc579533132a1892e2e0
      history:  > ✅  > ✅  > ❌  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68f5bdaf9533132a1892ebb8
      history:  > ✅  > ❌  > ✅  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-12
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:68f5bf9c9533132a1892f679
      history:  > ✅  > ⚠️  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

