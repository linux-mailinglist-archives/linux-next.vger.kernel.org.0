Return-Path: <linux-next+bounces-5143-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B160A08DAC
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 11:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71D5A3A1712
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA031CDFD4;
	Fri, 10 Jan 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEJkdz7K"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535821C3C04;
	Fri, 10 Jan 2025 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504189; cv=none; b=eCxumIUVMt/TjPv2G4uH4F/BynnyiThUzWrrtxPZkDNDwtDscS1bUN5d3vdmRz7O7c+jCgbFtAdnlPpu1hxBBG5976KkK3mbrI52u03j5WZSXNEWyIqktFuPibeEjtFM7PYfboLlr/sot+aQHvzM3SLjLNDpkNjpux8r3IpYUnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504189; c=relaxed/simple;
	bh=85XiLVzULcd/deKx3lMYm3h7pbQmtHq3dT2MgQkyHIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOBfY/RhCjsqfBxwDLmLaSTBxDKdbwSzR3h125GsAe9KFjOw6sb3OVbUnmlnuYs6D1orGnQJFg2hvBHyEvC4z2MzVkdxg2Pi/3S9t6gjbHve+PSB5YHxLqKvR6ujAA+rz0zKjgBPxt2XbYasiBe4ozK1oIMM3TLm8SqtPhGqsU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEJkdz7K; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2162699e0ccso3178135ad.0;
        Fri, 10 Jan 2025 02:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736504186; x=1737108986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pageJVsBx97TB0CxdVIhRFzZ8X1GxECNtCRlQlHLdvg=;
        b=JEJkdz7KvUsLmyYR/pjK1OqqN2wjMIXdBiqGGJgh2oDU6uAn1vcZBGBNLTpw3nUdxF
         TDcnLvNYM8HndSgS7XacHZYDoMwuMYGCtaj5ACkQ17FldTKpcY7kBm4ZQDh6zqEFLBWO
         UqOwr0Ewd5twmqxR73HC4SDsGc9MnnmYYh5ltkUCyXSI9o1tJqZc7KeN2BaEClEx+MSl
         fSp+C9DdZXNSvNPNDgMXkypKcH4wwfM1Mo6nLhSl5+89EoH4HvPlL5EsuQdAqWta2jGm
         CFQNc1FMxqzDTCm3jPwP/W8fFqKzOz8Ln5DGA8EX0Qslr0r4ItOHSNekWOHhV3kcdW9u
         LYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504186; x=1737108986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pageJVsBx97TB0CxdVIhRFzZ8X1GxECNtCRlQlHLdvg=;
        b=XbFs0hP4wiVCw9CqWQgaRXe5+v2O0MKDmKI7OAv4X7WO8+FjSKXFJPDsdQ+yVWxVQl
         rNRbKIMs492WwBQycsLRMAYLmdkconzMMZbtQuC/T09tKUdcBhQt3PZH6noDZaatWo5s
         UC3M5O7W0iUNjI/uAElav7xzbAXtyfxUExY0cLEKNCg2n1wAK5cueIA5EeY/GgsNqaYL
         QlnwqvZtsM/uw/39m3/ojAP50O8sRdSBYjsKutEfM966e82R5zsPiwAn1Fa3/lR86/rE
         q13H7M+NSSZQ4bn0MzPVpWdMtwojH+EQ4TTcaEk/6cbyhsuLl3vIokS2MrM5Cj8XLHBy
         0U+A==
X-Forwarded-Encrypted: i=1; AJvYcCUb5d6IsAcc7F9oTPu4gylKlvp19Ii/CR7MaucUXxcUDlmOMWwEJSf/QOBOqsi0iKtideenjfu1/XAN6Q==@vger.kernel.org, AJvYcCVArsdaZJjgYxmLliGpULwybm8opRx0F8wB/hZmScYLWEOlzf7gqlpID5+2qonRtMjGrt6p4wcnukMVtxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLCQfISG6DqlnzgdoE+9bjmE44js7ZkjG3rJUb7XIqOjW3RHKz
	nmhVCA0wJKpkBlbQt9Q3K/Q3wsde4TxJd8ichft/JYLAIXDieeWMpVUmWxspWoVrFnNHfqGmMsM
	HDXoSZElcEiznXglRFHmpPJtERZE=
X-Gm-Gg: ASbGncsdrj4mBa5GTUH6HaGpKyLM1fEYxugbEcVeLqn5Vg5teGz/PODi2OxQBkqbUlK
	lJePELi2mwiq9NpUAAREP9rlKymEKL/S8ibwjnQ==
X-Google-Smtp-Source: AGHT+IEHDEn02X33hYEh7nEKKAGNOrlpsvFwOBKZz3UbnpQ2byEKWPz7syUxH+QBejZmEsSv0TGtlxhyA3X82HdXSGw=
X-Received: by 2002:a17:902:d48d:b0:215:b74c:d7a7 with SMTP id
 d9443c01a7336-21a83f76c71mr54046835ad.9.1736504186411; Fri, 10 Jan 2025
 02:16:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110162828.38614c1b@canb.auug.org.au> <CAH5fLggV5QC53u9xypFga4yheem+7vO=fNqLE47zRj=t_H8eYg@mail.gmail.com>
 <2025011024-clean-refold-b170@gregkh>
In-Reply-To: <2025011024-clean-refold-b170@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 11:16:14 +0100
X-Gm-Features: AbW1kvbFgJp_9hnEd0srdKatsqA81zVfGuhqywlWB2iIbIjvNtmho6OHHOlR7Dw
Message-ID: <CANiq72=zO_Grb-eX6SYxPrQszksgfe8Lfg35Ee49kFgBVFWRvA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 10:34=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Can I take this as a real patch for my tree?  Or is this only an issue
> due to the trees being merged?

The issue appears when the trees are merged, i.e. the code is on its
own OK, though it is also true the code should be using the function
but the macro (even if both work), so you could take the patch as an
independent cleanup to the tree, I guess. In that case, I would clean
the 3 cases (i.e. adding `!` but not removing `kernel::`).

I can also drop a couple bits in `rust-next` and do the cleanup early
next cycle.

Context:

    15f2f9313a39 ("rust: use the `build_error!` macro, not the hidden funct=
ion")
    614724e780f5 ("rust: kernel: move `build_error` hidden function to
prevent mistakes")

Thanks!

Cheers,
Miguel

