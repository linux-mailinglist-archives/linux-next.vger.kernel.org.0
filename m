Return-Path: <linux-next+bounces-8937-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53097C51C7C
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97B61189A06E
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767CF307AE6;
	Wed, 12 Nov 2025 10:53:20 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE62FFDF8
	for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762944800; cv=none; b=UoYRNnOzRiNloM+dR2pdja/tA39OE278utzQPmgTsLzI0bjFOZG7F0v0BBPkuXXRTwHhAqkS7K4uyLszJ0QH3b4OaN+vtaozGU2vbaQtpHlIVwZGYsVz1PjpRWcvRpCjdp+7KhhhmxhL2+gGZozWGuVk/KVSKytdxIQKnVPEAkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762944800; c=relaxed/simple;
	bh=MBkcIHaoTtJht9V7eELfMMFBFS/GZwbB162qFIHhEkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raBapcQhPzp0zfoZawnpGQV8MBLkDBxUfM7FhvYSp8ZiCmX4jl2G22Emuwa9cyfybVuQ0wiEoN5Ck8o3Yh/IWCZ9AT6cPpUBmIkb/2cyW18PkMwUVN2l6bBgHlW7DfeW43d6IEjRZSaf1HiAbVOveo68zqTrt8K4pl0iAx3Jn7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d61f261ebfso275383137.2
        for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 02:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762944795; x=1763549595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22nv2YHVY20paw4fGOnUiWK+fXNHbu6IXKzWGD3lqAg=;
        b=cmBjYCpqUifd8/38Tt4i91CIEmVmfQkUOIz2Rht6Q2yp5IqmXikmFp6dTqx90PEJeZ
         zmkgci99ZaZ2+TWCN7UldFdTNuWQc+R/tubjzViLtWn1AsjemXOfb7qOrqmbsW15xvQc
         Cmg0y4xlyR54IVeiJqMWx6HPmD48WPua4WD86VwEgdj5eTusVpyE++NQcat6p2SsfnMl
         FtFRprL6Zj45sPgfgTpBCwKty34bxjicePtjdY2k4WnswQC4uoDsTXt/pS4f4q3wYOjl
         sTTJgNFSRiwXDIiNydfn3O7Dd2o5tyorH1ENbZ/r2x+Et9KdfBVyCLEGGYioXjv419+G
         zWbw==
X-Gm-Message-State: AOJu0Yz/K01RZin3IvX9e3iEFT+bmeRFgUl+PBCV+9dwEsVt3CFLMKZO
	fqQjuWhwpZlOpLj/BO8yDBgKsEEYYAyrzw/1wIyA04dYlt8WgDbKAu+ED+o7kcE5
X-Gm-Gg: ASbGncsBTcQ7uXFt1ZTZz2lqjHxaQfparuTjKNbemjrgG5vfU0LMFlskOwlEIHXK6Pl
	pGdrhOlkMaONTyceTGeBufDDJu4Nyna1gmkUFICuhpagkSrsU4LbCZNzoWdf/t3UcLC5XvYKtlZ
	Zx9lBfJ6sH0hPryb8Od1F0CzkJdxPu/C/P/g+OlI7CDEYH03eez1KDvK90G4Ig+VltjGzXgGcTk
	gfIFWT2RR+c9eJNW3+yEjXlvW2KJoWs6XE2DQ/9hZImtCKygr6uOx+1ssO0y4rbLw3YNoOI98yp
	vHF/LT4dEIf0IHQOdAEflXuj348uHOTqxsFplLQsoo4li9qN/xin6I1c+xbdOtbMfFmsOJJtPXq
	da/JFMiWHYbtHmXRVZYIgUoL4STw66xFmUJxxRyRZqxvOl9+YmjLxgcHVwV4WePJ87/jKB3mxio
	hXFvLaxCuzEeBCk2FS+0kGnfeX7cGypcpVKo7+TZ9iOw==
X-Google-Smtp-Source: AGHT+IEfpE/gyL6zV/XefSg3u3n5KUCNurg9zx//zKS01FoFdEAGnn2xahtPkv9QoniHmXl3N0fSvw==
X-Received: by 2002:a05:6102:1613:b0:5db:d7a5:ba33 with SMTP id ada2fe7eead31-5de07d2fa46mr512889137.12.1762944795487;
        Wed, 12 Nov 2025 02:53:15 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559958285f4sm9586833e0c.18.2025.11.12.02.53.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:53:15 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9371f7571cfso226809241.1
        for <linux-next@vger.kernel.org>; Wed, 12 Nov 2025 02:53:15 -0800 (PST)
X-Received: by 2002:a05:6102:161e:b0:522:86ea:42c with SMTP id
 ada2fe7eead31-5de07d2fa38mr570610137.11.1762944794864; Wed, 12 Nov 2025
 02:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112160553.171643d1@canb.auug.org.au>
In-Reply-To: <20251112160553.171643d1@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Nov 2025 11:53:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVaz7T=n64YJrv4QEa0dM9pMt+es6fFYxP-czZxhRpsPQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn1q2yZFAdSThfGUme1Ea7R56WVwUCp_oiRj4_PbxJicN2lvoGKqu8c5F4
Message-ID: <CAMuHMdVaz7T=n64YJrv4QEa0dM9pMt+es6fFYxP-czZxhRpsPQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 12
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Wed, 12 Nov 2025 at 06:06, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Merging drm/drm-next (2a084f4ad727 Merge tag 'amd-drm-next-6.19-2025-11-07' of https://gitlab.freedesktop.org/agd5f/linux into drm-next)
> CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h

This file contains a duplicate definition of MAX_DIG_LINK_ENCODERS.
Please drop the second, cfr. the resolution in drm-tip.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

