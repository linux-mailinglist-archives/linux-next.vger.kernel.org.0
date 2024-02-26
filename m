Return-Path: <linux-next+bounces-1361-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A58676BB
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 14:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E59F928E275
	for <lists+linux-next@lfdr.de>; Mon, 26 Feb 2024 13:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDFE12881A;
	Mon, 26 Feb 2024 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dG97OFSY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B4F12880C
	for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 13:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708954655; cv=none; b=dkBCQUWThzQU1sVwrhIf23kInf6Fe6rYky8O2ogv1PJF6D+Fexwbct7yPzbv1Dg20NrqsLp2gcxN3gQzPca5DiADKAZBdMoUxUN/mzaKs+VSOKWmR474iiAje5kSLHvPl1GFcfKs/uTg6StbjQj7N852veAdkC64M7xiWjmxcs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708954655; c=relaxed/simple;
	bh=QdEwI9QlMgL01Ffi2DaCcAkgo345YjCp2wxa14Lk+NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AV1Dcur/LHbNs2HJAYpv0rdXJnGC/08RzKuWqtT0Bar+p0g3F6aQ5ixVhzty/1UD1r+4LZcXIiKs5t0nH1p18DBV5cttT8P0GEL1H83gchf4ffCWSMaGvt7zRej9XAujOMwqHUHhJOd67NJKG33duDF0tE+ST7xv1Ch4CiTKR4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dG97OFSY; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4d14e9d4d0fso289292e0c.1
        for <linux-next@vger.kernel.org>; Mon, 26 Feb 2024 05:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708954652; x=1709559452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVBescN1cuFlk0Nm2k2RUQXFNz8C6uStbKpoBsdlsAw=;
        b=dG97OFSYAM5gOF68+MxVRAAlNhVVRx6sajFXM7Szyot9RYRDul8fXmRV56Zar9t3T0
         yvDcOXer5iWqGjr/HR7rnR6aiA7XY+q9mqOouKWji86obG0hBYI8MUQJUHJeuIaTUYgp
         6k+Knk8jTeGMwN9AmPZv8+L5FjnRsnjyljIrpfp1Yf0Z0WT9BJvt+afXWEQ4yxdNcvfN
         4eBDlDpsujhphz674nw+ml/v1aZHDbqCFA1rtt7cSJmfDAm/Y2jw+82sNgoZd+EuAPkd
         674Df78nsf9fSImrGN5kERJ2BdyHKUVDAWXk7VCExJ21QEpC+oSXRZavm/2vr2igVS8X
         3xPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708954652; x=1709559452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVBescN1cuFlk0Nm2k2RUQXFNz8C6uStbKpoBsdlsAw=;
        b=Ata53AdIsNSwgx2Wd6XGggLI4NheDpFGwacGUvYTAh6nRKqgK/UxVU+Eh+AQbxPRok
         lh6L9A7ELixvIoYD/xV6lRWRop0VU1rUeFMNOLegJ2blop3veETcvPWpbr6f2T9U9BKL
         2L5udkL4ubECw4fsj2W2Vz3AfwbCEztndCSCxBWJIvThdx3opYt3EQ6YNCHtqKKOTw6n
         tGRMzDkB/cJ5Nb2pF9YtEPUHAP8/Bsbnt9BcHeQON/+iQKADTgAZf8GLvjflUOFOxq3q
         CqTi5s4txLmuYj6teAkPqBH3i613egr2RySowngukSbkTFYzNEvjrwxrbRytiNRBc68X
         LBWw==
X-Forwarded-Encrypted: i=1; AJvYcCU6l9luUhnAoSGqLOwW3Tfw7vQBq6/KBMKANSe7CX4AiRgdCHkYxuycovhRswLl7ELq5aKWWCi9KtG36hCuGM00G1KeGyf5VWJTdQ==
X-Gm-Message-State: AOJu0Yz6nEmkVDc5o2sXDSHcsBlyRUfD1Em+45CI18LiJpkP9qbuUxkx
	bqf9bNZ03Rqp3pj84mWstc95Dg7MrBOJ30/Y3So3D/1yZSO5cqmbeclcM55v2bN67DfEnW6j9kp
	b2aFN+uUnQ7ZrhPykhDyxiaR/lGtHXMZyUDt9bA==
X-Google-Smtp-Source: AGHT+IEfn2RuqdpoU1z0tZbiuMJyTRGgX8/XzY8xA4xhr9R9WWQS7s+vHLTBQjEQ7TNvZhNKDomanMyhV93RZKd81I4=
X-Received: by 2002:a1f:dd81:0:b0:4cf:19c3:c1cb with SMTP id
 u123-20020a1fdd81000000b004cf19c3c1cbmr3104603vkg.12.1708954651109; Mon, 26
 Feb 2024 05:37:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226174117.722301b9@canb.auug.org.au> <CAMRc=MctN=PqM6O3GxvcFuk2ZT2YcqTiKZiuCiaTnXDEV+gXaw@mail.gmail.com>
 <20240226110424.GA120668@google.com>
In-Reply-To: <20240226110424.GA120668@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 26 Feb 2024 14:37:20 +0100
Message-ID: <CAMRc=Md3pfEWcMSoVjdj7_o9MJQUShfKL6=XyWVm3MqEWKFX9Q@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the gpio-brgl tree
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 12:04=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 26 Feb 2024, Bartosz Golaszewski wrote:
>
> > On Mon, Feb 26, 2024 at 7:41=E2=80=AFAM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > The following commit is also in the mfd tree as A different commit
> > > (but the same patch):
> > >
> > >   4a7b0850fc7a ("dt-bindings: cros-ec: Add properties for GPIO contro=
ller")
> > >
> > > This is commit
> > >
> > >   7b79740d42e7 ("dt-bindings: mfd: cros-ec: Add properties for GPIO c=
ontroller")
> > >
> > > in the mfd tree.
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> >
> > Hi Stephen, Lee!
> >
> > I picked it up because I was already queuing the patch adding the GPIO
> > driver. Unless there are conflicts with the MFD branch (doesn't seem
> > like it?), I think it should go through the GPIO branch together with
> > the driver.
>
> This is the first I've heard of it.  There was no reply from you, even
> after I specifically asked you for an explanation.
>

Huh, I now see your email in lore[1] but I don't have it in my inbox,
not even in spam. I would have answered otherwise.

> There is no convincing reason for this to follow the C change.  It's
> more important to avoid Linus from facing merge-conflicts during the
> merge-window. Please remove the patch from your tree.
>

This is why I'm asking if this caused a conflict. Whatever, I'll drop
it alright.

Bartosz

> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

[1] https://lore.kernel.org/lkml/20240223102039.GK10170@google.com/

