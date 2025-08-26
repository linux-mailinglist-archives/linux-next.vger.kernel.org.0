Return-Path: <linux-next+bounces-8104-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6184B3735D
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 21:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85706464D62
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 19:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52057277C85;
	Tue, 26 Aug 2025 19:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhg0VABN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6EE30CDB7
	for <linux-next@vger.kernel.org>; Tue, 26 Aug 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756237555; cv=none; b=PaJdf+NDsxK2FUmIm2FmlkGHE2jFHwySTNE+Z3OkgjD2v9IBW2plTQX7cJT0jdnO+DaNRQr8DK2CeBC3kcBudJ2feqH928y/pBbmKHyDKjGwE4Emx3x3S6CdmxhT17ukOSY8ntV944bB+CMEhrMz0M9Id99EDb+g+aAOrwHE+Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756237555; c=relaxed/simple;
	bh=JzdvJ3D4cIox4VnfVjxmXcW2+yE9RmgV3r9R+q8PdFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V44+QCLhVxP3JgZoaJuZNXzWtgp/YpMhazmRVOVeZTkiarJGe+IAE/N5jrLwalGw0TzvA7My8QVppFynmNyTnybtsrou3JkHN16DnNkZKHjTlQ+Lf+2AVQ6TboZnqXBgMC+2zAwV+lUwyJ0vR0j2u4dwMm8tTZVe54DheCyd2VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhg0VABN; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f3a61d0deso845484e87.3
        for <linux-next@vger.kernel.org>; Tue, 26 Aug 2025 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756237551; x=1756842351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXuip4G3eXQRlL52moPjD1+7Xz7J18hYMMxbx4Ti2y4=;
        b=vhg0VABNQQGRadMHSQ7SycAyvpbFv6QjliAP2sBrbz9c0EGrQa08QSsxEq7Ra+Ux2+
         xLKfn2qGAk7yTAIx/yo7WxcufYS+goiO24UFJ7jj5gxEvDDjo7WEBlyjgChgEWq7j8HE
         LpjzNOS2E/oOFosMwFZ83IQvu2T0/8w8YwnBL8ZoBzcB7c3lJaqZ9dLJunPhZYQSf1gZ
         UjvEqASB9+PLDffxwz3ngX7YpYiSg9EpvYHzpFiDeoG6esaRA5ri7SjZv075I+4p2x0f
         3v+zToMokKXYe0Hh2hlS3lM/oaGfa/5rAhE8QbojpJp1dqtMNYgxLNnxB0YTyT1C9kgf
         3L/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756237551; x=1756842351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXuip4G3eXQRlL52moPjD1+7Xz7J18hYMMxbx4Ti2y4=;
        b=W1Wb+28eiqrSe8ZOi3mJGL0xuT10mIAn2etKabuYR10YtKVh4j5eOfm2cNNeisC9oM
         WELRPmmLUaSkD1KhXR6aR+FSdRuI+yOVJPyzBHRTkEpoiuLqg5Bbl3shSgZzCWsAkKLc
         Y9niH1Qs2SzEdnggdoRlN4QrQneASxvbKTaPRrStpuOnwb73k67lLmcyjhbIBV7QKWHr
         qwY6j5ss/oCXHsXzj47GgFPEohlaaRcOybhd0pJ8r0xy0RcLOPYC8WOFMzoHx/hS8+yj
         Zu/02mNTdJLL2/q7td9hPc1A8hLTncb37JduMK6zAqXUyVqyybgIzfszm936robYLOf/
         IHXg==
X-Forwarded-Encrypted: i=1; AJvYcCWYdqeA8xFwOPzWZ6QrODwzh/1O+FyUhXsJdDZptHBWnGQ1QRYEnC2sKh/Zqlz8+2t0zfo6/QZCaOFF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyx86OFF1DBFHu25AR9Y45Czz02JPFI1CNwiy/bjJ+HXE02Lbw
	cnPUPOUhV7hkppAQA8pNFDCXHEhSN3kFM9TtcSfhSZSeMVmxdMn7Q71wSbuwb68COsI=
X-Gm-Gg: ASbGncu7mzVkpXYqLTVQApKDY+R4AFUP+bMrCpI+0V9akHmYXFvCMDHoTzKaHnPAlTy
	pE063o4EaRDdlrapFBCPo0YFKaMhbxkWlZ0LVYeUTmy4awJAak9ERvlL6TVxPPKXWKkwLYWMh+U
	yk79qN0nTlPLPxiR5faGjRDqmtTzHf521/UhTk7frxYuwFL0KY0u9Df/F7bIY5zbl86ZRC3Ue6c
	utUwFBdYFOHPu72YpW12KsmKm2SFx2SoWidGyGx7vTfMMv0da614pcxRV1tY11LVh7zDbInu5Vk
	HtTArw7WnepWASjGytxxK9Fac5iARktPQMobEwZkUARZmJUuwv8VTa1mPpUzqqHNWWL7caOm08e
	fHQ+a2Am6WdVZ/gmJoFl9hKbmqw9LQC+6lHfSy+kNWxD0RJdg2Gn2v1XufM+3eA6PDwUWr5lh7S
	1gfaHlOuupvLA=
