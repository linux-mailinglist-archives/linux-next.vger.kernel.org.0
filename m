Return-Path: <linux-next+bounces-7056-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98855ACDC10
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 12:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65AA1173215
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 10:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7820F27FB21;
	Wed,  4 Jun 2025 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jr3JM1rh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF67262F;
	Wed,  4 Jun 2025 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749033997; cv=none; b=pwqpksdfIcWOgc02b1vMDFPhw8uAJsD5eGysq/PJEnicJHfXAwQp6Z3Fq6ohPprF+169la0/01abpmEaNXstywBKurjO9RJScCO4zGo6WSIz7HscizDBFYXVfpZGafT3msK0KpI2x6WRoh2ScqBHkzJjLsxN23r4cCYClYHwJGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749033997; c=relaxed/simple;
	bh=Epv5mheAzkoXZsYIyltaMAeCUL6h42koA1fBsB2ZV/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvM8Mg1mHsAM3q/HgwIWd60d67VQo04lXhB32ZuREMh2w2YXlvo4ypW10IpiWB8sTeTFLbt9p8dqNOca0IjV4Y80zBqW458X82FsMAt6zxXuLPGrMeDcAjAWnCBCfGaEZpzM1YRmG8NUUa6pHud4juTmQC1lavnkn6tJuwbQlvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jr3JM1rh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311f6be42f1so1191725a91.0;
        Wed, 04 Jun 2025 03:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749033995; x=1749638795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZkMdZcPLkgpesLYoSGyu8by6g0yo2x1DeouPMHzhTM=;
        b=Jr3JM1rh7uvPSMYVJOgLn+BUsQm61rsyrLdRm3xKdtChICX7mleF/DmEg4I/iDMzmq
         /P4VaZZk46YlEe2+ShzRlDeTdOdO1EfRy+qr0ZAEwyKNQ93ka79U+ugSfBjEVCBPc7PB
         lxUajAbEm1l/EGUtbX52J7mQXF7ceiE1Wmwp87uDDp4NCQYmq4+AsQW477KdsZOnqEWU
         bdUkLxEVukZOgm2QTGkud2HV37eMtgOZtXhtqoISYStADV3WSd9Rbpo/Yu/BiDAYgt2p
         4t3P4iLAkPHUTk2zEDR1n3xkamqWQFUeN5MZtJLWQVuc8ifjbA9wuCdN5jmZuT4WdRkm
         5hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749033995; x=1749638795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZkMdZcPLkgpesLYoSGyu8by6g0yo2x1DeouPMHzhTM=;
        b=oZMGkwDvWfqEzm/+fmi20ziqbaZQ72xnGeIXMBNTnY75OhQGGi3XSIut0axbu5v5wB
         ShFKg8FBs3GkfWyFbPrSFbsG6O3iAP6kJoL0PibA5PBVdFN07AF6TvySino+0mbb2CTe
         BiL+AgcbbGcMJ8PaZbdgocfd4Bs6UbI46LF6WvuBGwNDVwdVN7Eg6oYuzSwhorViSAdP
         K7k0bnN7TdvyfKA5+12G0pmQ9biQF88IEBb2SPy4vVJcYMvkiJjxGXxzON6HCzxPcemm
         crRX4Bs1v2kV5TtG/gB3SdizBQ2DMCaIkfcT3JgjM330TOg86T7NNeO3QyJIXb3E6S/z
         R6Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWJvywZqRdfkqATzojgD+mSfjsyqmGSWFqIJ30o0mJ/OBZFvxYLlYmlIV7Ez8qbLn8rgMu8iyhai8pkrc6rOBs=@vger.kernel.org, AJvYcCXmyVG03kMLhtJJCDV49Dykk+3DjT0UcuqYxXExqQEiBfjUMcH2DjtlUufMlBR0wRqpDlntBuGnY9C3@vger.kernel.org
X-Gm-Message-State: AOJu0YzhjX67/RVtITPKkJcsYHt+VDofero99EHxzTvmFczWwwgBsRnF
	6n+ZB3nqnm+I4NI1m3s+po91sXgoXKa23fZPMfiqZWGuHgZWkfMGH0hg8XvUs8yfs/yMjFvZDTB
	D8ZeVNVLWgWuKgU0/gfmFwEmQxYFec0o=
X-Gm-Gg: ASbGncuYmpCWjldHr90Z1IG1VMhK1W4z1r+Gs1BJl2B80tTiFIow2mzs1y22G1gRHuP
	pjddodHXIWO9xq262Ieto6kZzPrlAQsX31ET+Z7G02XVyLGIxFiT1MGUBbBCYzPCsg8+Yke0KOI
	G3EZW9AYLKFizhV0EjfEh1ToEXY6Ifmp6k
X-Google-Smtp-Source: AGHT+IGNTKbmWxJj58p+j9OqUbP+KdcPfi3ogpgUnwFvWYVS0MsDXgTq9fUjK9ub9rEssL91xGAhBa49+UKQcxA0aMM=
X-Received: by 2002:a17:90b:4f8d:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-3130cd6d852mr1421896a91.6.1749033995206; Wed, 04 Jun 2025
 03:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
 <CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com>
 <f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info> <CANiq72=+qUNJu5j+uoveMrTbngwA89+ScwjUPd9OyVGqps54aw@mail.gmail.com>
 <20250604073118.4205f303@canb.auug.org.au>
In-Reply-To: <20250604073118.4205f303@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 12:46:22 +0200
X-Gm-Features: AX0GCFt_aMFHy55zt8zB_FnAa4ypToTjhayKmPmGVsXSI4Wl9tvd7Ee8ChK3pqU
Message-ID: <CANiq72kghKg7FU=W_yO_q9VuCf=smiyzvrcU8oOFG2FFFsOQiA@mail.gmail.com>
Subject: Re: REGRESSION: armv7 build mismatched types
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Rudraksha Gupta <guptarud@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:32=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Damn!  I knew I would forget.  Sorry about that, it will be applied
> today.

Looks good to me today, thanks!

Rudraksha/Thorsten: the error should be gone from your builds now.

Cheers,
Miguel

