Return-Path: <linux-next+bounces-7234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8998AE64BB
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7987400924
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914B82951BA;
	Tue, 24 Jun 2025 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNb+hU03"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96326A1BE;
	Tue, 24 Jun 2025 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767453; cv=none; b=DyO3MtYXSLb3N1pno76dhzwhRgQrOfMgA/dWJRobj0hrNu6NsMbFdRArS0BUL0bfgo4u12g9vEYbQ4dQGa9u0oqkzqZ9hXJwkiQQIfJONLgnB4rUeCnRkgGWSWASnaALhLrbU7RG59HxwQKvEH9AR1LzvC38eTpXIySTng5yIEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767453; c=relaxed/simple;
	bh=YPvlENJzb+SZNZRarHaAxtpjxGgvC4AgU4VhvFO4EOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfiJencgDxpsf+tZN0tznS9YGOrKGl57Xi4lcRYI2LBlMQUZ3lsBB+3CXVgtT4laTBS9+XxwQOyyMHbYKJBHs7JYCmctx/n1aJOexkZyhx7gkDtyMhMyzfCFJ/itzUGGzyyHDo1uC+1D/8cwhwXrHUtnCRTFgP+c5+DFLaiOdAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNb+hU03; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e98f73850so4579026e87.1;
        Tue, 24 Jun 2025 05:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750767450; x=1751372250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEDST35ZX0GfIK7s8eSoWDSoiwV7DcfQwsefjsmC8T8=;
        b=HNb+hU03yjapYwypYb+iHvJavWC9qpsArN2FVrxpo77OQ7S7tuKWRk8Vx13njb0QjU
         YMicFHSW2tJo9qtsYWHNmctrCMIPybn6WWIbtIaRWQFzZWp3JJ8w5QD8Lrew50ZtCKSP
         GLx77Sb1hh8Q3bB0BMPd9jtl6Qbb8sG9PpFFmqfGRAkwKY03wYhgOwyI+r+RRzoOdYQU
         r5sb/oymZTnxusNEhqaJL7n/3KRyyeEgQLaytECfWpfAd1TXOPEhT2RmLRKePXzAqDR/
         KgkskqypsQRPgSNRz/5/moCTn5bMJyTmuahD5QcsMdpSeX+3GeSJyMNq38A2eTuza2D0
         17lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767450; x=1751372250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEDST35ZX0GfIK7s8eSoWDSoiwV7DcfQwsefjsmC8T8=;
        b=xHJRvaDXK5xp61tCIvj1A2Am3qvrzumozJ9x4cYntuL9dYc7Y9E+TPfBJKZE5Z7G+B
         +Q8H8WNQJmYi2Le1cMiuSbfEzV3N7FcsD+FxV2OeCmGmLhXdTe0rXcNTcOCm6dgEtQtJ
         bHKWzA5hrsD3ZQZvFf5nLUmTHBbea7dqNnY0SVlwd1S2QlXWIcp9CSgcg0aDlb535GIa
         R+LY6F/sV9Z0FIdlsU517cyGxr2xUjMdcyCPso6ZvXEwTALIV1VweURxYqsY2yGAMA4/
         XD19F++2b7M56MN6DYFafEynfr4zyxX+pxSv80nZw3JVxPqNY5epbVZui3JE4+BqtfFj
         4g7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlVNQqyFe3PIvgiz7YiDkEpIR/yQnfCGvU+zbtIZsPKIapV8blhFVl1vfrhWsxCTOrBki+iLcuv3Rp2Q==@vger.kernel.org, AJvYcCV7BZdyCLMbasmbMFIfxWGpxbsrse35AZa3D9OXEpnw7hFaQgjFbbpc1VHgBShZjTRTNh+qc9Xdi4IJcng=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5h2umHvv6I9h8lP2Zw/XSwfhYNb7mcTSce9CDwh1273b8VX+
	ZFwXSowHx1UYzEbK0WNPB9fnOG+7KuvsuiszymXZSyuNry7R14Y7afWt578ocZPjpWcVcD8ecig
	n7MqPiw6+ySKTmz/eiaSM3L0g0Lu60S4=
