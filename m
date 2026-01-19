Return-Path: <linux-next+bounces-9728-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F9D3BAF8
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 23:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ED15303AE8B
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 22:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EAD2550D5;
	Mon, 19 Jan 2026 22:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJO+MGbD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F1E1E32A2
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 22:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768862260; cv=pass; b=WpsBqyDU5Rw+9JFEad/ZQnxRhxl0u2qZ4EjjAKBLh7NvxiSOsXw9ttBpnZ6X8DwTwAOkrdv7wDH7RrY3SBdLwLgvYc3YKXnj/CeJ16Us5+B/144EWGT9G3pj5vJ+0SDYh7GIpCvbA8fbGoObwbqrqwR3AutKiWBSSPLSx0Nj8A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768862260; c=relaxed/simple;
	bh=q0K6Vr0qfNg3mPGL/ae6wm4IIrZCOCSYug9jW0PJx4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LN6CJ7Pwc7SyH/OqdPxYNFrJhXGBKJRHbhoOhgvpgGXy3b6U/2uDwSwVINjmLncg3FPqCe6nkh8fjFpFC3gTbitFUK87vgqGUXJ3YEH+zLCzs3sUgSFh7Wnp9L0ipgNlSPmVqmlvCKyYCg+vsurA66rLeVDrDeDKwOPz4coDN0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJO+MGbD; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-123387e3151so265881c88.3
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 14:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768862259; cv=none;
        d=google.com; s=arc-20240605;
        b=G2uUma4Ok90NTBe2eLQwt3Gg+1ZF0ics/p/ywDkqA9zMsFQQCfhsJJ87x7r1SiO72a
         d8cg12iBLfGj6ktGkYBJwoT6XkSAzLBfSrO8XER1sZIPYkX8CedjKu+moOrMbhxXNyU5
         MS/13Ub6J+mjYQ1KZj3uZdxXnUbjdicRvbRDGJewxGallU3O4Tu4AwGmSvvG4COjuKFN
         0Il+r1aRtG1vkaMzCYdTJMKxwu9h3ysLjpV7tIJ7zTA3dMghAd68cly87Z18Qu40dui3
         N5CY/bZ9uYsgEc5iJewVL6ViDpK+BmuMB4cMIiiLwr/xdtfKhUvof4HsRMhiZ0Cn18zq
         chvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3KuM0Gspy/srwSQ1flNStvF1/hXHbmByFvAm47JWCKc=;
        fh=xctwQcWJUGCUaLsbvEYjU6pzPsGvsx79a6r0BhOKgoA=;
        b=bhgKZyef2Hm76AnxZwBxacCGLa1qURZqDPyfVtqkVYFkWDrMdubNBLCZNnm0/LdZej
         ZAUX4MjlMGVUhME1k48xLkUPX+H2TqF7B/uq0CfgLW9eTd0oYZ/OjhOen/Lu+B54OLFQ
         YGzf1SkcshxYuCEFW2alFD/gwnXRAtK+6+rOUQfTlCA36A6pIvanMVgne5BQVKwhVg87
         MvxMU1s9THjvHzrNvUM5Ozeh9OaFMR5BRKz0z1DiBLWuhPFf2lU7Zj0nD9t+byneWvAe
         sF4GYKRZDwxM4s3a8V0sFOMP82T2ojKpQFu9/tVgTDvEd0DROx9atnfsoUnCbzU0s5oQ
         OWeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768862259; x=1769467059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KuM0Gspy/srwSQ1flNStvF1/hXHbmByFvAm47JWCKc=;
        b=QJO+MGbD3TblDA1R/5PT0lfnVjRJXoQfha2XIh323Tyz0++PCRy1WAlmprqn1/yAGa
         uatoyIxtsW15TOwdNn3D3quhSH0JYKfRj8lHpE+lC07krkooGN7xjAEjI9tOzYBR7+xA
         pbIEcf/+/U0Xek5sQXCfiZTvIY869hQRn1+AJMSBTCBRlAhP/42cObllRENp6n/ogDys
         mNRCqv2s1WgFETZTxqYwmxMQabuIH+B5Hnm0JR7RfMfOp9TsplRW0fAwuzcTAQrdiS3G
         tGsefCj+jyqDnIXv+NnRyJ8zv3CRV4Ie5/YbdQs5wDRvm1N3OSQyv+WdSNXBYkv53EjI
         T+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768862259; x=1769467059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3KuM0Gspy/srwSQ1flNStvF1/hXHbmByFvAm47JWCKc=;
        b=uiOwxKxc6tpY+jQWaDYXx7e1petsxjbCV9I0I/ilJWL2q1IuMc8F7l6B5/T3qvKZie
         /1BsfJK8Ue4EJ4Xyv3lg6gqtJDvcxYdPRuSUCEYPK90/thpLaO3OosRUe4LT4vhcD0+k
         GNe4e/sHRc+DtF75CaqjH13I+pTwSZ5T/3KMRDzHKokQdkLDxCS5euMc7ibxfs1bGg7i
         nMwtpSNAVivDc/6ykzvZWqTlvJngF5aX4HkTH/pWxIgCRf/ZcT+gNr0IpStunZXW0e1/
         T8blOh3m+W6AaYm1oizku8ClpjALOtnoPg2zAxdSBYEqyJ8IhdXUiYWtSmIJIGfIM/YA
         6THw==
