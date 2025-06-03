Return-Path: <linux-next+bounces-7024-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B2ACC747
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 15:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD5D16433F
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 13:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E7422ACEF;
	Tue,  3 Jun 2025 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOxqjpku"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706F612B73;
	Tue,  3 Jun 2025 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955856; cv=none; b=jOkJ4J0cXeppQM3Uscrx0J+gfAhQKpIbXUuZyDb/PesV+ObaW1nfRA+wX0B6bY7nqzg9PrZr9Ug49dYUgU+8CZmHY7XqLr4cg+K5qp8AAgLd6yPgPgVSTZvswlVpqfvkjASQzZ54q4sjamlTgkXNLQWXZk4isH6wjlJnt4E1TjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955856; c=relaxed/simple;
	bh=Dricr+w/L9wB17nGicPZZQEshdkqpaGFOdOzgyB7jtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbItLM/UZdl4+r9TmKlVqb7+WAyn4yz1/13lfDcCQ7A5xBTNf231eJFXMvI1gfC/yeXVmNHDFbZZZwgYextU5K7ly0e0Nxs3Lo1Luky5DjqZNdI5va4dlmtBxmcY6858n5BBpaBpiFQLlPs6dNHgnxn8/txh7QuZY3+VvaIgdTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOxqjpku; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31306794b30so753a91.2;
        Tue, 03 Jun 2025 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748955855; x=1749560655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dricr+w/L9wB17nGicPZZQEshdkqpaGFOdOzgyB7jtU=;
        b=bOxqjpkuFrCkTt+/FopdaTHeXjky3z2HTQIMsu5WGzWBtT3S6YNMKtsAMpvxEIyIpD
         OS+SP0WkNDgoXDqJpwfPwB/nap575glU89ZvTJzXFPPlqJl/5Ow3ASem54WWQgdwStyf
         AsyA+BaucT0RkD61tZa+5Q4OTjA3pngfS1IauqN/ajNn5cqPgL89xr2ZY9v9OW7PWCcc
         fLXXuiTIFB/JOr2v+PREHZtQSuqdUOehnVVIjkycFwqnfIVOKXFqh5O383mtqCy0+0zM
         IZSV4zs3xS86DeW3UvQjZbq5Loj+6/LQdCRT25loq90wJ9IRU8T/hb0LGV7ws9Fhs2AC
         KFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748955855; x=1749560655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dricr+w/L9wB17nGicPZZQEshdkqpaGFOdOzgyB7jtU=;
        b=fFiDTRXR3nG4r5hIm1Y1eXyk4WLWNoLBH41wsFgaPQ8Eq1mcB8cFEBNZVnZONyx3cA
         fJLdTxvnkUblHreFaaB+JxmDPGtPPFpiUsrkD+e8jUloxmQfbhmHq6KwekpEtppfWHEN
         2JWxJeoqBMFFml6lvuTYJHiC6wo047LWHvHW43eeSRN/w1IDdKiKrq3GvSbnQT0rR28t
         CvZcdE0YLN0FqfLeGwdoOqNOjp56slR10i2gCW7mRAb1lMKd7aXqZixMw4JwFwxV1LuJ
         H+xsuZ6wqhW6aZg2/6visXi+gYqX8kKJymedJ8EohRBLO33Hnp430iAqRWGQothOlUZM
         s9/A==
X-Forwarded-Encrypted: i=1; AJvYcCW7xoy2SiCb+p+2zq+Rjx0AN4lfpmzkwdWLosX3dJGkCc7H1MqhZ0tBgABrcQ4e5dUWfiJNgeRC2aB+@vger.kernel.org, AJvYcCXplFKgmkryU11kEqDAXw8IoPWLkIrEVdlA30FQ/+aYu4bvQqntM0fL+4vWFL6SxGcIoDWTv01tW47VfRxjTNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwU4XBRc3hR48lqSzRXR5duTN+J98QRWMITLfp7Wz0OZh10SUn
	HZUMwy8RjTmhzHCg0qArMbMf2vr3E9EcrhVTo9wFDyAcEtuAsw9RXICVTSND0sZHWuKJSBQ8FTl
	vcGsqqICkT+PqNyTCJt4w2CO3YdNanys=
X-Gm-Gg: ASbGncumGkAff4SVDN7aE+EMIhqgcHzoYtylit/u1ruE9UXY2te6wJRm4e3DbSIKGCi
	/oGjUuuWfZ/vCsEYFon85fuLM7W/vXOWgTkjvxqapHqxPFZymAVmh+vhZ/UT9SQi2t8ruvRxlD7
	GyI9FTTLY8g8JZUUF0NHlk1XM2ziB8mdlca73yXxBg9A==
X-Google-Smtp-Source: AGHT+IHZuxjBASZzmcDbKtbKMKwND8EBhwgefoY/g6fQjw8zmCJ40rK69VbfhFbhfFrS77nV3NseKq6ain69S/GuEbc=
X-Received: by 2002:a17:90b:250b:b0:312:e76f:520f with SMTP id
 98e67ed59e1d1-312e76f5260mr1035611a91.8.1748955854470; Tue, 03 Jun 2025
 06:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
 <CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com> <f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info>
In-Reply-To: <f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Jun 2025 15:04:02 +0200
X-Gm-Features: AX0GCFs7VQgBRbPSLVv4A4_rBaiT9g1Fb3Qcf6rhz410nhP4a-xSELk381kh9nw
Message-ID: <CANiq72=+qUNJu5j+uoveMrTbngwA89+ScwjUPd9OyVGqps54aw@mail.gmail.com>
Subject: Re: REGRESSION: armv7 build mismatched types
To: Thorsten Leemhuis <linux@leemhuis.info>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 2:51=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> Or is this heading towards mainline really soon now anyway?

The Rust PR is, but it would be nice to have the fix in -next before
sending the PR (I will give Linus a test merge anyway, but it is nice
to know everything is OK in -next too, and to have another reference
point for Linus).

> Thx, it fixed things for me.

Thanks for checking!

Cheers,
Miguel

