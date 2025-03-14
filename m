Return-Path: <linux-next+bounces-5793-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9637BA60AF0
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 09:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 297513BE130
	for <lists+linux-next@lfdr.de>; Fri, 14 Mar 2025 08:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A904B198822;
	Fri, 14 Mar 2025 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMsz86LI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F113F2AD25
	for <linux-next@vger.kernel.org>; Fri, 14 Mar 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940022; cv=none; b=WrWQQP8Ej8A9ATIL5awug9ZHtzGVbDs7rXVxQfSQ3LjGcUZRhSXIpd9mGEQfH2r0AQCYfKgZ0dnqSDMTHeOIv/xfy6GbF3x3Xiv78aH72KUDk+RUZ2LB97cNw5M5MqVuKVDf5xKq7fATmQWbMDYrbSFdvAaCmIwa1SiIcLJFufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940022; c=relaxed/simple;
	bh=bfyaaaGZ248cEZprNg8k5yG+giucYQf8o99euJalEWk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=BPo++saLQz+FipQhkOfFZUtO0zkvfy+dWGJsuBFhM3H2qLmxlfBQ783FMOgvJqtP4kGA1Cl1IQZNE/Ta/m0Wi7+wXifizyYrTiHKlhzrMXOU5TWEEgW+9taTVqEPJaBi5N/5x+BDqe00dXEZ+9tjHK+Z7kRRIntRXQZFmHtxd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMsz86LI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499bd3084aso1826452e87.0
        for <linux-next@vger.kernel.org>; Fri, 14 Mar 2025 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741940019; x=1742544819; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dup0RSoe3QAIF5CQ1kUjuu1VJpLw+V0S0/0GCWyGvUw=;
        b=dMsz86LI1PsxtpKamzUkfknNyKo8SSsBIJkeidpy/OhKgfkwe6zMfwrr/Ff3cJFRUl
         yT8pus8tWtnJ0/QBhoSsb8drX2JVmvYIBiPzvX9bnAw+Uvdnpm0DwxV9txLZxxCS4Mme
         ePuBa+XwTa6EaIW/4JQMGd1EzNMGlXSycPDtWNObmt7jYu4vn2l6rbOg2CFRjtuCymcd
         nijubl5h/KgT9tWpXOZl04pqX4G85lxlrGahcPTlzHhp3RbpRbhJBCIxnhjVOlp6xnM0
         wNkz5rzRxs/ur39EimfdAPGwSG1wj9LzTzydtLofxJUia9UgktfnCDYFLL2UiENR3puG
         C+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940019; x=1742544819;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dup0RSoe3QAIF5CQ1kUjuu1VJpLw+V0S0/0GCWyGvUw=;
        b=awOcsmFSbyDv1Gnzuzj6AEZQ8u3OxftpRmkfDxcZUNyofHquD/KLE0PGqfJoLrBjPQ
         FItoi2t/PM0hE4mx5bc17ylt44/fPXpn5X5fTi6BjknjIUOz5PdKR6R7OH3ppaumhtRt
         PbXrNgkgDQMuPOHtzGwvWmSSV78ahKVB3LAxw65VvXzaLIuLqNIzTg/pUElfUETcsigN
         D0i/Qw9wBZF+iA5MSg0CsSx/rItOQvm6dzbhlb2hn+ci/4nlpm2QX7Tu9E9gNsbLzEyK
         oMiM7wP/X/JLA95TQBLk7YRjeoAv3RtilxhFXJCE6dPVFMHhpxUeaXm89wsrusYvq5me
         1htQ==
X-Gm-Message-State: AOJu0YwNKHzkhEAAQs0UBAaLPSkecuaG/r+uKfoQl9kENZ+j0oAUaKy8
	1Wu50Ij0ij/1io8rxsJmJKrqgSR8EpeLeQUUB635V9UVnXHBDs1SfXRA5rcC
X-Gm-Gg: ASbGncvO5hXVenbgXyW39fhKw/QGnL0X/UwNHTQzQmZ0UsV7mx1kxLWh30aDbxUDYKF
	lb1YV48T8pOF1yzrbfDp80UMcYUlhYzGqQ7Gm2iv/xbWY6bp61R79wW9OhqKvvgHzNE8Y1Pbfvo
	aKwlwCnoJ/cgo3aOIiTkx8uqU12Plm6y9VKBkjl/GZErlLY3Xl7QtWPA777/VdCGd5d0ibBvByo
	0Z6nRSzNo6Y6MqT+/nCCbYXK4DZvQPM1sv/PG64hiTip/qSkVa0ohcFuTJzuAiH9bQ5B4MVQwNS
	ZBVqIgvtDyqboxc13o6edqhyswWV8N36cntZcU7Wr+L6D+YikCI=
X-Google-Smtp-Source: AGHT+IHogGzBU364EZNm+r+YGuqTi6j1M2rpi8VcLIYtPtnXuzztnD6z2LOGPFhFp/w7JkLVPq2j6A==
X-Received: by 2002:a05:6512:2396:b0:549:8db6:9366 with SMTP id 2adb3069b0e04-549c38f2058mr468118e87.28.1741940018795;
        Fri, 14 Mar 2025 01:13:38 -0700 (PDT)
Received: from [172.16.183.197] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864e37sm457607e87.117.2025.03.14.01.13.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 01:13:38 -0700 (PDT)
Message-ID: <fb5a1e5b-8182-46f3-9996-2faed39c1082@gmail.com>
Date: Fri, 14 Mar 2025 10:13:37 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-next@vger.kernel.org
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
Subject: linux-next: BeagleBone Black won't boot
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

The linux-next tree have contained a bug for a couple of days, where 
BeagleBone Black booting process jamms early.

With "earlycon" and "debug" this is where the prints stop:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.14.0-rc6-00397-g97e8d55cc2a1 
(kale@latitude5580) (arm-none-eabi-gcc (Arm GNU Toolchain 14.2.Rel1 
(Build arm-14.52)) 14.2.1 20241119, GNU ld (Arm GNU Toolchain 14.2.Rel1 
(Build arm-14.52)) 2.43.1.20241119) 5
[    0.000000] CPU: ARMv7 Processor [413fc082] revision 2 (ARMv7), 
cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing 
instruction cache
[    0.000000] OF: fdt: Machine model: TI AM335x BeagleBone Black
[    0.000000] earlycon: omap8250 at MMIO 0x44e09000 (options '')
[    0.000000] printk: legacy bootconsole [omap8250] enabled
[    0.000000] Memory policy: Data cache writeback
[    0.000000] cma: Reserved 16 MiB at 0x00000000

I bisected the error from yesterdays next-20250313 and head of 
next/stable to:

042fbd055300afff395c37c6577c32c0db5d2c36
arch, mm: set high_memory in free_area_init()

The bug seems to be contained in todays linux-next tree aswell.

I hope this helps,
Kalle Niemi


