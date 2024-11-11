Return-Path: <linux-next+bounces-4736-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D849C398F
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 09:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88824B213DD
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 08:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1CB15DBAB;
	Mon, 11 Nov 2024 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QH2wxovs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2D15A86B;
	Mon, 11 Nov 2024 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731313018; cv=none; b=IyxOY8YUNC1l8X/zJ3ZVDxBlQ/nTHi5+Qaoshej7btGbC59t3dzbj5dQAdUUmX53jQBZrTKdutntDCts/QSfwwT1Hh2tv7n6f23xrPGSv7NEt+u9klvc8ELQKOxfNuAzp/JGpv+W2n9EiixSDHmNU52EJ9CfuX6oJAOfzM6WSS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731313018; c=relaxed/simple;
	bh=GvMvDjY9KTjukdadvKB8O94pJ4nJ6tWmLvAoLceCEUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n++ep3+18ll57cseOOGsnIFHW5LobKn7ac/k3C58aT5ImvvEdsiKneItsr5tTqpKskPilyWMNIlnjYC3zZF+dLYh3eOi/oLSxK9U6w+orV0PoTtxwO4VwseG8J6RmQuW3WyEGnvC1+v+OSbWeJJ/WHw0AILmQT3iQlSyrVnCj4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QH2wxovs; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-211985ed4c3so1170735ad.2;
        Mon, 11 Nov 2024 00:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731313016; x=1731917816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfWHwi/OtcjiHabudi9zWdTmEl0MHfGKcPLOFemBebo=;
        b=QH2wxovsHw4z9r2Tk9yQ4TKHHQQQnje+WWwRTLPXFkkiKkAmyBXy8epXmA+tv/yQjb
         sd4mFkbkPz0mkmLdE7KToTIH+M86YHAMOdLyxOySiFlaqeWxf6T04xdn15Xej75P8Kct
         PitUSbnySfXJM9lGYqU/gfWOiarLmSfLgKg6KAgzsTdclDvV6P6AfCEi/K1mlPXWK92e
         3jPP4nZO7VeIwoVandFdpdUdKZ1vbWe4BK/MBKSK7X69nK/j34UWcmJX+cVCtKb4NnTm
         4DxkmdDHVcSiOWrGoznt5tyQHLIdnkT4gWsC58FBelck9vh8msK7YbHh9E+PaXxDzhHr
         erCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731313016; x=1731917816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfWHwi/OtcjiHabudi9zWdTmEl0MHfGKcPLOFemBebo=;
        b=mcduSt9xeRHaXAgqF1Tc5N2RCB7isvD0Z5Nov/G7U3sIlyMktybhoIuVRgSJvByUdj
         fuH1IfJQD0oMhXTSpaOD6WSIRuxokJBtTmHO57DP0/extf+MazqwtCagg6i6eOpwS9+B
         NUbbInsrPWycc+mSHMkvam8bTWLE2snunkTHE3brhCwwQ+8I1rGI4HNhNOKH3GTA3wp+
         eQxmGQpSI+LyxyT8NyXktcLYdarw+vd6bHkPdTR1U8HjcUHiT0YB3DQoy/TOOXst45su
         yQ3dtr1k+AbQOL2JvE27NVYVT4yIAPjG1Tm36QQeNweW86D0ht/n/UpX4/y4yi50ty3y
         C7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCURazYU/LXJcN1Tovn9m972PUJ7e+dav0kBM+WhRQczq1qhf0JSzTG9NbIjLYtMT/TBYCrlb+UCFP4zdA==@vger.kernel.org, AJvYcCVKl0W9cf6JFHd6tEzNDDAuhFq5ADE84MfFSusNrrly3luFdGzqh5slkAyfGkLLBsvzof7f48rUqUO1nbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5aPscV3EEWc3vwnkphESHvNAdyEsy0XdSecIv1Zp4UvTF35IY
	Ch+S5U7cgcwc2X1Htwhv/PuBj5NF8s42qHcmM/vmp04Z9xY6WX/Rrn0hKO5nkfqu2rmOzLMCrCl
	MthBbYIHDHiL4XRrFDxHmMoiBkJM=
X-Google-Smtp-Source: AGHT+IHepygJxaMRWEY+r4zIfJzBpAgteSshbY3Qmj+9QV2/1qQoCszAwCNlxqNFPOBf+pVUdS7juAsrz9krUkVP6/g=
X-Received: by 2002:a17:902:f70f:b0:207:14ab:c436 with SMTP id
 d9443c01a7336-2118357ff3fmr64222285ad.12.1731313015783; Mon, 11 Nov 2024
 00:16:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111175842.550fc29d@canb.auug.org.au>
In-Reply-To: <20241111175842.550fc29d@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 11 Nov 2024 09:16:43 +0100
Message-ID: <CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 7:58=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> My first rust build error!  ;-)

:)

> error[E0308]: mismatched types
>      --> rust/kernel/device.rs:176:17
>       |
> 175   |             bindings::_dev_printk(
>       |             --------------------- arguments to this function are =
incorrect
> 176   |                 klevel as *const _ as *const core::ffi::c_char,
>       |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ex=
pected `*const u8`, found `*const i8`
>       |
>       =3D note: expected raw pointer `*const u8`
>                  found raw pointer `*const i8`

Yeah, sorry about that, this had very high chances of happening. For
instance, here we would need `crate::ffi::c_char`.

I am thinking perhaps the easiest way for everyone is to take for the
moment only the patches up to introducing the new `ffi::` crate (which
includes most of the changes), i.e. up to commit d072acda4862 ("rust:
use custom FFI integer types") but without doing the big remapping
just yet, so that others have it available for their branches, and
then take that last part later, ideally early in a cycle.

Gary: what do you think?

Thanks!

(Relatedly, I have been thinking of moving the `c_*` types into the prelude=
).

Cheers,
Miguel

