Return-Path: <linux-next+bounces-8528-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0218BAFECA
	for <lists+linux-next@lfdr.de>; Wed, 01 Oct 2025 11:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55E9B188A624
	for <lists+linux-next@lfdr.de>; Wed,  1 Oct 2025 09:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61EF28D8FD;
	Wed,  1 Oct 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lW8kFH1O"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBCF28D8D2;
	Wed,  1 Oct 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759312273; cv=none; b=AvhMqgLH/O//kxMI+OP0Ajts+YvJc7U7kDXAzaQTnnSX8jaBp/2J0afN0qTEKaT5+60srr3/afmmZ7pl+wURPbnl9o83w77/jBHXRP1KofhtFtAL3ppuMGga3lHV+rT0BsZ2aprhNBp6MBp2s8JmaOp7+wgMiP/XKgh8BuWknM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759312273; c=relaxed/simple;
	bh=kyLfflee9tTqpv7bAy4zsW2J4GJPgUPc5d3I+CZhIpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpfTtu6v/PHLo6hqfV/JYSwebyJhThrwFFJci1/FD3dTAHG3vcu10XuyggoeqVhWObjiLpAd+BHYxAypg8socoqSzpOz2BJQAGRhsMhsgWGBvE2ouMFu2cWUNDGW3ZM6I24ZM1A0HN2bAGmTcYN7EVN0fupTOUzRfrNqH0Ugf6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lW8kFH1O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8DAC4CEF4;
	Wed,  1 Oct 2025 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759312272;
	bh=kyLfflee9tTqpv7bAy4zsW2J4GJPgUPc5d3I+CZhIpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lW8kFH1O/o+UjhzVNXeT8HnRkH50tl8LPsqYZyy6Ojw57G3beeAk0/PpON3dk0CUD
	 1vfe+oBpAGveZdggfWeqKTdM/PLNtdWSxXEHSayrSaVC9VrsJuFTK6t7x2ZbjlQIxK
	 6rJXQAtedIM9kd3/FRqqvQollHb3xOFxOKJhP3ocPyYIhhmV1+p/YTjxx7OS/Z4Ccj
	 eYgVZqmFOLX4r4KrcgLaA1dmAlmSUXmCuIDi71ATlyHY3GzQQVMTx4uSaA5t7hG0iM
	 4mtmLiUb0Iu98x+/g/iWfB1J1o6jr6NUvuRbItjXlOEFHXfaWUJss0vwHmyFidr2Pz
	 Qc6OUyr/wg9JA==
Date: Wed, 1 Oct 2025 10:51:08 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20251001095108.GO8757@google.com>
References: <aMqxWGx0asGTWZ2V@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMqxWGx0asGTWZ2V@sirena.org.uk>

On Wed, 17 Sep 2025, Mark Brown wrote:

> Hi all,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
> gpio-stmpe.c:(.text+0x213ed29): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get_direction':
> gpio-stmpe.c:(.text+0x213eeb2): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq_sync_unlock':
> gpio-stmpe.c:(.text+0x213f266): undefined reference to `stmpe_reg_write'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x213f3ef): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x213f472): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq':
> gpio-stmpe.c:(.text+0x213fd27): undefined reference to `stmpe_block_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140005): undefined reference to `stmpe_reg_write'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140089): undefined reference to `stmpe_reg_write'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_disable':
> gpio-stmpe.c:(.text+0x21402dc): undefined reference to `stmpe_disable'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_set':
> gpio-stmpe.c:(.text+0x21404a4): undefined reference to `stmpe_reg_write'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x214051e): undefined reference to `stmpe_set_bits'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_output':
> gpio-stmpe.c:(.text+0x21406a4): undefined reference to `stmpe_set_bits'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_input':
> gpio-stmpe.c:(.text+0x2140805): undefined reference to `stmpe_set_bits'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_request':
> gpio-stmpe.c:(.text+0x214093e): undefined reference to `stmpe_set_altfunc'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_dbg_show_one':
> gpio-stmpe.c:(.text+0x2140ac0): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140c8c): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140cb1): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140d61): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140f6c): undefined reference to `stmpe_reg_read'
> x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_probe':
> gpio-stmpe.c:(.text+0x21416b2): undefined reference to `stmpe_enable'
> x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x214193e): undefined reference to `stmpe_disable'
> make[3]: *** [/tmp/next/build/scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1
> make[2]: *** [/tmp/next/build/Makefile:1242: vmlinux] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> Command exited with non-zero status 2
> 
> Caused by commit
> 
>    df6a44003953f ("mfd: stmpe: Allow building as module")
> 
> which needs commit
> 
>    03db20aaa3ba3 ("gpio: stmpe: Allow to compile as a module")
> 
> from the gpio tree.  I have used the version from yesterday instead.

Isn't the later already in -next?

-- 
Lee Jones [李琼斯]

