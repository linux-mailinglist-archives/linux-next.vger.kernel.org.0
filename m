Return-Path: <linux-next+bounces-8741-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9EDC13F20
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 10:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64233A7BDF
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 09:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D256A2F25EB;
	Tue, 28 Oct 2025 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vOtcz/xM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F922EA475
	for <linux-next@vger.kernel.org>; Tue, 28 Oct 2025 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645135; cv=none; b=Bl7+ES5m4DdqkSma/t1K2lGZ8yfuG2jxbfoJs4t9BPplUCwKthyze7znabJy3k1NVMRsjyrJ9eO9fozJcVG099+3qKri8hyAxj+GYcPXgL4QNQYykwJ9OPT917VwcqqI42AMg/GRSPFtUILY8SRnYcDoNd3T92GCQ8zkaE0yk1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645135; c=relaxed/simple;
	bh=BcbBFf55+8HophpvdJF9R0Hd9KOcW7q4hoVEpuvZsjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VlyeGMwFFSEN+3I+L5QwmzJSRBDhlkX4Z7yZBlUo+8DzrvipWCibLGw6X83oCgkCZ8YegmBBOdUhtiknXB/OzefE0oNGavsk89HYPl2foIf86aYLfWP6qMUN116G84KphcV0chKUlKWdM+BMH+HFphz5TB1EDpgT6zeVIhHS+KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vOtcz/xM; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477124f7c00so7436565e9.1
        for <linux-next@vger.kernel.org>; Tue, 28 Oct 2025 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761645132; x=1762249932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li4we23t0sY+HaTe7D2v6NWuNOLR0K5hfC2qWnBkS/s=;
        b=vOtcz/xMl5ckzG/qkkHWvLIT5ONyFWundR/XUWukfQNLrDlfndgY0YIkCbE6ToJNCW
         xVgUbqUbl2gGjDGMNvQBD6XAcQ/Yc2QUqGBM/IJRZKspUvq/Yu20K0w8d4hDUKso5s+X
         tyeL8TtllSuSbQ7r9a6bC3rVblzj2Z/oURm/0soloRoUvSo3v7QrjYDU9cCMyckChXpr
         vNwGVBVQbYFzraAlh1H0KgV1TKzemMBrymu7WJdXYhQQeyFRQu4VsYvp/L7xK2d08RmR
         YSsZ42gZ6jurKQ6DscKsJnJhQ5pvObs3MrnpClv/GhiE9x/DMkl5NjQCpTcHJh7b10Ov
         Mvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645132; x=1762249932;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=li4we23t0sY+HaTe7D2v6NWuNOLR0K5hfC2qWnBkS/s=;
        b=J/6OB3Yu3Z0JfO7Qoq5EHQJGfs3CQWpweiPG1h/DqoNFQAOsAR5tDWO8gTxAgnBa+j
         kGuW7x0K+0gx9U6KvyE9mi7VbH189GnFX/9MRTHW3j7k/qjY5vfTYRuM5eIjcv3p48VQ
         HcAcIxElaQiEikdebvMZ6HeLjW4Ou6RkKjSk488edF1q37eNmihL/YJDxF5f3AOZ4XO3
         Bdmf+zVs5Ir0oK1Dj8BF4bC+ZGKHqzfqcYWEUx96ywXCI13Vjnn09f/G0nWSwlaQLz6M
         VeSf8XZut7kz73ufoYIXVl1ZACu2c11JR/baCOxwSAwmvrqMwCHLU4YXKiOvVD+KGSB4
         CWfg==
X-Forwarded-Encrypted: i=1; AJvYcCU/FlltMwHsfL76oRLF2M7jePdUnH/xLC41JPSiXaGpB1OBrnR3ctnuUj2WKK9fGCUxL3LfWzcKtiJx@vger.kernel.org
X-Gm-Message-State: AOJu0YwFingfEroZREGbgKhJ4NvRw+JdiLoqsAZDn90m8mRpxC/Di3z8
	7MytDhXrvDRf5QE94mx9/cebH2T/G3imIDXBYpHsCnvSHzY+q+j1hhqgvjYrANSR70B4FBmYfV7
	ND7w+SHO9xonJV3h9Lg==
