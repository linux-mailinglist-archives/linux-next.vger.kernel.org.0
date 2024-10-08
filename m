Return-Path: <linux-next+bounces-4147-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AD19950EA
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 16:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FC401C25068
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 14:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7693F1DE89A;
	Tue,  8 Oct 2024 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdrjUR3W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1911DF74E;
	Tue,  8 Oct 2024 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728396100; cv=none; b=Hvh650WCkjqZkCv/WOGADko/y5rGHVFdlsm88M6cTf969yG2tL4jBQhqRuEWPCj0ZOlqZACQjtHy9yxhfyCYBiSgULeIvvgcnPZFxQE55rthpaqR67LQrZkS0qBe3O4YIrqPwJj5vbQdKFx4QnrFyEVNaWOWmLj5cqqIPnrRBB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728396100; c=relaxed/simple;
	bh=vygMF4CiAZmlxLrVHu+CXHlWf4sk4EWH2pXeTvqXogg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=el8qE2W9XupzpFq5xWRRqonsEtJVcGLuq+jm22CWVv2zZEtcX3fn6wnnMYJ/sAjWgPCm5uPqogjffwvqunVmY47Y9asGkNsE8d0qzhKJVjQArIqveqQihhlhE3w1a3+s771E3Xeb0hRdsIpGW5g34HaUEfH7eK9WAk/ogspra+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdrjUR3W; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e02ceccd0so135930b3a.0;
        Tue, 08 Oct 2024 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728396098; x=1729000898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vygMF4CiAZmlxLrVHu+CXHlWf4sk4EWH2pXeTvqXogg=;
        b=UdrjUR3W84fEcOleEC+qlT+pq0oH3ZxRhhnH/nyuTE76Xg3dYogQvvvwHUx5zauU+n
         MysbdHNNtQxEckIyO3GXEJYEYgycuE++o49WLsjoGFEtFYNXYzZ3cZc2ySzR/izGl8eK
         b5H/BYVPjuSZ9gDIGTO90jwLjwi5lLg8tIbgTOAA5FF0zQrJKsq59GpyrAj7ru3NBtK7
         IuvTta/mlBy/mfdpUxKHHwMMxJSnjOCx7V9izCZ+GSr3J7JN0HcMiKqOBzM6FxzQ7rLR
         LNw1dK+1zxy4ftdR7mZQuknSe+V0N2oQ0mX9kMMNqSFYWcNSIdS973626KwfVHr+w4DN
         9+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396098; x=1729000898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vygMF4CiAZmlxLrVHu+CXHlWf4sk4EWH2pXeTvqXogg=;
        b=GWSZ/hqbFnnL3WmWbDD0tgAQCqGSgEv2ia03Ir1IBOAbv8hSvSJ25SV3fMLpdK1zgY
         /DmQTtXI3JoL6nmHY3ajjhR1qVIHrAymiqJMHsxWSjna87CR3Cyp/4OFBXyjwqGY86ZL
         TJSXPlNvVk/7VcSHoJLikURYXUWimlACO+XlcA1XJX1+oGOCcKcU48+sGZCI1uFoI6+U
         5rHMwn5ZIFpBoTQ1GT6BTuECjxOXGFvlcekfZ/ptv/puZt5LkGyF0iZ+GPHh8Pw8iA7w
         ADubcgy+4KHUF1Z3Gi/IBly9cG5QHCY6QYu5S3ngwo0T84bI/0cInpXxe1qhPklsQbyc
         GD9w==
X-Forwarded-Encrypted: i=1; AJvYcCVA0ONxvf2kTTW7bBxTRkHsLew1su5px14n0BByufSo2qBdojajtTTF/Idx7SWJkcmEE6axttBMEeg7Na0=@vger.kernel.org, AJvYcCVmG8M/UoTSpE9+Bdsx5sdO5QPYKqKAUPhzut54LWmMf3UJEFEWOhviLbJbqJcU4QnGRP2N51ufOeE7aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY5JTfzYi42i7+CMrlPksLlcs3861tnoawbap8FCmwVWttfoUS
	CM2ylb3IyYGIXYMtnBg93bxPHOT1gKA18EjebcLnc8+hCzhC0oPRLO3Kw8l0V4r53s86ZIS6Bn7
	h+Z80UfFcRLZ1mNC71klpArNNIN4=
X-Google-Smtp-Source: AGHT+IFpyQag4WFuyK3Tmtf4D7nw0Mi0p5TYGkzcHuX6stOGq//NWWnhTZfxXk+Rcvlx/R1FXfSJAp6jNVXnIb4Mgxo=
X-Received: by 2002:a05:6a00:ace:b0:70b:705f:dda7 with SMTP id
 d2e1a72fcca58-71de243f079mr9947820b3a.4.1728396098124; Tue, 08 Oct 2024
 07:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001102839.77211fb8@canb.auug.org.au> <20241008095652.2247c731@canb.auug.org.au>
 <20241008-gastarbeiter-empfehlen-8226a842fbc7@brauner>
In-Reply-To: <20241008-gastarbeiter-empfehlen-8226a842fbc7@brauner>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Oct 2024 16:01:24 +0200
Message-ID: <CANiq72=MGrrAPfFymAS+M_svLQ84JeczDkc8B5wqtRGzEVpg7Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 rust-fixes tree
To: Christian Brauner <brauner@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 2:39=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> I rebased the rust bindings onto v6.12-rc2. So this conflict will go away=
.

We are moving `AlwaysRefCounted` in `rust-next`, and the new code in
your branch uses it, so `next-20241008` does not build.

I can add a temporary re-export that we can clean up later on our
side, or I can drop the move for another time (it is not a big deal),
or we can put your branch on top of / into `rust-next`.

Cheers,
Miguel

