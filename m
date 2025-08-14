Return-Path: <linux-next+bounces-7939-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1511B25957
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 03:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAFEB68108E
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 01:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0DD2FF651;
	Thu, 14 Aug 2025 01:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="AT+xcj3v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E514421ADA4
	for <linux-next@vger.kernel.org>; Thu, 14 Aug 2025 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755136748; cv=none; b=az/89fp8s1mQROb8C6xNlZCpd3K/YyUfRBekoI/qjWQRd6Q7Jf6yizd4Imi/gFFhCywb05klbAVi1WiCo+Xc6jrpw1yOvk0KfncDBdbfemruFAhn0hlyAHF4iKVKu6QfyS5iQng3ETM9NouId9SHWTtr14GK5gHngDfhXZXD9mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755136748; c=relaxed/simple;
	bh=DJQQnr7ESP5Nn8I3uqJgk8t1XpmeKx5WIrPpvxKCHOY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=c9rG1UnttvGrVy4ALXoCgu0htzYboxR1qSi1Ub6MoKLlrQfeVVipNC5dXUJU0jtoiZYhUZBHlRXG0fUz2xbPbXHu0hwGQ1WYjn/cB6FPtC3TNgz2YEw4iGRsi3NLkguleneHQbQcIl5H6q+duAQbkDQQY93sb/ALEruMr92X10Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=AT+xcj3v; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b47175d02dcso486796a12.3
        for <linux-next@vger.kernel.org>; Wed, 13 Aug 2025 18:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755136745; x=1755741545; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nm1YdYpw7cZr42uTUu7r927cwPSI6CHJx4UhJH6tZg=;
        b=AT+xcj3vy3f+C1w/Fc6sGW9ZdbzUpbdqhFj9GN8UpUQaAJQVNearCV8AZer+3rM7pY
         jMV+gzIYJdOKpndmqQ25+FHOlJpR+ckIf+1z6TTpgx8yVj5yuAnSeK082crgzZ1pxhWg
         pdLAaOy73BxlHWf4auJB8S0jlo5GhVeexxMWMBWCKSoO3Ivfyt9KwpXPW2ZchzEPrJEq
         /P3u0YM0a2pCVdmtwlAvrwCT7uV8WoFoer2qJafhwhDV/DAwebbgw5I0DZ20GZSNBHEB
         yf3B0qevG7HgKW1cHH9IxE5P4MfhGJh+jPDcoqz5qjaN1QmQN08i5sG5k82y1MPyUbRU
         TpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755136745; x=1755741545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nm1YdYpw7cZr42uTUu7r927cwPSI6CHJx4UhJH6tZg=;
        b=iB1EHnD/N2U6GG3CRA7BwjPWaEHB5GbOa9vYsda321QVJesq0Hb8Y9mnxFDkZXBui5
         BtCwgcNPRw1sUEqjMRHFVyP/w2fPIK6IiYxbxZN0ioI1HwR8ETN8eDDF/5Th6o04W2Uu
         GEnkTdOlxqhUwsDPuGFCw596sD3GNwuQ3x5fDpyLaOzFkIo3FnzfSXV5Lt77d0irymsu
         rvv9843D4gdMlhKGM/gyQHWRJ5SwJgu5ZeLTf5TWmQ2B4r/UT3nCKwE7ZUzF9T0TDV4K
         jW4C/ZUGqJTR6cwFwXG29KZ7PMbsEPyN+KPSP3jYlKMxrvU+l0JYLUGV/BWqpYoyFi1R
         aRsg==
X-Forwarded-Encrypted: i=1; AJvYcCVigBmtkfTHwD5nsz/6YJWcBCMuy2AOPdzYGqrbdsqGjcYkH658/Qye3EeSS31eq5VRfKe5Izx6D+q1@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnXJBPqD6dL0sdqGWUzFgQJo1EADmoGEy/xoo9R+Jhczuv8Wh
	Y+6Yv6ieai9zXiy/GA0qE/ZTHmFKkaHM1hGyxhzx1GROA3yGscAYl3di9tuwyiBzRvE=
X-Gm-Gg: ASbGncvtt19R4Q8NXZOWHv6C3uXaLFf6uM88YrXgJC3AJVRtPb7+BCK+GvNGlvxyKxM
	WbEGoQhubeJb53uPxAPUuSdPxnmCToGfKhphkJ4hYbDIGMvak9W1DPf5R2ixrRkh8Os7OEvSCGG
	Gx0jqoFQwRrRc7aF3VuQEPMxJEA1f6suLAfWXY8gVcWN82rujM85QmoPR5bUo4cSO2iTjyIydAH
	0ESzIfoHASLDpwE4ChPopB2mjw+4/U1DrkPFehNZRo3Thc7+lyKYgMVm9r43i8VSWFRSIWDawMC
	YzRCMbj2NJ65oH4GFgf4g2xruqXe95HWFR1DjKkdvx467s5JIdnLUaXHFFKEAim57+6Zbn/H7jz
	wXtF08isnWh5H6Zdb
X-Google-Smtp-Source: AGHT+IF5yo39E0u8V8S14AjFdRemc8iQY3OYRVyD4esZG5ox61CGTqO1p3ed4efCjU2r/HsYClPZ3A==
X-Received: by 2002:a05:6a20:734d:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-240bcff8edamr1780389637.13.1755136745069;
        Wed, 13 Aug 2025 18:59:05 -0700 (PDT)
Received: from 16ad3c994827 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0391sm27956571a12.37.2025.08.13.18.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build)
 ./include/linux/iov_iter.h:171:7:
 error: variable 'remain' is used...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 14 Aug 2025 01:59:04 -0000
Message-ID: <175513674368.82.1504743662347433431@16ad3c994827>





Hello,

New build issue found on next/pending-fixes:

---
 ./include/linux/iov_iter.h:171:7: error: variable 'remain' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized] in net/core/datagram.o (net/core/datagram.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:82c48b655cc0d40e7033745ca11b932d4cb70784
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  e0eed1e413d2ef7c2122647cfa76de2809e42c11



Log excerpt:
=====================================================
In file included from net/core/datagram.c:53:
./include/linux/iov_iter.h:171:7: error: variable 'remain' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
./include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
./include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
./include/linux/iov_iter.h:163:22: note: initialize the variable 'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
  AR      lib/fonts/built-in.a
  CC      sound/core/pcm_lib.o
  AR      arch/x86/platform/atom/built-in.a
  CC      lib/bug.o
  AR      arch/x86/platform/geode/built-in.a
  CC      arch/x86/platform/efi/memmap.o
1 error generated.
  AR      arch/x86/platform/ce4100/built-in.a

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:689d2d72233e484a3f944060


#kernelci issue maestro:82c48b655cc0d40e7033745ca11b932d4cb70784

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

