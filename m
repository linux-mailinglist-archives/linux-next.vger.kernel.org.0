Return-Path: <linux-next+bounces-6701-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C126AB3642
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 13:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CE2017C4FC
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 11:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676CB267B0C;
	Mon, 12 May 2025 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI0ago30"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8989E2673A9;
	Mon, 12 May 2025 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050777; cv=none; b=ank5L/T8I5A7eHh9aBylCaZVHdLs8OR8bRRAHV4cTxh9Bd0nH7mjZZDmsBgH97YyDhZWpd1jhlq0yrk8bG7UexnT9IbOavwcivjiHwdnuNIcA+BDaNw5LHtVnZHRw1+UXk1vlryATfgK7p84yvF/+mjYc5JLwgb7qZM7LyzDnrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050777; c=relaxed/simple;
	bh=oo4/TzVexqKyE/EuAeDYMXfgf6SLlVETjNuimYWEluc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBLMT6ExHurn0IwPBDUFhcWyAB72N5M9otPjPy2Vb10L8DEOqYkc2jxjqC0nSJwdKDqmFfWsimoxfcknJd5udMXK1tXf5bLZuYJL2OB7B7pkQf3dfGljcyQZ2kzuXK8a04FoV+iwEQZk+8i/8oykuw7TzwvFHD1w6qVt88r+RBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI0ago30; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e163543ceso3540705ad.2;
        Mon, 12 May 2025 04:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747050774; x=1747655574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo4/TzVexqKyE/EuAeDYMXfgf6SLlVETjNuimYWEluc=;
        b=JI0ago30KPYrnSELZ5mgHydmcmOkOo1H0Y36GVkr7MTK79CCEbIUQ+ghD9lKbPdYYA
         Lr5amIeBcS8CbHil4mqSJkknBNptPy8QQdx4K+ZcE9rxDe6zFXiEmjn7yMmoQ68Qgo5g
         jXYG2rTjVdamOxcQsijczonjJr+IWf+4KjYqypSpylMCgV62DbE9Pq82uz+pmZnYK/gI
         x7WuIQckBoVws4CO8Kt4x3bUw7Jlks5oBVuf/WBgGF134XyoVsLV4l0A6knPxQVQl8Jz
         m0e6Kynk1fCbO4qMNwu9Sr1wPE5kjN1JHbRxWZ3zdkDVOwpj/20VnMVgNEl/ujwqH/8m
         J4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747050774; x=1747655574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oo4/TzVexqKyE/EuAeDYMXfgf6SLlVETjNuimYWEluc=;
        b=k3ngf/H62wyr/NG+2PMyStDesQ92e6hP6X0NbWRwKVE+dZ3fgV3kZLJAG5fr+DevgY
         D+yVtxsMNB+uTS5357jRs+Jd8W1h/Gn15DugsXOM8aqUkDZOmibWDnJGx9y4Zy+mfC6g
         Y1Z7/HL24GYeipwZao27QbYsTk9asY+KyZrHZXFmAGjpt5kxObBv5FBh/6xKiFfkfPCS
         J/ljDQ6fPlPr0icGSDy8USaEz5ghT0rECsCCKcsTGuIputMUeRTAoemSS0r0G5HhDtXN
         k7/MTfIpnlY/fvq2I4nOJnAEkV5V3eT2BJeJsx1DJ7hYcOu8HxJJ6G0BkhIloT0U5F8P
         TfsA==
X-Forwarded-Encrypted: i=1; AJvYcCVgZbJZ3UKYID3Hl2dDi+yq9YraazZR8pk+KbHGVMIncrk/V5dRedimi/PxCrlI/fE52c6FoEYVGc7WpQ==@vger.kernel.org, AJvYcCXrO3TeqwUQwUmKSqn9JejhEx6Jz9YX6GGGBD/jSpjOPA3Pq73atfQDPbQgzUh6yNYAGBUvDIcCMoWYT7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSb+CwWSDZmJU8zUDYKVvBV20xdbpL5JVJ8I3X483KKj2IRzB2
	gq5OH3cToCxaDVm7+jqeUzhQYA3dPuifNB3Olso1DviONSz9/H0G0GSM3do5YW4dPNJwwolJxre
	JGikjuFgP1Vrw0m7+yZq7Y7aZyeY=
X-Gm-Gg: ASbGncsyo4MarJa5/CwpbqFNuTXiaMuVOs/u9z+lOlXWvqA5yODw+XeJTZu7KyAFdVB
	owCZOow1TfROG+9+DSau1EWw+0HG6PfQC10uV1CvUlZKWkyy8yfyX2XZEtWfmDGHFwE62+AmwnO
	y233uijEwa1ppI8URWmrFR6OlOecvMGELSYrPRxZsUCGM=
X-Google-Smtp-Source: AGHT+IEteCtbPqS1i1Wldot6vJgVrGTIPz23UCNRKKXAdQvxj8l2nBr2DPuG7EsHLeAn16XDEYRpdcMuLtsFH/nSAwk=
X-Received: by 2002:a17:902:e84f:b0:224:e0e:e08b with SMTP id
 d9443c01a7336-22fc8946fbfmr77057865ad.0.1747050773672; Mon, 12 May 2025
 04:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512194008.3bf1bd47@canb.auug.org.au>
In-Reply-To: <20250512194008.3bf1bd47@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 13:52:40 +0200
X-Gm-Features: AX0GCFv1jrzlEPbM_9KGtSL-lNPg5smR3y-QHCF2tW9Yd-4oZIvyXy293v5eX2Y
Message-ID: <CANiq72kv96aFrOYLtMpakfo02hLYyzWv_vfAPdbx1NEp2zfCOw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:40=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Not sure what caused this and that file has not changed from
> next-20250509, so I have used the rust tree from next-20250509 for today.
> Clearly I need help with the merge resolution here.

Sorry, it is due to commit b0ba6be4458e ("rust: retain pointer
mut-ness in `container_of!`") -- the change requires cleanups in other
code arriving elsewhere and `auxiliary.rs` does not have those.

I was about to suggest the cleanup (just removing 3 cases of
`.cast_mut()`), but then I noticed a Clippy lint triggering in turn
due to that -- reported.

Anyway, I have some upcoming travel, so I have dropped the commit (and
the dependent) for the moment.

Thanks!

Cheers,
Miguel

