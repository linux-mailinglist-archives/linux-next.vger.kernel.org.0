Return-Path: <linux-next+bounces-9720-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28757D3B676
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 20:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1CA4301055B
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FE2392C3D;
	Mon, 19 Jan 2026 18:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeMq27vR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2738F946
	for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849181; cv=pass; b=ltILTNOr5xnUvzWl0bghzB6kzIkNJFgSWIJFuqz65pofO/zt+rRwCyTUrsvuFh9mRxRQwA0DE/wYuqm6fAHXmpr8YalQFh/GEjajvpc0y3wT1HC3CPdjcvbUog3J80Bqui0sAwWrv2lHJWa+gwrCQSuxKyeQGKtbVpdo/hwL+xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849181; c=relaxed/simple;
	bh=o9DAEU4AWsCcCNOLp3bYlK7zyrFJ2w2sHYHHHj3Uc48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4X2Er3Z0oCqNcoFiokoPU1EkKyRDBWZl1nfHM5r2CLdobfMyrZlxTgPFNXi+sr7PKfFhDWod+rseHZgjAUevJmfTjst2B1CtpSJbyYtLEWVW6z/2bG0inK+MF0MPJc3sAmTuS2BOJO0YSQ/PFDlCyo9Wt31uYmOUaTv9ZQ06TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeMq27vR; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12336c0ae91so418952c88.2
        for <linux-next@vger.kernel.org>; Mon, 19 Jan 2026 10:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768849179; cv=none;
        d=google.com; s=arc-20240605;
        b=Jmz6CZhIL/1HfDBpgzJGLGZxm/2hcL4Q1fkods1RSQMWC429SUoecjsWRk6/wHZ8BD
         EfyU1Z2OwnBnTtjSNjKyeF3vCN+z0NMxSJWgm50aLav0sb1XJ5S/uiY1hZT3sQU/h1pV
         CYvvolxLX809kR3MyjMB0aa27Vrr0BPd3+NvsGE/c6v9GEB3SmPUC7mPP2+U0EaYx1uP
         3LlPTKmAS2dO9yJz4pPIyKDAwlz9dOw2z+wphd8rUMjmFPQ+oxm4mfAc+2crOFQwoMY2
         J2sWDpp7/n2jwa6I1bcl7pW+IY+2H8TMs1EkO1aiyT/RGviKHHMK/amD0UxvKVIN3E8M
         dBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xg4DehDqwFRzg85T0/oFHNEkKmDOZJTQ7vEaeDzNVNY=;
        fh=fnFW9xXqQE9fN84JFvBf0PGm5w9Q2mnLhdLXO+F/3qE=;
        b=VY717Ue/OdKSM8HIpmW4MNr2aVQrJMdh/pK0e65iO3+TZqGCkbmyluWpDx95aiLW8q
         l6cGz4lCJ3N7nPT+rdYiLSsbcwyC9tLEt6jtn55ERL1iFH/BaeVgbTkUnRxTT/4leHq6
         kUtcEK3UMUJe2snPT3ZMIInFf1bhpHDEFv9uCYSwDO83g+VKn8Uyr2b61FsTaVpaYwNn
         oLl4lt1J1bRJVVdoF6QTMv7j+KGJhwH/JHITgPFLRfmI5JP+hcpGMQn/drBlJVJ1SuSS
         F8/BwJQMRxPNREl8EuZuiRd291LHFO96XBrNkLVELW2ALOJfjWVdDD/SCQqzSQg/Runp
         8JvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768849179; x=1769453979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg4DehDqwFRzg85T0/oFHNEkKmDOZJTQ7vEaeDzNVNY=;
        b=DeMq27vR9Uf2Q8YXORJ1h6mGDUlqoF5SXez5GsDMoPT3Mq71EgjL+NFlibYcSJyI/N
         ZO22CacQ1LjE+xQi1PlIT0q4iqsi1r+IGlBKsNIaeCJ6ziQ44q5EsqZ1EMhjY/9NEAlI
         FTXXvDtb0kTqyQIqy/OHpnbNStx9n6lqzIAlhJVxeEIAR+gsfWKrdI+NsMBwGBOhF9nK
         BezJvV/fOW9M81CmyXDTXg6/S+92kNEZ4WKfvrIKPG3UG3HZ5kAjIvKnr+ziB1LhlWcU
         7UpBH9JrqS5jnsCSNPSC1TEceXmoV0Rw4FbqFJxt0mbNLO/JrmbPYU93ts2+h2To01K8
         6fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768849179; x=1769453979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xg4DehDqwFRzg85T0/oFHNEkKmDOZJTQ7vEaeDzNVNY=;
        b=L+RmE6YhorM4+0wuflnMcJ6Ot4x0ekVo66k7NpBif+icnN8rIVq8urWa6+zNsoq7m/
         /yOgsvEp0ew7YrzrSN7+mA2UHBFLyvX22rZiCcAn4LuXJN85Ob7o/ze7zCvlgan6Our3
         TGpWppId8rzBUbHqXGLGBQcnuSyhMCQ7vnHYK26ZpjN/xBTH+uL7XekuX8loTr9c0QJU
         F9uW+C5D7Og6X6Td8viiMDckHJ1g8kGl0fTBIXb40uBgXIJKKfTK8pWB0qF/8nEWQUGq
         mbCuX2PRCtAL6wk3urrvVyhRw1brooYe9j8WeIGGcqVmxbZIbGQ1DJLg2SQhn14J/PE0
         85Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXMaXD299S4LwPDzlSIon6qQ3L9yG6X+CZsiCw8zQ0yG+YuJi2GaQGRIaLT7gWWrHZovirBqoeUYmrd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2OyrXk0FA709ELcDpvxAn3TtURj6DiJ8PoEPBmpwL+xPbS8Yk
	+G3VKAIja0lBXVDSTPAKdfSnsTvoIHfL6cN4mKenOZx65LZQWegomNyzLWOlxHGrdd8XqSPOBIK
	3bRcY77BYtcfN/unxBvbY+ffkZO1BrqQ=