X-Gm-Gg: ASbGncuR5EkFn5PnQEHLVZ5L+6Z4EuX45GwBeOzFmZgwH0LhXBVeJKcr+FbKEPE/YRT
	ZRdOi6ofitzNU3juX+8qMjIYyGu0ux+SXobQ6R8PQpRg1+6vVqJwXfIV3ksGk6lyvhgr3vYSVqs
	Bst0AlkXmx9kiirRCsukzuIJobnS6k2faDH66Nife9P9ZxqiU5vM/Qsg==
X-Google-Smtp-Source: AGHT+IHTN7D9jDflZUo9kaDOVnT7WdurkvaNM7vMAAr+3pbTLv/G8VLv5GTnMmXfxECmi8qZbE6HXoW9Ve6MObl0yL8=
X-Received: by 2002:a05:6512:3684:b0:554:e7f2:d76b with SMTP id
 2adb3069b0e04-554e7f2d9c8mr2218188e87.56.1750767449540; Tue, 24 Jun 2025
 05:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624173114.3be38990@canb.auug.org.au> <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
 <aFqTX2oDzacpDpif@pollux> <DAUR75ROUY1Y.1GX6ALNM4FUAX@nvidia.com>
In-Reply-To: <DAUR75ROUY1Y.1GX6ALNM4FUAX@nvidia.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 24 Jun 2025 05:16:53 -0700
X-Gm-Features: AX0GCFu6jHv7VO078YVj9OoV2x2Wac9B8iBYEj9HMNgO-ANW95ZcjtKcVwDykNo
Message-ID: <CAJ-ks9m-pas1nYSr7GKvREsOKdGOoyW2ru3OKnnjerv9hsWdGw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Lyude Paul <lyude@redhat.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 5:14=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Jun 24, 2025 at 9:00 PM JST, Danilo Krummrich wrote:
> > On Tue, Jun 24, 2025 at 12:31:52PM +0200, Miguel Ojeda wrote:
> >> On Tue, Jun 24, 2025 at 9:31=E2=80=AFAM Stephen Rothwell <sfr@canb.auu=
g.org.au> wrote:
> >> >
> >> > error[E0277]: the trait bound `u32: From<DmaTrfCmdSize>` is not sati=
sfied
> >>
> >> > error[E0599]: no method named `as_nanos` found for struct `Delta` in=
 the current scope
> >>
> >> > Presumably caused by commit
> >> >
> >> >   b7c8d7a8d251 ("rust: enable `clippy::cast_lossless` lint")
> >>
> >> The first error, yes -- the `register!` macro was changed to use
> >> `u32::from()` to avoid an `as` cast in that commit, and while the cast
> >> is OK converting the new `enum`s like `FalconCoreRev`, `from()`
> >> isn't`, so we would need to implement `From` explicitly -- Cc'ing
> >> Danilo, Alexandre, Lyude.
> >
> > It's a bit annoying to implement From explicitly for all of them, but i=
t seems
> > to be the correct thing to do.
>
> This might be something `FromPrimitive` will help with eventually, but
> in the meantime I agree having explicit implementations is a bit
> cumbersome.
>
> What I don't understand is why these `as` are problematic - a type like
> `FalconCoreRev` is `repr(u8)`, so the cast cannot be lossy. I think this
> is the case for all such instances using the register!() macro.

The use of `as` is problematic because it disempowers the compiler
from checking that the cast is not lossy. In other words, it is of
course fine in the case of a `repr(u8)` enum, but if the type changes
in a way that causes a lossy conversion, the compiler will not warn
you.

>
> >
> > nova-next also contains a couple of cases where the introduction of
> > `cast_lossless` causes warnings.
> >
> > I can implement the From traits and fix up the warnings caused by enabl=
ing
> > `cast_lossless` in my tree with subsequent patches, such that we do not=
 have to
> > carry all this as merge resolution.
>
> Let me know if you want me to take care of that.

