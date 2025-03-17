Return-Path: <linux-next+bounces-5833-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 326AFA65E12
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 20:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3705119A06E9
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 19:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7211E832F;
	Mon, 17 Mar 2025 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+74I7Q+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985C1C6FF7;
	Mon, 17 Mar 2025 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742240180; cv=none; b=t6L5oWopoCOthKiSlm8bE/RIwVGzDGE1166xMb2tfft0MvCOS2HxsC63512qQdMyIJ3B5O5mg5hUe0/Qg5cs/IMhZgmI5N/tphb2lSSGj4YIGrm+VE5Qjmu0hn2zoOdxizrN0bLkvtpzy4l6ztUFD+UoXffP3sLs9IJHtXoCaKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742240180; c=relaxed/simple;
	bh=v2obfj0ofi0vwoYVPDInvXxBDJFh8tTH93J22JPam7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cC7ND1GP4maLyEAOFkGhXjWYglS71X4hRWoUhOKZkaNA91YL1XQyPZ9VIZgYA6S/FhTgH9SFOwUSi9RIFvNi9kk6gbEI4qTdX2Jkr1ubAlzwrNgsETFYQwgsZLuDhjgKkeax2gSQHPEYainGUdVt2jap6eahaQtq4OsD95HQl28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+74I7Q+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301317939a0so602089a91.2;
        Mon, 17 Mar 2025 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742240178; x=1742844978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXo+v6jnA1X+4Tld4PMTFXnewHJ2jJrP+UR2zXBqFlY=;
        b=f+74I7Q+gSJ9M0Mv02WDAP0a6CzGx5YKiWvaRUtmG1A8J0faz2rBNSC6HCRHKTxjHU
         X7P3Ya0kMhnRBxQPOUYFDskN4jyeOoxg8m3zXAI9bO7CDi9hr9mFp/RG35spCFnvpoTN
         D3Xh3goMvS9zGUnqSON8bW79r+pPbUpQFY1D0euuhqKO39/k+NbgBNim3NRsBjMZztHz
         Y0vPMIXa7T4hcY+DMzZzAIIJVh6J6iyMqY1HR4wqlbTPpuPqFgNaDBN+J+LfiWSsWbod
         x1UfIWzGeLhQftsU39JI0r6bY22zivajFC3CneK6A2LNmQ+GrYltj9tVAU5IrYMt+R4d
         ckDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742240178; x=1742844978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXo+v6jnA1X+4Tld4PMTFXnewHJ2jJrP+UR2zXBqFlY=;
        b=er23EXI1+HaaNeYhiKjL1DTjrBUQj/QDVH4zmQdzj94sYcY1L1ibI1YnxY4kRubYXR
         RkJsPb9ow4nAFULoGX4t7l6SUszSPz7Zm3yim029KWl2YG3/cckEwGuwTO6vKEyYvxoS
         lNMyxM9Wo0ptidzW3x+eqbrppjntRH6dDwxPsuRaiW7aDSQ6UopGPrnquLl47RD7nUVZ
         nxulrNMlf0sqqoV9ZPzB4/m6xUwm94letV6MIk6KZHrXmFdZtn5oAuYeMnOjVZAXD5QS
         2pL8yVKPXAJ5GKnoJdr+ukX0o0Q4VVpUxNUfaDxyvaZuwFWM8pAprBxV7VDPzKAlMM0Z
         VZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCWWLg4Uke+S8OKQbpX+Hxu9iMh1yva+AGF4gSfTtf9lNaSZQTjORyRy4JvqM16QrXmxIn2PwF9Zt8eCMyI=@vger.kernel.org, AJvYcCXcFmxIgE91PlXAbW6OD0pLJ2zhv4ObjCx6+FAgrVtYWbVtQaj33HdkjHKkrhJ/K89iNrTPo7GcMwY0vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnzIbxP6fEoykrZ1Linj8A4Y2prZN5oIn1kYeF0BBhpI1FDqKR
	oX7CQbJ8zcZ0VogzpUk+PUkLLDemdeJZQ0aFZllDaxbwijJsfLdv0snQgcU2K9S495TfG0khq3B
	4TuKKarrY05MmvmPgeiQ9VubLaRn6i+4K
X-Gm-Gg: ASbGncsJSYwll8mDSe2iw77sxU/sTAXko781M+VDPlXCZXkAHbCsDok2XoAozLH1bP7
	PQiw3K+NKbgCYGykZnWBIWJhGjY2vqoIr0jeTzLh2xMirV/Qn4rdRPA26tViRGchMivpTPoNuXP
	DORLys4vQ02qmo7DQiNwq7/D+hcQ==
X-Google-Smtp-Source: AGHT+IHvr9McC0p5Ht5bhftBl/m9Wn1Anb3wmjCUI3LLldyU72BYFGcNj9dUvgbL4At+MJ+SH72exn99sy1AivNNgoQ=
X-Received: by 2002:a17:90b:1c0e:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30151ad6199mr6661114a91.0.1742240178120; Mon, 17 Mar 2025
 12:36:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317203806.63d4bc95@canb.auug.org.au>
In-Reply-To: <20250317203806.63d4bc95@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Mar 2025 20:36:04 +0100
X-Gm-Features: AQ5f1JoddkkFR097TIAyL2vRgRGggUuI1QJOHyLoxt4Xt4sDtlOIdzl3VU8NHdg
Message-ID: <CANiq72=5jp-KMmX0jUhaR6G2emVV_w1=onGZamDW0ZRRDM8ipw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Benno Lossin <benno.lossin@proton.me>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 10:38=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/Makefile
>
> between commit:
>
>   e3de46f775ec ("rust: kbuild: skip `--remap-path-prefix` for `rustdoc`")
>
> from the kbuild tree and commit:
>
>   d7659acca7a3 ("rust: add pin-init crate build infrastructure")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks!

Cheers,
Miguel

