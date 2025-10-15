Return-Path: <linux-next+bounces-8594-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE4BDC273
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 04:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F22814E4AA3
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 02:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B282BCF5;
	Wed, 15 Oct 2025 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2rM2maf5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ECD24466C
	for <linux-next@vger.kernel.org>; Wed, 15 Oct 2025 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760495413; cv=none; b=HqM0NsQkUzGulafPmnF0fEt8x51/bAdXeQ7uyfsvgshRRfLYpakts0batYzJM/dhogctWkiiLHdh2EgDZG4eTRCxJAOZ6+I+H2zgHTz5ZA6AdL2Gz8JsHd8y7f2Dspm6VfzKz2dTBLR1VDQ5ncOEGPI0wtHrpUxLCKWasH+nHX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760495413; c=relaxed/simple;
	bh=x3zKu6wjTtfE58AJRfD9ZG3zppq3StxnbW2WquhGfvQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=sYquOxcPFFtwJYvZWQWCmsbBHuaa4fhmzwPSErETKNpb/aRQhhzhN/buJpeOUI0HONAq503CloPyAjD2c/cwd8pWxC6uuzTJNyThM9dl4jcSus95VBnjRiMSah39ce+lg6G/vpWd2Pa2c3TYm8FaUKIzsy6ICJ9bWHWgWT4R9EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2rM2maf5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so5441765a91.1
        for <linux-next@vger.kernel.org>; Tue, 14 Oct 2025 19:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1760495410; x=1761100210; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dREHhJBaIjFl53w7IPspXlxzDvDQlDoYp4SReqSoawo=;
        b=2rM2maf56lLKL4+ShwPzL/fmTeO4Y4aYeydspusrIDDAhZ+kzCQDGBiM0enxxmr/UD
         uMUc3fgqBjlacTAfTW+PR+4cVyZBjjS0wIjfFIuA2r+iI1kBxrEb4MU5nlkFKTGcnqGz
         8OdF2XsRtl8/Zxj+gjW6FzjdQqqOg8s9r19nyJ1vuZq9hr3CowedZC8eabAtgFEWO2oz
         2bAZ/FAAE00pJCuBgFGsxmf+B5W+ZyKTScJhB+VXS6IBKKo7zGQ2YQ8dw8nRPN2211JP
         SiUwBnnc+8Wod+H5ZBar+KO33IYxpHx6yMej9zJdTZgX379upAcjs2F8nbXWNbqRGp2/
         0yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760495410; x=1761100210;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dREHhJBaIjFl53w7IPspXlxzDvDQlDoYp4SReqSoawo=;
        b=nDpCHixZdvwK8dDwC90kX+5RVRyiw3JdldtiH/NTFU+OCLHJlufPBAY0J1RWQldnXz
         +gbZnjbsTcCWcqwIrIUuRSid7hnCIFjztjYQg7CIyCXQgZiKcKddwtRHz8C14PAniwN1
         We1UN40yBYgAJE7Wrm7ebOktPelE+X91fe0EZElpdmsgcF9vqK5USL1EnX/UxengXK0S
         vFWSoXEAlXrB+TDBKK2D6EBPkja79jDO5dPmc2YywkrC0QwOnkVY5AO1ckS81q0T7kMV
         ODLxPTQwUcxBBp/523DwQsxcpx/dd6EqKt3mZ9xdj93uP+wEto8TzuUweoZKciS7Tx1f
         IYOg==
X-Gm-Message-State: AOJu0YxtvcR3UvU317e/Qqu4mL7vjUd1wE2kos0t56ZG4sBFtJOCbLMw
	lpIiM8bkCGWPRLPAQgc2RccnnOWHhu8y2Pbhhn+XXwtOc/3PZcT0T38lV+qrvt2QzPARzujIKRl
	/ZlLD
X-Gm-Gg: ASbGncv0hhsC9/Kp3jvXGC5CXFFv14QHXsFYaHT+hdOv1zPl3YLlZC7/omZk5hnL/A4
	7pqVyFpOQ1Q9i907na1mAUeXNLdY1GlxVZ8HHRsy+tsXjD6moOqqk6rjnujUyBzDHKg6mli5p5R
	IeXDzhQjZY1X/2knBg1sORKLQxIixDXFdvfoBEgtptJvpWhteum8dmItqYMjg52+bBefrHVNQRx
	XpvgUdxu4dRGe/mipW/3BjEhAw+58oVZ2CwXm5KqyIZ0LxfJYIneU1uRcK1DO7J3F975QDBKibF
	Way3BHYmUza8SbrDf5P4Pl7jzveU/r5jRmzjILi/tj9SQntTJqmxPCddLoZ49Wrz40LMXt9ikud
	CZ2iSlNiMu/eDEYqicjjc0hPI5i3QrqK0Ii5vDDzvag0jdw==