X-Forwarded-Encrypted: i=1; AJvYcCWf5d8EHXaTrdAwiRNAaIcAZHODYB2aJe8ZMun6SjIbuJm4adJHKpg607A3ujlRjvyz0CJ3SkZULs+s@vger.kernel.org
X-Gm-Message-State: AOJu0YzkwT6UJsFwhM68nnlQtguYW8BU9EEBLynJtCHAfJEIIGGJt/5j
	OR8JwfEeeA5zS+C96wJASmIqMkCUf3Du8WidCRIFo+OfA1QJgUg14SzWX99F/oEpxdonK4Ss5rK
	vRRQCmJm5dyTTFV8DjYSoYLoO1tdBZHs=
X-Gm-Gg: AZuq6aJvpq3H2yy4bR+pLQ9I+pmCtFufTGtoJ16Q3tOeLdvXI6wU2M2wBakPe4Od8kB
	v9baSq3/VUO46m28YqgCgGYUd5EthBMhHx61PSyz1NS+BBoVtmq0dWGjFFtoI1hTHA+3XYw9vXr
	Z95Phmwud01a4EsJRZCw5ktQ5KiHI4dT893qUfHO0t1fJd0dgaV0kuKhAWyhLUHlybNp4AyS9V7
	b5RIQ9oiqus186KLsn1HXg/WOzE85EekBQ9VZWS+T8jTMSnZZm45oly1lBt/IAYIxpuY+qygKHo
	p7yOxmBtAW+iy20zRaUBi2EL6syioqzOeYl4s388N5RboEKaNMFNPCwlBwBqxCSwRO8me1koiHZ
	aTmcXs4u1mdrylCPOb0/9uCw=
X-Received: by 2002:a05:7300:324b:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2b6b3f21d84mr4830486eec.3.1768862258636; Mon, 19 Jan 2026
 14:37:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW6wfOjd17D5tUC5@sirena.org.uk>
In-Reply-To: <aW6wfOjd17D5tUC5@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 23:37:26 +0100
X-Gm-Features: AZwV_QiG2Lzv4nJG46-kajsQDKyMz6FUclR3dnMRv0SxAw8I4Gw768sEjsyYXqg
Message-ID: <CANiq72=xTpfYAdY3oHRG8c8akOwKGHo=kHXk4L71m0TxAXv4Aw@mail.gmail.com>
Subject: Re: linux-next: build failure in final build
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 11:30=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> at which point I gave up and marked the driver as BROKEN for today, I
> might take another look tomorrow.

If they are "just" warnings like the latter ones (i.e. CONFIG_WERROR
is enabled), then I guess one option is to leave them there for a
cycle or two, but I don't know that can be easily tracked to avoid
trees accumulating them... :(

> I note that the dependency that the rust DRM drivers have on DRM=3Dy mean=
s
> that they evade allmodconfig build coverage which is not playing well
> here.  I will move the drm-rust and drm-nova trees to be the last trees
> merged to mitigate this issue, their fixes trees will still be affected.

Yeah, sorry about that -- it is a requirement at the moment, but it
will be lifted with build system changes soon.

Cheers,
Miguel

