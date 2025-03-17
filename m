Return-Path: <linux-next+bounces-5835-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF7DA65E18
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 20:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C4997ABC3F
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 19:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377011E8352;
	Mon, 17 Mar 2025 19:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxPVOShy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F11C6FF7;
	Mon, 17 Mar 2025 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742240249; cv=none; b=ThI8C/tjFgSLDkTQEMSYJhBlw45NQqJ1CzWomi5nsBO4Hq/nl1GOXMOhPJUFNIM8yDWCqYNX9BCWJ08hQi/aB1yU/smNYI5Ltw1X1puEQG5VTfnriVPqtMGC4gBZoIsf3WxgLhqn9Yj1FHHuA975VxXnwvxIyIfUIROEvgxj7wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742240249; c=relaxed/simple;
	bh=48OxUMxPHQABF9d/aTYX30rMMKk5IS0OEGcms7nIWr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dg4Nwtk7ksrSeRI1FKXpf5EC3O5MUG8VHiksIzABvavSRKS6a6GdQnTnoQoscQ+dWQjsEdOSmQzCTTvnkpVwu1NLyTggqfD6jc1FwnzT5SfXqyJySoZLcrrZIZZAUx1AZ4lW5sy9o/3epB3mHVWFepfYjsWXV3tsmTsqtSTpy+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxPVOShy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30144a72db9so782978a91.1;
        Mon, 17 Mar 2025 12:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742240247; x=1742845047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzFLPpauAjmtDRR9KbufCnHsExEXTbmFfTCN7TBMzCE=;
        b=TxPVOShy7oL3SLzqw8ZAE18r2IVijwbYmWq6ewc9Fd0t+hs703hBAKvrGu9f5DFcT2
         /cYnrloigmtGLgvpnVfrjUR3ZR4g1CgRYo9lPW1zQNkhkorERLO3HCEOMBH6iyD4Qfwc
         TXJIVMMQfP+9El+HSqLqhvWQvsDf4Ra6d3ZIJZKZoH4zybWSmIO/xVfoXAUa745fk8sP
         jV1Us64VQdKI3B7u8LnsaQw0gjdU+xwtgyD/1t3NmbKPx9AiqsWJxURTsCCxSooIZ0Wh
         mlQeQmg2+FEVjPad02f7ZrqErLJC4nP2W1M4PdgGuctYGO7NzkwIXBP40HZ3Yw4LRDut
         6zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742240247; x=1742845047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzFLPpauAjmtDRR9KbufCnHsExEXTbmFfTCN7TBMzCE=;
        b=K6EeB5cUAv7Oi0Ac1o/jUSCs/as9qkgFKLbk9JKngZRY7wUjNYhu9zKFZWUHXengTZ
         3G28/kclxyotiXfDFyK3u5wHoBfqPvupvCelGKvxYx+Y2D/vTjmZvS1na4ZWW2Yspntr
         HXBdQntAZ2Oha7uzgJDENmbIsSJr5PxO4O64aSuUmi16joA762egmWBI//BlfQV4BZpe
         0BHVgWkFn9EwUVJ+RuYnuQno+C/PMh647tcHrhAnTaprvtYSNf1ShsHzL51zE7SHNedq
         ncMhoW0Ls4/sXHttUFv6+nH19+5jfoLU32o638ugQ9UCdoY173RnWRUhQFiOAdB0vuvN
         DAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIubUbr0XSQf1qXG6ICG0JO6K6QHCHFSQw9TCdhnEEFDNJMLZqvKlRzUscI07Qg8Z5GzgUmKZdOPxL78M=@vger.kernel.org, AJvYcCWlZdJu6kuTZb+KoGeufKCFdx6i4lci4ggeH7ISk8ubbFPPITFfThHohhQ4P5miuCDre4ORirREZEy1CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD/sBt/sPW7N7wEp/TfNbbQTcu9GTgJgw4IWBGy8jJrowWb/t/
	ponAk6l9qU5L+xNmyE71KWGBV2aqnmzo69dvcASkjup4LCylV16kDq+6uYKiUNIo8o1hZflx+4y
	B6rbKfeYHROcwVeQohKlvXbc6Ago=
X-Gm-Gg: ASbGncveOyNY5d6lfdq89HFI9/VXymlE/5JGY9ECNnaWRrIMbTMIxGJSw9Hf6yJ6SbP
	OMXLC6ud5ocQRyf6Kjiv9PjZAoN9Kj+ANDoM+2i2Fy9Sj6riXXfk1+w8+FOP9dc3Aq7nBQSWPsE
	zTKGwcDMGaikrRgMEyMakdncXNeg==
X-Google-Smtp-Source: AGHT+IGoOpPo/zhhexF8sP8etMp1/pbpwFpj7QfRZdqLQXhk0v5/ongpMnTE3wJOrfaiCTd6ivElDIFN4AwOwN4BUxQ=
X-Received: by 2002:a17:90b:4d07:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-301519cbb06mr6641930a91.0.1742240246634; Mon, 17 Mar 2025
 12:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317212047.46580935@canb.auug.org.au>
In-Reply-To: <20250317212047.46580935@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Mar 2025 20:37:14 +0100
X-Gm-Features: AQ5f1JqQGjyQhMp7QXPMnvtHKZrY64h7hi3RD207uSY001ucP1t2Pn9M4ej6lxo
Message-ID: <CANiq72nD2ezPVHH_mZhB4+FmD_Un90dGL+q5-Np+zUDj97UWCQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alban Kurti <kurti@invicto.ai>, 
	Benno Lossin <benno.lossin@proton.me>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 11:20=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/init.rs
>   rust/pin-init/src/macros.rs
>
> between commits:
>
>   df27cef15360 ("rust: init: fix `Zeroable` implementation for `Option<No=
nNull<T>>` and `Option<KBox<T>>`")
>   6933c1067fe6 ("rust: init: add missing newline to pr_info! calls")
>
> from Linus' tree and commit:
>
>   fbf8fb328d1b ("rust: move pin-init API into its own directory")
>
> and following ones from the rust tree.
>
> I fixed it up (I just used the latter version and applied the following
> patch) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>
> More (or less) may be needed :-(

The part you did here looks OK, though we will need another line fixed
elsewhere, since the equivalent to that line is now elsewhere. Please
see the resolution in the last message.

Cheers,
Miguel

