Return-Path: <linux-next+bounces-3617-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F2496D944
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 14:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28BF1F292C9
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 12:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FB119B589;
	Thu,  5 Sep 2024 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jNaHdmYY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498DF19B580;
	Thu,  5 Sep 2024 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540438; cv=none; b=Kx6X0br3L/BhytMq9gJobl6NB0mrJX2T5oiPJycuQn5AAqT2HDvLUR+Qk7OMtFp0wPpMkVa8AipzNT9dDGTftwbXnw+l5goi6x4bdapvpml9jpoL6D11kwOAGgpbmTxNxEIsLHdB51G5Y7FqMe21lOlkJRkjSwNN7U+KFCxT9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540438; c=relaxed/simple;
	bh=EmNn1r+T1ToHy931TqpKF2f2qNCheHl9z56eCtNf19A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eaud2Ep/1amdLF1BGVlrZZYJdXS4s0q97OHUKO6za96WQUgJBZoSfJXrtaLGG9+MuVlahD653n+UZ0lSxwKqwCJ7oPKm05PoUgcoli0Ut6vqIVD840ryu5HfQiQzztuxt+15lmm0BIqY1v/JrjSS5NntKU6I1RDPx21dP7+EXJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=jNaHdmYY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DA7C4CEC4;
	Thu,  5 Sep 2024 12:47:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="jNaHdmYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725540435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eea8uZWcK14Y782vcsUjrLDlKpqXHZEblzng+z0F6m0=;
	b=jNaHdmYY7pj6bv6v2jVSEKZ64O9l5N0QmQv9L0eWV7eW9x45xdNzY5gJ969NTumgRcO9un
	c5cSJrunGAZ86Oe7c83uvo5kUlAPGuEgbmR3HTqXj8BoqxVULq5XxUNJqeLl4LGo9w6RBy
	9CMHbW6O0WA848XXshAJgWJmHUxa7BM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 922dfb3a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 12:47:14 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-278279a3a39so480575fac.0;
        Thu, 05 Sep 2024 05:47:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhiia0WvjoA0bXhtNr4uz4oYbP/fSAxHn8G70fxA37M6RAdA1Sf6waVQVFMMvIGa6OUtC8yQ1Y3WJP4zs=@vger.kernel.org, AJvYcCXjqFc2B78tVTscFKJHi/vOe7zZWEaqQh1SrmwVKxFkDApZAmjBr1QyZMIXB79cYl6Fwfi9GTgKhDiNtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtfePlxfaFHHYLmuwdf+uzYCT8NYjSvXPIGipTuqagIl0XGvU+
	SJCW8UajWHn1wBtSrHK0M16TnarLr1rbwtHc76rtWMnRUxnuaKzbhSozOt0cZkRBieCnjxReTU4
	rqaE12kjeczKza+w9ondVqZjK99E=
X-Google-Smtp-Source: AGHT+IG3KQMHUKU9zNSxnJ1WEZYpsuuplYJbYfPwX6sX3iYl/Q1rKAuLiwjTxnnupJSIoghnFTakLWYM7VfO/OsXxEc=
X-Received: by 2002:a05:6870:a70b:b0:277:e493:d7dc with SMTP id
 586e51a60fabf-2781a7e2181mr10141274fac.23.1725540433734; Thu, 05 Sep 2024
 05:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905201930.417e7596@canb.auug.org.au>
In-Reply-To: <20240905201930.417e7596@canb.auug.org.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Sep 2024 14:47:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9pm6OHUcwptTLYK9yU18uYYTMDx6rnN4fXty8xD=fOgFQ@mail.gmail.com>
Message-ID: <CAHmME9pm6OHUcwptTLYK9yU18uYYTMDx6rnN4fXty8xD=fOgFQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the random tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 12:19=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the random tree, today's linux-next build (arm64 defconfig)
> failed like this:
>
> In file included from arch/arm64/include/asm/vdso/getrandom.h:8,
>                  from lib/vdso/getrandom.c:11,
>                  from <command-line>:
> arch/arm64/include/asm/vdso.h:25:10: fatal error: generated/vdso-offsets.=
h: No such file or directory
>    25 | #include <generated/vdso-offsets.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
>
> Presumably caused by commit
>
>   88272e1f28dc ("arm64: vDSO: Wire up getrandom() vDSO implementation")
>
> I have used the ramdon tree from next-20240904 for today.

Thanks. Looks like, despite all our testing in review, this still got
missed, because it's a circular header dependency issue, so depending
on at what stage things were built, this was triggered or not. Fixing
up.

Jason

