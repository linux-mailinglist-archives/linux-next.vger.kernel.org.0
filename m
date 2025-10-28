Return-Path: <linux-next+bounces-8731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2AAC12A98
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 03:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80FB94E19EE
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 02:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0BA253340;
	Tue, 28 Oct 2025 02:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="do2HUSgA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BCC2C190
	for <linux-next@vger.kernel.org>; Tue, 28 Oct 2025 02:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761618626; cv=none; b=aNyPPb/WBqPetctJyppwDd+C3Xsky/1CUvCp10YctX9plP55146zNpgAcgnzTa8fYPQ+S9w/RHvGjGxKD2/OIDdb/hyAKADkoapKIe/sBkfAJxQ0gS8KfFVe31Q78a8WmUFm5GGJn/GpBZaG38wp0KFrWgQnBh8sgBttYotYEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761618626; c=relaxed/simple;
	bh=bbE2II5FFky6Vh8mQbPZxR+a+xL3xD18fkx1XaSWweo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=P2MoxxoxdjyCZ/OSna+kGwHHAgeSFuzOatrggKiAs7QUbl4rOn5uf7PC1U3WVoEFM5ku9pex9PSrS9t9mLLZghZ+zppmUIc2Op+VTeS/sX4LohVQ/9obWhjReeeHy+7XfWOTJUACP2ex3itumkE6/yieZm0SyluAi35FWWtvnxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=do2HUSgA; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6cf1a95273so3959834a12.1
        for <linux-next@vger.kernel.org>; Mon, 27 Oct 2025 19:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761618623; x=1762223423; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TBa2Yq1JjoBVKhY0OrzN/FZmSuh+kDtcSwJyMqnDRs=;
        b=do2HUSgAUGwCsJH5kJRr6WQkAUZmbdBL2R9dRGcYafatwgGm6rezm6oAV5oVl+YD5P
         L9eJNAQlqpfHYV03JHd07UncCnQmVYFzd1QoyIN0qcc/HfZ0/FI3lvlruxeHbon+L+PB
         t/6FwQrM/wqcmw/uIlRYvjhs3OtuaoBs1D/TBatQRtWwmEniSD2gGTCz1hDM5yPnPH7x
         PFGRwj6xfQxM2NBev9TRpTFJxQQ4dGv5Wc+keqN21JeCSx2wwmGNuq2DIjPnXCtaecg+
         CEKCR3aJfss/ahDOJ2qUBz23Z4YXqfSOmJfOa8RBtcz5CxfR+K4h/aPdNghSoW72lsgw
         OjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761618623; x=1762223423;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+TBa2Yq1JjoBVKhY0OrzN/FZmSuh+kDtcSwJyMqnDRs=;
        b=dYeEQJP/sKj8VfwagUvNwckhEXVjiwi9/OPJy9jrmLWgtpzP6X4VnU5VjyWkUWpfjz
         h9dg7mwOBHqkPU8bzI2pFEjsaOqqb03mrx2MMlMD90UxuxK3MGR5E5K5TD4npWan3Jq7
         F3u2A9id+TqRHHbebLO/DvazFQyOI2aIEbT8pmzMuweKG963s69BL1hHZjMjZO5m8ODl
         EvMB1SKooW2HEt5TITkTEYKZ5z0/HczMdLywORZQEZubsEMU6B/hUekxuMgePRQwp+bL
         U8tP/V2381XQE3e/fG5U8KRZZBQrdHIWavvSMv6lhvIDGannGKs4G5e39NHlu2faYXDu
         gsQg==
X-Gm-Message-State: AOJu0YwVpWMWRp6atUOD4LUFPrFlVBf2B9SvSNzAeE/hEe9oSt5N2tgN
	WiEQnPL638WuUiheM/u12+LqtUJQuid8ybGgkIerfa2ENg+1ROz5CpogyDm2/wH9Ih1vlHgj9VR
	jl7XRz1I=
X-Gm-Gg: ASbGncsH/erKjua0MzRp3++uUbZmUy3hR2Q/6RwtPfDQkrmSVLfo0lMJb0fhUBeOOWI
	HRPyLb4ihgs4iddIpE4jEh7b/fjgECokCc5YoUccfuTlYw+E51JFZVMBl8KRD8yC/FrOf1nMgzY
	GCHch/ZWHdCjQwYBFh4dVE9ZL4cSOhmuXVPPlU0PHBDjzlIWPnygcJkJR/DRfJnbXot5kPrVMAw
	IWnGp5fuL23RWovwjOzB56XBr/e+GoSWYxj0M3D9nKXyHjF5qz9qDGm6J13lh7GXjdKWYp+5/yZ
	dx480mYxNs24sP1g/n7qWx9iyfBEMDSDryPYvZdrLIXEWRtolXZjL52rZ5PaEGVigs8H+oM/FFw
	tBhyyIx0lFL+k853Q9wB5xsG3VChLZHBFSSCCenkBykd8wVnGRIdku6WmGYAzqQbZeQTh2Q==
X-Google-Smtp-Source: AGHT+IE5QZjHmw6EXFJwywqHetSaqbqU9RwFrpsiFrB1Tu0TMDwekl5JmgMi+XqjcssZSkosDHp7vA==
X-Received: by 2002:a17:902:f691:b0:28d:1815:6382 with SMTP id d9443c01a7336-294cb51a504mr22824865ad.46.1761618622977;
        Mon, 27 Oct 2025 19:30:22 -0700 (PDT)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6035sm10188281a91.17.2025.10.27.19.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 19:30:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 28 Oct 2025 02:30:22 -0000
