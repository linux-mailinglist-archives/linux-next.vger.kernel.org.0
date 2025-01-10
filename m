Return-Path: <linux-next+bounces-5140-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F39A08D58
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 11:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17FD3188800A
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C5520ADEB;
	Fri, 10 Jan 2025 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yyqhx4wT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95A520A5EA
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 10:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736503642; cv=none; b=BMhSxHKhwr6KcX4yfJPMGJQUNR5vpEzCoiDIeclvKRleP9Go5CFXdYP8kKC3fnhdzpoNFr/QGfZp/jF2yMyYHmrgOo9EDA2Vow62l7siu8Xrlt66lApP7ohpJa982b/kOOm8xIV6MdP6Q4YN/dwab+C6NN9Xr+knvvXiLOsC8ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736503642; c=relaxed/simple;
	bh=uR2T8L0wpqHFhWp/zYshUDthdyAx9rjMTCdYnAo9hRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYWkWbjs1Sp7t6jW/fy9iJp+Xx0tIxaUU4BfE7ei0JdwO89eGTrx6o+CA0oAb718w8Ij5/duLulW0XBB7fgqEM52EafJ3elJAweem3/MFo62qJezva5UF/aL/FdCnQHH1128U1uZMR5VhQvuWxjLzyttiYXO9+4GQsNt4yKvMxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yyqhx4wT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso13664985e9.0
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 02:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736503636; x=1737108436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia81hw9WsrfguaItlFiairxmS/UDJdInAWGL5rV/qKE=;
        b=yyqhx4wT3rABuiQuWQw7jzwxO04w1UhGDbrzPbj1Zu/sGPq7FgvBseDozKsdZOrFi7
         C9c15feW9OpuGHygS3Mymn7EJ23hYHAEQBEpwaSVZJfYrHoG5eQ8Ofn+K0iEcAA21ip6
         V5mHWX/UK456YmX81uscgXDo91VhWIT+tr1UHsiYgxNpdcUnR7AI4uMR/QdYvVj0PnXT
         vF6sS+IqTO67rgFrB6pi10TpwG43ulU9Z9GCB/hQtPZ+1fYYdKhVkuOwzxrpFa9BQALT
         shHBHVtkW4/0YxX/ga0Oshw++z1LUxlH7raj9nfs47noKWOtRuL1BMQ+1JYWltrvgRRA
         DXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503636; x=1737108436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ia81hw9WsrfguaItlFiairxmS/UDJdInAWGL5rV/qKE=;
        b=ozCtQvWuoAb/wIPle4dd83xV+Vj4jWThwCg8TJlP8t8UgV182Smbi+dOovQvxjnVhN
         5B4IYN//a7xywHJqsajXdOCHBSuM8sEUdJJF3vBv206qNUYEaQZzpiKv5R1WdmztIDDW
         m7crujjripq8pmPdVIKX5PpDO/UGhu8RnNDSucRSgIxwYaY4fSCHFzejHk8KR6D2S34V
         gCd7vJ2MMONUUV4LxckdnbPeOPjL+RBeWheGAF2luZTxs+3YjKA+otOCjC2nVIvghK1L
         Hpp2Ahz5dMa/OQzODoutj5PgKFY/bNR8rg/qoNu4t7J+2e7u14jZyS44J7ASUMmHNVlZ
         i9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVL2iv6r826vL7NGymfwiuEfqoCDZpDrgtFGgHzY1xvjis+SzuwQBHaxbq/LjNaxrehdNgBMztZZmR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9IGAIVhrUcqczs8uPBSz6Ir8wtLQ+jj3r/vAvvR707lYXRjF
	F2FGU1DVT8NNYeEZuGqYztv2nCuZv+KIS6dbRhLC3d76ogBpdp9yDyHj9iemubIkALbHpbKn2a+
	sciwjm7PPxsrzdV6f5NgHXKjkjaXkoEXsmk2sHZaoNIjxeOu5Mf9z
X-Gm-Gg: ASbGnctiBV9+pYINUCtpISy6gmEfK/hSooe08GlME1ZNLKPt+dL+xWT2z6jzQlHaapb
	wI8egsbwl9+CEVFk82xTVIfyUMnhv90ZTY4PokN8=
