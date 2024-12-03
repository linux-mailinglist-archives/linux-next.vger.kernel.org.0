Return-Path: <linux-next+bounces-4856-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B39E1843
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 10:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 223ED283486
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 09:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330E41E0B96;
	Tue,  3 Dec 2024 09:48:52 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C298A1E009A;
	Tue,  3 Dec 2024 09:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219332; cv=none; b=ZgD5w3+RIvnMO1dXH2PPUQNKex+2QBzd3kBqmbxI37qDdqfnsC6Yjch0DgSRHOWC4vdpuYJCFGD+YjGA5guVartk5qGfe2yzQSPKd/cc3yGBXHs8Kby9QGWz3ck3a5Ziy9MNZV4pULCPlbbemicSwHu/8LJZMf8TxTrE5xBBNXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219332; c=relaxed/simple;
	bh=PG9196wRXMmgtxOoHLyiAMvB2Lsd0RXo8mYB2x7rhd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cva1dQpC0V5r5K3ZkEJnt4cT3KADXo+1wPoBXPDMiPNWbe9Nbp8o4eryT+aVnWdCKEViEqPne3jRB8XObRaXg/xzOOOG+rp0Cf53OTNJTqbV75sncCowWCckT6a14q1h+h9Pydtsj/+D4vL2vykVUjlGWtYrtV49tBmm/j4dAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-84ff43e87cbso1442035241.1;
        Tue, 03 Dec 2024 01:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219328; x=1733824128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XU54JmccrCF1VbYyZLPWkaVUjumLO6idy1nMQ0BP5Ug=;
        b=hFKq4+nsQWYMutKnwa8lOoLncuGZ00LOpS0D0MxdfQCIQav38wHUL0ww1vWbho17Ij
         SU92NYwWPwh6+CaTgMC70vlPLW3qmQzNZpXyH72gyBy8wM/OV1kjsCgHtNcUvPLYhtCz
         DZdOMg3RLUDOOkvQ0LMITNrirvQeNmF8x4/v9GJaR9bzf4NUBUPDrzN8B4t9jYX/v6wE
         XM/6pjTAUj68kEzmE7fd0i8NMDBndTHFMPStKb9r5RyKJP8OcN117sVrS55Bvq+YeQNr
         ZbL+GAXq5TlxYXuaz5hnESx95tVxsBaw9xW+LFEw9cjeIKWDEaWBjzkGGEQDmAIhVcE5
         DJGg==
X-Forwarded-Encrypted: i=1; AJvYcCUH81FsMpddkKxyl3oLGj7lqmMceIGKN65bmf+zrou/aa9putGCUbl1ds1zdQfQk5iwo70U7lgy@vger.kernel.org, AJvYcCVyWYer9umZ0nFZh5LafYZaNFJ0N/++AKABkjWud3UQ8sGbTJDYWMSYYUCBR2IFWcdwl0oJEZ6pdXzAcsg=@vger.kernel.org, AJvYcCXrt3ef1q2HKf9WbmWMI/1jeWGUQN/t3g/JlFZ+an+1SxSy9fuBU/WU4ujxN/jVxtMS4b+RkrtYMctrQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI2GZIWkPHYBU49rl7KVJiMQdpf0QqQbwdKGvhBzbFwPjj3jL+
	csoPHRVlKg1g65rw8XQ6rT0s+CXdIA2bQ7KjhwC5ebPeQ4f64bRDALCxWZj3
X-Gm-Gg: ASbGnctjqUbtXlf33zHA92A9ddpwRYPmanW6NvlS18K1Oxr3Em7RNBZ/4+dHPPILK1K
	XnmymhtWTOBIWa3qtq5Ru2/Ec54/QHIfjvWPSppoFNXnUeQJBO5JjYA9oUvY49DskMz3Yule23e
	CFNCaZ2Um32q1EnUe2d6WYDQ2D8jE8GU6A25o3CGeO8Vhu5xBCVZjWCi9j7baC0lizPx8GeEKCn
	P3Wf/u85Br2NK9oK3e5JZ7kIsiMQjG0i98gV4pO6jYln3PcZyrcSHWC+WJSqpD1xrIci4NgqACz
	LcchWG0ffEIH
X-Google-Smtp-Source: AGHT+IHvmzyfEPWhzDVbWCH8r2vx0TL6SDD8bl87hsG4+AWHbmIqT+V0B16srjvm0DDkOjdUP8DDSQ==
X-Received: by 2002:a05:6102:5486:b0:4af:5d9f:f8b with SMTP id ada2fe7eead31-4af97375e45mr2463156137.20.1733219328190;
        Tue, 03 Dec 2024 01:48:48 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af592352b8sm2066031137.27.2024.12.03.01.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:48:47 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4af3719294eso1437867137.0;
        Tue, 03 Dec 2024 01:48:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCbHf/iqxOqsEvouGi0NgEGTUrNLY3nqVSxXNfcdYsLENyCDgED0xbXqn2fe2ghThecCvunMkSwtKgaw==@vger.kernel.org, AJvYcCUqiTDRU/dl00SDbfYQpMXsBVHBFuJOTDrfagA7fq0j1YpOxQa07Z2l0XFRcGbppOZIUXrlg3HP@vger.kernel.org, AJvYcCVxcZYyJkCNdxe4Uw2gnPR1nufBWrJvHCR7WsXg6tKQ+Uq6B0g5rgD8A81twBoZ0xoc24tR+bIdFwpeNxM=@vger.kernel.org
X-Received: by 2002:a05:6102:3054:b0:4a4:8d45:6839 with SMTP id
 ada2fe7eead31-4af97268516mr2634403137.13.1733219327668; Tue, 03 Dec 2024
 01:48:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241130145349.899477-2-u.kleine-koenig@baylibre.com> <173318582905.3964978.17617943251785066504.git-patchwork-notify@kernel.org>
In-Reply-To: <173318582905.3964978.17617943251785066504.git-patchwork-notify@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Dec 2024 10:48:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3J=o2x9G=1t_y97iv9eLsPfiej108vU6JHnn=AR-Nvw@mail.gmail.com>
Message-ID: <CAMuHMdV3J=o2x9G=1t_y97iv9eLsPfiej108vU6JHnn=AR-Nvw@mail.gmail.com>
Subject: Re: [PATCH] ptp: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jakub Kicinski <kuba@kernel.org>
Cc: richardcochran@gmail.com, yangbo.lu@nxp.com, dwmw2@infradead.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 1:30=E2=80=AFAM <patchwork-bot+netdevbpf@kernel.org>=
 wrote:
> This patch was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
>
> On Sat, 30 Nov 2024 15:53:49 +0100 you wrote:
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >
> > Convert all platform drivers below drivers/ptp to use .remove(), with
> > the eventual goal to drop struct platform_driver::remove_new(). As
> > .remove() and .remove_new() have the same prototypes, conversion is don=
e
> > by just changing the structure member name in the driver initializer.
> >
> > [...]
>
> Here is the summary with links:
>   - ptp: Switch back to struct platform_driver::remove()
>     https://git.kernel.org/netdev/net-next/c/b32913a5609a

Note that this now conflicts with commit e70140ba0d2b1a30 ("Get rid of
'remove_new' relic from platform driver struct") upstream.
Resolution: just take the version from upstream.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

