Return-Path: <linux-next+bounces-5688-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 188FCA561AD
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 08:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FA403B3B5B
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 07:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7267C19CC3E;
	Fri,  7 Mar 2025 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VkbXKxV8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cGJ6YtS8"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3631A89;
	Fri,  7 Mar 2025 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332034; cv=none; b=E10wYPAOTGT14szorzbhQKOIrJ58aln17ttkZoh4fzsNdLuwuuDCAlLKz3OVUvvBOxeITfpRehAyUiUF8nmDYV8TPDbvESIxmg9I2O2mkxptDV9vB83n9YEdZRmP328OAVJfO/ycuNpeiUGBUjwdSLFrj717I6EJes3bDNtAaI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332034; c=relaxed/simple;
	bh=7zGI5yZLq64CnAlC+0CHrJw5wtsVAqpO1T1TOnMxXm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKA0OsvXWKs6Yl63/7IcOwUMXwkGesFP2eHOBY1rvbO2S64NxHKFJzdwAaM2VOOla/9YX10JcfVULgDobppw/dD0DOv7v5zzmn7wAs30a3kT5/lb8FZApE5vfKoobxdBUb17TgqhvdPrjjrF+0ojFMZ3RicSsO4f3NhR9xcf3xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VkbXKxV8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cGJ6YtS8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 7 Mar 2025 08:20:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741332028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+AG5UruUxgLbWuATEg2BmmwXjmBgRveHzEkpzY1wPfk=;
	b=VkbXKxV8MXuZrsifc8Sj8me2P5XnL3f8aiMKNa6vVBhEDWuwct1JyVpmlEelKwYiBXRolF
	50nXZIAHVw9m0T8EUBpJ4oKq+OX6MZbH2pTI0dLupQHssCfzN+oUuyjpj8eaQ0DEDYyCLR
	S/v50vv3rGlCHetFXoJAn6Pj7s9mwh0MCj8Ocg+itTyJZCy5RdYn++unslSEH1g0Z5sJyF
	N9UFmLQEi1BphH4E+isneXKdrjBa4BKoT2BlNslo/xvGc6QEw8RXkPqJ5lFp13eCBikwn9
	gojEC9SMdJHLP6hByEOTTR3ewtBKJAQ38Zdwxv/4bBhmtJww3bul1GDeAALPfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741332028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+AG5UruUxgLbWuATEg2BmmwXjmBgRveHzEkpzY1wPfk=;
	b=cGJ6YtS8XQY3gZzYJm/9YIFbFi2hl7gZQ1Raum4mCYQD1TThnufNJ34TiwTwhDSNbc8ylt
	vel7hhOHHXQDjXAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jeff Xu <jeffxu@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20250307081733-c161a60a-a466-4f38-9024-0d89d7ff13d0@linutronix.de>
References: <20250307151426.5f3c0c39@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307151426.5f3c0c39@canb.auug.org.au>

Hi Stephen,

On Fri, Mar 07, 2025 at 03:14:26PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/arm64/kernel/vdso.c
> 
> between commit:
> 
>   6742f72d084b ("mseal sysmap: enable arm64")
> 
> from the mm tree and commit:
> 
>   0b3bc3354eb9 ("arm64: vdso: Switch to generic storage implementation")
> 
> from the tip tree.
> 
> I didn't fix it up - couldn't figure it out, so just reverted the former
> for today as it was simpler.
> 
> It looks like VM_SEALED_SYSMAP needs to be added to
> vdso_install_vvar_mapping(), but that is generic across all the
> architectures using GENERIC_VDSO_DATA_STORE.

This resolution should be correct.
VM_SEALED_SYSMAP only does something if CONFIG_MSEAL_SYSTEM_MAPPINGS is set.

<snip>

Thomas

