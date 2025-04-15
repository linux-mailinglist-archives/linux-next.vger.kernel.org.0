Return-Path: <linux-next+bounces-6256-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C8A89F5C
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 15:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 653283BF3C1
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 13:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8194297A60;
	Tue, 15 Apr 2025 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZctmkI2b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E332296D1D;
	Tue, 15 Apr 2025 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723513; cv=none; b=QsNd8WXe8NMB01F6FMWiSrtfO0Wl82LK0HOs3v/1yWOkzgIbw1JXy0/wq5g2yi5csxG8/ZFzbcIR8kOk2zDEE8aZJniEP4idtGQq+euIWX329DGoVrpOa2kwZ4/ubk5GVwpaDrhVRoJ3p8pbGUr8f6SNs2jSTz4Z/MZ4YkQuPgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723513; c=relaxed/simple;
	bh=ENvGVae0BhBk9INbEpchFgitTTt855bq2lyDWbXwKU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpZJxkEJEAsGqRpIUmJ8bnfcv5w1wnn3u790NHUndon2HzuWa1rwFPTz+q+ibmMFhMphN6gO5cACSjzK+OVwIEtZTrnKjXduMjyGjbBflGWl0XIvNq+u2A9ay/Fs8ieJnvU/eMRREXZ0aYk0c309KgpkEWeE9VvslkGzyKoTA1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZctmkI2b; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso56274331fa.0;
        Tue, 15 Apr 2025 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744723510; x=1745328310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hPNT/WjvDZ+inoI0tT6dfItZ/XKNLAOxt8UgmO6ED4=;
        b=ZctmkI2bDPuFj1YaZNkYfrcYG5B8mO3EjNgIzMH2i3Qs4CHbNDpiRt2BQwvOJfdNRp
         btsNIlZQowreXknxdMK4oTM++YrIjITJkYT5yn9KYM8W2kIB6QoLi4RZmDGJhWBDO03y
         p86nDuVndgt2ookKSC/Tys9HPB88pxOYG5I1f4anfLVv5myZvD0arzAUO5ftK7bniVEr
         FErGEuZmv4X3mCClB9UhW8/hOhr6yqGot7G0jjYcr3yL9mBKBr9f9aA3VbXksCpoEk9v
         1qoKaqozBNEQbpB6SP55a56czaWtpx2fEyajTyxK+86e2DsyD41+pvJ1x6s5tgmqkxjD
         fRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723510; x=1745328310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hPNT/WjvDZ+inoI0tT6dfItZ/XKNLAOxt8UgmO6ED4=;
        b=vOffzNy5rKKz385Z+6HHlQPiGcG5pYj4UBbI1fwvHG2dQFrWCQU/3j5Zet9xYjPRvh
         8q54KxR9sFado3jDDfgPEUnw8gCJFC9Ea3RFif/1JXfTfJjxys9ilCCGoytH1nQmkWNW
         v2MwDD6EYyBkONpV/2XBXVN8/UoraYeQf0oqZGA7GWunarHmRXM9NyCxxXBJFPUpKZyJ
         AiyaCYpytidGMsk2YnJkGxASl5Ed1tv9MoswKmUyTEBt5pkzJncHjhREAcCeu/06tVOe
         qY7Zj/0I9lnRNEVQdcPqEoXkR2oSAeBJ5q+DyE7NMCM0Qd4XoC9CpaP/l4SorUcP9MqZ
         ylnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNU+uCLQ4UqyrqIIBxXFrVkkrKbMQ2bDjbWxbSeTvzMe/+aBvb8NUbNPxLrtDH8zDxT70EHFtwBpnOnNI=@vger.kernel.org, AJvYcCWyEHu4t1b14+XBEnYMUeVL2IZYv0g2Yq26tCtZFV1Bi47VrY4FEra+jw/Jx/6Q7drsCcMRNnz9uf1z1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw49afqUtbUoukrz4AH7kRLCQifvKx18q4pKEp4f910ElZYxrph
	Y9tNtngFCfKhRyerTJi6uzHgiRcMd65VjNXfXcKLThxCJtfJjjQBY9cjGwFjIdSK4hxC/4uTbyZ
	4HkVR/7RVF8IdvcO9T+iQXDEc3i4=
X-Gm-Gg: ASbGnctVxYZygx79uzAhunX+zVrtiTJOVcrLe+MW6MShPoMBm0O10zemcLv7XuhJ3r1
	PnrlXjGuTP9VUIqq9WVW+D/d8cIYCHTC+3qdr5+iH/h+BBr87mA7qRH5BfI+NEAuA6/MypMH0R0
	ennsCkd9XPKsbr1AMinyybMN6o0WzBbmngfzQ8ww==
X-Google-Smtp-Source: AGHT+IHLR+a52PAnwOwgW3gpefwFl/AFdB+PQHlCCk06YVjtbZT4MMEAbAJt3PqMnONXDm+9sZjLntkCaqUr0U2KvuU=
X-Received: by 2002:a05:651c:144a:b0:30d:626e:d004 with SMTP id
 38308e7fff4ca-31049a1addcmr55312611fa.20.1744723509886; Tue, 15 Apr 2025
 06:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415140116.13544ac6@canb.auug.org.au>
In-Reply-To: <20250415140116.13544ac6@canb.auug.org.au>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 15 Apr 2025 09:24:32 -0400
X-Gm-Features: ATxdqUER_TV68nnL_2mE2XyNl9dwOQ_q78y7o04bEsJRL-XK6zVlHV3yXSle-D0
Message-ID: <CAJ-ks9kUBCX6PjOeOSVQNXYGcy9gkYw++BEmHZ0eFbsyZeBZcQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the workqueues tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Benno Lossin <benno.lossin@proton.me>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 12:01=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> After merging the workqueues tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> error[E0308]: mismatched types
>    --> rust/kernel/lib.rs:204:9
>     |
> 204 |           ptr.sub(offset) as *const $type
>     |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ types differ in mutabilit=
y
>     |
>    ::: rust/kernel/workqueue.rs:495:18
>     |
> 495 |               ) -> *mut Self {
>     |                    --------- expected `*mut ClosureWork<T>` because=
 of return type
> ...
> 505 | / impl_has_work! {
> 506 | |     impl{T} HasWork<Self> for ClosureWork<T> { self.work }
> 507 | | }
>     | |_- in this macro invocation
>     |
>     =3D note: expected raw pointer `*mut ClosureWork<T>`
>                found raw pointer `*const ClosureWork<T>`
>     =3D note: this error originates in the macro `$crate::container_of` w=
hich comes from the expansion of the macro `impl_has_work` (in Nightly buil=
ds, run with -Z macro-backtrace for more info)
>
> error: aborting due to 1 previous error
>
> For more information about this error, try `rustc --explain E0308`.
>
> Caused by commit
>
>   345e029b561e ("rust: workqueue: remove HasWork::OFFSET")
>
> I have used the workqueues tree from next-20250414 for today.

HI Stephen, I believe Tejun plans to back this out. See
https://lore.kernel.org/all/CAJ-ks9k2FEfL4SWw3ThhhozAeHB=3DUe9-_1pxb9XVPRR2=
E1Z+SQ@mail.gmail.com/.