X-Gm-Gg: AZuq6aK3+0YK9oWecVy+orrqMoGyuknKref8TkCUL6CUVMaRl0B4LeimK3e576YLEK5
	T97CCpIWcUDw9X0514wUkuTDWoWkLjhM+hKrWnvUPAvDjc4AZF0oLPZ18l+jmowAME/K9+pDwB6
	7YVdG8kLPjbov6uDobkamIWnFuCsCt9wg/BilY0dCSXyUCpvGVzLr0R8cRtz4KnSBFgS8fOJRYM
	WPxFZ0LHo1gOT0WJ18IbvLcibkvlek6PN9vOeeYlPq2V/9mcjRbEhe7wfNHtsIjrcWratY7ihRZ
	7K4uftLj2eNoM5TAyqsbD5jJVj4ZpEiyeGADr56ZxQQv1FFPI8ergCl2z0buf32ER/HJUiO5JqF
	A8ayuFxpA48ZV
X-Received: by 2002:a05:7301:9bcb:b0:2b6:f142:44ce with SMTP id
 5a478bee46e88-2b6f6f81a7emr140167eec.2.1768849179489; Mon, 19 Jan 2026
 10:59:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW5xqLq7gatOy1DV@sirena.org.uk> <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com> <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk>
In-Reply-To: <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 19:59:26 +0100
X-Gm-Features: AZwV_QhrbLqABUGQ2JbKBKnFaIudzalL-h29KJ5-rDXu-pVaHqcTE4CDgaHe2bw
Message-ID: <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To: Mark Brown <broonie@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I could do that as a merge fixup instead of the revert, I'll have a look
> at some point but not for today.  Someone will need to work out how this
> works when things go to Linus...

That would be great, thanks Mark!

And, indeed, when the PRs are sent to Linus, ideally the submitters
should warn him about it (at least that is what I usually do for other
Rust conflicts -- I usually point him to the resolution in -next
and/or a custom merge pre-PR).

By the way, I will send you the details we briefly talked about in LPC
for the Rust bits.

Cheers,
Miguel

