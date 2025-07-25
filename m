Return-Path: <linux-next+bounces-7717-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B199B11743
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 05:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DECD2AA4BA4
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 03:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812031EDA1A;
	Fri, 25 Jul 2025 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="c/82j0wu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639E45948
	for <linux-next@vger.kernel.org>; Fri, 25 Jul 2025 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753415948; cv=none; b=m/3gJM5TUP1gUUGoIYSZpUeGZnOnk36fAOAhGGnVOoTBOcFR8KzAsx6Aa+md3thfJBH2bODtkKGIuWAaBu198ae4WH2adIYugiqul1NTtQABzGjum/nun1ukoAk3vBmePWl0fMRDq19ASU2yYqZ5wKPei8OuRWyZ8GopHS/TAHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753415948; c=relaxed/simple;
	bh=d53IBNL6TQDfQ6j0bJfy7p9/PA8pw4cbKkSHnivKnsQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=j1U+SsOK9G8aG/3TCdZOJuABXPAQTJiH3hOY13jwPkQXShHwmBxvMDWZXtvfURMGcCxgU2uV9nT0PjDAfWdZbwj3mc9OB02U3hL8cemCnNjecXOVk4Dd/C17Nu0qjbAX7rog4dtYRWBT6D7u+SOhnNXw8PaTGzdkaM5HY4C2UdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=c/82j0wu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso1170370b3a.0
        for <linux-next@vger.kernel.org>; Thu, 24 Jul 2025 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1753415946; x=1754020746; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5A8MFeD+gpLwQ/+UKz046ntsLUTOWFzNAWDLRs9Qqc=;
        b=c/82j0wu80EJeAFnaQWJcbLnX5u9A4XVJ3cnVhIaFTqsMzWzzRRSqfcIozyRQJdYBk
         nOzqBZu9r7k3Noc4POJU3fAl5N6WeoDwVuUyHCN2zBd9N01MrTykcNDF9YciEgXrDGiX
         FR4+v2CsY2D8Mn3EV11/Xs2qiUCk6NobbVsOhPBWsHLH/kYW5WVQiw5eLIkJJh4Adg/+
         Ag+PztJXDLK2HCip6toPzRZir20W3bXlQh2EKVkImx7dgGMUcEN26hriWoyORL2pO6Wj
         HKs2iNX/0Dss7pb8g2GPPiIZ2e/ML1KoOVb+U0l8TRCf3AT/ftrWB6rhFZMKJWCiYONH
         kKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753415946; x=1754020746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k5A8MFeD+gpLwQ/+UKz046ntsLUTOWFzNAWDLRs9Qqc=;
        b=hhwV799Wll3gbDYhNb3+jD9XbYjMhFJg0WXrDQlzHK+b2kzRiN3WvwkThhwvMNP4PS
         7bMqFTMjY+fV8t9GuwJjXMWS7Z4050yR3K00QH/WEv9u1eDtSnEOXpVGsQ/ptmN288Yo
         tfD60HgvsCQZSzZj3TeEodQVSUZyfypSEAw5MkLFZ8BLkOWGWl9KzyhCzbQmZZaKu2Ru
         R7/oShyr7+tSTg3YwyH3nLb/hGffC3cyuD3u9z9jLlr9+JwQA60At+ifrR0cHy8jFJOT
         F5miiJY2l9yz6h0rZXRJGhjdoSkzUNeWdIi24fcrh4diiDY8+mIsU9rj5qI+MEbTXNWS
         RsjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSM6kohrETroMMTeQ5ZEXENPgpaTwp7F0CW1eBMqlN5nSHdBBXH8poa77herMGRZwi+FgTaGQZfQaU@vger.kernel.org
X-Gm-Message-State: AOJu0YzzYhBKhUgsFRgUYMJK252ctEH7Y7f2PmhgxAbNIEDPcRxFQJDl
	yvaQULTdbR9uzaM346tPZeK+ujU2MFMIlPWAYyhkMHC58WaQboz1YgG1Ycd0LulhApLEQ2pP9/P
	jJ56g
X-Gm-Gg: ASbGnct5b254i0xHZbRBMJe5sDjZM3UCRsc5vzZA6hV+Cfu3/+8QOdPe5s5a9n5xWGD
	TwarRONrJOxu16moKIaAkqMieWh86bdpLchSF+80zG5I65IBgnAUv+jT8bGw+DAF5fAqULHwKCr
	6Rh/3EjBxOGiMYSzdqHnTti4h76TfzU//1//OZ43fH1p62nW83GYweZYYWzCVAMuj+WASKtDEzM
	tMeyOp0k38JwsRLo46EgtLPyWxFbPQguAz/PDKxrHMx1jbT2QBI0LooNIUanUNI7oHeYZWoeAr9
	wpvDCfp+wSTNU8fRabZ2n7j9nWtrrWddru9tbWmKuZDGztXwOgktjyN9BW01HMHRfW+hriIJJp3
	+ivpriIYwWjhvHl/b
X-Google-Smtp-Source: AGHT+IEeNHkrwTsp2skrtJ7VYqwt+HFbC0C79Gjbo7/LXhVdsCZGoFX5ACY5b3qV4sNaSSwXTzOcQQ==
X-Received: by 2002:a05:6a00:39a2:b0:74e:a9ba:55f with SMTP id d2e1a72fcca58-76339278b49mr787290b3a.20.1753415946062;
        Thu, 24 Jul 2025 20:59:06 -0700 (PDT)
Received: from 508e4dbc6f9f ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b0641e14sm2817095b3a.134.2025.07.24.20.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 20:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) variable 'id' is uninitialized when
 used
 here [-Werror,-Wuninitial...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 25 Jul 2025 03:59:04 -0000
Message-ID: <175341594422.117.11494999566960779174@508e4dbc6f9f>





Hello,

New build issue found on next/master:

---
 variable 'id' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/virtio/virtio_ring.o (drivers/virtio/virtio_ring.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:33d32f9f3fc65aa1a71269ee14bd5f37d938b6bc
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  d7af19298454ed155f5cf67201a70f5cf836c842
- tags: next-20250725


Log excerpt:
=====================================================
drivers/virtio/virtio_ring.c:2113:40: error: variable 'id' is uninitialized when used here [-Werror,-Wuninitialized]
 2113 |                 BAD_RING(vq, "id %u out of range\n", id);
      |                                                      ^~
drivers/virtio/virtio_ring.c:60:32: note: expanded from macro 'BAD_RING'
   60 |                         "%s:"fmt, (_vq)->vq.name, ##args);      \
      |                                                     ^~~~
./include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
  154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                                        ^~~~~~~~~~~
./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                                     ^~~~~~~~~~~
drivers/virtio/virtio_ring.c:2077:19: note: initialize the variable 'id' to silence this warning
 2077 |         u16 last_used, id, last_used_idx;
      |                          ^
      |                           = 0
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:6882f2ab2ce2c1874eede7df

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:6882f2b12ce2c1874eede7f3


#kernelci issue maestro:33d32f9f3fc65aa1a71269ee14bd5f37d938b6bc

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

