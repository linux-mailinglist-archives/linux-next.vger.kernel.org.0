Return-Path: <linux-next+bounces-60-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F47F70F3
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 11:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4347B20C12
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 10:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAA8171CE;
	Fri, 24 Nov 2023 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W//U3hd2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7081C1980
	for <linux-next@vger.kernel.org>; Fri, 24 Nov 2023 02:10:48 -0800 (PST)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4ac42a20f35so441814e0c.2
        for <linux-next@vger.kernel.org>; Fri, 24 Nov 2023 02:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700820647; x=1701425447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RNwbKkpOOdlYnkUmnFUQa8oGNqtKbB29P4hnjmshOjc=;
        b=W//U3hd2XG8neh8uv2ahWMhv+4QOrs4rJw1Yqp1tQHS9tvtecbnOhZVJHceKDtUzbZ
         6DopOI0tR0IxayWWm6tVkjKPqmQN/j1ZdKJyw7jVc0D3mfsKzDcxX6dIP2LGzDfSXcUr
         4AiGF+3tX4tB/WSTy/If/6b4/grwx6NtnAp7i6zX1K31hFNb0tCyo8GCqDHeAyo8Ti8Z
         AnlBYhr3kJ24yTK++YpTtH2R2T0LH0ZZizt4QcYWzIrjwaHEBKaTLlJGY2Xhdk4z0EJD
         /B8xrHT4TN5W/EawgCm0l/oRBALKmN7gOygqmRBYZV1IvBWGEUBeU2SIKenhPlOYOEcF
         cLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820647; x=1701425447;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNwbKkpOOdlYnkUmnFUQa8oGNqtKbB29P4hnjmshOjc=;
        b=c5rkzLldaD6uVNA1earnvvwagVhkckej3GY1JVrAt2KYETRtwsAPxiKZ6sY7uUOieU
         OkxCaOy1wvDf1/7cVCVrORkiGRGBUnaff3731mAGkZ5D9xur0awcQw/4CIvNaAjaDfcM
         AyYIAB1HHeuDxWUIvA0VoSsfHd61fOySobdy5Gu9hH80jEth3AtY54cMDW1/FpAArdRf
         5sQP/Ml21ESV4Jnsq2E2F1e5vTQ3Rba33l7DjuUJoMCB12x21jHDeSL57LwhsU0dyLKg
         +bp2DfQ8h9nGJeLyURe+v7XDxavYSg1l8VqvU5hl1uO7iFEw1H8ngcqKz2Dj5iEnvLfl
         npbw==
X-Gm-Message-State: AOJu0Yye6sr81AOEZ633D798uSkWRH6Diz/GN7PEccRqRomWVChNM1yN
	WC/FOTKd1S92BNNiicZzlkk8rDMLs/dvKYWj7PQ8Zr3wv1tfE4lUBFE=
X-Google-Smtp-Source: AGHT+IH1qYJUzvgMQWrRt/3NN7fan5ueWXzVBAKMLdmqcstxxzoVpfakJzluUr9qCtOyePI3AI91zWSiPENY9/RXLFw=
X-Received: by 2002:a05:6122:a15:b0:4ac:a482:f0d8 with SMTP id
 21-20020a0561220a1500b004aca482f0d8mr1264660vkn.7.1700820647430; Fri, 24 Nov
 2023 02:10:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 24 Nov 2023 15:40:36 +0530
Message-ID: <CA+G9fYtV6X=c3JVTTAX89_=wc+uqLpzggnsbGSx-98m_5yd5yw@mail.gmail.com>
Subject: next: arm64: vgettimeofday.c:10:5: error: conflicting types for
 '__vdso_clock_gettime'; have 'int(clockid_t, struct old_timespec32 *)' {aka
 'int(int, struct old_timespec32 *)'}
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: Arnd Bergmann <arnd@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"

Following build warnings / errors noticed on arm64 build on Linux next-20231124

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
arch/arm64/boot/dts/mediatek/mt8195.dtsi:464.4-27: Warning
(interrupts_property): /soc/i2c@11d01000/pmic@34:#interrupt-cells:
size is (8), expected multiple of 16
arch/arm64/kernel/vdso32/vgettimeofday.c:10:5: error: conflicting
types for '__vdso_clock_gettime'; have 'int(clockid_t,  struct
old_timespec32 *)' {aka 'int(int,  struct old_timespec32 *)'}
   10 | int __vdso_clock_gettime(clockid_t clock,
      |     ^~~~~~~~~~~~~~~~~~~~
In file included from arch/arm64/kernel/vdso32/vgettimeofday.c:8:
include/vdso/gettime.h:16:5: note: previous declaration of
'__vdso_clock_gettime' with type 'int(clockid_t,  struct
__kernel_timespec *)' {aka 'int(int,  struct __kernel_timespec *)'}
   16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
      |     ^~~~~~~~~~~~~~~~~~~~
arch/arm64/kernel/vdso32/vgettimeofday.c:28:5: error: conflicting
types for '__vdso_clock_getres'; have 'int(clockid_t,  struct
old_timespec32 *)' {aka 'int(int,  struct old_timespec32 *)'}
   28 | int __vdso_clock_getres(clockid_t clock_id,
      |     ^~~~~~~~~~~~~~~~~~~
include/vdso/gettime.h:15:5: note: previous declaration of
'__vdso_clock_getres' with type 'int(clockid_t,  struct
__kernel_timespec *)' {aka 'int(int,  struct __kernel_timespec *)'}
   15 | int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *res);
      |     ^~~~~~~~~~~~~~~~~~~
make[3]: *** [arch/arm64/kernel/vdso32/Makefile:149:
arch/arm64/kernel/vdso32/vgettimeofday.o] Error 1



Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231124/testrun/21224014/suite/build/test/gcc-13-lkftconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231124/testrun/21224014/suite/build/test/gcc-13-lkftconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231124/testrun/21224014/suite/build/test/gcc-13-lkftconfig/details/



Steps to reproduce:
---
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2YbbDYkIkXuo7IuAzRYY1HQS6Cr/config


--
Linaro LKFT
https://lkft.linaro.org

