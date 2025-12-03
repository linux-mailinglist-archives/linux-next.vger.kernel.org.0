Return-Path: <linux-next+bounces-9311-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FAFC9D938
	for <lists+linux-next@lfdr.de>; Wed, 03 Dec 2025 03:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C02DB3A66E4
	for <lists+linux-next@lfdr.de>; Wed,  3 Dec 2025 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF00A36D507;
	Wed,  3 Dec 2025 02:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uINIT8eq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A278139D
	for <linux-next@vger.kernel.org>; Wed,  3 Dec 2025 02:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729028; cv=none; b=Gkyk9Bvd+tSA1/pele+HKVXkN34hlZEF7fIkdlFCdAs87fqVo52kLqYeNpCWv7V6HGeNXVrZdaX2LLhpHG0D3wwVnlEKEaGqhfebkwtgJIN7V+QxuU/egiYaRFONg5MUNjQkbfiYJDVZQ9OZnuh/KQqYwJyb8F4+a2DvhB+sPxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729028; c=relaxed/simple;
	bh=hTCryuiCg0wI0KMD+jx6UYPAbZpVuTGkDcD8VUyTFBE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=SLTuEaMN9Ucq8htcNqNv+On6IVZg8M96DtUgCs/W4lVK9xVJXgJY0LX14Pvx3kNjZjrN+2r4SPoIiJ/83xB1PeiJz9cNYL6E+/QCo+m4UNAfNT/jQ/i04PalMpSuBHSJuYOaPJeR0QNvUEFl5M1NWesluIP1CQsh7LGu/eNoKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uINIT8eq; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso5361145a12.3
        for <linux-next@vger.kernel.org>; Tue, 02 Dec 2025 18:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764729026; x=1765333826; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tl14CrxrepUeMRLfBF1B7gNSNJRSAOqcsxsIiISd8M=;
        b=uINIT8eqEHa9wdW8BBrT+3fpmNtBipqiOMniSgxjYsSaNtShVUPDgOngOWffESYpWv
         IT7An9hDcIB+yBOww7cEHNqpexXigQVgnO09pkKMMpWRtna43kzgBPKfg5xvPTdxL+PM
         vBPl9gUqz87EPpKCt8LtCFea2qDTjuYEF6CubRKqvdxU+ibpLZ+Fs72PJuee6QrdI+jj
         2u3cIThytLNeWPFHyKGo8nmSXvdQxbG/d+V8aHZcbINYG3pG9pbSXDW+02apan/POky3
         fPsC7s1KUx7B2rg+iIapvr7aA33Hwk349npHLO/K8G8//Jg4AJE8ReBEltXPnls+e8kP
         cDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764729026; x=1765333826;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tl14CrxrepUeMRLfBF1B7gNSNJRSAOqcsxsIiISd8M=;
        b=HM3gmsmohGhO7iCZIB84cF2MOFLYQOqZi1L7CcjyZU2O8nnj8Gz1f6BVjFlWDSE+Ho
         m6wysMQc+c4bZvXquIZdMYUKHeOR5tIxV44SLgh5NN+a+J4O2RBHXKNUXTFg/jzFF8yC
         ChnEe0jmBEdKCush1EzXIAEEgWnDEr01jTbhQdc+bt/qQO2c5p3euWDlON6J1rUVJW51
         O50T8ox5bKpmT5EMgbtmgnVR5Lw2ASNaYXNx4F49yAJzA1JsskeKRDrrtHkuqp4IX4NC
         JomD3CiscMrRTA47oQcIz3sJlstR9elYUGWm5qLM05RlIxJoTZiTFRynKtnXIXnKckoy
         VrDA==
X-Gm-Message-State: AOJu0Yy9k1fcWHwl3IBK5xxr2OEUnpoK+AIsGHEYxEfCfKpLpcGZc4bQ
	Zosf8+IvZZ6Tr0YXThMrqyPh2LHuTiazLcPPybYBtZ4LP3994IZZCC9A+u8UQx0NZ3cZ7YPalqJ
	3ev/K+H4=
