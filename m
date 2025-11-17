Return-Path: <linux-next+bounces-9053-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B2650C64EAE
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 16:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3420636075E
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 15:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291E42701C3;
	Mon, 17 Nov 2025 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVc4n3Qe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC7826F289
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763393870; cv=none; b=G8oIyLfW2N5jF2Nq139jONEJ3/fcaodAjvZCFVDWkFnjpgluCEsW3l5QcAj5VmpeqKR3rkhhv0rGJbtAaouJOOOQyLM9Gnzf6mRRE82tJInIJCaAq9KJYmMJg/6u9KQiRhhkIGA5fv4PgQoLkpWbHR4Y9txqkBYkjr7fpt8sG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763393870; c=relaxed/simple;
	bh=07GPJfvXx2LYcJW4wCEh3rg6NuuvChP0epuH9ve4eSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhGeeFwLeFdyiFamn6jJ85n5GjpLBvQ65+ETKlMJAnZTW+JeynDVIO66DlemX2XDH3Bysw6GD8Hw3BtzzR5A2RU28Pp/uonr+5Qf9USAJFcwddHlY8uMRm8fg6lrDmxF7cEo2CCkD6ZIn9Xh/TTsJ9Dg8qrEqaNeN0RaByPW6mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVc4n3Qe; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a5bc6b491so35009641fa.0
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 07:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763393866; x=1763998666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/gx5EASctMs1h76tjCnS8H0GzHctOpzC5Unlcw0xSg=;
        b=fVc4n3QepxelK6KTFfPObE/Izm82RDkBamzsnYEUnmWf4JnU2JU+9syPt9Q0R1UfoI
         X7UCmeAB3LznVQtfHpOGiyfyJ9VQbRubrJF55Q+rzdXfkxeNrZO6xuVgBLIDeKQv+4MK
         WZ8JA8GyLv+yaR5OUD86glOmAxjV1t4b3rv9RXHVY5a2D0DsBjvl1ivHIlmfq9XIfNXi
         GAHqtdmpw640Q/4sHpSKngtMoxkMwhM49bbHLzNjNMLP6FvpTdefRNCxoJi0Wqveo7rN
         JLSBIOMe6es/JweK1/7MBj+sclb8u0jdBnwjLXKKCHtxvDO08hgOke7lm63QojrZgcdV
         yDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763393866; x=1763998666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/gx5EASctMs1h76tjCnS8H0GzHctOpzC5Unlcw0xSg=;
        b=ak/PCHRhe6FH0qv0m8C3dSJv7j6XUbB6Ma5Jer4oaa5+Oqc6yZJdFJb/VSSzqosFOO
         EkmWa+R5ntMIuNxIY+F4gg4PtaLu3Bnj4GYuvaDk0fuLqjjITFg8yCwayW9ifN33DPpU
         HYeUBvvU8X+74TFpMxXWseNlxRAPq6eW3D6jxtI8HwnFy9S1PX46oiBvkffifMNPZMeD
         io5l3C57xY93/m71X2T9q+kqZkRYgBHOoOFUIM4mT1v/i1Dr2XF0QbO8uqBhS6t6drQk
         fk4VqxFgWQYUmJ0JOccF0wcL5C9qxotkDgM/+X3J2rMaSj+m+G4ETPd7zdBEOktgSeI0
         U9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsedRlRdTJTugEwGk50tBEr0djjlKNJoGKKTiWtmisZnJYigrdXKVuSZpH21o4hP23NabTszzbs/h2@vger.kernel.org
X-Gm-Message-State: AOJu0YwAqunRPfq+74/JuMhGMSq5rT+t2r9rvc6rNrNNrkJ0uINst838
	VMI/eIdb18RvlMlt49tyQgpqFaAKXRX2kQEmLzeRx33HUc+6YrMYdjE/8s3DNbUadj+JQH2to1d
	D/Oxu01Y9KDZV+hh64BAX6dy1sY9q/JU=
X-Gm-Gg: ASbGncsaeWjVcw9reD/EoTIwjW4iAJLJrWbI0eK3Usz6JaW2C619vRs+gGTkRCZCuxK
	rXLnZW5zv+KMnY9pncTTmuyPaKrOXE/jpywO5OeEMKgGSqAKEySsg6lpYPHhNguAU0qT7AlfZAg
	vo8lQk0vwLe0PDpGoT7xtl7+Ka3TgmEGyewg7Wn+0FdOpVyG+AuMtfj3j4kBOrrpfTjPa0LZ4iV
	PC35XYmiikhJhYml3obEa08yJoCGvGKEbJAY9h4NZoy9jDq0v9aarhu53sIEOylAXklvvy3Vu2H
	ycC7yhdDNxOlXPYTKd0XvsXWOmsQsJ9JO/2sH11vddk6nCFOl6Dls8wVROboREY2VT8we38=
