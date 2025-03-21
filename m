Return-Path: <linux-next+bounces-5934-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90CAA6C4AA
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 21:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CE367A2177
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 20:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3304622FE13;
	Fri, 21 Mar 2025 20:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cgxp1b5H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B201513C695;
	Fri, 21 Mar 2025 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742590508; cv=none; b=YPQKhbI9pNLHmKOZMOKNXMjC4CQwdSrh+FGM6zUb55PXzXk3OZSFIbHA4TdoKs5ZM5zokSkPXUqVcl5TV8CzfJlv4nvjWs8nmHJBn3eDSmRI/cTQn4sjXOkMrmT4MZricGwr/AIzzE5BjMCRjilw1n3gwfsF+SpGHor5mJqgqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742590508; c=relaxed/simple;
	bh=MVawJ+uRuf5qJyFi5lAM7ITVcCh8q7Tko+q2Mk4Nb+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtUhC4R79qHYA6dryoBJwdBU/vwAH5NNEUfF+HddhQxzQMf6p8LMdKDSNSLzT9uh0GGJbeYXKeR2jkFFp3zClVxAys6+TSFbZZHqUUg38z935gAdq0l7vyHJZI/IugHkubU0MN2XaWkGuBb7cS5QGdOB6zeJzP1ZcDtfn6UM/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cgxp1b5H; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so645106a91.0;
        Fri, 21 Mar 2025 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742590505; x=1743195305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A92tVAeSYZBweGivFYxCcNKXj/GHAJth/Pmm7NFfrYc=;
        b=Cgxp1b5HYqE173QGX1j3Iq8K/706RmvyZVYuXLPrUTiPTh5Xlvhifqjfq295KWw55Z
         C/2New2VAyDbr5CWtn+qR+KvRBKdTzJ/lnFbeDaYorYpFic/ZfJ+QQYM1nAp+SREtqEa
         rIsD4629ktZU+bmo9YzYublbtuFZIWeFW67k9OKPQufvfRo7cDuJHrwpll0fZFat55dd
         muvJ+hr8uresYYB49r61Vaz2m3lKaXc4TWh6w95nBdVinyj3mY/eDyudos0Je+4f3w0H
         xWiJrI6CghMtY7M55OYBKve/A2ndJSzamenQlebxRGYNFDDYqp8f6zpdyf0226zd9WkQ
         +6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742590505; x=1743195305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A92tVAeSYZBweGivFYxCcNKXj/GHAJth/Pmm7NFfrYc=;
        b=MwNeHXQGY2cddUBc4SPHbHlM6j4MnK34MdWTptwyn5dJSBmoPZQT6XBhnsIxmPGxrE
         s5kBwvljGYM1CM7x3wsd4TmREALY38MaNwU8PpAVUMBLd7xLxSEyMBNVhbrejTvr8KO7
         mqBMV6l3Mq50twiLh6YZItUVok7qFxjHDf+VdWDMhecvW2/u9kPT5qxEgGm3VeHF+RYT
         HjyLUatLmzHZvrBnxLtyLG0eLheF/8zBjNpGjIT3JxovO4IiPD/wTz+X2FOWTz4PD4qX
         G5gShQLnAotOuSrUg5eMhkLoS2RBSVBWGu0gfnXdd+uJE4OUN3Tq7no5kvx4Rf9E/S1J
         07FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5YOivDg8LpJqva2izPewS40t/GNoV111IqGGr20wirYr6D97LhUERh3ILThqUJVFloMvjSzLGtxkY5Q==@vger.kernel.org, AJvYcCXAz30Liug/Bjoyk7enAKnq0LmjLtl5sIEFvGYjuCT7Fq+K3rrfF0SpSB8oLwIfAa7KwE1vIDAZu5E/ORU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB4ry6cp6S3bBINeNIjUVD8JWr7c13LUJeUR7o4TlEjCJ3d+36
	hhxmVn61e2DFSBNOuvEcrxbtXxodKSVelfhIUgMDEZn8Bbs1vSgHTQYrlsl2wyNZNF4rjYx0MYi
	iOAu10UcGHaMSukSodITJemtJgt4=
X-Gm-Gg: ASbGncuao1zEfymRj2NKjVCRGfnIfnG1AfmclaP0V9PQv636KKQTpq2Q1HvCswl1iP7
	Noav317T1ddUSC/WXf4Vugqu+AJWYIUIVzDo1uOvgSJCzBlg1tH0q3BHiDJsF972Z7W+qnXy5gc
	XxPjhRwdBsdHvqlrP8fAGic/78eA==
X-Google-Smtp-Source: AGHT+IF72bezPVTt+Bwr+E5Kw+h8sXNz8ywq21FjjEMo2IOeV33umLOwEl8IQcCzNZYC8pQga0VB/BbY4VQSWZYvlCo=
X-Received: by 2002:a17:90b:1b0a:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-3030fedf3e5mr2544199a91.3.1742590504899; Fri, 21 Mar 2025
 13:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321185630.566dc075@canb.auug.org.au>
In-Reply-To: <20250321185630.566dc075@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Mar 2025 21:54:51 +0100
X-Gm-Features: AQ5f1JpLxFtrBj1igOP5SIzY8-Fl-cncCY913l3brOXrQqIuFHUW_pW6F9SgpvY
Message-ID: <CANiq72n_W50ZeS7xpiH7OL1DMUy4Z5FM2Kwjui_z2aiuJh9+BA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 8:56=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the rust tree got a semantic conflict in:
>
>   samples/rust/rust_dma.rs
>
> between commit:
>
>   7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")
>
> from the driver-core tree and commit:
>
>   9901addae63b ("samples: rust: add Rust dma test sample driver")
>
> from the rust tree.
>
> I fixed it up (I applied the following supplied resolution, thanks Danilo=
)
> and can carry the fix as necessary. This is now fixed as far as linux-nex=
t
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Looks like it worked from my test builds, thanks!

Cheers,
Miguel

