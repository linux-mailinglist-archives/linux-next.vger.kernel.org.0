Return-Path: <linux-next+bounces-8549-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CB5BB57B1
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 23:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9733A9953
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 21:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B0315687D;
	Thu,  2 Oct 2025 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HShZiSmn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7D3BB44
	for <linux-next@vger.kernel.org>; Thu,  2 Oct 2025 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759440924; cv=none; b=ZAodfGbAsMShMHF3UVt3EwMesEOPXfxf8MuFrKTeAZZ8CgBR5+43yNUEzxpD1dnnPgKvcn1GIY+1HwLccbh4AcE4+wCWR4p1wWITHExu+yTQEWteiK0ln0MF0AxRZDHdl43f1b70yWXBqdDxyZZzAzeJ2dxD+c0FXnijgoI4p3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759440924; c=relaxed/simple;
	bh=AVVFwwOZs/J59otbhwfw4JT56nx06ai60RPEpmvIzvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQ+lWvt95OnE8/hML69m7Yq+6SddcNJWmOJ9NBzHOJdQ/C/b5wd0GbdIwz/k5QEQpvTN+acOpn19ePCWbLv9kp9cMYE+cY5x9ZlxrEBiFY71WxOZ4x3g8Wx9FSj/3wrA2ZV63jRTEsKhuUocywp033yOn2w2ZzVrOQpm0wVG2RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HShZiSmn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32ecc60c9e6so175829a91.0
        for <linux-next@vger.kernel.org>; Thu, 02 Oct 2025 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759440923; x=1760045723; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4oFCmF2MJYP82Tx26J9+m0tH7yujIZ19Q3AuUhH2Vw=;
        b=HShZiSmngGwwkbMzDFmKm2X5l/FxURwI4DMKGUulJc0vXxtlAbtP88DTeGYbRiClE8
         CBol9/OirXLiqYuRDqjvjDpL+K2pFKcsYVqPqo5z2w17XveWdwRDp87SemhbUj8h/B8L
         b5IsA/9wmmrfQqLq/SQdcnp6rTNlsoZj51rgYKwwLcpZGk06rveeYHExfvrjN2tVv83x
         +SRkjvL3kBGE8LCVAnn2+s+8PPHTwKkMlEAtsL2vC3oh/Eu9erT38SHaPDOIq2EWvEyt
         vhRmWxseE+vuwiyxgyWRf7laXDUk5N8BS0teY3E8nkQakW4NQOif5IaTk+30sUWFAVqe
         x1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759440923; x=1760045723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4oFCmF2MJYP82Tx26J9+m0tH7yujIZ19Q3AuUhH2Vw=;
        b=fNyANAAiSCaI6EdVIrPmloVmBbi5JoNmUglAx1Do3iYkFXPUQkxoCsBwlgl9BeVOmi
         r4hPZ36jEPRrndgfNuUrwPZ1H8DeVd1SrNpm6dTdoEaPG/ews9J4P7UBz3dvAMaT8fWF
         YJhbzcjvkq7FEYFS9Pu0Yh4exJaX6ufiRJgt5wpkPs/Cu9s/PfLf/bCDHP2yHDmfZ9kt
         jrqnv1LW52t2TheoG6QIUPoTP2zx2Bb+EuVDDBow7YmxK28fFpliH/6uA3MUP1hd8sfc
         wadeBDPfsB4+BXuoHqRYafTNge3TE1mcHZl57m+WDJUuvKhEF1Bz15+jM7NtmOb4Aqs8
         PQJw==
X-Forwarded-Encrypted: i=1; AJvYcCWaPl/4A/PIGPn4seqABRkuCh74LAx39b0dQ8AGhkQ3QSTOBp35rB5bvqOO/8ER7NKZNQUldzUcZzng@vger.kernel.org
X-Gm-Message-State: AOJu0YwhNBaJyJNGelyLUk/37RNQ16fpkYOBSMLyV/tfP2QV278AQeme
	ZLfYNNFi3AOPfmikl1CbAhvvwW1a5MsSHZ5N49MRDc/JeBdVG/VQcux/gIFpmzA2aA6+QUqabRf
	eDwyoOFOohwx3BlnGsuvXgLCaTtK2ngQ=
X-Gm-Gg: ASbGncum9ZW8Pv2OHVaMBo431knNprh+LHIVIGzJLDlxQAmaZ+xan8j/wiFjp0+L0p7
	KLbWJGJE5gq9JQNTlTZ5NDN7/VggnjXA/cJBbkSvoeckOjiiDqKbY3j85A71ht7F/Pwb3IMaShy
	Sj4/epnjeeA95JXBGMfrm6+YE4/91b67l0rVYqkbSFyGH06oo7JWNRWArhn5aMg+HAjkAC6rnyY
	XeLebVSCQaB7N8+eUjiDZFURuQAASY6SFFmgMgchc8sTrtJ2jNcuOcw/9bNaSvrMytcFENxNgPp
	K4l6ObAXoDHxlxRzhUdO66r/uuuX5G9A9C0ore4zdpupJu/qZA==
X-Google-Smtp-Source: AGHT+IG/xHpb8vODrMK0iW2dO7jnh1RpIn7FOgY3FtTrp6iPO2ruZi3ef2cbGbqIJ/HrnJZyknLRRFb1B6+7lSVn0Sc=
X-Received: by 2002:a17:902:e802:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-28e9a6e3c9fmr4516935ad.11.1759440922764; Thu, 02 Oct 2025
 14:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aN6qWFc6hIcbRU1o@sirena.org.uk> <aN7cRUOxq-zwCoZN@stanley.mountain>
In-Reply-To: <aN7cRUOxq-zwCoZN@stanley.mountain>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Oct 2025 23:35:10 +0200
X-Gm-Features: AS18NWBdoHHZzscWUqRPxLm5RbUpvjG-fyzvyu5Mm6idZH8fsQtFe8T5gS5qDp4
Message-ID: <CANiq72mDsU3W5Qfyf=sKhbad4tAHJYF8WnY+4VPz2J0paA2gTw@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 2
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 10:10=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
>   RUSTC L rust/core.o
> error: cannot find a built-in macro with name `define_opaque`
>     --> /usr/lib/rustlib/src/rust/library/core/src/macros/mod.rs:1757:5
>      |
> 1757 | /     pub macro define_opaque($($tt:tt)*) {
> 1758 | |         /* compiler built-in */
> 1759 | |     }
>      | |_____^
>

Thanks Dan.

Hmm... Strange, it is the `core` library, which comes with the
compiler and thus should always work.

So it sounds like a mismatch between the binary used and the sources
of the standard library (or perhaps other kind of mismatch, like the
wrong edition being passed, but from a quick look it doesn't seem like
it).

I will try to reproduce it. Did you happen to recently upgrade the
toolchain(s) or something like that, by chance? Are you using the
Debian packages?

Thanks!

Cheers,
Miguel