X-Google-Smtp-Source: AGHT+IEt8Nv0C9k6B51P0Bu6omHX78GtGUI5akzFwO0EsKKpWO1hUm2te9ZXs4y0v64KaGbBkwbGtQ==
X-Received: by 2002:a05:651c:20cd:20b0:334:1db:486d with SMTP id 38308e7fff4ca-33650e22e7dmr16358621fa.2.1756237551336;
        Tue, 26 Aug 2025 12:45:51 -0700 (PDT)
Received: from monster (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20cc9csm23313081fa.10.2025.08.26.12.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 12:45:50 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:45:48 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>, regressions@lists.linux.dev,
	linux-next@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shradha Gupta <shradhagupta@linux.microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Jonathan Cameron <Jonathan.Cameron@huwei.com>,
	Juergen Gross <jgross@suse.com>, Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>, arnd@arndb.de,
	dan.carpenter@linaro.org, naresh.kamboju@linaro.org,
	benjamin.copeland@linaro.org
Subject: Re: [PATCH v2 2/4] PCI/MSI: Add startup/shutdown for per device
 domains
Message-ID: <aK4O7Hl8NCVEMznB@monster>
References: <20250813232835.43458-1-inochiama@gmail.com>
 <20250813232835.43458-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250813232835.43458-3-inochiama@gmail.com>

On 2025-08-14 07:28, Inochi Amaoto wrote:
> As the RISC-V PLIC can not apply affinity setting without calling
> irq_enable(), it will make the interrupt unavailble when using as
> an underlying IRQ chip for MSI controller.
> 
> Implement .irq_startup() and .irq_shutdown() for the PCI MSI and
> MSI-X templates. For chips that specify MSI_FLAG_PCI_MSI_STARTUP_PARENT,
> these startup and shutdown the parent as well, which allows the
> irq on the parent chip to be enabled if the irq is not enabled
> when allocating. This is necessary for the MSI controllers which
> use PLIC as underlying IRQ chip.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Regressions found while booting the Linux next-20250826 on the
qemu-arm64, qemu-armv7 due to following kernel log.

Bisection identified this commit as the cause of the regression.

Regression Analysis:
- New regression? Yes
- Reproducible? Yes

First seen on the next-20250826
Good: next-20250825
Bad: next-20250826

Test regression: next-20250826 gcc-13 boot failed on qemu-arm64 and
qemu-armv7.

Expected behavior: System should boot normally and virtio block devices
should be detected and initialized immediately.

Actual behavior: System hangs for ~30 seconds during virtio block device
initialization before showing scheduler deadline replenish errors and
failing to complete boot.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

[...]
<6>[    1.369038] virtio-pci 0000:00:01.0: enabling device (0000 ->
0003)
<6>[    1.420097] Serial: 8250/16550 driver, 4 ports, IRQ sharing
enabled
<6>[    1.450858] msm_serial: driver initialized
<6>[    1.454489] SuperH (H)SCI(F) driver initialized
<6>[    1.456056] STM32 USART driver initialized
<6>[    1.513325] loop: module loaded
<6>[    1.515744] virtio_blk virtio0: 2/0/0 default/read/poll queues
<5>[    1.527859] virtio_blk virtio0: [vda] 5397504 512-byte logical
blocks (2.76 GB/2.57 GiB)
<4>[   29.761219] sched: DL replenish lagged too much
[here it hangs]


Reverting this commit restores normal boot behavior.


qemu-arm64
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663822/suite/boot/test/gcc-13-lkftconfig/log

qemu-armv7
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663615/suite/boot/test/gcc-13-lkftconfig/log

## Source
* Git tree:
* https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: d0630b758e593506126e8eda6c3d56097d1847c5
* Git describe: next-20250826
* Project details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826
* Architectures: arm64
* Toolchains: gcc-13
* Kconfigs: gcc-13-lkftconfig


## Build
* Test history: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663822/suite/boot/test/gcc-13-lkftconfig/history/
* Test link: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/31oo1cMOi0uSNKYApi80iQahbLi
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31onzS5UmJVvvZucEhtB1veoJA1/
* Kernel config: https://storage.tuxsuite.com/public/linaro/lkft/builds/31onzS5UmJVvvZucEhtB1veoJA1/config

--
Linaro LKFT
https://lkft.linaro.org

