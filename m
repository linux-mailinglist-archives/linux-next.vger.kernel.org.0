Return-Path: <linux-next+bounces-7223-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0AAE6275
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFFF47AAF99
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 10:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AC9226863;
	Tue, 24 Jun 2025 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh10bI1u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C45B652;
	Tue, 24 Jun 2025 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761126; cv=none; b=OuEHEfzcKsiobm6p1aEFkIVdU9evlXC6wYXeIgEP0vR7xsIcV5fHOvp7m6EQiPKIxZJ1W3yX1XEPiJg4cEY7Bxy73Vo8JDdH1FDQ0C2IzEDiL1wzVWpCsWkflNh/rEYkf4DnsaNNPX+8BAeVg343PWNlFwgGhxxBj8yxCenOhos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761126; c=relaxed/simple;
	bh=kL6nOpfMR23Dw4ZrrMzJ4BFkSQrh0eapV2BWV/VaoXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEcnAbJFlCE2Ozc4yK7JXN7qxrrJZKrebVLAj4CV1XVRKjipUBTx1Vtkf2EyA3bXP5tZaLe93I7s6lWIULi10VlD3MLO7huYqHeNwpu9tudjmWk2AxtsYNZQ/JVtldlnwy2lRoJW1QHPnTUONEtkON2SlfLXDWnVef5JqvcVZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh10bI1u; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-313bcf6e565so739176a91.0;
        Tue, 24 Jun 2025 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750761124; x=1751365924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqIS9lB3Y641B91lEhoiHbekqE8O9ocUeQTdyPaB66I=;
        b=Zh10bI1uCy4zJONTJFJVlVSy0OQo1ok35ltAsfMADCJqaiSG3eZe3g01WX5TYY/mAV
         3wBKd+ISgdjpqoEXUpEqlK7hTc6pVQPOKnrNwmPuDhtUMXow2ExZXOAfWXkUnuR2RN1i
         olC0eIDlg9YdcQvtSpCkxIoZ4HQn+wxLuYrCYLJsqxNk6UlfTYdNrDzrzwrRiXHZfcVr
         sjuXBwwTLaJ27mK7tDuZqNbWG5LbAv24VwIXlOsfvrjkKYqIXUeg/59efzfVoJ8LkrlY
         FEG70AEebabRZyr2nzmr94Qmn/ymETId1m/jhjGd8vkwKeGVwZFxpjOT3kB08Er0zg1x
         cd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761124; x=1751365924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqIS9lB3Y641B91lEhoiHbekqE8O9ocUeQTdyPaB66I=;
        b=RZlQqcAGn99V+ZvO91lBOZmBuTLaizvnU+zIIjKzk+cmtsE+OH6OD3Z+imcIWd0lI5
         Pj3qM9VEW9sJ4lDmuKtlRaH3GFqzY4RpLPtKS8BDOF/1skZUslZOM+HBdY0j/pE0cVja
         0lTeQUSEhNoIOHUFKR6lM2g2F9cktAmj9eP1a/dS3urO6oOBMSPNSoReZR610UXRR732
         sTrjnMKfKJWwXC8tKrUs4t+jsTe5QBLaEWs93/fuRXkjcIkbVchwRSm2Eh6StZPU80wr
         WYWgR9sUhegJAPHUUpMH259la2NTjNcDPMAsGjogJvCrOAlLPzEPiN3zJiuDHGkN0Xwv
         SF8A==
X-Forwarded-Encrypted: i=1; AJvYcCUOgVprwmSjhs0NP1ZUVEh5FO+si8JsHMA6xJSWYSjSRJvAGSb/5WCUoC9y895rpjSCRixBqgEWyd4JPrk=@vger.kernel.org, AJvYcCW5T4/8IgBbgfcHWCKjX4HLPd59k88gDhUSnygkpes0W9c1bP3X9BWk3ZEbTR49QRRHRKHqy52SObEP9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHTDN5TRPUV4Br/o+eaYAb5gT9FVyUqEx9DTxAl32B7rJF/6p
	v6LYFL1tsqCjnDDMKUE/4drhoUDkQDr1MklhtU9qO71SUnIUbkyvLvVmeXF5VX7R+TI9Bp+1tEE
	Ml97VyEq3Mkx+ScvmQSuTmeSYI40HlQ4=
X-Gm-Gg: ASbGnctz010Kk/dXRnTTcAHE/lc125if4yB09IyDECWVqI+QH8taLQwjrc0XjiJ50AO
	Evt4ueBbf7hqEOmkP4tnzI3O7zubdaxQ/wAeVkEaPiJ0fTQUn9nGDaac3U92BtJvVAvVUm+PSmu
	HB38wrUwlTOaA/c07l+aseqKATplfSq08Hcyj8WYL/s8k=
X-Google-Smtp-Source: AGHT+IHm0DOfa5YeILsDiGGfpgzwvQxBklvlbqyzujT/h3zythWPX+h9nvC+KWLsUTTRworGZ5SK60w+2TZeiB8Xgio=
X-Received: by 2002:a17:90b:2709:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3159d8dfa33mr8707837a91.5.1750761124257; Tue, 24 Jun 2025
 03:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624173114.3be38990@canb.auug.org.au>
In-Reply-To: <20250624173114.3be38990@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 12:31:52 +0200
X-Gm-Features: Ac12FXyWPOVGbipCHMSZvXK7rnd2yjbqIVj7k_UuO6W7ZINjHGep1NQXkGNKEHk
Message-ID: <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 9:31=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> error[E0277]: the trait bound `u32: From<DmaTrfCmdSize>` is not satisfied

> error[E0599]: no method named `as_nanos` found for struct `Delta` in the =
current scope

> Presumably caused by commit
>
>   b7c8d7a8d251 ("rust: enable `clippy::cast_lossless` lint")

The first error, yes -- the `register!` macro was changed to use
`u32::from()` to avoid an `as` cast in that commit, and while the cast
is OK converting the new `enum`s like `FalconCoreRev`, `from()`
isn't`, so we would need to implement `From` explicitly -- Cc'ing
Danilo, Alexandre, Lyude.

The second error is due to 2ed94606a0fe ("rust: time: Rename Delta's
methods from as_* to into_*"). However, I am not sure why that patch
was applied since we were discussing the naming of those methods
elsewhere -- Cc'ing Andreas and Tomonori.

Nevertheless, even if 2ed94606a0fe is dropped (or the conflict solved
by a trivial rename), there will be another nearby conflict after that
one, due the addition of the `ClockSource` generic parameter, so that
needs a change too, e.g. using `Monotonic` explicitly if that is
correct or allowing the caller to pass a `ClockSource`.

By the way, I also noticed a Clippy warning in `nova-next` (on its
own, i.e. without merging anything) -- please see below [1].

I hope this helps.

Cheers,
Miguel

[1]

    error: mutable borrow from immutable input(s)
       --> rust/kernel/dma.rs:297:78
        |
    297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count:
usize) -> Result<&mut [T]> {
        |
                ^^^^^^^^
        |
    note: immutable borrow here
       --> rust/kernel/dma.rs:297:32
        |
    297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count:
usize) -> Result<&mut [T]> {
        |                                ^^^^^
        =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/master/index.html#mut_from_ref
        =3D note: `-D clippy::mut-from-ref` implied by `-D warnings`
        =3D help: to override `-D warnings` add `#[allow(clippy::mut_from_r=
ef)]`

