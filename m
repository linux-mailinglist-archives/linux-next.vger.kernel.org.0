Return-Path: <linux-next+bounces-4037-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C898B685
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 10:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA15B1F25168
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 08:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4271BD005;
	Tue,  1 Oct 2024 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWCZ93Qa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003EF29A1;
	Tue,  1 Oct 2024 08:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727770033; cv=none; b=tYx7NZf26nvLW5qdg850ADkOJ+cq7UUVWQQda/Au3Xkl51OmgaoS3g++wDy4LGkMyLq8srqlQ5ghUXiAqCSo2yEdRzyGFOP/mS9cBUmlnnpaWUrvSaA4BTvSvUHBculZAebbbWjqBX/rKp1CdC1Rl9EwcNwOh8BPb68RmCmVQNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727770033; c=relaxed/simple;
	bh=DLmkguVWBVtNsTnsLZDKVc+/Z/hHe/fpCablLbt8fo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/5UjjH2S/LtBLz+l9PnWpeji1/qC3nUyW6KMTlDNq9XY04imLDJ8loCcVlgN2GCNt6AuLLcwqprU1bbUZE55Iv2rIbaCfXQw6wEfO3FOq7tK6X10FMLbVktRh0afJDEPg78mnAmZxR++/tOofwDcXZi8K+k2d+o5IAVxMDz9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWCZ93Qa; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fad5024b8dso15350691fa.1;
        Tue, 01 Oct 2024 01:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727770030; x=1728374830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDGdkPHx0D1j5vHF/c6NOku8EQtRl7HCdp9J72B4+OI=;
        b=YWCZ93QaNN6Zpac8tw95U0AIAcBWeG2AlvAqtIKtgeJ8ORhMceFOsfDRhUdiy0Giqh
         g180TeeKFeNcK+jLprXLZqS3hvjdInr7gjnNZRvik6+xC1iTTA/qyZbSSLKUcji5WhO2
         p9d68/F9H8ypnwssIP/aPAFQuBAPctHnkVb/a46JGMZFtaZ7drU5N0ESn/RhBtAYCzzQ
         14UILGQ6vXmsAQyHQaebZZgvT80lPrDKRwzmgZXBDWeI1bTiXfWz6dl9JuM9/juZP2ce
         u+wL6oxeK7FykxpcpYZ6ecmjCZaceUleEcN9JYjykk6N3lMMJmb6C/drwZqnNGprQPiE
         NNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727770030; x=1728374830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDGdkPHx0D1j5vHF/c6NOku8EQtRl7HCdp9J72B4+OI=;
        b=uBtA65xI1TT4yWlAK40Bk09SGAwUJzoLgcMokyqBdxhHWZa7VM9TpmUUZ5rasoWT9Z
         36/Q7OBsRH9jI4I0vgZHy6lCqaP5ZeVb7PlcYc453A4dX5adlKkIdakX0nHLNj10V6vu
         objPgE+4dhybvpQALpcaevlJK/yHO745AKuyyaoqOtsdETOu3pXWvO9ak120Sbhbfx9l
         rGLIn1lRtitJ9kTmSb3ZlVZX7LCy5Wi4ikXBg4bDJT6rMimC5QumQtt5BVNGI5vAj5HA
         EYbxtRuedoBNOc7rOBF3MPT19J1xUnL+19ZTCQOINOM/dBNHxj6XAAYRXJ53FpOqeG0g
         U2eA==
X-Forwarded-Encrypted: i=1; AJvYcCUjHEbQQDs+1xMUEudFqG3ALecHW9ZUvLRGewR9dLws9ruffu/BS03xeeXlL0MIDWljV7gWoHTTkuwamA==@vger.kernel.org, AJvYcCXWfUiBDtWQX6ydJig65rYzDA++GIhmriZb3p2C0A4tdHdIGEtoLZG5UWntd5oq5wpr3Z4ScOz98bqQwl8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rZ33zDdD9XxlZZU/tinJUOk4lEtHRRi9+3q3Qchm5b/6v1PC
	3aI69EAckWsNucG9pjK03Y6aq9JpLpgKFXA26kSmeZhrMoXhFYJywNXDdvIOlvTYYhQ/hGnL8A6
	XCoyWs9O3mCEO3pacO9JvDTlhjTDKFIglsKS8Ng==
X-Google-Smtp-Source: AGHT+IHvOBYxOwUNOdUDNsDNEt0IUTQzFgiYQcsCEoRnAjcabGr8fw/ZklnSkzujELmuW9wahcWEGEQFJ63COsA2Nq0=
X-Received: by 2002:a2e:b889:0:b0:2fa:d6cf:28f6 with SMTP id
 38308e7fff4ca-2fad6cf2c81mr19409351fa.3.1727770029640; Tue, 01 Oct 2024
 01:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001134423.62b12a80@canb.auug.org.au>
In-Reply-To: <20241001134423.62b12a80@canb.auug.org.au>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 1 Oct 2024 10:06:58 +0200
Message-ID: <CAFULd4Yg=VmL5rCdxqbh68TSR04zFHPjxUYN0fqNBBfmdQXkmA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the random tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Theodore Ts'o" <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	DRM XE List <intel-xe@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 5:44=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the random tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
>
> Caused by commit
>
>   38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/rando=
m.h>")
>
> interacting with commit
>
>   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
>
> from the drm-xe tree.

This was kind of expected when two commits are in flight in the same
area. IMO, the best way to solve this collision is to change the new
include in the DRM tree from <linux/random.h> to <linux/prandom.h>, as
is shown in the proposed patch.

> I have applied the following merge fix patch for today.

Thanks,
Uros.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 1 Oct 2024 13:33:48 +1000
> Subject: [PATCH] fix up for "random: Do not include <linux/prandom.h> in =
<linux/random.h>"
>
> interacting with commit
>
>   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
>
> from the drm-xe tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/=
xe_bo.c
> index 7d3fd720478b..3a14b70f12b8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -7,7 +7,7 @@
>  #include <kunit/visibility.h>
>
>  #include <linux/iosys-map.h>
> -#include <linux/random.h>
> +#include <linux/prandom.h>
>  #include <linux/swap.h>
>
>  #include <uapi/linux/sysinfo.h>
> --
> 2.45.2
>
> --
> Cheers,
> Stephen Rothwell

