Return-Path: <linux-next+bounces-8512-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 204D2BA7C01
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 03:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 018CE7AB6EA
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 01:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C312DF68;
	Mon, 29 Sep 2025 01:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KMawo//x"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF9728EB;
	Mon, 29 Sep 2025 01:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759108406; cv=none; b=M7krkriupOx6Dsel1OHrD2VQyXxNjahemcdAaMEEQX07mB6YJIWCULceT7KZJNYAG+75mipwxZ8xcrhwDhkRijB4q0E7TqFWg7RuoLWEwTmzdFUzPUx5yvcUInfyYB66Bj0g8QRIzWYye24G9p+2CIfnvVdlT0HY+EfrrB47AQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759108406; c=relaxed/simple;
	bh=uWWZYhzLnkIWvtNqNKZxfH994ho73QyI7gg4Q4zLhEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pj7O1L5zr8zHGZoNdfo6ApVmzyTbXC6TBvUCfqUZm6jMZ6cIOrTPsI0Ma++eLnnuKxVFCEbsNxuNwEgecygrPXBArovGZTa1YohRlselkhFLSLFzVeayxG9iqLEGrqB/vA2CSHD5LZfO4YmR0bre4xGSzHmIi8b8CHW04LMtzUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KMawo//x; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mC/LHOhidd//dshIwSfoLCI+xZmvyk56CrMFEjh/Vi4=; b=KMawo//xjEAC3wuLaF7/cQZNMM
	SPAbJdMqeLcPW8b1XIU6TH73K5aZtgN8eYYZQ9sqVxhAqaso3zCiYPzD7QV5tLImRcb/rhD6+oBpF
	Vhj7yapsCM9fLs4yRJBij1dpyxa/oCUg6V/WYW+LlURu/dTQFXpGV0ydwtuFluFGBWnl2VyQ5nsJB
	jE5w56j7a5sCusONJpVxUiv7jlgUvFFnfFPOoqoy6cEz6PfEIYft41z8v/a0fpYgkvbeyw3Da+KdP
	/P64to7ih0bESkKu5B3TQ1g2vytacJKwY5KmAkLRwYjASGyIoUwYVZTgbNpo69Z0rUU7bMW2MeKUa
	09y73rDg==;
Received: from [50.53.25.54] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v32S8-000000011RW-47wq;
	Mon, 29 Sep 2025 01:13:21 +0000
Message-ID: <bb21b532-b68f-4c02-a9bd-7e8aa3c07258@infradead.org>
Date: Sun, 28 Sep 2025 18:13:20 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) undefined reference to
 `pm_hibernation_mode_is_suspend' in vmlinux...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <175890594349.36.5014274970333071394@1e895cdadf47>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <175890594349.36.5014274970333071394@1e895cdadf47>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/26/25 9:59 AM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  undefined reference to `pm_hibernation_mode_is_suspend' in vmlinux.unstripped (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c) [logspec:kbuild,kbuild.compiler.linker_error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  262858079afde6d367ce3db183c74d8a43a0e83f
> - tags: next-20250926
> 
> 
> Log excerpt:
> =====================================================
>   LD      .tmp_vmlinux1
> ld: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o: in function `amdgpu_pmops_thaw':
> /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2677: undefined reference to `pm_hibernation_mode_is_suspend'
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
> - compiler: gcc-12
> - dashboard: https://d.kernelci.org/build/maestro:68d6bd56aabea828fddae00b
> 
> ## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
> - compiler: gcc-12
> - dashboard: https://d.kernelci.org/build/maestro:68d6bd59aabea828fddae00e
> 

Is there a URL for the .config file that causes the
build error?

Thanks.

> 
> #kernelci issue maestro:74f8fe195e9e78290f1dae54754bf5b8d4b2a893
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 
-- 
~Randy


