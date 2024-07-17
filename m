Return-Path: <linux-next+bounces-3055-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D0933A4D
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 11:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3002283FB4
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3714217DE30;
	Wed, 17 Jul 2024 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DbQVqDTp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2794A210EC;
	Wed, 17 Jul 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209784; cv=none; b=gfG3Cu8MUzQehtN9il3WgpKu1BjQ/SZa3bal/n4T+pvnLyzqqvzv6BNW4rtsmA4XfK0d+InVKTt05wiM4NVQ3cuTy+OusFbKwMR5wvN8X8ksrCQGWu+lDkz+99Wg+uIc/tApDHKS/YE2FJJc5K+Sv21KxpvVKc4B5hrEFO/Ord8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209784; c=relaxed/simple;
	bh=M3SgeIYU3cLDNvzNl/r/KSBmjP/DUuhRZJB9w9wk5t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fN6kByrXzkpC4TW3CyNQP0KBg+nypo406NUM0rbmhDT4qZAItfx7wb26AQgyfBYFRhM6PiZNcZZTPXk8ch0MAc5nd+6HcLSo+2z75+No36pXQ3FTK7xVunpOeePyfE8uCYDOytpYHJ8/C0L5DSgC2FooAU4rSgwEGfg4kO8iNgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DbQVqDTp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8B1F540E01A2;
	Wed, 17 Jul 2024 09:49:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iazDfRnirfCM; Wed, 17 Jul 2024 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1721209766; bh=T8SnuMCaKdsLxP8ZJvjEI/aaWXRDOi4dmWKtPvrU7iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbQVqDTpoihRNOhUeWAVOW/lXkI5+q4UktIqInwF3tC/U7ibZYgnL9aEGRZvqzhz2
	 1eMA4zcFkysAUQWTFtRHcBHzT7IREbXz8yX0JimEVnG0D5mFPO1A9wHnk0Gu3IyAWk
	 jNzFp35W982Olau8fJpSBCm5sGfWTeoSgbR7G6tMnIWySi9Msr0KCHqAdLBK8ix1Zq
	 SyHB6lIyO3ziV3k2FDQP72W+OI985DkzDHy3wthUnOlOApXMK/83w+KrJvtp4gG7Ta
	 QDmSLgARJDnjktoAy7OOnQzfCQYlhjvA3mjEmSXuWGaNbh/vutV74qQ295HU2Qdwd/
	 qBuD35M2nssNL8j1vznuRz/emOh9pxjehIkuPV+ATKbwn4w60FSTGqsexk3u+IuzH2
	 RAamUkXcPExlRpO+/Go1ak0v+QimTFHTIVxCaVmFgVc4V4z2YnJljZ0TgolAHQoHG+
	 6rXNVQeum7bI9c0EBXTuVAITmRLb52gO2qxjML5ZlbJaRgHHo2WQyluOPQu5ZglprG
	 HFVy+8/GHAqO6ZBQK8+MWn+CVxm+kwJYOUAGCse79MPPN34x63iB+7JNxJaVTdC6wH
	 t+yaHRzHAST/iL4x2VKu/mpjITRg9Lq+gBjEq1vZ9gVbvSgJHDYqxM9Q85wcYqGZE9
	 /Wn7m46rcqcOwqUt7JWeNdm0=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 90BF240E01B3;
	Wed, 17 Jul 2024 09:49:13 +0000 (UTC)
Date: Wed, 17 Jul 2024 11:49:07 +0200
From: Borislav Petkov <bp@alien8.de>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Xiaojian Du <Xiaojian.Du@amd.com>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20240717094907.GAZpeTk403VSYORXOH@fat_crate.local>
References: <20240702141555.3494c5a6@canb.auug.org.au>
 <20240717114155.1a3d4c07@canb.auug.org.au>
 <38ff1530e63a1659f35c3a0ff315b17b65f2dbd5.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38ff1530e63a1659f35c3a0ff315b17b65f2dbd5.camel@linux.intel.com>

On Tue, Jul 16, 2024 at 07:33:12PM -0700, srinivas pandruvada wrote:
> linux-next branch of linux-pm tree needs to be rebased to Linus's tree.

Why?

You resolve the merge conflict and show Linus the resolution when sending the
pull request.

Rebasing is a no-no.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

