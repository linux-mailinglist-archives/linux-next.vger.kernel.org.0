Return-Path: <linux-next+bounces-9653-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FD7D1C230
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 03:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 260E7301926B
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 02:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DF4301015;
	Wed, 14 Jan 2026 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="H/+0SKHm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD12FF172
	for <linux-next@vger.kernel.org>; Wed, 14 Jan 2026 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768357810; cv=none; b=c2TJ/75O1tcKo3ZSquWYnwdoQ53VZcpH034adpqLF0CYMC5l4I3O+ac75pw6pzrrS5AWemB9viI/A48sV6v1YaG0t4T+vPAC3tHv4dYRJeSn/Q4zEy0erNOYOobaThlI+2/9V3HaCtEsUd5wYUzgCgt5rhqoytKoZGV7Vr3fbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768357810; c=relaxed/simple;
	bh=KJzDdx7mqfCCFSyVSkosSWRy+xzLIvIzBLYdbtSWjqo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=K9MbOBz0Z0IaJu52wGee31Y3FhHIERv5WAg1dw52ZF0SbDZbFI5FcQ/t1XDEkFI/r8s0gDPYOnn9jM1XDDCLgMqYFH71dc3UvF/4V88Pf17iW1vmTdVkNZmtlNjW70ISGMbegjd/Qe3TzbtDymQdqlcHrKzewU8fBxvGHKi68lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=H/+0SKHm; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-121b14d0089so9269405c88.0
        for <linux-next@vger.kernel.org>; Tue, 13 Jan 2026 18:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1768357807; x=1768962607; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxypAh5zMKBpgunFZZrE+LtaVoytFDHkhLqaeeuy8dU=;
        b=H/+0SKHmG6UA06BKh1HWaEWRq3PwuX3dBCQa5jSyYX0Kk7osVuEbLnSeFwYrNEQ6HG
         FGEFP9ZQr4VC2FHflhxXWRUR93vtLTpKHNScupP2O3tqUGBQ/MhbXmg5X3L2xxTCRRRz
         Ja1Dd2bh9OLtag1sp/cKSAmc5ikHEn1A+6zprYDziaYMHVoDyi7KWIClJR+jWhp7Lieb
         QzkwQf8KLAKwFS79yCCgoSfU7YRz0XBAV9iHE+LpK4syPS1X0qKwz8RBbHhA789obSd7
         ALiLcJ3NQWNzMlXT7DdtxbL2m0Ti5OzwXKF+C18CxMtP0ITVDABY0zMT9HLuQErF7GfF
         WTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768357807; x=1768962607;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxypAh5zMKBpgunFZZrE+LtaVoytFDHkhLqaeeuy8dU=;
        b=vHSRfaNl+v5ypXaup6EdjWP8sFOl+VPHzssNWHk7xxO2d9ASi6LAoVvP7TYJEUrfnr
         YYX4e5KSKvJ/e94wGvl2gWU9DCQeXiAvbehBUPvXnhOOqGg/I1WTHPcHA6CtqT+28QXI
         OD+PEI2WeQGSQ3WvsBty3tgf6mMMMvvPsIe80pwFiHWyc5Ycqrx+sbQ7vkm3jEj1bPLw
         ElREp7w07gBuLl7HjXyTLsQJMECl1D8NcbUXC/4Lmh74QX98bC5rP9BhndG6t/XmwBnu
         /VwWkQ4D8+eVdDU/dBq+sKhWEPMiTRY6By0oVDV2mBZPeVwEjVHULQL7cFG1sRcATPCS
         horw==
X-Gm-Message-State: AOJu0YyUi54rGQngv2yL3P6Hs9yig+T36k1yfsfAS5ItqNtB65Peeu/7
	1ynixE4ECqDkECQIJxfBRwk9kSWJAdmIgQhHKFYn0RS4cmY/08G2ciImhy7WodkwUjjbllXMMO/
	GK7grf9c=
