Return-Path: <linux-next+bounces-5137-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC28A08C07
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20841188DC8E
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 09:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4765B20A5FD;
	Fri, 10 Jan 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aBjZy0kr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520E620B801
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736501341; cv=none; b=HGJIm03kIrCKu6H3T1Y6ewn9F4JDRMWcSbDWkYPznqbFGiyQlPx3iRQiPQFzwUB4ABFtoE+8/tUs6A2+XDh1EI+QpH4HxzkrMIdhtgpv8WjnOsbe6ARdb7zkmJkhDNuUQViNnW4ajfKAfLd1WRMqlxelGoMxDnHkLwiZXLksom8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736501341; c=relaxed/simple;
	bh=ugxU+y6whzGZVd7Lc5WjWdCwqy5E9nGzKmdtgmp2yIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMfYEYVsgl4VJCj8PFfQhzvl+KQG6jA7KccQExq1cjmJk1q++BoQ4UJGI3EfVbC6uz25mperVt/uwEvp8NuUFCJLzcecI8Ah/yUvR7LbAPFzdC3gP9jBvizzFhuDtAs1SVPIMK/LbGMPk/2M6MfopI+IlyVmM/FPVWBC1iu05Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aBjZy0kr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso981439f8f.3
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 01:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736501338; x=1737106138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc48kWJkc+jN0D3iJgJ4FngpU8KfaZpctK87uL99jGA=;
        b=aBjZy0kr4lW/TUA90ZLYAQbtgMl40DOSKMbyuP0/521MKsNa/SDC9O/lmwDsy3BMNw
         Z7k00zTKtopZ3PxdVvOACEtkoGbb0md7YhO9EliOizE0OkjLq6QOxMdOHQ/ihnWR2gkY
         9s1rXVfc/Awfl6YjPLit4iSXpha+QCqWzY+JEisZJ6ulwFrxBEa3nPc/2Us1/dxMYhEl
         e73HZ7HcSIefWIIc2DhtsC/v+hbbmP6JIoBmfPj9209bEdPVP9BpfRhFLHQ9CK4OT6CB
         CsfQhAvC5E+pald/tCSv9lO2Q8Fs6aMbDaoO09hlloVVoIGZqdzuW7LXJ1Q1pTwsiopv
         rI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501338; x=1737106138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pc48kWJkc+jN0D3iJgJ4FngpU8KfaZpctK87uL99jGA=;
        b=iN2F6Mm72Za33I/Cq2YVgJQwlYjqy84wQo3Rg+AK/I/6UI1+/tFzyyboeqweq5KTkk
         0I/mHlQxmBaEucwcjW4Zh5CaIe4qAXfvs2/hE7rDtK+LYnKJM/WpBWLa1B4M5XLp124q
         /x521LFVS7aj4Pzj+sJgMaX6E0Ox9mxTMi9Hw7cS+g6U5VFbVKnJUYx8CcccQKlPSPnP
         NJC1ZVY5XHMlkTK1HQE2v3wPDNr0rPcjO3aJBIHuicT9E+5XlCozbRgInuS42nBoIybY
         WycFXlD9komfhdOyq7jiEtSvEgd+3r5Tfl+Iy0WK018fRt9qRyInaIK5brLxXCl7o4WK
         vrDA==
X-Forwarded-Encrypted: i=1; AJvYcCW07617qdnI5MnhFbYLIEfDHcIl/3EK96scZX7xwGprB1oY4SeWO7MfHiz1+fbgpFCpmCMUVUsZqXoA@vger.kernel.org
X-Gm-Message-State: AOJu0YxiWe2DGm+khHXSffhRk3eS/eULED2FuYZKeTxsvO7ltwmDrofN
	T77dC8OleHzfw0tEdyjdV+ZhW+8ZWfQOgfLFhDXXzYBv0E1O1QLDDN5vv9ExN9r4LV6rbjf7eSt
	Kiw8WjnOlHuksit41QbURHqaM5R75uFgq9Kiq
X-Gm-Gg: ASbGncsIvfIkdOoj9i5WYnqep8vY71MaSsDskRphTbskAYTG7rAyJU4vgddS/YLHea7
	7JKUqwXURYxXVhdHsXrpRNXHk/yQZAQ7Bsfc9etg=
X-Google-Smtp-Source: AGHT+IFsI/zsaa4GsW+VvaTS4J5d6VE3camb4pW6IpRhw6KrFr4+xRv0pep3resZyiIheLRk14YQ9hzs//IRMrxLFx0=
X-Received: by 2002:a05:6000:4102:b0:38a:8b4c:886d with SMTP id
 ffacd0b85a97d-38a8b4c88b7mr4766586f8f.46.1736501337706; Fri, 10 Jan 2025
 01:28:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110162828.38614c1b@canb.auug.org.au>
In-Reply-To: <20250110162828.38614c1b@canb.auug.org.au>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Jan 2025 10:28:46 +0100
X-Gm-Features: AbW1kvZ-4Pne2VkIG_5V-NWETmrz8cPkMUNcW8oBZnew0F8PiEhuJ46yjNHbYdQ
Message-ID: <CAH5fLggV5QC53u9xypFga4yheem+7vO=fNqLE47zRj=t_H8eYg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 6:28=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the rust tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> error[E0423]: expected function, found macro `kernel::build_error`
>    --> rust/kernel/miscdevice.rs:159:9
>     |
> 159 |         kernel::build_error(VTABLE_DEFAULT_ERROR)
>     |         ^^^^^^^^^^^^^^^^^^^ not a function
>     |
> help: use `!` to invoke the macro
>     |
> 159 |         kernel::build_error!(VTABLE_DEFAULT_ERROR)
>     |                            +
> help: consider importing one of these functions instead
>     |
> 11  + use crate::build_assert::build_error;
>     |
> 11  + use build_error::build_error;
>     |
> help: if you import `build_error`, refer to it directly
>     |
> 159 -         kernel::build_error(VTABLE_DEFAULT_ERROR)
> 159 +         build_error(VTABLE_DEFAULT_ERROR)
>     |
>
> error: aborting due to 1 previous error
>
> For more information about this error, try `rustc --explain E0423`.
>
> Caused by commit
>
>   614724e780f5 ("rust: kernel: move `build_error` hidden function to prev=
ent mistakes")
>
> interacting with commit
>
>   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
>
> from the driver-core tree.
>
> I have added the following merge resolution patch.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 10 Jan 2025 16:02:19 +1100
> Subject: [PATCH] fix up for "rust: kernel: move `build_error` hidden func=
tion
>  to prevent mistakes"
>
> interacting with commit
>
>   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
>
> from the driver-core tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  rust/kernel/miscdevice.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 9685e50b100d..3ba018651bc0 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -156,7 +156,7 @@ fn show_fdinfo(
>          _m: &SeqFile,
>          _file: &File,
>      ) {
> -        kernel::build_error(VTABLE_DEFAULT_ERROR)
> +        build_error!(VTABLE_DEFAULT_ERROR)
>      }
>  }

Thank you, this fix is correct. Greg, can you pick this up directly,
or do you want a real patch?

Alice

