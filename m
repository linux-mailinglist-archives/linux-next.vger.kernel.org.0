Return-Path: <linux-next+bounces-7238-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF0AE64F2
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7458A176A96
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A83729615D;
	Tue, 24 Jun 2025 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dy7XW3GO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3309C295DAF;
	Tue, 24 Jun 2025 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768202; cv=none; b=JhVYQQiLfv3eAgoOEPxkvROVNKjqGB9k5tqPxzliJ0GjYaFgnpT1EnYZ/2avtfMY+ri9UgV6sOcXDa2q+RqckjqpGHExgIdF0nnLz9yanNdHOLn5nFn3ecYmsm8DXXt4w85CQZD1qpZlt12ko/w5HiqedwjEepezFOHS1Wncxj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768202; c=relaxed/simple;
	bh=Hu8mQWv+/j9szkLawEtN6NrSf27gfW00Ljjp14aT9TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVSR6ngoZ7pbejh871ddV3RCWHr9PtyVA4Nl86NOK3w1nnZxkGid+3RtvC8QOLodlIUgX6qlhrdWJnc46dpnupdcKZg/LfDy2XQW6dsyqybIie28wemcrmb9ixAxK/pnuZuDplUDIyx5DTTUkArSG51xEaRygRi9PjwkyYmy49k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dy7XW3GO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b7fd20f99so55158121fa.0;
        Tue, 24 Jun 2025 05:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750768198; x=1751372998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmQnlm1WwTewdNTS1e6Ykf8/k8UdqfstamnrRtcU854=;
        b=dy7XW3GOwkBB50tcPN8fnPCYXKNmwfB0ejMfSQWSGQ/K1mZV2PRH0VbrQxmdgWC6oh
         RBzD+Nci0xicyL6nmM7xk4saUTdJylvQti5V5g6DGGyeNefKJpIb7FZ8mruDGS6BEiTu
         7bq0L2Y9pU0CjknAgB7xVgOnUiJ3GsPwI/3SjyT1Glex/kJewrKale1TG4ufOcENuM17
         kvAjF7xdjYv1Wu/VANoHWQykvc3MGsvZPfjlLFzULDSKuiqdJNJi+MKAnSH/StKtRkNS
         ZdMHfFgWWojeVZO9pfMwEH/2bKinC4XOj+1fyqPrXbFzZpp4UdPzOWfVs8JxlL1DbJ1o
         fNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768198; x=1751372998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmQnlm1WwTewdNTS1e6Ykf8/k8UdqfstamnrRtcU854=;
        b=XYaJeST05eEFUYf/gnEmL0lrML49zeEbcwpIwMGwPjmSW2dvEkxKG0BmoijrtV5BPd
         neiuZgeYUYzek04G3vTYj+eZOQjzcqt4JdMe77EvpKKHSRkO5eXTL8t96QxK1vwlYQDZ
         VJTyePgv1SXDUsbeL/80iyxUdsVJ37i6MqhZZcR3cvezXrAFIq24P7RWctHcmypsz8KN
         DMuMaYUXPtBPLGPwpXWFMKb9hPTd4+bamntiW4N/sVi/urE36Y9xebT8YGNzLi9kauMu
         k4pW+DPs30CZS6BA4lq4sIbR285QG8AnjJ0JQPs29LMNDTpTe7cOj7Zk98wq9a0CaMB+
         gY3A==
X-Forwarded-Encrypted: i=1; AJvYcCU0rZbduViC3p73bkRHFynZWfiSxALtm1GbVfO95YZ7YydrU9zLCiAOq41iTHngG/g/OYGlR2RgWyaJWg==@vger.kernel.org, AJvYcCV1Y3Ad5UfpgcmJqXOjfR66Qls5hJk+iZC4720hLoFFZzoWyt9BiAxCUWf0u83Jgd5WVBHUC7bz5F73N6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUrtEEH1s0Rw6983qinPxg8gY2xu4dJDj9buHpdljYjos4jtDy
	YmJkOssxhLZdiBBwGvOY8JpZAXi9WZILHUkmSvPXUFUNpkq1IcBspEoGMgBufSq1BlnksL6jLda
	87JQlv+dHTkzsxcKE9MJLscp6DgDx83k=
X-Gm-Gg: ASbGncseZGLr0QpWumBTyXStAdm/nTSHDh/lPK9j8zRxR1kdI2L3Vqk/MD25n8mvOGD
	kJTtHM8AqzG+qylRQxt7o4z1/19XFj8VmlyHvbHPHX3itLsJUoQTli56Qeqr1sdqCYJwvw0WmB3
	pmjNPe9RopoQsFwdCgWoAC4upLlWtHVdr3KeudszUptXw=
