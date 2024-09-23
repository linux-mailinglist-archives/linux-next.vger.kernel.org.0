Return-Path: <linux-next+bounces-3947-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8397F14D
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 21:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C33AC1F2284F
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 19:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2431C1A08C1;
	Mon, 23 Sep 2024 19:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFrJqq12"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8951D19E97A;
	Mon, 23 Sep 2024 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727120422; cv=none; b=b5T+6XTWQOqU5yUzKcdPGCgTqwe2AMIoN4P6wb0lxi1K/NHL02AZPfyDK8jJ401gJhQTMkXvrs0sG/5ZxEZ06b9TpBYUrAglehbc3SmtlYCiufsEFY8+bPkCZcTcQ/H1wM6kYiAFrCGRp1hzROdTs+ekWpzkPNh5wE1ET7ZHCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727120422; c=relaxed/simple;
	bh=ERNNM8hT/vJGtD/Ln5CDaljFWEc42veBV91nhIIYLRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yr/LB93PNWhdfmKpgbXRe9qGbEAXRqc6h6jAhkhKKsHZ5MtQV/ffosEqetz2a4nQeIimgkdmx5pasDOF6IdL9KdHCNv9MKmfIzGYTag2FjVPwMBiMY+x1s/exYUGVf/rqs/rZB9bvlT59jT4Y9Baw+93qbm7FV9KlUEMKc2F7WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFrJqq12; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7dafb321dbcso301892a12.1;
        Mon, 23 Sep 2024 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727120420; x=1727725220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51RTtdmnW15bZ4d7aEGEGz378EzshMD/jEqRF+XqVkM=;
        b=jFrJqq12pvF2nLRoq97pm1pODlhpuehZNquUC1xHO2AhDSsFG24EWALN2GlToVOWVQ
         M1CIDxBxEaQxZl0rpSIvoqZW03EsVUcmTh6znhZeZX885sLb/y/8cwAqkTjTk/TFK+v+
         gRxYXsCHZv4PQS8y4X7/MO1b9KRGKOevZOkioFj87AaBL+KyRD/Q7e8DsB8g79QsQEAF
         zem8+Syc8omSRlk6xRkDvNxdXbd0sylSnrUhLOeIBgCIwOW0uH3ZUHUyPzV6dapzp1GV
         q5hNmXsva4Vf2H0CV+EGfXn4MpQXcwqfHt+rwIKO4UUvINXfm0tS3TIZmIE14t1VAGFm
         forA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727120420; x=1727725220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51RTtdmnW15bZ4d7aEGEGz378EzshMD/jEqRF+XqVkM=;
        b=WIU7LjB9flFxwZlIckaaTCjqje5aA7Uu8NB/SgawOZll3KdXwJ5WvSYPorgBKLs0ZE
         QVlpf2ggqs5runqEWzuRsMtfEE1QonvruD3HKig2jEan4xSmmF6AZupJL6VoLEPIWLOY
         Scw5noI570tmJv3y0W/8/21R7zd7cTWIBFG5VTT20Kz5oGxBgR8dY5zHD9QzUjRBb3TM
         z015D3cWjSpUYFHf0lckrl7FGbEY3xNdib1QjR7mqKAxJiKbQvaGX3Yp1YdSg5eeKV/h
         m+MchyNixcN3FYsXojW/Yf10Izqrvx4BYKuzqBL2I9HMjOoafiFkWayMBDpreh2wfX9+
         cXEA==
X-Forwarded-Encrypted: i=1; AJvYcCVzTn3ovb7G/ZlMzbV44lwZfZTFdE1LZ9U0WMtkKFYG/+dFbexrUReJyV0V0A65YuCdjJkk7fZwJwTivgM=@vger.kernel.org, AJvYcCXZ8gj8sH0fNqzrQwkDxXeJifLGJWtDl+62fQ5HAf0CfAq61J5QfGP9jAqB+BfpgQD2oW2J82acWn6wqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyisxwiq9onjXXMTrgW/Pp4lHfifMZrgIUwqo8PQAkHmPyTnrQK
	KkxfLL7ewZUG8YPJf2H/NkOe9C4sUfB+9IR116MbG8gzmW+Ld0U9RrmV2WQRWL0JkGckR2t5mrq
	JCfLMJIng+kH+t6t2/EBrUzmr7JI=
X-Google-Smtp-Source: AGHT+IFuNLe0Mw9eflilTvIfP0FGO6MlYa2wMh6lQlq1YpU3zlROlsGpyEw9NhqNCrahSy87WRq9GWzuvvoEv1yROvo=
X-Received: by 2002:a05:6a20:2452:b0:1cf:43e0:d75f with SMTP id
 adf61e73a8af0-1d30a9f2180mr9328230637.7.1727120419894; Mon, 23 Sep 2024
 12:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917145941.2c4695a5@canb.auug.org.au>
In-Reply-To: <20240917145941.2c4695a5@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Sep 2024 21:40:07 +0200
Message-ID: <CANiq72mi05w4YuN+D=-0VODDCnP-kWeX-bn1UOAJGvTcJ_tJ2Q@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 6:59=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> The following commit is also in the mm-stable tree as a different commit
> (but the same patch):
>
>   cc1d98f9fe30 ("kasan: simplify and clarify Makefile")
>
> This is commit
>
>   78788c3ede90 ("kasan: simplify and clarify Makefile")
>
> in the mm-stable branch.

I forgot to reply during the conferences, but Andrew and I were expected th=
is.

Thanks!

Cheers,
Miguel