X-Google-Smtp-Source: AGHT+IGpY1Fira3dlQUpQV/o9WMvtIBJxuA6SkYa4zEUp4aDR2NEmszlFqKK3XjkOBU173zsseFm5upt7EbX9rg=
X-Received: from wmjf14.prod.google.com ([2002:a7b:cd0e:0:b0:475:c1fc:f10a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198e:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47717e409c9mr24424375e9.29.1761645132397;
 Tue, 28 Oct 2025 02:52:12 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:52:11 +0000
In-Reply-To: <22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251027125148.7f7d8ed6@canb.auug.org.au> <22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>
Message-ID: <aQCSS_h47zUVilno@google.com>
Subject: Re: linux-next: build failure after merge of the pwm tree'
From: Alice Ryhl <aliceryhl@google.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Peter Colberg <pcolberg@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 09:11:31AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Stephen,
>=20
> thanks for your report (and creating next each day!)
>=20
> On Mon, Oct 27, 2025 at 12:51:48PM +1100, Stephen Rothwell wrote:
> > After merging the pwm tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > error[E0277]: the trait bound `core::result::Result<core::pin::Pin<Box<=
Th1520PwmPlatformDriver, Kmalloc>>, kernel::error::Error>: PinInit<Th1520Pw=
mPlatformDriver, kernel::error::Error>` is not satisfied
> >    --> drivers/pwm/pwm_th1520.rs:331:10
> >     |
> > 331 |     ) -> Result<Pin<KBox<Self>>> {
> >     |          ^^^^^^^^^^^^^^^^^^^^^^^ unsatisfied trait bound
> >     |
> >     =3D help: the trait `PinInit<Th1520PwmPlatformDriver, kernel::error=
::Error>` is not implemented for `Result<Pin<Box<Th1520PwmPlatformDriver, K=
malloc>>, Error>`
> >             but trait `PinInit<core::pin::Pin<Box<Th1520PwmPlatformDriv=
er, Kmalloc>>, kernel::error::Error>` is implemented for it
> >     =3D help: for that trait implementation, expected `core::pin::Pin<B=
ox<Th1520PwmPlatformDriver, Kmalloc>>`, found `Th1520PwmPlatformDriver`
> > note: required by a bound in `kernel::platform::Driver::{synthetic#0}`
> >    --> rust/kernel/platform.rs:196:15
> >     |
> > 196 |     ) -> impl PinInit<Self, Error>;
> >     |               ^^^^^^^^^^^^^^^^^^^^ required by this bound in `Dri=
ver::{synthetic#0}`
> >=20
> > error: aborting due to 1 previous error
> >=20
> > For more information about this error, try `rustc --explain E0277`.
> >=20
> > Caused by commit
> >=20
> >   fb3957af9ec6 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> >=20
> > presumably interacting with something merged earlier in my tree.
> > If someone could provide me with an appropriate merge resolution, I wil=
l
> > apply it.
>=20
> Having no relevant clue about Rust, I bisected that. The bisection points=
 to
> 0242623384c7 ("rust: driver: let probe() return impl PinInit<Self, Error>=
").
>=20
> Translating the changes that commit does to
> drivers/gpu/drm/nova/driver.rs for drivers/pwm/pwm_th1520.rs results in:
>=20
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index 0ad38b78be85..dd554574adc8 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -328,7 +328,7 @@ impl platform::Driver for Th1520PwmPlatformDriver {
>      fn probe(
>          pdev: &platform::Device<Core>,
>          _id_info: Option<&Self::IdInfo>,
> -    ) -> Result<Pin<KBox<Self>>> {
> +    ) -> impl PinInit<Self, Error> {
>          let dev =3D pdev.as_ref();
>          let request =3D pdev.io_request_by_index(0).ok_or(ENODEV)?;
> =20
> @@ -365,7 +365,7 @@ fn probe(
> =20
>          pwm::Registration::register(dev, chip)?;
> =20
> -        Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
> +        Ok(Th1520PwmPlatformDriver)
>      }
>  }
> =20
> which builds again.

This merge resolution looks correct.

Alice

