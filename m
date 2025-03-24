Return-Path: <linux-next+bounces-5987-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB88DA6E6B4
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 23:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D03D61896471
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 22:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF631EE7A8;
	Mon, 24 Mar 2025 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktLMQ/4B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58581DDC3E;
	Mon, 24 Mar 2025 22:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742855786; cv=none; b=O6VFznL67T4n3VCtbyLlFcnGX0XDXhhXJYv0m+UtOoiYABPQgGGmCRZOPajE8v7uhSNdl3Ii5hGjpY84N23b2jBr82umRt5upqZen6rrm5IvXI8u3KoKZWC6scIztb1qoCH5NTjvCvF2MDrAbYtR3aWehyKEj2sAs66aPvLn4G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742855786; c=relaxed/simple;
	bh=noLkjTOkKdGAQzY6kLH3v0T83S59RS3BZvbEAJQ1YUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKCpDkO205S7dw0zovcwXEcby1uwPcMAmSuwUm0woL+uVPav2tKKkjPhOzRJt6zYMRwliKknuTpH6cEWQN48dXO8Gl3c7kN6ufYHZUtrqGJcDAkmj0+saTXmxED/lwo84h/vZ90+DyGQzMWyPaPLqyq0H6joe0FLjRhwz/ZJtk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktLMQ/4B; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so1537893a91.0;
        Mon, 24 Mar 2025 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742855784; x=1743460584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMwpvpGSihFpcWPv7SrmbBBHPmwSxCgI9Bu4MhCTy9c=;
        b=ktLMQ/4B846dXEetzrZrJU8dxpn1W8ltIT/j0I/wmOokpe1mcjSiA+kp53Ju8h83lP
         zdXA38bQs5Pna9TklQrP/7/kpg8TrxTrzCOESsel6vYeN6wPGyHux5yNAFSHORKFtEQ6
         o+cgntWLlJKoyDu3NhO360ObH5nWz6ms+uhvaLIjFW/ZqsmdkrlUQSRgd/HehG3X02h+
         8W3VH1x2eM1HiBb6CQMCWn25NRIbimduKdNAUaagg1P5zVprcsrhnDIVZnSn7fPaFKOd
         8iT9C1c9JFu+7zYNWhp+F5lWjbQjUl3yvCMrKnH4OvamrVajPHZNShnWFxC7upSXCl7+
         re7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742855784; x=1743460584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMwpvpGSihFpcWPv7SrmbBBHPmwSxCgI9Bu4MhCTy9c=;
        b=v1IQB8lwen2dMzK28peMnPa5VFvsvHEVfV8mZF7FAoGEHTrCZRmSEC+BEgfJxudE2d
         B1Ulem/H49zOi9KkV6fjRykg8xy7kugJcc2bxt528hWuM9WP6xQ31Vg+YxXTjfI0ztid
         RptY9+oBoervoOq3kJa3I3TvfkhzjRLAmg1cIim6JLRWo/R6grmbtMLMfeiuzHKzGv1I
         ewTyv3Z43h4z/rfiSvTxFfrVz4ZYw0nmA+1121abHx7LXp1M7fbQcJkp28uYVtHO23Iy
         9/bS+SDrMuElVdfZxYucZiDc98U60pquQ+zVRNvKikARiQip2j3XWVKd2UqemvCbcUxs
         q25A==
X-Forwarded-Encrypted: i=1; AJvYcCUJexkVx2SS3zlzw0IfUPcApqrjYhU+IDe8ZZ1cN1uRsV9r7fyZt53MWEmjhKPC3Ataz6pgI7Obn9Wr2aomWFI=@vger.kernel.org, AJvYcCUwJSB3p4ZJxJHs5Fzha3OwBpsX5VIkuXWlOop5c3s3eYisLe5kWYWUNXxRc353pC9MhfJzL15YivyX1Q==@vger.kernel.org, AJvYcCW9fq/NvR07UEEAn6XgM7OSx29vaW2ZZxvBKO7n6a/uByakS/pVCGMdMqKlDnOLcsojEkx5Or6zm9bTL/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxspYYfXuIrdxwQZlBZf7RcyREpjO7gO9+BxnX4oiOhgwFqJoOg
	6vwAROiZ44zvNLoJyCe1/R7hfezyvEJP4uEgB2bdTOSjndmmthbhXczRJoDv1+jNdWN03/ea/cT
	BOVcpaZC4WJfJ4BaxQKkrqK+NeTA=
X-Gm-Gg: ASbGncsA93J2Ngb3ArvgCtNOQttmqWzR7wtq9Q5DkzsiWcuqw8XY2v95Af9af1DNPRI
	9rfFh+pc9KltjDRa/PocOa50xY2Ru2TKlf75CRMdITbfY/aF/Re8mNp3FXTqA6nCagjgQtYOvyv
	JVTx+n/Xek0a5nSAX95LhuM3oGlA==
X-Google-Smtp-Source: AGHT+IF/fJ/u4xiqCMQ2K1WXQtqCvrm0pQusiRTeRuSVmYcqrt8sQZo9BRnGZSEZ3hMjshFl7A1HNsUqnQTtmsQngSA=
X-Received: by 2002:a17:90b:1a8a:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-3030fe534e1mr7312291a91.1.1742855783991; Mon, 24 Mar 2025
 15:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324174048.1075597-1-ojeda@kernel.org>
In-Reply-To: <20250324174048.1075597-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 23:36:11 +0100
X-Gm-Features: AQ5f1JqI-eA9JFe0ePpg07tre0ZPyNqC1B9iegmOoeXkhSrZWtBSCl5eK_XXsWc
Message-ID: <CANiq72=4woD0Ri1OrLMb33O6+W5TuG07ga0+B275Jts_qYNeAg@mail.gmail.com>
Subject: Re: [PATCH] rust: dma: add `Send` implementation for `CoherentAllocation`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 6:41=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> Stephen found a future build failure in linux-next [1]:
>
>     error[E0277]: `*mut MyStruct` cannot be sent between threads safely
>       --> samples/rust/rust_dma.rs:47:22
>        |
>     47 | impl pci::Driver for DmaSampleDriver {
>        |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be s=
ent between threads safely
>
> It is caused by the interaction between commit 935e1d90bf6f ("rust: pci:
> require Send for Driver trait implementers") from the driver-core tree,
> which fixes a missing concurrency requirement, and commit 9901addae63b
> ("samples: rust: add Rust dma test sample driver") which adds a sample
> that does not satisfy that requirement.
>
> Add a `Send` implementation to `CoherentAllocation`, which allows the
> sample (and other future users) to satisfy it.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250324215702.1515ba92@canb.a=
uug.org.au/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Added number to Closes. Fix typo spotted by Boqun. - Miguel ]

Cheers,
Miguel