X-Google-Smtp-Source: AGHT+IGry8Avz2l8MvoCXOJt4q8vsdEgQ6ebKyyCB1XZbMte3frc/UQIKJ/sNkBOs6xR/04MFALspYaGqGY5+/7q7zs=
X-Received: by 2002:a05:651c:50f:b0:30b:f0dd:9096 with SMTP id
 38308e7fff4ca-32cb9650be1mr9485751fa.12.1750768197943; Tue, 24 Jun 2025
 05:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624173114.3be38990@canb.auug.org.au> <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
 <aFqTX2oDzacpDpif@pollux> <DAUR75ROUY1Y.1GX6ALNM4FUAX@nvidia.com>
 <CAJ-ks9m-pas1nYSr7GKvREsOKdGOoyW2ru3OKnnjerv9hsWdGw@mail.gmail.com> <DAURELPD1M69.1WQM3ZJI33MFZ@nvidia.com>
In-Reply-To: <DAURELPD1M69.1WQM3ZJI33MFZ@nvidia.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 24 Jun 2025 05:29:21 -0700
X-Gm-Features: AX0GCFvWIwNyF7am9y3R2MrAteejgWlbSB1QOSTQ5fp1vYioMFve05dTVfcdaW4
Message-ID: <CAJ-ks9kd4kOXDLfpqWr5vRj4WPvXbVfbrjbro=MQ0iFfyHNPyQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Lyude Paul <lyude@redhat.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 5:24=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Jun 24, 2025 at 9:16 PM JST, Tamir Duberstein wrote:
> > On Tue, Jun 24, 2025 at 5:14=E2=80=AFAM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
> >>
> >> On Tue Jun 24, 2025 at 9:00 PM JST, Danilo Krummrich wrote:
> >> > On Tue, Jun 24, 2025 at 12:31:52PM +0200, Miguel Ojeda wrote:
> >> >> On Tue, Jun 24, 2025 at 9:31=E2=80=AFAM Stephen Rothwell <sfr@canb.=
auug.org.au> wrote:
> >> >> >
> >> >> > error[E0277]: the trait bound `u32: From<DmaTrfCmdSize>` is not s=
atisfied
> >> >>
> >> >> > error[E0599]: no method named `as_nanos` found for struct `Delta`=
 in the current scope
> >> >>
> >> >> > Presumably caused by commit
> >> >> >
> >> >> >   b7c8d7a8d251 ("rust: enable `clippy::cast_lossless` lint")
> >> >>
> >> >> The first error, yes -- the `register!` macro was changed to use
> >> >> `u32::from()` to avoid an `as` cast in that commit, and while the c=
ast
> >> >> is OK converting the new `enum`s like `FalconCoreRev`, `from()`
> >> >> isn't`, so we would need to implement `From` explicitly -- Cc'ing
> >> >> Danilo, Alexandre, Lyude.
> >> >
> >> > It's a bit annoying to implement From explicitly for all of them, bu=
t it seems
> >> > to be the correct thing to do.
> >>
> >> This might be something `FromPrimitive` will help with eventually, but
> >> in the meantime I agree having explicit implementations is a bit
> >> cumbersome.
> >>
> >> What I don't understand is why these `as` are problematic - a type lik=
e
> >> `FalconCoreRev` is `repr(u8)`, so the cast cannot be lossy. I think th=
is
> >> is the case for all such instances using the register!() macro.
> >
> > The use of `as` is problematic because it disempowers the compiler
> > from checking that the cast is not lossy. In other words, it is of
> > course fine in the case of a `repr(u8)` enum, but if the type changes
> > in a way that causes a lossy conversion, the compiler will not warn
> > you.
>
> I understand and agree with this, but why doesn't the linter limit
> itself to such lossy cases (e.g. `u64 as u32`) and let the harmless ones
> be?

Ah, that's a different lint. They are all explained in the docs
probably better than I can:

https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless
https://rust-lang.github.io/rust-clippy/master/index.html#cast_possible_tru=
ncation
https://rust-lang.github.io/rust-clippy/master/index.html#cast_possible_wra=
p
https://rust-lang.github.io/rust-clippy/master/index.html#cast_sign_loss

They are all allow-by-default though, because it is expected that
*sometimes* you do want to do the lossy thing and there's no other way
to express that.

