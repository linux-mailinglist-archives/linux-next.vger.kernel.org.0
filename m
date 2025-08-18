Return-Path: <linux-next+bounces-7978-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47623B2A035
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 13:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8681D3AA58E
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 11:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6BC2C2370;
	Mon, 18 Aug 2025 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvR9gz4X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330BA2C859;
	Mon, 18 Aug 2025 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755515950; cv=none; b=dHz3Fx9V3UjiyIUEAfHla9WBF1p788OfW7uHlVCc/3N/va2Ri+PX0tfYzL6/JUaBfEbXsirJJld+7IDBW46n4JOdfavCX6Wfs0kgOHWNz9pR2CfnvdVjpC+VMXZcbp4V1hCJi1XQ3e/hcVRmq3HuUFN6PLLnWOrn4AhVc2swzYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755515950; c=relaxed/simple;
	bh=xnirQyl6NtJUepL0SbTKIFjKA2ZZeazliRyo80v03Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhHAu02J/bYoFvt0WKTSUPH2hJwEWOnIcGlKxibV2e5+Gf1z43Yi0ZkDC2xWyZ+RSubYjchLSjHXINLGEw3OFirw6ALTTHdg3WXdLYb0NLMh8v9KtPG6H63zk9Rtdqpllj2fUTY9mz5pzxabV37Mnudczh1D4NId/izeW33v7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvR9gz4X; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3234f8df749so211353a91.1;
        Mon, 18 Aug 2025 04:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755515948; x=1756120748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnirQyl6NtJUepL0SbTKIFjKA2ZZeazliRyo80v03Y0=;
        b=DvR9gz4XFoB/wYPmVyO1v+NGnCbs5wlkecGzlYrzJ3aSvIbznqY8RySbXW96TrygvP
         osit10mv49FCaIfIAHpz770WR1gjfuu8vpAmPjDm3wl4rJySsCfSOE0mqjC0y0QmeheK
         KeGrDGusV0D6hMMZNLkgWGB91ogkYBMxGzJJRxLGtUrch/6abAkdYo2UXrVoPyPqLfRs
         Qk/qBx+/hjJ0QZRy66kaocGqSglltXrrcLPu5Dm4eDa1uaLSw7lLQhHgt0aa7NyJNwq5
         3Yb8lnEzd6WjzFWD74nONeIvVoeW0GILBpXkEZpZP0RrjjxcjV592vMBdsOzaTVLialC
         JvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755515948; x=1756120748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnirQyl6NtJUepL0SbTKIFjKA2ZZeazliRyo80v03Y0=;
        b=NTf2i18QZuow/PP3W6JvxvErix5b57trDd23B/spBO0QJCAYTbMliofBDevChi8bNe
         Gbxf8R0DOPk/64NrvFWugi51tkvhQVp4HN7BKXahc54YzQzczfLt/E4ufr4afwo4DmKR
         qssnNx4ka6ZoPBiIMslFaJLpee9yf8fQLkGQ1r22WNO/QLmiU4VJyFaSe0PxKlKqN25C
         4wd34k8dShq143bi3hOLuKIapruKpfONGBJITnXLyljZ3iu4iUFh/TnOUMzQx1PcJMiZ
         C6EM/d0NC/ebDCVSAnYjES0CYfNygE05rirI27aHb4hooQcc7nBGgRWmL7OYjBLV+76+
         LF8g==
X-Forwarded-Encrypted: i=1; AJvYcCW1w5BWvpoh7BSQMpSXfJulHZUK4mv5LKXuo2aNIM+puUiWb5TqBkNve+2mkLymU0RGgjQtmbo0TUIlbDgSSMY=@vger.kernel.org, AJvYcCX5nBKgFSjd6NzcfomRj4a5Pp+BVsmaG0IlgOy4WqgglFunXp2A20d2gp5jmJIQw0SlT98GvIETdKcbrQ==@vger.kernel.org, AJvYcCXTXnV1GMIyMtrUPzuG5YUP1O+/whKe2ZZLAiHPJIyAVduG8xuuDSYQtLW3dh7a8OVkXVKCgIbafyMC1PA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbX6FMZFBDRHd1DSf+O/tdPnOHrXpuAYhNoNy5sjtIGJiFnuRW
	A3GidMEfyXd4jUVi4LKqdVX/Z1ew0Db05uf1vLI68m04AKXWM5Q8c4WR0428Jxw4avoijqH1mOb
	seWb+z9bJfZl0QlTbQcJ+GfMEfAyvvCc=
X-Gm-Gg: ASbGnctVz0OXabsop9tYFhUz1PRAwGlAFA088kjRL64rI1phghZVImkHnuT53D1bZOy
	LXlGbNj2lPXyVO7XvFKBXgRimeTJPpFi9Swx+gW2AkXwuQOiJ6IwHuhrx/8a1MdY6INtnmK/Cq0
	9goBFs0G3E3W6X5FozRYhcOYPYuIMYK50QK+8Gp7TNdUm5yGJ4Gf/DzFi/khViV4GHnoXGyQPcm
	h26tzR9TPiC6oDPf6Q=
X-Google-Smtp-Source: AGHT+IEB6mtYk5NJYh8LYxYr8dqZwcXL6UJUoFRAcV5Kygvnph29+Alv9tMPi0agX62hYV9p/H4wpV6KLKD0EHqz5fY=
X-Received: by 2002:a17:902:ecc2:b0:240:bd35:c4ec with SMTP id
 d9443c01a7336-2446d893254mr55283185ad.6.1755515948312; Mon, 18 Aug 2025
 04:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-align-min-allocator-v2-0-3386cc94f4fc@google.com>
 <DC38NDRET9NB.31UDI8FHB7WAY@kernel.org> <8aa05f08-ef6e-4dfe-9453-beaab7b3cb98@leemhuis.info>
In-Reply-To: <8aa05f08-ef6e-4dfe-9453-beaab7b3cb98@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Aug 2025 13:18:56 +0200
X-Gm-Features: Ac12FXwCrFGErkROMwouACVOQgFbTlyq7QH7i0XSag3tm7GDnoPUHsI2GpMApSw
Message-ID: <CANiq72mpYQU9CfwjvHvxhBaud0+qur3Db-hmKVqLKPLp_VHaiw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Take ARCH_KMALLOC_MINALIGN into account for
 build-time XArray check
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 1:09=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> on arm64 (ppc64le and x86_64 worked fine).

Yeah, it happens in arm, arm64, loongarch64 and riscv64 -- we don't
have powerpc support for Rust upstream yet (we had it originally
out-of-tree, but it never got upstreamed).

Cheers,
Miguel