X-Gm-Gg: AY/fxX5mElGWfGguWLW79oIeOINUuZwVtFseX46D+f9XpPbYmfgueBDEDoVXIXnJUkV
	CLopdKGbdoxIA/qr/AeBVJTarZMlVx53TM7EU1GXvukGgliEvwc3P5APDNcVG18Uj1zDZxEpKEU
	xMkqVuzKt6DUQNUJ2sWcef5fCgMOUJocOGn7mEdkCCeoBGm7j1JM4a3ueL7NiU56fCus1X+1dPN
	0B390ALAS347thnpUic1Oc8wv8OTYjRSVu/cluON1iWjUJdwjvClc+ZpgTuK3tmnh2enj71dLmi
	rewyRuv4qXWZxqnLmUUEPWmFHcdR593DZoTzrYYpx3qKX88zt13Yr1Pqqjk5heh0yk3Tw6WHNHh
	uj5J5+ZeCZWoMDb6wwgbQzZ+/mIIoRWYFS37hdbTU2uldQLrTCf9+nEMAmFIBDzy0BRb9IYVdnR
	gMk4Gj
X-Received: by 2002:a05:7022:fc06:b0:119:e56b:989d with SMTP id a92af1059eb24-12336a0c413mr1047869c88.4.1768357807172;
        Tue, 13 Jan 2026 18:30:07 -0800 (PST)
Received: from 1c5061884604 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm22735218c88.0.2026.01.13.18.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:30:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 0f853ca2a798ead9d24d39cad99b0966815c582a
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 14 Jan 2026 02:30:06 -0000
Message-ID: <176835780597.3065.14960962026715247279@1c5061884604>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/0f853ca2a798ead9d24d39cad99b0966815c582a/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 0f853ca2a798ead9d24d39cad99b0966815c582a
origin: maestro
test start time: 2026-01-13 06:51:31.674000+00:00

Builds:	   53 ✅    2 ❌    0 ⚠️
Boots: 	   66 ✅    0 ❌    0 ⚠️
Tests: 	12875 ✅ 1731 ❌ 4520 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:6966099eb2a19cc73aaab0c0
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab553
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_leds
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab551
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-cam1
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab55d
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-sd-io-1v8
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab55c
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_regulator-sd-vcc
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab55b
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_7ef00700
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab531
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hdmi_7ef05700
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab530
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_hvs_7e400000
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab52f
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mailbox_7e00b840
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab527
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_7e300000
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab525
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_serial_7e201000_bluetooth
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab51c
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_watchdog_7e100000
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab556
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab554
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:6965f838b2a19cc73aaa6152
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69660347b2a19cc73aaa9eee
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:696601d4b2a19cc73aaa9123
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8192-asurada-spherion-r0
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69660224b2a19cc73aaa9426
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69660328b2a19cc73aaa9dc8
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-kingoftown
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69660234b2a19cc73aaa9555
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: sc7180-trogdor-lazor-limozeen
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.exec.exec_execveat
      last run: https://d.kernelci.org/test/maestro:69660a8db2a19cc73aaab612
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.device_error_logs
      last run: https://d.kernelci.org/test/maestro:6966097eb2a19cc73aaaafac
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.device_error_logs.devices_error_logs_test_device_error_logs_py
      last run: https://d.kernelci.org/test/maestro:6966202eb2a19cc73aaae798
      history:  > ❌  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:69660efdb2a19cc73aaad4c1
      history:  > ❌  > ✅  
            
