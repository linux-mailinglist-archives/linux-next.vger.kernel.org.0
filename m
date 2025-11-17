Return-Path: <linux-next+bounces-9054-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A2C6511F
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 17:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DC5E4E1D87
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 16:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AFFAD2C;
	Mon, 17 Nov 2025 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ppsY0kCS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222CB1D61BC
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395933; cv=none; b=P19455y2aBXR2qsM77oiBJAi4xD0NyyC+Uq68r1McaiKVN7SN70RSuGzNuKi2IPhJshDYlI5qy3hWkcmEHmxJY+l3dNIRzKF4iASz7T1HvGYeBYUpZruVFPImJh1K5goVUfaDenH6BlRdE1ft4P0WMcvxA8YEfWthMnk7JNL8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395933; c=relaxed/simple;
	bh=JphX4K+smX1gz2AfiIymsTfIAN6EG8L9o7S5ttB6jLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8FrfBwk+3ItWgNJvrY92e3OkfbErpPlHx+V9ols2GUZaDLY4a9iTK7jgQgD0NJaHpjPjgZBySOIVYh1+Or4Km1DDTo1zM3UzAj6c65OHBghOksAqpKjH4OPDiZoLYKB5S8aJTKctBwOSmWNsh4c+eesZe3FySqxzlQCJFMQgfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ppsY0kCS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso12162355e9.3
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 08:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763395929; x=1764000729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpCwR2FcL/sZw0I8xZgpJsW4WpJvYR7GKT+ewaoLXCA=;
        b=ppsY0kCS7aM0VojoDrh5iPKV+ZDLfJg9r5tMVwqZHV5Lk5EkwNFnmtd4jeMK0dsFWJ
         CYjfqLaaRKDhVU6MS/lmqsBFE1KwZ6uQHgXSjuePNUQQexPqDaSMsE9HREG1C1wMb40P
         +CDYrMnt6UPz4p25wGvxOCQP4dNtgvkUUFz6Q2GP2WGc2SW+9/tqyPjE6xwepJqavjhq
         nOy0KFfscWbGVRcjZC3V+eE4J5R1OIlj3lCDYfyRwaEGSOwA1uj2sfB3RC7BqKU+bv0x
         u4emkOQ9W3vblPOZBvn2Ux8B7DqkjHpRCe19f7MWzW+94+aVICCFFQMljmbPfb/fNvCk
         xKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395929; x=1764000729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JpCwR2FcL/sZw0I8xZgpJsW4WpJvYR7GKT+ewaoLXCA=;
        b=kqQtQ1F+sWfoSXgsP+2pv2AEeEY2MHFVW1nAjRXTR+EP3Hpc+ErN6XdvppGJ4JSM14
         8id6v6BRlLEebKd2vzn7NFh5lQEgqXerPQTFvXIQqH1BrSO0VhaeH7Gtx9DYNjBojZMf
         vtIMUzRoLcS7xhTI9ddJJbDLy9DRzD/11UM1ilrZVL+5djwFNrH1Df/eF7eMYpNSgmaN
         qeiw3V5eoa4rRUIJ5/vO5scBJ/fDSU/j7vODcQjzb1z5Qo/UEIL1sujbvdRg9c+BdMVf
         cUAOVUlIc5xGruhxfXigdqvHiM6JRZ0VTsCevwbau7AzZlzWvu7nEUbQs1cnfWbFZVO3
         /AyA==
X-Forwarded-Encrypted: i=1; AJvYcCXSR06d0gCIDTzjVlh1HIMVNmgRSvK84hY+t1GTH5wXhdLHas9eIMCcTvkAm2q9sXPsZhkB3xl6HHyE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6caIh3TCyIehP94OYJ3s0P6BpKcze/9UMTJ8YEy83FtXkN1HO
	FP6mBzSa0z1a2uQ51w8GjvHDNW9u0/iSdEZUw0qInKSKt4spUIqMDKXmpOm06CRvheXsUQTb46o
	dTNVafbILQ/wxkL1kM3303hSjrlwBsAH1f1oq2bU7
X-Gm-Gg: ASbGnctRTqCae6NAcdtwLNnN4kznUPIJbg1BU+p3esCZ9tNbq5fgkaib1Hrlz3wzcoO
	OlVfWF4KKbj++kNGnFS4qQP5k/eNM4ZI/722CnEfc4Db92Y9Viv8wU1uWeRL7sHFSyypVtSsyCz
	MjKsO2HOBUopR5SuhEWrSIeMlW/OxaaIcxEJCYdViQxzuMhNY044sQd+gpMC0i1IdVzoJTZoy0J
	2XydO+SQP331w3CiNfoAa12dyr6+Z3Z+kHtdrXTyd9u2W4x8IZRehSys43CfZcuJ2/ZjCh5rEIg
	pTmtFDw=
