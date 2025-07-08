Return-Path: <linux-next+bounces-7409-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258FBAFC9F5
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 13:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46B063A3920
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 11:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F025622ACF3;
	Tue,  8 Jul 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SBKegI9y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662926B75A
	for <linux-next@vger.kernel.org>; Tue,  8 Jul 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751975949; cv=none; b=iAB95+T+e14cXajRexQe3EIESG2lougtFnpmN6Xs4FWjm0N66+SecKjgfzACyqRfOW2HIgyR0nm9vGqkPHKtKz0+3tR7b8FA+scz7GB88Tur9pUgKtH0IwnTqByQIevDD1Bvv59v0SlnZLVclx8dcZtc7D7vpnce446tFPvwd8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751975949; c=relaxed/simple;
	bh=l4YWMze/oS4h0PoeJI6+srjACyEMe2Xs4EmUu6v8QWI=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=QQK4mfwTvA0mJxNsfex5lcpqJDczK8lCIiMHOmiMVymygPfo34y5XMfVEbk0KuNubxePIuzMCMLO9RnyCaobVigNAybe8Gra/pJaOwqL2zw56BJcHImsg3s1Oy+lg5BRdthqTAmuyd49p+Ffl+UQkVsEjVwhTNb09EX6kmZ3TtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SBKegI9y; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70a57a8ffc3so35558287b3.0
        for <linux-next@vger.kernel.org>; Tue, 08 Jul 2025 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1751975947; x=1752580747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtzSxUVKERYTmkdWodmf6sDIEA7o3urEegtQwrIBFeo=;
        b=SBKegI9yzc+solYOpkDHnFYaTtiwyaNAaIhfsMp55hO5Hdft7gcDfD9lMP6WDIgNV1
         7oNN0puqIh9Jnkv7POvYFwWk+wUVd0XGNMnC27H1B6wIP4sFYcmRBhUK5jqQ/K4XLysz
         wBNFc71m/mzaWoFFJJ2utbdIAeA90Qh1owNNg/+aX6uIoodJplOXDlsWGQx6etVlWcaI
         nxF/mwC2PTJ5V1GxpmdEDbYpjaVMpvd1dr8ji4YreBUnQOvJSa+ims9PdLUtLJF/cAno
         BPhXvRNGka7cTZdasgwk8ojwH/RvbysEpFHmRTcx12qfmi0BVAia18lFH7Ls7ATXiwou
         OBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751975947; x=1752580747;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtzSxUVKERYTmkdWodmf6sDIEA7o3urEegtQwrIBFeo=;
        b=axYxcpRAZfwrdXOFZ7M/Hifea8XCfVMTd9MvZheOR0F1f9qy9zd7SS2ERjAJTHm69o
         bSOAxv1SFsGIYbbPg2JJq5J20yynTB7tXc2j91e+D30uF4/XYEQH7Gp1q9hUy6Hr/7eT
         l7SC2R4knNuwsNKuQIG5ceC0EK2fG5+6HCJhHbDBFhMTFhGus0OkucOScpYk7QPEuvkA
         C7N2YwVQT9eiMJBATDbiK10IxWYoGAxxcO1eYZQ2rtpCOsxropjVbM7mybOmxTmGv8bX
         0pY/+Ozg7SeDRe7OwcTfErllyfC5H9QbFl2AJ+KT3hh36JuFjhLy88/ouqrLBLsNbAGl
         yMtw==
X-Forwarded-Encrypted: i=1; AJvYcCX3CqiPqkw6AYtzdlioy0aDKfp7PCFcMAXWPeEkIz/50Gh+/T8KlpA1pMMciL42DEdd3HYb19y/ooDk@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4VJGvjz7iyctIXfjo/5PCFCyMufdz3uhTEzmJQ1JaxeDPNsl
	6gxjceBeeRx/4HmY3FvF1Q3VqduoHeiYprYu9hoa7hDIe81SAao1uuuXR/9wuincugOxuhpdP4s
	2ooPMhOo9cDvUJWyEevQDDakgth0CYVPvdG+LQOOrWg==
X-Gm-Gg: ASbGncuRYO6EFmRvsVJNkvnr5XtB5thX04C3msols8R8aGfxopGKti9p2VifKc8HOkg
	RVNQi5TldhAQ78y7gQg59AKMs2m9vPsH9vo0M3Q3gVp3aqiAogxROHC/OXJBIH4SqGt22jag1ed
	axFe/pxxK2ceyRBzlLJLH4lyvlaVM217lWFm2bI0uYXQ==
X-Google-Smtp-Source: AGHT+IHldcdfL3KDEtXQ5coruO648VbCeq4DNQV8fjNhsOKR6jna0NqzlmNfbozuk89fRAZyu9pcN0kJL/if35bHIeI=
X-Received: by 2002:a05:690c:46c8:b0:70e:2a0c:bc5 with SMTP id
 00721157ae682-7179e464094mr49136347b3.38.1751975947430; Tue, 08 Jul 2025
 04:59:07 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jul 2025 04:59:05 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jul 2025 04:59:05 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 8 Jul 2025 04:59:05 -0700
X-Gm-Features: Ac12FXxdG7SBioohOVIdrl2kRCgFlhwWfZBNI-8C0Yojen0DOxGOdqxZG-1I8wc
Message-ID: <CACo-S-0GQ5cmyK=xXjWxJrTfUu7_B2gHD0z5fO2O=QVi3CEt2g@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) variable 'sys_info_avail' is not
 needed and will not be emitted [-...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 variable 'sys_info_avail' is not needed and will not be emitted
[-Werror,-Wunneeded-internal-declaration] in lib/sys_info.o
(lib/sys_info.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:5c04e00f1c1b59acf474835a714df4aec7228b6a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  58ba80c4740212c29a1cf9b48f588e60a7612209


Log excerpt:
=====================================================
lib/sys_info.c:52:19: error: variable 'sys_info_avail' is not needed
and will not be emitted [-Werror,-Wunneeded-internal-declaration]
   52 | static const char sys_info_avail[] =
"tasks,mem,timers,locks,ftrace,all_bt,blocked_tasks";
      |                   ^~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:686cf90434612746bbb46434

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:686cf90a34612746bbb4643a


#kernelci issue maestro:5c04e00f1c1b59acf474835a714df4aec7228b6a

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

