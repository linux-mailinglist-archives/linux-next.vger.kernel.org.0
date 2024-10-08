Return-Path: <linux-next+bounces-4148-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C669A99535F
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 17:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F2D01F27D52
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1151E04B9;
	Tue,  8 Oct 2024 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zAqFEIvd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEEC1DF745
	for <linux-next@vger.kernel.org>; Tue,  8 Oct 2024 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728401212; cv=none; b=qyOQvXj2gPkC5zDQfNqIrYwmlL9CkHLqwY6bF6/j2zik77zov5yVDqkREp7mM66aDOgFuC49JCqqtxevJ123A7X/C11spvwDKif5dboHE8kIyblOYsrTEw3N19xWgSxa5EWlZgbU2UfUK0Re61cVpzDfU22oqO+b3sUVoIL0V9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728401212; c=relaxed/simple;
	bh=vKKxSkoKFnogkBx39S1SpQG/+QwYvL+sCYJlUmloRwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRui6rlvc+07CYJAtpzmgnvQKOcQjLIdp0nuFVOXjyVJrSmvZdBQ86o8kdCzv6KTTI8xCqQyXVJBPJjuTCOToZm7SmVQu9rdlFUIvGTGpiYZOJ0uX0r8SewHPIYhXnI9Y9DRKh5hIdYTGz1JGXXg6sw94Z2zsql5VCoFwTUPzGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zAqFEIvd; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad15b3eeeso61829731fa.2
        for <linux-next@vger.kernel.org>; Tue, 08 Oct 2024 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728401208; x=1729006008; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTAFSL6jcdadW5qIrfK3DEadzWBZ/GHH3F8iUzhjI/U=;
        b=zAqFEIvd01SpthaDmSwVnpr9caMF8g5LVEY9AabmyCgQoYN4yYfNGY/gAC1prVh0Ed
         W4VcCMXyskqnrslgTRWu7iVY7EYEZwiG5fksI03V41YiWy1pEP8rIuIdPVJasspDIIHl
         i5vaWi/xm2iA2Cu+xuV0k6SI1oi6J0SK3GveqOuiy+GugSmgAAmwzXlDj66M0UIaFpwK
         rjBAar+YX5duB88UbOnJW3OytmEHxuKKqOIMtSO+7855e6ZkD4HF6kdVQXNX5MB+2+9E
         l3sH+XkSSC+aQXtoGpNEBaKRluuzoG2iw+J9wAOuFs2TRYjgGmSkJXxdBWp/BEol0xJw
         LztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728401208; x=1729006008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTAFSL6jcdadW5qIrfK3DEadzWBZ/GHH3F8iUzhjI/U=;
        b=bjhm9P+xZeicd91uxejeEkLZ3y5PSdid6dSVv5Jjaukna6I6BOW0Nc+dZhr+Ovv9Ra
         QCLpH5plxcwd9IK4zzh05ZQyh7X640gD4F9twvK/+xWGwThSL+aBDsfWx6pm6ZbpasWY
         ibP7gTtV49dnQ+NXbgVObeBCtRnoSrToxlkC15jt5k4qXb9TBQPc2pGpAvmisigIUY7Y
         ru3N0CFVflpVi8pV60jJo0VDxVhrKkhR0OeCmiig8hN5/gCG1tE671gTkBBc2t9lAy1A
         OloqUPEH6Y3NzP9zdtVeDUpzAYgTC4meNdF60tNnJtcdliXy7ewcV3csZBTBX14NFHHP
         DvBw==
X-Forwarded-Encrypted: i=1; AJvYcCXE+5ZwZWUI/BYnwtQ+i6FQuDEU7RzDQHR48IpmqmDnLf0JEsb0mie4+X94qlwSVPrnxWc4JEP4focj@vger.kernel.org
X-Gm-Message-State: AOJu0YztweiSxOMt0dvMhMdkel032dednaPNy4qWQRWKsdQEBE9nKpEn
	wSzurmqlfhmDwr4H0VKNXlwUO6sRrFAsVruzz7hJPGEyhekL3iOXdKwT40MU6TLdH2hHgUHlZ6T
	BnTY3m65fJhkTAcHAR0P7p/fF0RduBXrc5MnUfA==
X-Google-Smtp-Source: AGHT+IEFfQhyAux2gJRZld7c2HZIzFN00gwATDRdJg+IsahVVBkamrqyhvu0kAa6KgQJs7Q8V9hVCCjoB7lrAdx5VJs=
X-Received: by 2002:a2e:4601:0:b0:2fa:d386:c8a4 with SMTP id
 38308e7fff4ca-2faf3c146demr66217621fa.12.1728401207755; Tue, 08 Oct 2024
 08:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008143159.35e26d8e@canb.auug.org.au>
In-Reply-To: <20241008143159.35e26d8e@canb.auug.org.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 17:26:10 +0200
Message-ID: <CAPDyKFqvG+Vcz8eVY6q9tkOnxMpudtQUuc2BBao74inDyOg=xQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mmc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Avri Altman <avri.altman@wdc.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Oct 2024 at 05:32, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mmc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/mmc/core/block.c:53:10: fatal error: asm/unaligned.h: No such file or directory
>    53 | #include <asm/unaligned.h>
>       |          ^~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   251377c52fde ("mmc: core: Adjust ACMD22 to SDUC")
>
> interatcing with commit
>
>   5f60d5f6bbc1 ("move asm/unaligned.h to linux/unaligned.h")
>
> from Linus' tree (in v6.12-rc2).
>
> I applied the following merge fix patch.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Oct 2024 14:25:34 +1100
> Subject: [PATCH] fix up for "mmc: core: Adjust ACMD22 to SDUC"
>
> interacting with "move asm/unaligned.h to linux/unaligned.h" from
> Linus' tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/mmc/core/block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index 66de5ccbb432..9752ecac6c5b 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -50,7 +50,7 @@
>  #include <linux/mmc/sd.h>
>
>  #include <linux/uaccess.h>
> -#include <asm/unaligned.h>
> +#include <linux/unaligned.h>
>
>  #include "queue.h"
>  #include "block.h"
> --
> 2.45.2
>
> --
> Cheers,
> Stephen Rothwell
>

Stephen, thanks for reporting!

Avri, no action needed. I will rebase my tree on Monday on the latest
rc and amend the offending patch according to Stephen's change.

Kind regards
Uffe

