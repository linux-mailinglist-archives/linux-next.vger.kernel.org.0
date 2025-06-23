Return-Path: <linux-next+bounces-7203-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A20AE3798
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 09:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F9A170CEE
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 07:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365EF1DF977;
	Mon, 23 Jun 2025 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="CTvDyA9f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DC7149DE8
	for <linux-next@vger.kernel.org>; Mon, 23 Jun 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665548; cv=none; b=Y2BxD2MJ+xKUnYAO4SjBEDR0l1PPMAhhjrJq+LiySxGdIBnk0K6XqFW4yAQBNgyHpNiD1stUZ2YhFExQ9cLL1v59kY0ToQu7/ZqLwVzGqUolb/NDD7CNpSPdo8Jpw6ydaTJ7zhgB3BGXDDxvnaK2JdLXV8jSdqVgowvnR77RTwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665548; c=relaxed/simple;
	bh=nI96Ff2Be3Evf1WXzSM8oKbNxUf1r8hXG8Ism039jAo=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=qM5SXNe+rFwHGrDB1RrcIDPYU6NsYZhIyC2VIAhJAMZGCrFebR8kJ+50MYh1hNEDtPCitsAn72ViKY0hCTeL5A7f+VrF1MZkxXgwWkobNAZBx1DGtGa0SSvPx2xbxqLT0gWTDViBF6a1wnrU33Sn2H6vf3rYL4KMIF4uVmk0u9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=CTvDyA9f; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e81f8679957so3050003276.2
        for <linux-next@vger.kernel.org>; Mon, 23 Jun 2025 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1750665545; x=1751270345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pile0HiM5eznUIiQNtWK1hqgr3gEVWhoaFfiYXdyxD4=;
        b=CTvDyA9fH3RhFZ3QTzOQv59leJf4D3SXnl8o4aRIXTGydpa4S6lMzbwUGGyWBu4zJM
         MB8I+UfM8ct2wJ8jKx+DGwyNLjwcfdh3XmW9yzFoE2QRnf/cA/IN8fTL7kXvI9DdSsIC
         qBad0E/1pclVS6+X0o59Udx+ItciJMivW+YsvyMfWkwEdZ7/13EA/NbzKXxFpbycbfAS
         1V5E5oyXfkskh+utrDngOLGmhsl/JOtOuIEvkG/8hS5GSMiKnnrgWgO3mqokOA5qFAGK
         zcH7jRlMLGKXZwW5duNb+P1cyrC8qnwyp9dW5iL90NB4XsyQmp4Oq3lAR1mGAUyKHy3j
         LLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665545; x=1751270345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pile0HiM5eznUIiQNtWK1hqgr3gEVWhoaFfiYXdyxD4=;
        b=iOS2SYWI7cWph0so7LC9VIR3wJSWAvFh/rzvachBDXIaYhjv+IP/t6LolesM2omDfB
         Hj05X2EcTNQuv3OVABJY7sq21GZDiXbx8gNa9qOZETF4D2aAV1vqBZwFTJw2VM+9q7Hw
         1MABYZMAI8D0Q8BhwH4JBgRF3HdyozQ39GmikhUb5WA5DTDcVJgXjUQbOfpbhv79iC4m
         yZAFPuMAQqCefuOFL3qZkhkf7UOWID6J7YcYc02r5v3sFXv4BRd3ECd2lNq5BpOZKm0v
         G8Ad3KwTi1GcOVuqs9EDy0T4C5KcGVIDZFlWL/qs1EVzwXjhfkC1jcOUT1805Gd64oyj
         mCSA==
X-Forwarded-Encrypted: i=1; AJvYcCXzu6+g9rdMUzlLsdsS73xuZ3vCcBkrJ5iH/XjJxRhTJNZGo+SnS0wzzc2BGIf0H5n69fsylKJhSb8z@vger.kernel.org
X-Gm-Message-State: AOJu0YyXPvVm4RYLd6ROpLEV75YmSqNRkGdDHF+w6MMyRwgRGrBL4o4o
	aLUuQdsKrRVXNAQ7W923cVleyDgq7Qb1coC8jRRymEo9lGPn6/r2ftlaKqQ0c/aBfV4b0FEsi3f
	9uYDzJNFVoTe9KbcYXhrGGY5n+LTNIWEbjE8y+pMopBa9/GFEQxgO
X-Gm-Gg: ASbGncv+49UL4gm9Ve/u+ipMVqUge9n6zIasBs3mdraHcuvRuaZRaVWeU9NGq3mx7hc
	kvw0FAlVqB2Tf2XgZ12EFs5UzV+FwWxTvI2Quo8quGIap05meBDDQrSbbqD2EequiClFowwQFdo
	blLQ5mt809HBGGvKPKIRYHJ3AHUcqO1MlzTAEUDfVZtA==
X-Google-Smtp-Source: AGHT+IHORCN8YHKwJByuZt+PuD3p3rvz0uvxsynt0rp2tKrG57zyH5zi7e7x6T5N9ZtTk+yKhwAeunQDSsFivaomhAw=
X-Received: by 2002:a05:6902:278a:b0:e82:61:6536 with SMTP id
 3f1490d57ef6-e842bc6236amr15025478276.7.1750665545369; Mon, 23 Jun 2025
 00:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Jun 2025 03:59:02 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Mon, 23 Jun 2025 03:59:02 -0400
X-Gm-Features: AX0GCFu9Zpq19V02N-ovo9nnjGPAJxLs2RO1qtchIPA-C4sQdqgsGDXHMpX-Gjs
Message-ID: <CACo-S-3ophYFr4ZC+XRVsOfzREDZA9Y5Au6Ma3S_bNwZsLq0pQ@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmHJhaWQ2X2VtcHR5X3plcg==?=
	=?UTF-8?B?b19wYWdl4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZC4uLg==?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 =E2=80=98raid6_empty_zero_page=E2=80=99 undeclared (first use in this func=
tion); did
you mean =E2=80=98raid6_get_zero_page=E2=80=99? in lib/raid6/recov_rvv.o
(lib/raid6/recov_rvv.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:79e6a6d6def77410fe6b7f454eb54=
6fc8d5f9df5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  f817b6dd2b62d921a6cdc0a3ac599cd1851f343c


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
lib/raid6/recov_rvv.c:168:31: error: =E2=80=98raid6_empty_zero_page=E2=80=
=99
undeclared (first use in this function); did you mean
=E2=80=98raid6_get_zero_page=E2=80=99?
  168 |         ptrs[faila] =3D (void *)raid6_empty_zero_page;
      |                               ^~~~~~~~~~~~~~~~~~~~~
      |                               raid6_get_zero_page
lib/raid6/recov_rvv.c:168:31: note: each undeclared identifier is
reported only once for each function it appears in
lib/raid6/recov_rvv.c: In function =E2=80=98raid6_datap_recov_rvv=E2=80=99:
lib/raid6/recov_rvv.c:206:31: error: =E2=80=98raid6_empty_zero_page=E2=80=
=99
undeclared (first use in this function); did you mean
=E2=80=98raid6_get_zero_page=E2=80=99?
  206 |         ptrs[faila] =3D (void *)raid6_empty_zero_page;
      |                               ^~~~~~~~~~~~~~~~~~~~~
      |                               raid6_get_zero_page

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:6858fb375c2cf25042d04b7b


#kernelci issue maestro:79e6a6d6def77410fe6b7f454eb546fc8d5f9df5

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

