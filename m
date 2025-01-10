Return-Path: <linux-next+bounces-5139-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7BA08CA0
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0A411677C1
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9108520ADCE;
	Fri, 10 Jan 2025 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tzCtzQQ0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E811FAC4E
	for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502110; cv=none; b=fGSGM+wIp/OSwx8y7MZxQsRmbG/MZ5yu+qlt0L/XF7q9c6SqB4E5lMGEfdoDi/9Ws6bwfaGFEEr9XCW7zBtTRJXIIAHwuodaSunWf8IuXoccJU4XdAsP2AdNOHD61vZnfMhnWE5W1vNYOuAeza2vY44U/GqP6geMFfhZk+B9WHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502110; c=relaxed/simple;
	bh=9iPfD8LRLHEfBAm8ALSaGGbUMoRGKb5VNTIIvhd+hUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRcz24ksoNWV2m3H8SWL1zSdTEmZzPVjLZ61TARzEfcKzBxUOOV2BG5C1piU8THibCfejdA8B+ocUdDbRSzDD7+/iw/L4Mx4jWBY/wijZ4YM3eG7QZeW7KoC8BAtRQO9wgaayXVNyeztm3y9Cn2APF3uFehHLwC2NlrvITzb9K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tzCtzQQ0; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e3621518so1043414f8f.1
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2025 01:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736502107; x=1737106907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emzzv0i1lpgx0YZ4PIMgaPabDQG86FPhIFQtuH9XTaI=;
        b=tzCtzQQ0gz/id9WcsgDz1PN2++x99zoEICS965HFnRL0q9bxpWupIVboqSAM40SPO5
         I9m/q+jeGM/ScttWfCkZM029rd02h+KTTZWOfd4NHPlCezkbpTLiYyro5etNThYwVJpZ
         ZtWLb2fP3iNK+YmT4tgKLgC4WYwiAaArC3qmYARnGSVuiHwj1EyNxFg/LHNm/7u29YLZ
         Sm0NfV8p+26JMv/pIvhJ2NzviK2M6Q9Kqk/ZSgd6qgJVOproRhYMFoYrGLgIGTJYJoHq
         MbwfUSBzl8DnAoSrDGYVZM9EVec8tUUIQck30lt39dnWXujlKiHwCaLHTTBU+DlOtp4B
         YEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502107; x=1737106907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emzzv0i1lpgx0YZ4PIMgaPabDQG86FPhIFQtuH9XTaI=;
        b=PQxebLP2jIyjuT47kvoxydwwmhCT4zBhiCKfX+yf2fznUEb7tMekfyjjOSy9vNpB8g
         chK3mINyemn6I/WOugTbwfgAPD8Jl2SdHfy2As3kkMfXZDfAkqpRudQM1AloEG8oTuV9
         F335E+Mtbmx74wVn080MjCkHl2PNe36Wrs148Gzoxi2yPjb4zHdlAm87QTs9uUS2mRSV
         +0Wr0B17l/MzZRWRuNUnDdlL2yf8RepormVH+u4zWO11IEMIdMwsH4Qo4jp6r5MItPS6
         F8kt+a/sFwc/zb7ikZOV4d5HKHS1oDZmblR4zUZVQdK03xKdn8dVk1O8daTnl3IgiTqo
         g4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfxR53ynNntVVQv8kPIaKnxtOWV5hRCxlb+quPjKttTM+XDVdLJC21TDpf1ZmkLdCdx4hEqF+Ify3U@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBBJGVMU1SXa1v85IweK/vhXAQ1jBtHcBkoimjOuglBwza9Vc
	6lRIkZECgTrR9b6AVD7zdjlk/mRcbS7BQZlfWnhOSnTu1S6iQpGNcfGYhf1GY8jBj1HNAxvDfev
	iAoQ36kDjQHwQUC3FxdZyWE5Zp7KJhyA+MOVRA1RUvCDqJ8IdCg==
X-Gm-Gg: ASbGncuniHgt5lEIenLPBE0VIGl4G7znLHVK7f4Pw/SZ/MldvuZzz6+bCDolOvC515l
	UPGWWf09b+W7T7LLvmi3okTKxygjOkwlzsF7x3Js=
