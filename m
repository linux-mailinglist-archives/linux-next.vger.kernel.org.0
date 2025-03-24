Return-Path: <linux-next+bounces-5982-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85CA6E197
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F287F7A7E26
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0388F268FD7;
	Mon, 24 Mar 2025 17:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnjTW6lo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B122641FE;
	Mon, 24 Mar 2025 17:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742838250; cv=none; b=ovIqQi7PweNT9QnOHgy4dnihV+3HOySMQhu8PHGPUKaQ+CeUQp9Yzg3aSGgr6Qz4/pRoqR7Egf9myezLbWlJT+GT/jLzfpvJ5e19nwMK5Zh8nCPHOppr2YJa5ufOa4mEVNvzBlFTdk7KAzUGcoroHJarqAXP/5ryUBU+kBA0rgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742838250; c=relaxed/simple;
	bh=P/9XwcXsOVbKjjIK2Rpo++6HrgceuJ+gEbpX1cDqB18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIEbetx80x/IvYPRp1btq7AGMNXSaZAf5F/XC5u237Q6HSXhZUYNk/3vclvkexXeCAh8FPMEu5m7njZuObOgXDLAcrI8Mo2pYNjV5+mOCAEMajODSMRsJJdU7IJmYVUYUL9YTH7bY3789ajhkzGjyaI7hfHCwOlIUTwpY48TWac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnjTW6lo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227c7e4d5feso3214925ad.2;
        Mon, 24 Mar 2025 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742838248; x=1743443048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tr7fz1vFTN6V3l8Oj56sNPcrXIYTQ8WnJdNMz8DEkSI=;
        b=GnjTW6loFPfGbjIi2FRhMPLkBRNxbOPi2yfELgTLmnL0eL1iw63loekxfl8LiuUJfO
         csyJY9xwmVzmQqDxkqAlQd38rXnwNEGbkFtbrFyGbM8llYOu7fnqKW9V1nXqowL1GyGd
         qyx8upCZE3XorVJ2/eqCAhH2lmBe+1KXcKCOspGkfmI1WApaynNi2zVLs41oTO60OV2q
         FuU0NN6xVHhduOXbSZkunODgNZt4duRTi6Iun1hOP7/qTnjuQzkIIW3Tx3haTcH8N8Lk
         3GnPnxKICIu4Xqy5hbfZ1xdYGqE1Z4S9gCwLF148+yzqqyExycihAXQRwiDFOdrOgyL2
         1fFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742838248; x=1743443048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tr7fz1vFTN6V3l8Oj56sNPcrXIYTQ8WnJdNMz8DEkSI=;
        b=fAqAn/ukwAxU+ms8m331LcmheVEevjpI8Bpw2kjVnzIMSmGgyL8A8NTqmNZf0bQIu/
         Xtx+u+e6f5ufjOx0idyA5ndMi/Rs9rmHIg5E1pgc0UgbhD8UvEeIwGfU+Yr8FOzUCoY/
         rTNTVydcGtRKlk0LI+m9KwQm2IQKnqgD3/GqdwrWmGQEEdkw5cNbvWlgUvsmkMuNffAk
         CB3Tt03/12iW3Zq49a0+XXVt7f12Fqd9mDtwMGNg7NyuMgVPOLooOQTN+Ybyn+9rx2Gk
         iED24RgWuRj6gwmogvnno0X6UzzertC3EkjQFex2uH56oONJ9Aveoh9fuiU0CyVaADZG
         jnxg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Hc06OmpEKRR7QDOZWnXQ+Xo5YqxfAhYIT++D9N8HuSnLOG0SJyr1Zo9YHzsqONNyBbXnJ1sfBpDv6EM=@vger.kernel.org, AJvYcCV1kyKzp7pluegcWhYvYLDIEfO4A8vtin/xuHhL2nWa3dJTk5qRCmyKMRHV8zRS2OAQuYsdBZiDVVJeRA==@vger.kernel.org, AJvYcCWhZuCtcfF0ELxaKAO1TiDSc9k1nfJnanHbq9S3u4Rmz62R1aoWGrhFXq2S4hx7FitF/Lg6fCNwiAtmZSSGjdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF12CHVIgfdrynkqSzP/yfGRnGcxER9wZckIbknu8Lj+phfF3T
	2aerHdujNmeK5kFKYZpYTsr6ls0b3t9YyRhbNnbsOBM47PYNIRMvwMPblFyKlpBDQ99R82Hy8m+
	fiKYXUQVIzNkrEjH+oW0vxFUXc+A=
X-Gm-Gg: ASbGncuKTOYFkDgRo4UnMOa9/UyrwTZ/JIwOy+E+1VxSEnTbRu5uQBSQqFt+mPZO7Py
	gh1kMu+BaEy/gWAXfO6pqmsBm+vMSwohLqTUV3lWsBbgcwW4311U2740H68dtUP024Wjix+tOjM
	nh4Lge6TVxdUmn+4GkkDHpLQK4C0nHIKV1vs1x
X-Google-Smtp-Source: AGHT+IHYp9P9Hd3H4WMAsbHt6gCS/M91bXqwUYnS4WNJN4VZ7p6l1yhJAh3NdyRbzI1+vwpRSq5rBe1g++hktt0Og2E=
X-Received: by 2002:a17:902:ce90:b0:224:10a2:cad1 with SMTP id
 d9443c01a7336-227913b859fmr49736135ad.10.1742838248360; Mon, 24 Mar 2025
 10:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324174048.1075597-1-ojeda@kernel.org>
In-Reply-To: <20250324174048.1075597-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 18:43:56 +0100
X-Gm-Features: AQ5f1JoAdDo2FferEGh4NhTQm25Yv727k5xcAQZM5n2ArJ6hFCIees06wSeNwIE
Message-ID: <CANiq72n-eP=gkfjLRA+F56WqaQwRZE2B0x4G9eF3W_U5eGxBbg@mail.gmail.com>
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

If nobody shouts in the next few hours, I will apply it to `rust-next`
to clean the build failure for tomorrow's linux-next.

Abdiel: if you can give an Acked-by, that would be great.

Thanks!

Cheers,
Miguel