X-Google-Smtp-Source: AGHT+IHiXxdwbSSb5jiBnnGiuawqMUuz3QMhi8ad9bTiJZIB7m4UlNPL7KQefIm6QwkBjZ6Rb5OvANxRqCpDWO7Skz4=
X-Received: by 2002:a05:600c:c4a2:b0:477:c37:2ea7 with SMTP id
 5b1f17b1804b1-4778fe9ac28mr112638175e9.21.1763395929201; Mon, 17 Nov 2025
 08:12:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117190417.44f20ddd@canb.auug.org.au> <aRs2WATn4sdUePUb@google.com>
 <CAJ-ks9mTZZj2B=r3Xx8T8gvqPtGLL2bpFOfa9Qh49bi5xSahbQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9mTZZj2B=r3Xx8T8gvqPtGLL2bpFOfa9Qh49bi5xSahbQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 17 Nov 2025 17:11:55 +0100
X-Gm-Features: AWmQ_blJbg_WI4pS3JxWM25le64gHx0bh2FTa7CuTIv_0jfVratYI8KQINyWfw4
Message-ID: <CAH5fLgiFjTBhgYEsCR4R=W8xS8_99E5+F5g0y-gq3Bz_rY1++w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Tamir Duberstein <tamird@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 4:37=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Mon, Nov 17, 2025 at 9:51=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Mon, Nov 17, 2025 at 07:04:17PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the rust tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > error[E0277]: `Chipset` doesn't implement `core::fmt::Display`
> > >    --> drivers/gpu/nova-core/gpu.rs:233:13
> > >     |
> > > 233 |             self.chipset,
> > >     |             ^^^^^^^^^^^^ `Chipset` cannot be formatted with the=
 default formatter
> > >     |
> > >     =3D help: the trait `core::fmt::Display` is not implemented for `=
Chipset`
> > >     =3D note: in format strings you may be able to use `{:?}` (or {:#=
?} for pretty-print) instead
> > >     =3D note: this error originates in the macro `$crate::format_args=
` which comes from the expansion of the macro `write` (in Nightly builds, r=
un with -Z macro-backtrace for more info)
> > >
> > > error[E0277]: `Revision` doesn't implement `core::fmt::Display`
> > >    --> drivers/gpu/nova-core/gpu.rs:235:13
> > >     |
> > > 235 |             self.revision
> > >     |             ^^^^^^^^^^^^^ `Revision` cannot be formatted with t=
he default formatter
> > >     |
> > >     =3D help: the trait `core::fmt::Display` is not implemented for `=
Revision`
> > >     =3D note: in format strings you may be able to use `{:?}` (or {:#=
?} for pretty-print) instead
> > >     =3D note: this error originates in the macro `$crate::format_args=
` which comes from the expansion of the macro `write` (in Nightly builds, r=
un with -Z macro-backtrace for more info)
> > >
> > > error[E0277]: the trait bound `MsgFunction: kernel::fmt::Display` is =
not satisfied
> > >    --> drivers/gpu/nova-core/gsp/cmdq.rs:532:9
> > >     |
> > > 532 | /         dev_dbg!(
> > > 533 | |             &self.dev,
> > > 534 | |             "GSP RPC: send: seq# {}, function=3D{}, length=3D=
0x{:x}\n",
> > >     | |                                               -- required by =
a bound introduced by this call
> > > 535 | |             self.seq,
> > > 536 | |             M::FUNCTION,
> > > 537 | |             dst.header.length(),
> > > 538 | |         );
> > >     | |_________^ the trait `kernel::fmt::Display` is not implemented=
 for `MsgFunction`
> > >     |
> > >     =3D help: the following other types implement trait `kernel::fmt:=
:Display`:
> > >               &T
> > >               Arc<T>
> > >               Arguments<'_>
> > >               BStr
> > >               Box<T, A>
> > >               CStr
> > >               Chipset
> > >               Class
> > >             and 22 others
> > >     =3D note: required for `kernel::fmt::Adapter<&MsgFunction>` to im=
plement `core::fmt::Display`
> > > note: required by a bound in `core::fmt::rt::Argument::<'_>::new_disp=
lay`
> > >    --> /usr/lib/rustlib/src/rust/library/core/src/fmt/rt.rs:113:27
> > >     |
> > > 113 |     pub fn new_display<T: Display>(x: &T) -> Argument<'_> {
> > >     |                           ^^^^^^^ required by this bound in `Ar=
gument::<'_>::new_display`
> > >     =3D note: this error originates in the macro `::core::format_args=
` which comes from the expansion of the macro `dev_dbg` (in Nightly builds,=
 run with -Z macro-backtrace for more info)
> > >
> > > error: aborting due to 3 previous errors
> > >
> > > For more information about this error, try `rustc --explain E0277`.
> > >
> > > Caused by commit
> > >
> > >   c5cf01ba8dfe ("rust: support formatting of foreign types")
> > >
> > > (I think) interacting with commits
> > >
> > >   38b7cc448a5b ("gpu: nova-core: implement Display for Spec")
> > >   75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings =
and handling")
> > >
> > > from the drm-rust tree.
> >
> > I applied a patch to drm-rust-next that makes this error go away.
> >
> > Alice
>
> Thanks for taking care of this!
>
> Alexandre: the correct thing to do going forward is never to use
> `core::fmt`; instead always use `kernel::fmt`.

Here's the fix I applied:
https://lore.kernel.org/all/20251117-nova-fmt-rust-v1-1-651ca28cd98f@google=
.com/

I had to use write_fmt(fmt!(...)) instead of the write!(...) macro.

Alice