X-Google-Smtp-Source: AGHT+IHNZMC9OskgsZTm+m0+tpC1DJNmZtiAmO7LHJa8yQhL4e+vQdI1UnkhLl7hxKIAew+oMClj4MzS+Hfd7/ZF2Ak=
X-Received: by 2002:a05:6000:1a8c:b0:38a:4b8b:c57a with SMTP id
 ffacd0b85a97d-38a87336f7amr9057422f8f.44.1736502107116; Fri, 10 Jan 2025
 01:41:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110162828.38614c1b@canb.auug.org.au> <CAH5fLggV5QC53u9xypFga4yheem+7vO=fNqLE47zRj=t_H8eYg@mail.gmail.com>
 <2025011024-clean-refold-b170@gregkh>
In-Reply-To: <2025011024-clean-refold-b170@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Jan 2025 10:41:35 +0100
X-Gm-Features: AbW1kvaKPoNxt5j-c9o-eoiJTQ21YAf2vM9BU8la-J9ThqaAz3qOAYX4qz8EP34
Message-ID: <CAH5fLgjLPH+LrgeLzav5qa951CJWpQo5aFjVWwGTH0zdKZ6LUQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 10:34=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 10, 2025 at 10:28:46AM +0100, Alice Ryhl wrote:
> > On Fri, Jan 10, 2025 at 6:28=E2=80=AFAM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the rust tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > error[E0423]: expected function, found macro `kernel::build_error`
> > >    --> rust/kernel/miscdevice.rs:159:9
> > >     |
> > > 159 |         kernel::build_error(VTABLE_DEFAULT_ERROR)
> > >     |         ^^^^^^^^^^^^^^^^^^^ not a function
> > >     |
> > > help: use `!` to invoke the macro
> > >     |
> > > 159 |         kernel::build_error!(VTABLE_DEFAULT_ERROR)
> > >     |                            +
> > > help: consider importing one of these functions instead
> > >     |
> > > 11  + use crate::build_assert::build_error;
> > >     |
> > > 11  + use build_error::build_error;
> > >     |
> > > help: if you import `build_error`, refer to it directly
> > >     |
> > > 159 -         kernel::build_error(VTABLE_DEFAULT_ERROR)
> > > 159 +         build_error(VTABLE_DEFAULT_ERROR)
> > >     |
> > >
> > > error: aborting due to 1 previous error
> > >
> > > For more information about this error, try `rustc --explain E0423`.
> > >
> > > Caused by commit
> > >
> > >   614724e780f5 ("rust: kernel: move `build_error` hidden function to =
prevent mistakes")
> > >
> > > interacting with commit
> > >
> > >   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
> > >
> > > from the driver-core tree.
> > >
> > > I have added the following merge resolution patch.
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Fri, 10 Jan 2025 16:02:19 +1100
> > > Subject: [PATCH] fix up for "rust: kernel: move `build_error` hidden =
function
> > >  to prevent mistakes"
> > >
> > > interacting with commit
> > >
> > >   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
> > >
> > > from the driver-core tree.
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  rust/kernel/miscdevice.rs | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> > > index 9685e50b100d..3ba018651bc0 100644
> > > --- a/rust/kernel/miscdevice.rs
> > > +++ b/rust/kernel/miscdevice.rs
> > > @@ -156,7 +156,7 @@ fn show_fdinfo(
> > >          _m: &SeqFile,
> > >          _file: &File,
> > >      ) {
> > > -        kernel::build_error(VTABLE_DEFAULT_ERROR)
> > > +        build_error!(VTABLE_DEFAULT_ERROR)
> > >      }
> > >  }
> >
> > Thank you, this fix is correct. Greg, can you pick this up directly,
> > or do you want a real patch?
>
> Can I take this as a real patch for my tree?  Or is this only an issue
> due to the trees being merged?

You can take it as a real patch. That will make your tree compile both
with and without rust-next merged.

Though I guess it would be nice to update all three instances of
build_error! if we make a real patch. (The other two instances are
updated in rust-next, so they don't cause the failure.)

Alice

