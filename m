Return-Path: <linux-next+bounces-9733-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2ED3C2F7
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 10:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E29FD64512D
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 08:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E457D347FCD;
	Tue, 20 Jan 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QLu52O7L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C83431FD
	for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898212; cv=none; b=pqWP6uSWYxRi2C+9Z4EAZ5ov4iAjlYzhhSAN8SB4Dbv9Xf33f3Mdogo2KMUfxSUrobL3kXe8QzhXOxnGTEb5v8/BhNrsv3MUsfkbjCNrNt4MT70SfPAt27xwbdQD01HpPTATyPyt94rKAC3zhcrRFvDNBZKrHi//713cPUnuH50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898212; c=relaxed/simple;
	bh=SLPtx9k2VlVNSTMEC55f13DNCIom1rYtjx/4Umtz89k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EWZZwgsT/eYvCd3oTD3QBF5ibgs0iZWCfvEwgnsPdSZcIvbgfdWYUBM90hxNfKME3V/g1MWqqj0nxQZcBmBXQcWiYjIuvX08GI3QQ2pBdiaDwWylCAKf1uyENMmjnY+DxIZFpekEYPBEW7tGkifJnD2woXAjhpFpdSMxhVOCSeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QLu52O7L; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430fdc1fff8so2779812f8f.3
        for <linux-next@vger.kernel.org>; Tue, 20 Jan 2026 00:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768898209; x=1769503009; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ua50Epln/erVqsAhC1kianK5QMKjfKGqQsVaUciigQQ=;
        b=QLu52O7Lx46rTd0VBXWQSPPiI+/HxNxzL1kZvdNGotP8aulU4mXU0sZdyZq8I+7BEz
         amIOWNLzACJ3kx3b41Y+qefDbLtkrnayBAjNmBDWvY1MsRTbZtBcCwgvWuSpBTCjvru6
         vfwnqkFYQwwu3Y0rEoG3vnKW9oJjAESf3ITlxYBOF3xEFoI6BJxkYyhnPCdDoS3IE4nf
         fm47tDgYrPyolvr5xnQigBCQuCD1UFNyqYCfEIdyTNXbOIUy3dTjJ7FgZ7AMX5I66Mnr
         jo7CZIxP33i4EQd3HIGpq2G3Eg8LaA/FuaqrTqYrLL/Uz83lddAPi3lNKHF8MSRP6XeL
         g1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898209; x=1769503009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ua50Epln/erVqsAhC1kianK5QMKjfKGqQsVaUciigQQ=;
        b=T2lAOa8/DarPOOQcLhEyXn1NtX97HC3cdWhJKzJ4aJFjnZPOoZRoEWhJjv846cIKHd
         yLQUEkq7fhPkFyv0sI049WXRR35LCmQaNXBR3xz90NC7Cdc3GXFl3wi19ON46SCg4IrD
         LfXZZScNKMfqAYrn6TsuCthaTyClsW6idfWAdHH96Zwx/ZllLomEdHQtiJXPI6IfdvLD
         t0q/2UY8BzbV5bIXyxuarTVeV9fBeLHGcMfAIWn1EI9zOmdENMAUJKDLo+egrurta3cB
         iJK9a12cuJG77Yf1HMwyMjKbWSrWnvggzYQo9fRcdEW/82cavpnZQN79JTXlUsMoUQrA
         AS8A==
X-Forwarded-Encrypted: i=1; AJvYcCWpjC3Na9k+bx3URGjbkcprRrQsJUw2VkAD70V+zLmEKqA4+Ckl9MpIuJITHFaSqSG0Os3sbFHsx/e7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhj/UF/NChQIS3U7Clyabg0JBzcX9imiX1w1uzS6nUykJRHLIx
	M4T3U08ta5dI83SzA9NXC4ZGqyZPfw+ELWMYVh5u9RTXdeREW+3H2cHMT32MWYWOrGT8sqXQ1VM
	2h7FNvmDyQuthcHPStA==
X-Received: from wro24.prod.google.com ([2002:a05:6000:41d8:b0:435:8f60:e5e0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1848:b0:435:92d3:d9b4 with SMTP id ffacd0b85a97d-43592d3db26mr1088913f8f.26.1768898209188;
 Tue, 20 Jan 2026 00:36:49 -0800 (PST)
Date: Tue, 20 Jan 2026 08:36:48 +0000
In-Reply-To: <DFSXL1I12WPM.BDODUQNYLEPJ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aW6wfOjd17D5tUC5@sirena.org.uk> <DFSXL1I12WPM.BDODUQNYLEPJ@kernel.org>
Message-ID: <aW8-oH7dtp-OTAZC@google.com>
Subject: Re: linux-next: build failure in final build
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 19, 2026 at 11:49:10PM +0100, Danilo Krummrich wrote:
> (Cc: Boris)
> 
> On Mon Jan 19, 2026 at 11:30 PM CET, Mark Brown wrote:
> > Hi all,
> >
> > After merging all trees, today's final linux-next build (arm64
> > allyesconfig) failed like this:
> >
> > error[E0560]: struct `drm_panthor_gpu_info` has no field named `pad0`
> >   --> /tmp/next/build/drivers/gpu/drm/tyr/gpu.rs:75:13
> >    |
> > 75 |             pad0: 0,
> >    |             ^^^^ `drm_panthor_gpu_info` does not have this field
> >    |
> >    = note: available fields are: `selected_coherency`
> >
> > Caused by commit
> >
> >    8304c44631c37 (drm/tyr: use generated bindings for GpuInfo)
> 
> I had a quick look and the problem is that another tree (drm-misc-next) changed
> the corresponding uAPI struct in commit ea78ec982653 ("drm/panthor: Expose the
> selected coherency protocol to the UMD") without also changing the Tyr driver.
> 
> This diff in Tyr should fix the problem:
> 
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 3072562e36e5..0c85f03b8a7d 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -72,7 +72,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
>              // TODO: Add texture_features_{1,2,3}.
>              texture_features: [texture_features, 0, 0, 0],
>              as_present,
> -            pad0: 0,
> +            selected_coherency: 0, // Some variant of `enum drm_panthor_gpu_coherency`.
>              shader_present,
>              l2_present,
>              tiler_present,

Yeah, if that diff can be made in the merge commit, it should solve the
issue.

If it's easier, we could merge a commit into drm-misc-next that renames
pad0 to selected_coherency. That would trigger a merge conflict on the
relevant lines of code.

Alice