X-Google-Smtp-Source: AGHT+IFmJ9/b8F8uwX4DP6KQzFrYh5avOri/I/dACWDlvGSbHOdETrQfk9oiXNlIlCpV/PA8mAY32A==
X-Received: by 2002:a17:90b:17cb:b0:32e:9a24:2dd9 with SMTP id 98e67ed59e1d1-33b51124ffdmr35223759a91.1.1760495409998;
        Tue, 14 Oct 2025 19:30:09 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b97853829sm400691a91.5.2025.10.14.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:30:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] next/master - 13863a59e410cab46d26751941980dc8f088b9b3
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 15 Oct 2025 02:30:09 -0000
Message-ID: <176049540858.2033.12419091531039003905@15dd6324cc71>





Hello,

Status summary for next/master

Dashboard:
https://d.kernelci.org/c/next/master/13863a59e410cab46d26751941980dc8f088b9b3/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit hash: 13863a59e410cab46d26751941980dc8f088b9b3
origin: maestro
test start time: 2025-10-14 13:20:46.258000+00:00

Builds:	   45 ✅    9 ❌    0 ⚠️
Boots: 	  116 ✅    1 ❌    0 ⚠️
Tests: 	 5911 ✅  234 ❌ 3543 ⚠️

### POSSIBLE REGRESSIONS
    
Hardware: meson-g12b-a311d-khadas-vim3
  > Config: defconfig+preempt_rt
    - Architecture/compiler: arm64/gcc-12
      - rt-tests.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68ee5d11a6dc7c71db9ffda7
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            
      - rt-tests.rt-migrate-test.rt-migrate-test
      last run: https://d.kernelci.org/test/maestro:68ee5f1fa6dc7c71dba01564
      history:  > ✅  > ✅  > ❌  > ❌  > ❌  
            


### FIXED REGRESSIONS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.alsa
      last run: https://d.kernelci.org/test/maestro:68ee55eaa6dc7c71db9fe179
      history:  > ❌  > ❌  > ❌  > ❌  > ✅  
            
Hardware: x86-openblocks-iot-vx2
  > Config: x86_64_defconfig+lab-setup+x86-board+kselftest
    - Architecture/compiler: x86_64/gcc-12
      - boot
      last run: https://d.kernelci.org/test/maestro:68ee5e29a6dc7c71dba0084f
      history:  > ❌  > ❌  > ❌  > ✅  > ✅  
            


### UNSTABLE TESTS
    
Hardware: imx6dl-udoo
  > Config: multi_v7_defconfig
    - Architecture/compiler: arm/gcc-12
      - kselftest.dt.dt_test_unprobed_devices_sh_sound
      last run: https://d.kernelci.org/test/maestro:68ee59b1a6dc7c71db9fe7e3
      history:  > ✅  > ❌  > ✅  > ✅  > ✅  
            
Hardware: sun50i-h5-libretech-all-h3-cc
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-12
      - kselftest.dt
      last run: https://d.kernelci.org/test/maestro:68ee5c38a6dc7c71db9ff203
      history:  > ❌  > ✅  > ❌  > ❌  > ❌  
            

### NEW BUILD ISSUES
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f14a6dc7c71db9fda21
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f17a6dc7c71db9fda24
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f1ba6dc7c71db9fda27
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f1fa6dc7c71db9fda2a
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f23a6dc7c71db9fda2d
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f2ba6dc7c71db9fda33
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f32a6dc7c71db9fda39
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f3aa6dc7c71db9fda3f
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code
- Issue: maestro:c1e01dcc5d8b9be9ec47f44bbdb346c2464c0f02 | version: 1
  Build: maestro:68ee4f7ba6dc7c71db9fda77
  Comment:  undefined reference to `devm_backlight_device_register' in vmlinux.unstripped (drivers/gpu/drm/panel/panel-visionox-rm69299.c) [logspec:kbuild,kbuild.compiler.linker_error]
  First seen: 2025-10-14 13:36:10.241850+00:00
  Culprit: code

Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

