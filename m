Return-Path: <linux-next+bounces-4745-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB69C4649
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 21:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13D4EB23E46
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 20:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C53D1586CF;
	Mon, 11 Nov 2024 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wr5CKacs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5D1AB513;
	Mon, 11 Nov 2024 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731355209; cv=none; b=iQb6vteZ/eMX26BkoOao7HZaREd4SP7JirqIQoCHhImDsnZEs6SrfJdYo6EfQGkOWxF3YyC8Ei9S7m6bjnC3bClP4fpgYKHr7vYmEA91z2GKcKDIvw3Ba6xzYxz0cpKomw0vm6kNPGGEzxW+g9MZRmMk0JKP3MhtI3Qfz9ik974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731355209; c=relaxed/simple;
	bh=WiOrNDG1WD7oZEY0fUAmYsOz30tIJ03LDcgV3v4oLu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUQ82H5d3UpyEgNiLk+dObKgfiIBi2cxw9TL2E8YTgNYA1eASjyU+nZzuyhqSga1SxlbTsiyUMg5O5AB8DzFiKHlzQxWEQF0g8s0hHFr/EY2jAXh7lULHOtuDjx3qCCKSOqPx5wAfF0PKnUtwvXwHV7MPNKn1c+aymU5fp5G+kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wr5CKacs; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2e31aacbbso612328a91.2;
        Mon, 11 Nov 2024 12:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731355207; x=1731960007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcFeO/WZBic4QahIcKveKriqrYB+4GqvXPKrBYwpRHM=;
        b=Wr5CKacsglQ4Y5FC1vqaNNpNUQL7YWUc7gmXL8cFpjncp+7Sb8sPulX2JlvOhgKAzQ
         l4Hy7ZO5DO+YkpOMCpebsfM1luVq53pRxUzsABwnwGc5kstcBZwq+MxcChHX4rdukymT
         j7Oozl2B+LrvxCJfybfP6PeyusdpWtv3iuzNEpvUQ+aiUygKdDNxbdBePrDT+mg/N1VS
         Jio7cs7KK5E5GXUdigu8KoS5WY8K3V+RK+zLPhTWtRq4zGZPB3wNhTmOoMqXFso56RC6
         XS7oQZJ2TIoYwi7SxTGibpSkZnqaR6XXtuEvv5fAsYgmaCpQjTUa0oEpW31pCnhClO4l
         mqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731355207; x=1731960007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcFeO/WZBic4QahIcKveKriqrYB+4GqvXPKrBYwpRHM=;
        b=gFvMHAomSkSnO2NTAWZMS3hHHtOZ9/6ZUsgKTG1AxJ3k6kBIosXR+ow3r46Bp0ZJWH
         vrf0hcKs+fbtJ+DuTlNtoI8qHR0RhPFFaoewOyTivl5qU8yK+bUV6lHcTFZgxhtHeAuy
         y/n+0BuoFigSXxF9SdiHWzDCe8Ce/zWBgiDYrs4OSkhmRYG4wbxUutk069UEPKTbCz5k
         0J0DWl0j9hT/tRTa4wIekl5puBiHFU6R85yhglKNSGswxAfyoavaFG9yZrX7u8Bd2B8i
         NoigJVL0OG3TSIg71Sr3V/ZlW5sLB42yy+SCSEI7wBVpZTV11H90qeRNl2hpFwDEJ7U9
         IxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/HvpSrkZB6zNIpEqhkzHkCepjQYovgVaaRaSa8XPWasvp1wD5YKt2xyLzJfGQ6B6Mf7ebgNu1zakt83JE8Lc=@vger.kernel.org, AJvYcCUV71rB6yFPd0PmomDhmj84tyDTRoi0D0iGXSMQeotCWhnrk2fUPIdNxJnszUY0d8BGBObx1gVy2hT7GVQhjyNellPc@vger.kernel.org, AJvYcCVX5YnTAylkDTUPKtLALD3LliSl0GOpK8im4er/gmQvcvDiKEIh3Mjd/U7GDXYIKf0BSoN2tTp3+94PpQ==@vger.kernel.org, AJvYcCVjxY1TFyv5uve69ajcPlbWheYwGVLMOboHXbZ9Pm9GEE/mzXpSTkoBk9IBz6i1Yo0AMuHYEPYKAfMxcJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzr8YWzkcAq16qssBBv8e63QXii6njdPm/P0s2H3Kb5XMjhMtF
	QuHzBWaUEKC1vU+tHUmFrpOHHUBp66aVoE8KUXR4DX+psFb623U+peBKO5uJhCEQFagsEQiGPqM
	ERpnLseZVH8wb6RbV2SWxUsTNvoI=
X-Google-Smtp-Source: AGHT+IHCla+3aT64d/PQpp3F34xwPPb0N3eP3FUnIcHUDvmJpi47dsbyQVEnutOGTkU/YrE5VMyCX4YDA0KOHFn+YwM=
X-Received: by 2002:a17:90b:4d0d:b0:2e2:9026:8bee with SMTP id
 98e67ed59e1d1-2e9b16aa2e8mr7616013a91.9.1731355207362; Mon, 11 Nov 2024
 12:00:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109165520.1461400-1-ojeda@kernel.org>
In-Reply-To: <20241109165520.1461400-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 11 Nov 2024 20:59:55 +0100
Message-ID: <CANiq72m_jUUo1ELwyn8qqXUDNxvCfPbv0NVRAxuAyjzU8o02ow@mail.gmail.com>
Subject: Re: [PATCH RESEND] samples: rust: fix `rust_print` build making it a
 combined module
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	patches@lists.linux.dev, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 5:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
>  obj-$(CONFIG_SAMPLE_RUST_MINIMAL)              +=3D rust_minimal.o
> -obj-$(CONFIG_SAMPLE_RUST_PRINT)                        +=3D rust_print.o=
 rust_print_events.o
> +obj-$(CONFIG_SAMPLE_RUST_PRINT)                        +=3D rust-print.o
> +
> +rust-print-y :=3D rust_print.o rust_print_events.o

Steven: if you have not applied this one yet (I think you didn't), I
think it would be best to rename the main source file instead of the
module name, since we already have users and a couple other places we
should rename.

I am sending v2 in case you can pick that one instead.

Cheers,
Miguel

