Return-Path: <linux-next+bounces-9049-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D6C64B47
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 15:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBF3E4EBFF8
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 14:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284762773E5;
	Mon, 17 Nov 2025 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xy199t00"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4A23321D0
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390858; cv=none; b=qFaKwq+W1oI+DckcfDFIs9hRwCc2jcAgNuaQU1MiIAKr6ADZxyorH6DpdL2yEEY4VMPiG+2m8Fp/NfSAJxsBJSHqanlaeGPcoLPUtkXQNWgj8h5WQLqw4H491cFBahpR0dH6BpMiKVtWPsdYuN0GA4OyJF5nycFdiEz5mcdh5ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390858; c=relaxed/simple;
	bh=A0n0rVGlIvQaQ4RMVsNOeH+W0OfM/ETsXcLVOCdxSPE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CGw2esLTpqhAB7rziTJug4Co+xFzu/QJPDJgbohTPKHAD2+eClAneW5db85jDx08/QVdZgWY4IaHrvQZcHAu/tsvdoF/OI0Zj3Ra0Nu/xSoeWrHxNXI2hUXLc/NlRIaE0FJ1Ub5zCvgOaLLoSk5ySbh3V+WX6OkQjXEq47nUDNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xy199t00; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429cdb0706aso3938539f8f.0
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 06:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763390855; x=1763995655; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1afKzXBvDN2B8nMak2qBkyd/NfZbmiS2FTEiE1WftWI=;
        b=Xy199t003kKXwmi3aqeNl4qxb0GNe04AKKyPqqFYRYdPcr8yjtc5KLk9DGOfXLejq1
         TbHgWrXIUoM+RemDfNb0pgQaLpiDXbywCLKVRpNivLAADo5vTLIW3iaYqaP/3lNoIznU
         UWIjG77QZqfAiY2HrV7Ez0EbDXgmMnGc3DH4DzDid4tPcZ7B5ynCRojBdcV4/dPjlO3+
         Zq+nZZyOSYn4O8kUG6Qk2nW5F/efXprkSUe/5gVkI8dcFS+Gt8S+Dln+gIAXuvrQeoKB
         kSRClF1vCHv25IdjiQwX7ifGjKLmc3QdDk3tChLR3FGBMfTwnFOq9qvF2+cWzgCX9dee
         EWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390855; x=1763995655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1afKzXBvDN2B8nMak2qBkyd/NfZbmiS2FTEiE1WftWI=;
        b=sTOzrLAke9LoL1MLNJkNvhVo2MrX84tBl/xWM3xJXxMSy/TQOSiuQrJQ899SJ5HXPY
         HYNaCd2N9ZTj7c8bYhbgEi41GBysCewfXazMP6ZI6tzs4+6dKKdi4U9NWqZBzJ4bneu+
         39/Y/YJJISlf0jsReJiZ29Z727LONNsWTsZfcPaUJ3fVo6r3JmLK2d2YZf+uxvQwPtOL
         Ut6dXBNHZfHXH2e6sf5yqjsCuj3TzluBZHwQFnDVcPX2bvOi0+HBHjJa0QsbEayshZCw
         t5MolhxcbZa4g11ltuaasEBw6fS9DVsq9SkMb39I4+7yghWo3gFbTVaK1P5AEq+mujUJ
         rFyg==
X-Forwarded-Encrypted: i=1; AJvYcCXF3dysGejvzglfOIoqLynv3ZjfqjiC9FdEe9h9mqSFPnZ11er3U/+hLWFpODgr1AFEvAJb31tUk5vC@vger.kernel.org
X-Gm-Message-State: AOJu0YyqCCwSqpyoBMibbk0b9d4hu25ay33hERJ818K0ISytGWrqbyiZ
	SZ5tmaw+s4PVqkzez3qJf6pVBpxkmFGVvEVTpycgFzw0nr/a6WIQPCvGbOnYJW8rbpGRfBZTlHo
	c77DI4DfQjah8aeItIg==
X-Google-Smtp-Source: AGHT+IG4MSO3uDNVkkjHl4LD8jbMYRbszWJo4l7hg5OncA4XN7bZli/XM7nXH2lpDQawElX+dHs3KKQ+UmmuEqs=
X-Received: from wrbee4.prod.google.com ([2002:a05:6000:2104:b0:42b:3308:563])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c1:b0:42b:3131:5438 with SMTP id ffacd0b85a97d-42b5939b2f2mr13082328f8f.54.1763390854762;
 Mon, 17 Nov 2025 06:47:34 -0800 (PST)
Date: Mon, 17 Nov 2025 14:47:33 +0000
In-Reply-To: <20251117160621.2043a859@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251117160621.2043a859@canb.auug.org.au>
Message-ID: <aRs1hb001g4n6vBX@google.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drm-rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 17, 2025 at 04:06:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/gpu/nova-core/driver.rs
> 
> between commit:
> 
>   1101c442410c ("gpu: nova-core: Set correct DMA mask")
> 
> from the drm-rust tree and commits:
> 
>   0242623384c7 ("rust: driver: let probe() return impl PinInit<Self, Error>")
>   e4e679c8608e ("rust: auxiliary: unregister on parent device unbind")
> 
> from the driver-core tree.
> 
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks! Looks good.

Alice