Hardware: k3-am625-verdin-wifi-mallow
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_bus_f0000_mmc_fa20000
      last run: https://d.kernelci.org/test/maestro:69660c17b2a19cc73aaac9ad
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:69660c17b2a19cc73aaac96c
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:696601b1b2a19cc73aaa8ff1
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:696601b1b2a19cc73aaa9013
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000
      last run: https://d.kernelci.org/test/maestro:69660147b2a19cc73aaa8b10
      history:  > ❌  > ✅  > ✅  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_wifi-pwrseq
      last run: https://d.kernelci.org/test/maestro:69660147b2a19cc73aaa8aad
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8390-genio-700-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11e01000_rt1715_4e
      last run: https://d.kernelci.org/test/maestro:69660dbcb2a19cc73aaace90
      history:  > ❌  > ✅  > ✅  > ✅  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_i2c_11d01000_pmic_34_tcpc
      last run: https://d.kernelci.org/test/maestro:69660e36b2a19cc73aaacfba
      history:  > ❌  > ✅  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6965fd5bb2a19cc73aaa776c
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_usb_7e980000
      last run: https://d.kernelci.org/test/maestro:69660a42b2a19cc73aaab557
      history:  > ✅  > ✅  > ⚠️  > ⚠️  > ⚠️  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:6965fd5eb2a19cc73aaa7773
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:6966030bb2a19cc73aaa9d13
      history:  > ❌  > ❌  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:69660397b2a19cc73aaa9fef
      history:  > ❌  > ❌  > ✅  > ❌  
            
Hardware: mt8183-kukui-jacuzzi-juniper-sku16
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_qca-wifi_1
      last run: https://d.kernelci.org/test/maestro:696601b1b2a19cc73aaa8ff0
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: mt8186-corsola-steelix-sku131072
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_mmc_11240000_bluetooth_2
      last run: https://d.kernelci.org/test/maestro:69660147b2a19cc73aaa8b0f
      history:  > ⚠️  > ✅  > ✅  > ✅  
            
Hardware: mt8195-cherry-tomato-r2
  > Config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
    - Architecture/compiler: arm64/gcc-14
      - fluster.debian.v4l2.gstreamer_h264.validate-fluster-results
      last run: https://d.kernelci.org/test/maestro:696601f4b2a19cc73aaa923d
      history:  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f08000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c71
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f09000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c70
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f0a000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c6f
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f23000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c6e
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f24000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c6d
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_dma-controller_14f25000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c6c
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c48
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_0
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c47
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c46
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_1_0
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c45
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c44
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_0_0
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c43
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-encoder_1a030000_jpgenc_1_0
      last run: https://d.kernelci.org/test/maestro:69660167b2a19cc73aaa8c42
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000
      last run: https://d.kernelci.org/test/maestro:69660166b2a19cc73aaa8bfd
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_10000
      last run: https://d.kernelci.org/test/maestro:69660166b2a19cc73aaa8bfc
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_2000
      last run: https://d.kernelci.org/test/maestro:69660166b2a19cc73aaa8bfb
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_18000000_video-codec_25000
      last run: https://d.kernelci.org/test/maestro:69660166b2a19cc73aaa8bfa
      history:  > ❌  > ✅  > ❌  > ✅  
            
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_video-codec_1a020000
      last run: https://d.kernelci.org/test/maestro:69660166b2a19cc73aaa8bf9
      history:  > ❌  > ✅  > ❌  > ✅  
            
Hardware: qemu
  > Config: defconfig+preempt_rt
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:69660553b2a19cc73aaaa761
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.cyclictest
      last run: https://d.kernelci.org/test/maestro:69660556b2a19cc73aaaa767
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:69660558b2a19cc73aaaa76d
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.pmqtest
      last run: https://d.kernelci.org/test/maestro:6966055bb2a19cc73aaaa788
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.ptsematest
      last run: https://d.kernelci.org/test/maestro:6966055eb2a19cc73aaaa78e
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:69660565b2a19cc73aaaa7b5
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.sigwaittest
      last run: https://d.kernelci.org/test/maestro:69660567b2a19cc73aaaa7b8
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:69660569b2a19cc73aaaa7bb
      history:  > ✅  > ✅  > ✅  > ⚠️  > ✅  
            



This branch has 2 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