X-Google-Smtp-Source: AGHT+IHkNr7FO9EtHd4ymgxPOrLKlBQyT9N+n+DXCimYGhAD2NxiMfugRjQr/4w9OtTSqrxObZXjHQZ6xpdyYKrgPGE=
X-Received: by 2002:a05:6000:4607:b0:386:5b2:a9d9 with SMTP id
 ffacd0b85a97d-38a87315bb9mr7584957f8f.53.1736503636118; Fri, 10 Jan 2025
 02:07:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110162828.38614c1b@canb.auug.org.au> <CAH5fLggV5QC53u9xypFga4yheem+7vO=fNqLE47zRj=t_H8eYg@mail.gmail.com>
 <2025011024-clean-refold-b170@gregkh> <CAH5fLgjLPH+LrgeLzav5qa951CJWpQo5aFjVWwGTH0zdKZ6LUQ@mail.gmail.com>
In-Reply-To: <CAH5fLgjLPH+LrgeLzav5qa951CJWpQo5aFjVWwGTH0zdKZ6LUQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Jan 2025 11:07:04 +0100
X-Gm-Features: AbW1kvbvB3fQ6BNMaBEkc8t0reHU4gxorWe9chsoJIm4GY7BLK4KsmnCvTUqwn4
Message-ID: <CAH5fLgjgEeGbd5NUhG1tEKKoj5+cKkuiq25BdeApjtx7SvnkEQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 10:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Fri, Jan 10, 2025 at 10:34=E2=80=AFAM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jan 10, 2025 at 10:28:46AM +0100, Alice Ryhl wrote:
> > > On Fri, Jan 10, 2025 at 6:28=E2=80=AFAM Stephen Rothwell <sfr@canb.au=
ug.org.au> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > After merging the rust tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >
> > > > error[E0423]: expected function, found macro `kernel::build_error`
> > > >    --> rust/kernel/miscdevice.rs:159:9
> > > >     |
> > > > 159 |         kernel::build_error(VTABLE_DEFAULT_ERROR)
> > > >     |         ^^^^^^^^^^^^^^^^^^^ not a function
> > > >     |
> > > > help: use `!` to invoke the macro
> > > >     |
> > > > 159 |         kernel::build_error!(VTABLE_DEFAULT_ERROR)
> > > >     |                            +
> > > > help: consider importing one of these functions instead
> > > >     |
> > > > 11  + use crate::build_assert::build_error;
> > > >     |
> > > > 11  + use build_error::build_error;
> > > >     |
> > > > help: if you import `build_error`, refer to it directly
> > > >     |
> > > > 159 -         kernel::build_error(VTABLE_DEFAULT_ERROR)
> > > > 159 +         build_error(VTABLE_DEFAULT_ERROR)
> > > >     |
> > > >
> > > > error: aborting due to 1 previous error
> > > >
> > > > For more information about this error, try `rustc --explain E0423`.
> > > >
> > > > Caused by commit
> > > >
> > > >   614724e780f5 ("rust: kernel: move `build_error` hidden function t=
o prevent mistakes")
> > > >
> > > > interacting with commit
> > > >
> > > >   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
> > > >
> > > > from the driver-core tree.
> > > >
> > > > I have added the following merge resolution patch.
> > > >
> > > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Date: Fri, 10 Jan 2025 16:02:19 +1100
> > > > Subject: [PATCH] fix up for "rust: kernel: move `build_error` hidde=
n function
> > > >  to prevent mistakes"
> > > >
> > > > interacting with commit
> > > >
> > > >   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
> > > >
> > > > from the driver-core tree.
> > > >
> > > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > ---
> > > >  rust/kernel/miscdevice.rs | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> > > > index 9685e50b100d..3ba018651bc0 100644
> > > > --- a/rust/kernel/miscdevice.rs
> > > > +++ b/rust/kernel/miscdevice.rs
> > > > @@ -156,7 +156,7 @@ fn show_fdinfo(
> > > >          _m: &SeqFile,
> > > >          _file: &File,
> > > >      ) {
> > > > -        kernel::build_error(VTABLE_DEFAULT_ERROR)
> > > > +        build_error!(VTABLE_DEFAULT_ERROR)
> > > >      }
> > > >  }
> > >
> > > Thank you, this fix is correct. Greg, can you pick this up directly,
> > > or do you want a real patch?
> >
> > Can I take this as a real patch for my tree?  Or is this only an issue
> > due to the trees being merged?
>
> You can take it as a real patch. That will make your tree compile both
> with and without rust-next merged.
>
> Though I guess it would be nice to update all three instances of
> build_error! if we make a real patch. (The other two instances are
> updated in rust-next, so they don't cause the failure.)

Actually, it looks like I am mistaken. This patch doesn't build without
https://lore.kernel.org/all/20241123222849.350287-3-ojeda@kernel.org/

I'll send a real patch.

Alice

