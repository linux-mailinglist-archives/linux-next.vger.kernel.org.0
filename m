Return-Path: <linux-next+bounces-6044-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A564AA732D2
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 14:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80FDC3BEA4C
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 13:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7B921519F;
	Thu, 27 Mar 2025 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSvm53tt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD47121517F;
	Thu, 27 Mar 2025 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080420; cv=none; b=rLVuyh2cCUaRHmq0+1F/PUZyR6VCJGzplMdnTtvD1Bisi9ayfukIvUZh8KdEpDWvefMVNFrSzBlfo63nnWJn1/FS2KCPt5J3Rrk0y/D8Udk9eUV2h/R+Roie1jhmk/Sc9k7YMZlSO/13Hjf+TTTrOV8ZtNTlzkLtLsKXzTFprNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080420; c=relaxed/simple;
	bh=KXEV8KHZ+ivlWDYtNUMW9VWpzqKYUIbF/NK9Dpb/tjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAEE4wjjfRk6ijV5TjSAvnnZI4SOyE1/T565bFmI+dpEyV0LEYFMPUvAkw3qOk8Ua8WkK8Mr9/fD73pGT1vJ2m66Z9VcNJqXbjnHlnzvBIPh/HB/sMhT8ujkqRD62KA8Orj3p7Mnpl072A3GfhPHPdzbr0rjTjZekApdQKo8L/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSvm53tt; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so198658a91.1;
        Thu, 27 Mar 2025 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743080418; x=1743685218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UciXxV3a8HH1NDEJVhtkPgA/ICuEyk7OoN/YAN6ESHU=;
        b=VSvm53ttfvhHHE+V+++i30JQH9Xv4nZqvnDjHvVEpY9+0UjuvMKGzSVoVQjiXn8okD
         LGqHPF+MZ/Qvgxb4QbRYLkLGhvBnX1IViDAPwSs1ThvHwWJk4Wq1N1UFEQCFoxKGRcQ3
         xNPs/C5xT81AMRaMzK6hYyuhMlKVKwxpH5jOucCpQRlNGWpKuOjg5QXZPU4pcSoC12h9
         VCj6CVSaFUu4BHUvkJJ6GcD8BdnAf1foWajdNrbOX7qKcL9L9q6TYoj2vQRQhhtunk8a
         PWriyRq63hwjuw4555UUIDoGiYXmRddaXdYW2qhAxtW+mTiGqOnB/IUATMOq0Z43TLk9
         Obew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080418; x=1743685218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UciXxV3a8HH1NDEJVhtkPgA/ICuEyk7OoN/YAN6ESHU=;
        b=OvrKzAcL0w3JlVhjHzuR9wukmO7IW4N4uwMOeLGu4i/oGTPaFjw7Y7NKg+l9k7QPLj
         f8m9dFitYy5Q2GZmWgFLBamAWKmbNKoS7s8SW9qsVhOJTPfqyt0YAbcCv1DnAWm9xzN1
         ixneYMVvyAKFvvPmHTMzst0QdC7p5zL44c0Kwk5ZdyxwY0DzYsDGS+BfW9rZs0PX6t59
         bywHQg48m4THOPYQ6cXVJZZ22KB4AivaTbKX2J9PS19qc27XGpVsbccAqxmd2eUcZ49j
         FJ1vmLX+D3LjwDaEOA8OqhbNu7kt/uuEGl0ZnGXPP8cWA7VTLHb16hfNZmatHsD2qYRR
         FijA==
X-Forwarded-Encrypted: i=1; AJvYcCUUs2U+6pArnT0CvutKOd6WLhk7MUvCm6bvnOIrp0fdy2PDk6v1vyYKsPdMyCTHoT31Wm0SuxX3/CQ5GjE=@vger.kernel.org, AJvYcCWjSXnbZD0722vB2f6bFAAowVcbS2AJub8nqBBO8NXJn3RDU7BP9y1vutXr9gLEM++zm+UqfyRxlwqOeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyunwEGoNTIgbAVfY0U+uiscHDAEmkalpQwfElQuDczjDxi1hR2
	r61/X1YWQbFJIOp3CsRXb8i15eCg3fmghdvFXZgQgq7SCRF74B0S17lfdba4YQqjvOqg6TIKKV4
	Z0sDu2KH4FhEghvIGm6EXbvGZv7pVmvAk
X-Gm-Gg: ASbGncsABjvB5ZfaEWBezwOXwVai9InKYQLoAvPCt7+lqYPQdOji8myR7Tmvn7deMNw
	MIMj0+hkUGMA/pyApruo40clJsgG6sSyV/MN9S6SSaMTRkB7UkwqwRJbi3oNM1mLFB9smKF+y8L
	2PTCj/G8GyaWI/s+yhHqoeG26EdA==
X-Google-Smtp-Source: AGHT+IHar0VigULHI6M2hkhPwkuQyQ/pmUsx7IL99GSorT1qKDcL5zodNpjJU605I4Gm0kfbLZkmTQi6ovizf2fwCos=
X-Received: by 2002:a17:90b:3e8d:b0:2ff:6ac2:c5ae with SMTP id
 98e67ed59e1d1-303b2111dd6mr1729747a91.1.1743080417731; Thu, 27 Mar 2025
 06:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327172055.2212641a@canb.auug.org.au>
In-Reply-To: <20250327172055.2212641a@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Mar 2025 14:00:04 +0100
X-Gm-Features: AQ5f1JoOAghWCrKVFuoGTmN6HrxrThmZyGfYrjWBA3Yfezp5OQZDFPXosLorAF8
Message-ID: <CANiq72n3Tv4eiaedqzV3akJrH+W9oMaPuUPs2MeWqYJj5kOJoQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the arm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 7:21=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/Makefile
>
> between commit:
>
>   ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
>
> from the arm tree and commit:
>
>   6b2dab17d6fa ("rust: pass correct target to bindgen on Usermode Linux")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good to me, thanks! My usual tests are still running, but at
least a couple of them finished. I have yet to add a run for the new
arm, though.

Cheers,
Miguel

