Return-Path: <linux-next+bounces-9598-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D69D07CD9
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 09:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 490C23098794
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 08:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86C732AACA;
	Fri,  9 Jan 2026 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ErVILnOS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF6B328B6E
	for <linux-next@vger.kernel.org>; Fri,  9 Jan 2026 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947044; cv=none; b=OHwdzd2cLEcxjk/GcYBv5nIjC4+CbNa/AZdOxhc/5Vd29QlJ7AY7thJ2HskBRRa8LugwZJ3tEzhmnVVJXJF1qR2hG+D9gZmsJV+Vmu75xG/Ty6iDzfWHNRDiITfvczZrGibe/X6wZNJwL2HzWkUil40BSF/AJsaYCYqwlI+az4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947044; c=relaxed/simple;
	bh=lz4Sv/doGsBkOipW/OZcwadYnUVhRBCE9fQYHSt6c8I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BGSDpVFKPk/AyYCcckU7TgU0asIvLjTNmbG2loo7eaP8KV2Fut/kIRh/qbCzyxLR2e7AJfp0wz02ozjCpZp26lfxNSl12dybm/Ry9QsuUKrymMweic03On8KbOS7PcwgKEWLvSjRsdE5ZIh98C5ybmsStMPQgogEto9OH+tuECo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ErVILnOS; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430fcfe4494so3111034f8f.2
        for <linux-next@vger.kernel.org>; Fri, 09 Jan 2026 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767947033; x=1768551833; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz6XZoZwTVNk1kaS460BdgY2+XDbKdduhK2aC7bHOvY=;
        b=ErVILnOSPVk0Jf0lEjQn7ryp/kipa6kRPDz+PA9rxqRB3gkmSqSji+GewqB0wjT7C8
         UIK0R/Ud+erckMOIT0sBkiSNi4K8IhD4/1ez7b5+kP50/Uf9PWLmhUjiKNyfR1Yvd7sQ
         UTqWIeue+++MlRLFVKEkfVBQqCf5J/UO44J/yuA3jbkVGO+vgx9CQRkHw0oaHB6UBaFF
         5RTb6leGf0PvWFSgD8nLEKpi8A9NsYG8XiNTvyJPuECWhsbPqefBr+Z+HfvqRpPobAgv
         FckRhyL723GE8KrN98aaZe4uC6PARIoEtdsghwzh/BtXcCKiwL/Y7FDqBjiKBjNUdYCW
         Faig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767947033; x=1768551833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz6XZoZwTVNk1kaS460BdgY2+XDbKdduhK2aC7bHOvY=;
        b=xMUf/EFO5aIftyQDU6idd14H7CAIRtESWJNCf8t0T3tMeg3ZvVV1mLnwLRTuKES1K4
         aPvjEu+MdPk7eLJfEUW5rW2pV8/RMdZr9XWqg3M29+VwyaW+rXugdR5pUbvVpNfJ6yUT
         7SLeKT2qspsUYIAV7fFft42n8mUAT7skWhzs1lgwyDtWqFBRxF2sgYm+oY53QORAmeUP
         If4PlcIIq88Xuzf5SDtZWTg9Y1izn7V9uTVxgFlYylWsyP0AIqKUno23bjXDmzIWSgHa
         V9CeTkWPvrpUKqBlP1We60fo7REWCqbQPRKSxzkQrsStqH9n6h5JkWseQiD3PtZlGW4b
         LcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUilWfQ5iBLegkZqFy5uMfrLA6pd2HoKNa8ITRWEblr3zVvr6l+ghz7uvcNS1FFwqK6lwQO+P6AHP1z@vger.kernel.org
X-Gm-Message-State: AOJu0YzJIAdjVuhViTLu0efhoFtcGjqvjAVg5Hn0QqiczYHJ1QL/YlNU
	R77tlhlkJGcdzH9hqoif7W6ZhVIBAswkDjC2QkSkbv8wAwKuhnGdEE57LhduQ77Kqo+Yu4oteBm
	xRQwHKykbRDWoED2mdQ==
X-Google-Smtp-Source: AGHT+IEORxBIBX+gxAwgYCUgmsBm4kcmdt3wMvqlRa+ow6HYY7tuSd6AdQ6sTWBCwLoPH+xaT8wwKwsFL/ro6+I=
X-Received: from wrp30.prod.google.com ([2002:a05:6000:41fe:b0:430:f692:a94e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:240f:b0:432:5b81:480 with SMTP id ffacd0b85a97d-432c3774163mr10272579f8f.24.1767947032905;
 Fri, 09 Jan 2026 00:23:52 -0800 (PST)
Date: Fri, 9 Jan 2026 08:23:52 +0000
In-Reply-To: <20260109135438.5b4f463d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260109135438.5b4f463d@canb.auug.org.au>
Message-ID: <aWC7GKcOB6m4LFGz@google.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Jan 09, 2026 at 01:54:38PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> WARNING: drivers/gpu/drm/drm_gpuvm.c:1855 expecting prototype for drm_gpuvm_bo_obtain(). Prototype was for drm_gpuvm_bo_obtain_locked() instead
> 
> Introduced by commit
> 
>   9bf4ca1e699c ("drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode")
> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks, here is the fix:
https://lore.kernel.org/all/20260109082019.3999814-1-aliceryhl@google.com/

Alice