Message-ID: <176161862179.241.1512619961116347293@efdf33580483>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
origin: maestro
test start time: 2025-10-27 04:17:08.169000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  144 ✅    2 ❌    0 ⚠️
Tests: 	 9112 ✅ 4866 ❌ 4178 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:68fefaa4417a3386b1d81af5
      history:  > ✅  > ✅  > ❌  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:68fefee7417a3386b1d84ed0
      history:  > ✅  > ✅  > ❌  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:68fefd8f417a3386b1d83c50
      history:  > ✅  > ✅  > ❌  
            
Hardware: acer-chromebox-cxi5-brask
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:68fef83a417a3386b1d7ebfc
      history:  > ✅  > ❌  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:68fefa1c417a3386b1d8138d
      history:  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_utimer-test_global_wrong_timers_test
      last run: https://d.kernelci.org/test/maestro:68fefa0d417a3386b1d80f07
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_display-subsystem
      last run: https://d.kernelci.org/test/maestro:68fefc6a417a3386b1d82a40
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_ldb
      last run: https://d.kernelci.org/test/maestro:68fefc6a417a3386b1d82a3e
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_ssi_2028000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a1c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_audmux_21d8000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a15
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a14
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_1000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a13
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a12
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_130000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a02
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_134000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a01
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_120000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a00
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2400000
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d829fe
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d829fb
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa.alsa_utimer-test_global_wrong_timers_test
      last run: https://d.kernelci.org/test/maestro:68fefa11417a3386b1d81143
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_display-subsystem
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e9e
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_ldb
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e9c
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_ssi_2028000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e79
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_audmux_21d8000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e72
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e71
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_1000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e70
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e6f
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_130000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e5f
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_134000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e5e
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_gpu_2204000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e80
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_120000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e5d
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2400000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e5b
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_ipu_2800000
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e5a
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e56
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            
Hardware: juno-uboot
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_i2c_7ffa0000_hdmi-transmitter_70
      last run: https://d.kernelci.org/test/maestro:68ff00ae417a3386b1d865dd
      history:  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_i2c_7ffa0000_hdmi-transmitter_71
      last run: https://d.kernelci.org/test/maestro:68ff00ae417a3386b1d865dc
      history:  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_4000000_can_4e08000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85b0e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_4000000_m4fss_5000000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85b09
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_r5fss_78000000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85afa
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_rtc_2b1f0000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85af8
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_bus_b00000_temperature-sensor_b00000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85af5
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_can_20701000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85af3
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_crypto_40900000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85af2
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_adc_49
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ae4
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ae3
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_rtc_32
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ae1
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20000000_sensor_48
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ae0
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20010000_eeprom_57
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85add
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_i2c_20010000_sensor_4f
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85adc
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mailbox_29000000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ad6
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mmc_fa20000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ad3
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ad1
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_interrupt-controller_20000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85acf
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_34000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ace
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pruss_30040000_pru_38000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85acd
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pwm_23000000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85acc
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_pwm_23010000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85acb
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_serial_2850000_bluetooth
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ac7
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spi_20110000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ac6
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spi_20110000_tpm_1
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ac5
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_spinlock_2a000000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ac4
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e000000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ab6
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e010000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ab5
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e020000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ab4
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e030000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ab3
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_watchdog_e0f0000
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85ab2
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:68feffc4417a3386b1d85a95
      history:  > ❌  > ❌  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.alsa.alsa_utimer-test_global_wrong_timers_test
      last run: https://d.kernelci.org/test/maestro:68fefd8f417a3386b1d83c1e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_audio-codec-bt-sco
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88591
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_funnel
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88583
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_hdmi-connector
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88582
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_native-hdmi-connector
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88581
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_snvs_30370000_snvs-powerkey
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88562
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_snvs_30370000_snvs-rtc-lp
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88561
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30000000_tmu_30260000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8855c
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30660000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88559
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30670000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88558
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30400000_pwm_30690000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88557
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88551
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_crypto_30900000_jr_2000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88550
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_dma-controller_30bd0000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8854e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_ethernet_30bf0000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8854b
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a40000_codec_1a
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88543
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_spba-bus_30800000_can_308c0000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8853c
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_dma-controller_30e00000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88534
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_dma-controller_30e10000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88533
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_audio-controller_30ca0000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88530
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_easrc_30c90000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8852f
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_sai_30c20000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8852e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30c00000_spba-bus_30c00000_sai_30c30000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8852d
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_display-bridge_32fc4000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88527
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_display-controller_32fc6000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88525
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_dsi_32e60000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88524
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_hdmi_32fd8000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88522
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_32c00000_phy_32fdff00
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8851f
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_ddr-pmu_3d800000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8851e
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_38000000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88515
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_gpu_38008000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88514
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_npu_38500000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8850f
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb_32f10108_usb_38200000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8850a
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_usb-phy_382f0040
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8850c
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_38300000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88509
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_video-codec_38310000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88508
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-bt-sco
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88507
      history:  > ❌  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88504
      history:  > ❌  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200_usb-port_1
      last run: https://d.kernelci.org/test/maestro:68fefc69417a3386b1d82a07
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200_usb-port_1
      last run: https://d.kernelci.org/test/maestro:68fefca4417a3386b1d82e64
      history:  > ⚠️  > ⚠️  > ⚠️  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_ethernet_30bf0000_mdio_ethernet-phy_1
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88549
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_etf_28c04000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d8851c
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_etr_28c06000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88517
      history:  > ⚠️  > ⚠️  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_funnel_28c03000
      last run: https://d.kernelci.org/test/maestro:68ff01eb417a3386b1d88516
      history:  > ⚠️  > ⚠️  > ✅  
            



This branch has 9 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