X-Google-Smtp-Source: AGHT+IETbmE+KrTvdiAvSHUpH4ELpgfJNZXeimwb/HRG2Q+jxK09aWw5oUcT5HBMYS74VCrlUtNEu2WHzIYD8LWPjI0=
X-Received: by 2002:a05:651c:3253:b0:37b:b731:3c92 with SMTP id
 38308e7fff4ca-37bb73147e1mr20165021fa.5.1763393865722; Mon, 17 Nov 2025
 07:37:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117190417.44f20ddd@canb.auug.org.au> <aRs2WATn4sdUePUb@google.com>
In-Reply-To: <aRs2WATn4sdUePUb@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 17 Nov 2025 10:37:07 -0500
X-Gm-Features: AWmQ_bl7xHbMKXiydcXX22_oKC_-KpJrWnda34NuaEGi-AFVyTfrecF3Fg2BIKo
Message-ID: <CAJ-ks9mTZZj2B=r3Xx8T8gvqPtGLL2bpFOfa9Qh49bi5xSahbQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Alice Ryhl <aliceryhl@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:51=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Nov 17, 2025 at 07:04:17PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the rust tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > error[E0277]: `Chipset` doesn't implement `core::fmt::Display`
> >    --> drivers/gpu/nova-core/gpu.rs:233:13
> >     |
> > 233 |             self.chipset,
> >     |             ^^^^^^^^^^^^ `Chipset` cannot be formatted with the d=
efault formatter
> >     |
> >     =3D help: the trait `core::fmt::Display` is not implemented for `Ch=
ipset`
> >     =3D note: in format strings you may be able to use `{:?}` (or {:#?}=
 for pretty-print) instead
> >     =3D note: this error originates in the macro `$crate::format_args` =
which comes from the expansion of the macro `write` (in Nightly builds, run=
 with -Z macro-backtrace for more info)
> >
> > error[E0277]: `Revision` doesn't implement `core::fmt::Display`
> >    --> drivers/gpu/nova-core/gpu.rs:235:13
> >     |
> > 235 |             self.revision
> >     |             ^^^^^^^^^^^^^ `Revision` cannot be formatted with the=
 default formatter
> >     |
> >     =3D help: the trait `core::fmt::Display` is not implemented for `Re=
vision`
> >     =3D note: in format strings you may be able to use `{:?}` (or {:#?}=
 for pretty-print) instead
> >     =3D note: this error originates in the macro `$crate::format_args` =
which comes from the expansion of the macro `write` (in Nightly builds, run=
 with -Z macro-backtrace for more info)
> >
> > error[E0277]: the trait bound `MsgFunction: kernel::fmt::Display` is no=
t satisfied
> >    --> drivers/gpu/nova-core/gsp/cmdq.rs:532:9
> >     |
> > 532 | /         dev_dbg!(
> > 533 | |             &self.dev,
> > 534 | |             "GSP RPC: send: seq# {}, function=3D{}, length=3D0x=
{:x}\n",
> >     | |                                               -- required by a =
bound introduced by this call
> > 535 | |             self.seq,
> > 536 | |             M::FUNCTION,
> > 537 | |             dst.header.length(),
> > 538 | |         );
> >     | |_________^ the trait `kernel::fmt::Display` is not implemented f=
or `MsgFunction`
> >     |
> >     =3D help: the following other types implement trait `kernel::fmt::D=
isplay`:
> >               &T
> >               Arc<T>
> >               Arguments<'_>
> >               BStr
> >               Box<T, A>
> >               CStr
> >               Chipset
> >               Class
> >             and 22 others
> >     =3D note: required for `kernel::fmt::Adapter<&MsgFunction>` to impl=
ement `core::fmt::Display`
> > note: required by a bound in `core::fmt::rt::Argument::<'_>::new_displa=
y`
> >    --> /usr/lib/rustlib/src/rust/library/core/src/fmt/rt.rs:113:27
> >     |
> > 113 |     pub fn new_display<T: Display>(x: &T) -> Argument<'_> {
> >     |                           ^^^^^^^ required by this bound in `Argu=
ment::<'_>::new_display`
> >     =3D note: this error originates in the macro `::core::format_args` =
which comes from the expansion of the macro `dev_dbg` (in Nightly builds, r=
un with -Z macro-backtrace for more info)
> >
> > error: aborting due to 3 previous errors
> >
> > For more information about this error, try `rustc --explain E0277`.
> >
> > Caused by commit
> >
> >   c5cf01ba8dfe ("rust: support formatting of foreign types")
> >
> > (I think) interacting with commits
> >
> >   38b7cc448a5b ("gpu: nova-core: implement Display for Spec")
> >   75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings an=
d handling")
> >
> > from the drm-rust tree.
>
> I applied a patch to drm-rust-next that makes this error go away.
>
> Alice

Thanks for taking care of this!

Alexandre: the correct thing to do going forward is never to use
`core::fmt`; instead always use `kernel::fmt`.

