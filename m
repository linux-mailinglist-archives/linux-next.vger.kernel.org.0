Return-Path: <linux-next+bounces-2895-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA692BB70
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 15:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 579591C241FB
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 13:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD0A15FCE7;
	Tue,  9 Jul 2024 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="um2fjJ4W"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1035215FCE5;
	Tue,  9 Jul 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532071; cv=none; b=Wb97CjOq079Loe+NyPFJnRHDaGcfdbW80uIpNjKUgYoMzNJ+0tFEbbNG1GC4p59ASLr8k/OBhp+Gid8m+7MMscriEeiIyiMab5mLYrFwR0uXS/ggkLchP8si7kW5Q1zjswssoVKBy1bRta+WTdnYR/XCxkSIfNeGBySzwOcNj8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532071; c=relaxed/simple;
	bh=Gh96kZoSu4qPl4qjbYnI8f6b5V2rgNt42/D6al+sp0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nanz6tJU+VE7mohvjWpaLPd+rlqcfThkd4EYs8SxF5T8ZZpFO6A69/xKIoHqOATj3Go14x/IO3u4o3l8mYkB2ViC+8CyjcE+pTV+CqUfXMK76ST2fYR7S3ENi+4iahC84kYrgE+gYxx6hu8fY5fUqMJ0TgsJki9bIb/BoxKWnvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=um2fjJ4W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BE4C4AF18;
	Tue,  9 Jul 2024 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720532070;
	bh=Gh96kZoSu4qPl4qjbYnI8f6b5V2rgNt42/D6al+sp0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=um2fjJ4W0tMdw1qTEefEGHwsoPIinl8Azwam2dvwPebUUX4JUss5ftzuuN3tC3xmj
	 yX4ZS/24VpkBq4lgojA78+Z9CYY+jaXKaFrhdVtkHCja8tC2WgNaAwExnBTiE8JsXR
	 Q1XGHaUedGR7XDWx8qH2LUzB7ILBnVKvH8aLt7IuIB859C4F8EeXiwVaqi0qssHUcX
	 Up0fNkhrYyYttsqDT0BZ3qVhsswDXvf0UIwU4ROh+59691qENsflhd3sH0SCYz5dlg
	 sBxO+iKkADL0SmnPD23jMuWnY9+79o7Y0vqzQ9JiHL3AIQBxMR0MVlA34eFxvuyPFD
	 2eB5sXpuMghbA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so7071773e87.3;
        Tue, 09 Jul 2024 06:34:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvuz8hjpabodKCPf6W4w4edkoWTq2k+uK1nHE2h+/d9pOx1gF354GSQwkATQl7KHl5RhRdVt337ItFGzVVcfoD2Z+W7cPUJZ8bOlX64sonWgsuX0xAET8tPZzVd6MvnIomVZT53YIEzA==
X-Gm-Message-State: AOJu0Yzfpvsf+4fq4eXWoeiASqMqshzVnOKIxfQyggXzhTN+XunYFRxi
	4akm/MdFCbEUTYAL8Bl0UFfRXMUgbD4Ia6573nTc9oXT+F2CZFuZ0rmH5O92pbfebNgz5FMO4ia
	t3wQyfyUWl1Q28pGCKM06A3/aTg==
X-Google-Smtp-Source: AGHT+IEWCZmwb7bqWfeSc24koi5vl4aX6yZQat4xM5ztZzsP7RJPqi/BX7TS1eBsMl67Usjfu//6soofUXW18r5bfeQ=
X-Received: by 2002:a05:6512:3b9d:b0:52b:be6b:d16a with SMTP id
 2adb3069b0e04-52eb99a3526mr2523301e87.31.1720532068799; Tue, 09 Jul 2024
 06:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709164618.69cfcfad@canb.auug.org.au> <CAL_JsqLmm6Da=4G9cJfAtKJB5j_dfbTywRRwHMKZyf3J7SAxfg@mail.gmail.com>
 <f2ceee62-2612-42d1-b727-2f087acc6785@app.fastmail.com>
In-Reply-To: <f2ceee62-2612-42d1-b727-2f087acc6785@app.fastmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Jul 2024 07:34:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJU5Ak9-wXai-q9E6btKOnoFDD5X17tighmzVPFUpAgdA@mail.gmail.com>
Message-ID: <CAL_JsqJU5Ak9-wXai-q9E6btKOnoFDD5X17tighmzVPFUpAgdA@mail.gmail.com>
Subject: Re: linux-next: duplicate patches in the devicetree tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>, 
	ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 7:16=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jul 9, 2024, at 14:42, Rob Herring wrote:
> > On Tue, Jul 9, 2024 at 12:46=E2=80=AFAM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
> >>
> >> Hi all,
> >>
> >> The following commits are also in the arm-soc and risc-v trees as
> >> different commits (but the same patches):
> >>
> >>   0620bce64afa ("dt-bindings: riscv: cpus: add ref to interrupt-contro=
ller")
> >>   877097a2fab0 ("dt-bindings: interrupt-controller: convert marvell,mp=
ic binding to YAML")
> >>   c7ce06684bf5 ("dt-bindings: interrupt-controller: riscv,cpu-intc: co=
nvert to dtschema")
> >
> > I had to rebase my tree yesterday to drop a bunch of reserved-memory
> > restructuring that seems broken beyond repair. Maybe I'm going to have
> > to just do reverts instead. I had no knowledge that anyone had pulled
> > in my tree and how is it just these 3 commits? It should be at least
> > these:
>
> I picked up
>
> b1a4e71d4fc4 arm: dts: arm: Drop redundant fixed-factor clocks
> f7e642bcd622 dt-bindings: interrupt-controller: convert marvell,mpic bind=
ing to YAML
> 2af8d8a583a4 ARM: dts: armada-{370-xp,375,38x,39x}: Drop #size-cells from=
 mpic node
>
> from patchwork when they were sent to soc@kernel.org. I don't
> see the other ones in the arm-soc tree though, maybe they
> are merged elsewhere?

Looks like it is just these 3 and my rebase was just a coincidence.
The duplicates have been there for some time. The risc-v patches were
applied by both Palmer and me on 6/24, but not pushed out by Palmer
until 6/27.

I guess since I rebased already, I can again and will drop these 3 commits.

Rob