X-Gm-Gg: ASbGncuvUiVxfPpdsqptTWvTr+IOwXywkhjU/AzB8sjit52vvGnOViyznmMGq6U8AhZ
	+HVcmyFJAg76JPm4JlF3DEjVKZpK7ixJXcTrq4Cz9PfyXa1HXX0ZoEZPtioDiee1jDiISSAdD4F
	XGzDFMOFBLgPyoHkMoKuuQpTcUQeLReOm03X+cKay/BNfwgDMdshqYyworHsNuzwSzCw9ihs1zr
	YMp+Tskv1him8bGbgbEvqhyWiWSkveP5TgTK3MNzENP6Yub+at3wOpOANIwm4oCVGaXYjVAKaBY
	Vm3nc6T5h3Rooyl9g8F7pTD5LHq/0d1Ty3z5jd9Wpg97AOWvVuhGKOtQdUXl8eUUU5DH+9Ozq1d
	CpmRtookxvQ4FqfkYROuZ4NDTA/SEiydh8mfT2o6yxp/l8YJN3pNASVnf4NjWzzjY7ClieacOQd
	4gu/FEgiV0XwbDXSI=
X-Google-Smtp-Source: AGHT+IFxdW/dHfBQebNB5uN6WllgxGev8hPyh0MKnrrYVJjpSjpVJdpTXhT2QiP4JcVfo9Xy4wytHg==
X-Received: by 2002:a05:7300:ec16:b0:2a4:3593:6468 with SMTP id 5a478bee46e88-2ab92e5276amr626777eec.24.1764729025860;
        Tue, 02 Dec 2025 18:30:25 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9655ceb04sm59485153eec.1.2025.12.02.18.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 18:30:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 47b7b5e32bb7264b51b89186043e1ada4090b558
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 03 Dec 2025 02:30:24 -0000
Message-ID: <176472902440.3624.17527119334149982483@1ece3ece63ba>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/47b7b5e32bb7264b51b89186043e1ada4090b558/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 47b7b5e32bb7264b51b89186043e1ada4090b558
origin: maestro
test start time: 2025-12-02 05:48:08.951000+00:00

Builds:	   44 ✅   10 ❌    0 ⚠️
Boots: 	  148 ✅    4 ❌    0 ⚠️
Tests: 	13783 ✅ 1121 ❌ 5106 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.alsa.alsa_mixer-test
      last run: https://d.kernelci.org/test/maestro:692e8debf5b8743b1f720ca2
      history:  > ✅  > ✅  > ✅  > ❌  
            
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_svs_1100bc00
      last run: https://d.kernelci.org/test/maestro:692e8d9ef5b8743b1f720709
      history:  > ✅  > ✅  > ❌  > ❌  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-proc-ramdisk.proc_read
      last run: https://d.kernelci.org/test/maestro:692e9daef5b8743b1f726d4e
      history:  > ✅  > ✅  > ✅  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: mt8395-genio-1200-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_jpeg-decoder_1a040000_jpgdec_0_10000
      last run: https://d.kernelci.org/test/maestro:692e8d9ef5b8743b1f720755
      history:  > ❌  > ❌  > ✅  > ✅  
            
Hardware: acer-chromebox-cxi4-puff
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-14
      - kselftest.cpufreq.suspend
      last run: https://d.kernelci.org/test/maestro:692e8bbbf5b8743b1f71df0b
      history:  > ❌  > ✅  
            
      - kselftest.cpufreq.suspend.cpufreq_main_sh
      last run: https://d.kernelci.org/test/maestro:692e8d73f5b8743b1f71ffc7
      history:  > ❌  > ✅  
            


### UNSTABLE TESTS
    
