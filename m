Return-Path: <linux-next+bounces-5841-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB0A661BF
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 23:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D729B18992A4
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 22:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F380C1CEAB2;
	Mon, 17 Mar 2025 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wly/As4V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA0D29CE8;
	Mon, 17 Mar 2025 22:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250968; cv=none; b=n9pJupu3gjfepe3951ZZQhmK52AAa2xtn6rlxksFe+drKFnojk2HWGGrHbTFmVYwaqhoLTF1K+JI4e0jTO+U8iscxxqR9O0YN0iukvxC2KQ9SPK6AFLmjUsBti9TKnr8NcqNU2FpAgDivmuZLnsrQKdGFvefqnurjdv7dsku1WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250968; c=relaxed/simple;
	bh=+9Ad6p6mJoct23JBf8OOH/51GC0g3fy2PqW/lzC2LBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKPi/VNmMVK9DveA+yznd/1/ggVvLglmfXGvO6L8xS4vnu7ntj89nEV7DEK1EcL90O0V+8YYP89Q8WS259zhh5pmTnKo5cDFWkzZAH6hx7hjcy94arF1MdRiAGIzsSbAv+yU4vlBt408knBVk8gP4nqCrOKUKWLn7eAfJd5G/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wly/As4V; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so762198a91.3;
        Mon, 17 Mar 2025 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742250967; x=1742855767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0+aUNT5oIxUZ/KdRGAbfzj/bzCQVJlGiE3X8c+kFXE=;
        b=Wly/As4VqZaXQgly9hPQUyXnqFlymH1+XYNjATO6dlqixMoV3JZ8ZH58/OLxHtxjmR
         ATVGp35cHWaVhRss3Gufueof8hELeb45I0KcUuTgOSSSzpBv9S0H8zz3FgO0Da7k9n09
         FPJu+qquhR5FOVvvOu6/N3k4SMZJ14hlzo13a0StKRN32y0Qm3dHK6C8plN9eYl2PEnT
         p8gMw3qef4k3LXtbu7DV/Wls3v0Ae3pKYLsiPIZGg7tt7TiG42Z5rIKaYMgtOAMsKSmZ
         wqkhB7Fqx9rjOXRK5Hhm+RrH/CSmuqJ7NOvHgyA93oOvS4n0C3rJbllGw7JzqX+CRqYv
         TOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742250967; x=1742855767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0+aUNT5oIxUZ/KdRGAbfzj/bzCQVJlGiE3X8c+kFXE=;
        b=opekHXyafU8LYAcS9jI23mc+G4J4C29G1jOhXwk5FF9KGN3thBkcPFdVcjAPuToLiX
         9u5iBkiulks+1PtgVEVFke4zoaUhb71xiQ21OQJ85fUI9qhfbE92mdglJHW5VCXwcmKr
         Doa8ADAbQpMrdInggUP9en9DG8tWfm8tL/HBAcpHnEMSHmKdmRBliyzMX7AaRorUmYjO
         NVIYB1q0fmuWpbGldESkwxWJwIoiZA9Q+zgDwAHKg1QqeTrZC8KwD1m5VDsqj9zzbFBA
         zcDKkwiqO8IJD3r8RCJs9TWeRDKB/sMqVOuy8KH/8xY2ZMymf41qaIDsthnaL+Ob91Vq
         yRkA==
X-Forwarded-Encrypted: i=1; AJvYcCV2S+Ss2Gqwf+0bG/ouS4rSemf+gdlrY0k0HQ4XtPKj2QJlJ4liBzYVVknlORJwj4UGiltRvofHdVCnNw==@vger.kernel.org, AJvYcCWKOc8wwnkYbpol9HFE9KausrHrB2pEJrqw27ikQG/Z0fgD8yLN2JxPV1Dco7rVa2NblIYGUkVkrkXlAec=@vger.kernel.org
X-Gm-Message-State: AOJu0YykefWinHExZoNZLl+o/PyDJRTygSIQ8yVspK04I3W9G5r2u0Bv
	LNh3QB5nm3FpnVqiNFZQJVUmhVUVv3uOpf+8WEYRUMHzD2ljM31YaCHiAUffEDjO1Kl/lSz/Fxw
	3mhvUsjfERHSbgAjDLOWC9RlqD8Y=
X-Gm-Gg: ASbGncsWxeS3NLo/bitkuqZTizDfiABqGRQ3vGW1ZEz1wS+fsKRJLz7TqlGKNA6XJ5F
	A51a/SsGxjGOExbnsU85RJCLomLwvQ5isd3J2iEeBGuCCZEG1VB0TFBMPRnnCAiRlSh6gI+/Zwi
	lfvm9BJ5bzc5onb7y9ePe9HlwRRg==
X-Google-Smtp-Source: AGHT+IHPCs5OD35Y2xsBkmuPLP3qNIWkbDfaVE0f4Y5JerLpr6+DGG1JqqBp9ApXA1M7THGsi52xCEkvYy5hLjqp+zI=
X-Received: by 2002:a17:90b:4d8d:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-30151c5dfd6mr6777483a91.1.1742250966596; Mon, 17 Mar 2025
 15:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317215757.2412aef1@canb.auug.org.au>
In-Reply-To: <20250317215757.2412aef1@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Mar 2025 23:35:54 +0100
X-Gm-Features: AQ5f1JqD72FQmjuu2a2uxR4XtTp4MAvXDo1QIL5rOmxRvK1Ax3XT_SFOjIcLYZM
Message-ID: <CANiq72n05i322FfpSjFX=Wz3-9AgVRKLkKs1CHa-LxzWQ7-pew@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 11:58=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Presumably this is caused by my merge resolutions :-(  Please have a
> look and let me know what te resolutions should be.

No, it is due to hrtimer-next, which I still have to merge on my side.
I have created an example merge of hrtimer-next into rust-next which
should solve you mention error above -- but please feel free to drop
hrtimer-next today if you prefer, since I will be pushing to rust-next
the proper merge if linux-next goes well, so you will get it:

    https://github.com/ojeda/linux.git rust-next-merge-hrtimer

For the other things mentioned in the other threads, I have also
created two branches, one merging rust-next into Linus, and another
into next-20250317 -- not sure which is the one you usually prefer:

    https://github.com/ojeda/linux.git linus-merge-rust-next
    https://github.com/ojeda/linux.git next-merge-rust-next

It is a bit subtle because we have to "redo" a fix from mainline in 2
different places since the lines of the fix are moved in rust-next.

I build-tested the branches a bit -- I hope they are all OK.

I didn't modify anything in rust-next today to avoid further issues
and get this part over with.

Thanks!

Cheers,
Miguel