Hardware: acer-R721T-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692e89f6f5b8743b1f71cf71
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: beaglebone-black
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - ltp
      last run: https://d.kernelci.org/test/maestro:692e93b0f5b8743b1f72247a
      history:  > ❌  > ❌  > ✅  > ✅  > ❌  
            
Hardware: hp-11A-G6-EE-grunt
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692e89f6f5b8743b1f71cf77
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: imx6q-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-14
      - kselftest.alsa.alsa_mixer-test_event_spurious_fslimx6qudooac9_3
      last run: https://d.kernelci.org/test/maestro:692e8668f5b8743b1f71c191
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_10
      last run: https://d.kernelci.org/test/maestro:692e8668f5b8743b1f71c1c7
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_22
      last run: https://d.kernelci.org/test/maestro:692e8668f5b8743b1f71c21b
      history:  > ✅  > ❌  > ✅  > ✅  
            
      - kselftest.alsa.alsa_mixer-test_name_fslimx6qudooac9_8
      last run: https://d.kernelci.org/test/maestro:692e8668f5b8743b1f71c1b9
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: imx8mp-evk
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_sound-wm8960
      last run: https://d.kernelci.org/test/maestro:692e920ff5b8743b1f7220cf
      history:  > ✅  > ✅  > ❌  > ✅  
            
Hardware: imx8mp-verdin-nonwifi-dahlia
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest.dt.dt_test_unprobed_devices_sh_soc_0_bus_30800000_i2c_30a50000_eeprom_50
      last run: https://d.kernelci.org/test/maestro:692e8eaff5b8743b1f7210a7
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-14
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:692e86ecf5b8743b1f71c73c
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:692e87aef5b8743b1f71c9a3
      history:  > ❌  > ❌  > ❌  > ✅  > ❌  
            
Hardware: qcs6490-rb3gen2
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-proc-ramdisk.proc_read
      last run: https://d.kernelci.org/test/maestro:692ece06f5b8743b1f731610
      history:  > ✅  > ❌  > ✅  > ✅  
            
Hardware: qemu
  > Config: defconfig+preempt_rt
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.cyclicdeadline
      last run: https://d.kernelci.org/test/maestro:692e8544f5b8743b1f71be68
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.cyclictest
      last run: https://d.kernelci.org/test/maestro:692e8544f5b8743b1f71be6e
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692e8545f5b8743b1f71be74
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.pmqtest
      last run: https://d.kernelci.org/test/maestro:692e8545f5b8743b1f71be7a
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.ptsematest
      last run: https://d.kernelci.org/test/maestro:692e8546f5b8743b1f71be80
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.rtla-osnoise
      last run: https://d.kernelci.org/test/maestro:692e8547f5b8743b1f71be8c
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.rtla-timerlat
      last run: https://d.kernelci.org/test/maestro:692e8548f5b8743b1f71be92
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:692e8547f5b8743b1f71be86
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.signaltest
      last run: https://d.kernelci.org/test/maestro:692e8548f5b8743b1f71be98
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.sigwaittest
      last run: https://d.kernelci.org/test/maestro:692e8549f5b8743b1f71be9e
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
      - rt-tests.svsematest
      last run: https://d.kernelci.org/test/maestro:692e854af5b8743b1f71befd
      history:  > ✅  > ✅  > ⚠️  > ✅  > ✅  
            
Hardware: x1e80100
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - kselftest-timers-ramdisk.timers_rtcpie
      last run: https://d.kernelci.org/test/maestro:692e9fa0f5b8743b1f7282d2
      history:  > ❌  > ✅  > ❌  > ❌  
            
Hardware: acer-cb317-1h-c3z6-dedede
  > Config: defconfig+preempt_rt+x86-board
    - Architecture/compiler: x86_64/gcc-14
      - rt-tests.pi-params
      last run: https://d.kernelci.org/test/maestro:692e89f5f5b8743b1f71cf6b
      history:  > ✅  > ⚠️  > ✅  > ✅  
            



This branch has 10 pre-existing build issues. See details in the dashboard.

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

