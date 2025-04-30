Return-Path: <linux-next+bounces-6456-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74704AA4600
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 567149A6DFA
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 08:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF38215764;
	Wed, 30 Apr 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W9grG9AF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FF1C7017
	for <linux-next@vger.kernel.org>; Wed, 30 Apr 2025 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003241; cv=none; b=LF1iDsjvnInDrPgZWkUzSVG0rkslq/2aYP0QNuZVowpRvtr1xI8Jd59BHZd28e6v4Neh84rrxahTzEVwvGJAXeRE3wK0rNPhy8N5UyK+4ph+kGK8l4TapdIsA3Ii9217RygdUjmL+JeP43fFRfqZUAoAx8j1ceVkq+hDL9gUc3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003241; c=relaxed/simple;
	bh=pkk4FnwFjZbg+KuXgTwOxKB73qBogdOwMrt/pQB1i8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7+8RvTTuxBwQCIkI4XiqWCIqTRZM/limFUmgf6TR5t8yVE2JEnusNDRudmoKplairG65+o51GcqFnA7mM/xqqkuWlebkrS9biBxA+mtuNnPF8slvQovJP7ia1pq35u8LaRgUYvQfFH0wFLq+IX1til7kG92Ps9eVH290JLsdAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W9grG9AF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54af20849adso786278e87.1
        for <linux-next@vger.kernel.org>; Wed, 30 Apr 2025 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746003237; x=1746608037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yr3vymS/gup0DlCuygO2tVK9TIK2xinHjdJneX0gB48=;
        b=W9grG9AFeY/OKPMMUK2/i99fhl9LHZ2AlTnTFXryhqEfT2QWnq2uELQ3wSHGSd/qsq
         P7uxzY9er7MaP0TNsgj/LNXPpT09tkZSjQw97owVkHmAggu9IeREH5A2CQHoGB8yLC9t
         hxRi5WZ1FqsuUCTr57DVfHaYDHmUQ1OVGNMcMflJHTDPFqJL0MS02WA47xDAmymSlNMn
         o/dIxYOqVFrgdz74n5g+Y/UMa72EDzT3XlpXHX+wT+C69xZZPCJpd2RJgN6267DdL0oz
         WlG+VCrFlxn+D8pHXT4gKfCNnj6Acc6z2CAgIPNvO6crwNvmiSkEXFQC5y590gbIC3bY
         HL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746003237; x=1746608037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yr3vymS/gup0DlCuygO2tVK9TIK2xinHjdJneX0gB48=;
        b=LQNShjGYLzk6sT3anU6IKGf0FzNCq7WX63vxpQVuACU180QjGKzIvdduRMOBSkzmDh
         mPzQX4gpNfT93VcrAi6xd5bmTzIgbeKwbw6KwinEwYSEm2Wsbz6OR7VzYuLGZPBFS0RH
         c7X3l+aZ/janQEl3D+BOba8NoB+XfLHBEfe2C75S2uX51v+omCu8+SCsB0ALpVG2UlKD
         HpJCVX58SzMoeTUG5oOqqkcg2JW6uqmR6sYYyOohIVxq2wQ8ABqHUkPhgtHH8fpcfsyo
         Tl80cdQVVeuQzLdlhHVn2i0+piacaMVRq57DspGsgp5dI5ufYZ31p7zlPeLUBO78l2bF
         DeLA==
X-Forwarded-Encrypted: i=1; AJvYcCV6OuveteA2iXwN3lbPWDJxAF3jTvPYhN3DbhOiGyuMbbeAfWkVRgOedaKzCsddP5rzDSUfCGyT41AF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2iN3pDUQCPXswQH+IkF+agoOFDucABosh5U0GgpgtOZq4I/t8
	rqKWEaE+xDqMs6FjxJWKYU3Ce5m4fXzwfVygGaVYBF8h4cPJqL8V64Unt7ifS4+19+6F2fEdeyv
	YBoSlbjV7vaTMhQ9ByQDT68I8aKUroL06GeugSZlXNzY03khb
X-Gm-Gg: ASbGnct8WKvwXByA78Enu1sG4HfwHz5Hdcz/c75cjZ7/CfWNDekcuXxHPcuwvMsLExO
	EL35NrG4/gfLbHDiPsoJXAfavPCXwJ1iOM/g8LJTDnHFZ94/Cdwx0T3LOR775/gS0+eUgXwT5qu
	jAfS7XFIoCGOGTmspG2tCziA==
X-Google-Smtp-Source: AGHT+IHpp2NWMXBPtPmK+nwFyhBtZNA2vTr8wwH2QoJMNsLq4Gpf5YQeAvTFVW+tFyTNW4iV9HptwjcCEVW6Oahyl44=
X-Received: by 2002:a05:651c:54a:b0:309:20da:6188 with SMTP id
 38308e7fff4ca-31e7cff0c78mr7933041fa.6.1746002863004; Wed, 30 Apr 2025
 01:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430175001.4d12e01f@canb.auug.org.au> <4386227a-3dc9-42c4-9cc1-827dad1556be@kernel.org>
In-Reply-To: <4386227a-3dc9-42c4-9cc1-827dad1556be@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Apr 2025 10:47:32 +0200
X-Gm-Features: ATxdqUH8wc4eV2JI38qs8w_0ktGCGFATczhejqgAF5f1Rqzi-aVwrIV_qYeISlk
Message-ID: <CACRpkdaxTJ96hpJqs=xWVD4gSLdgc=m9uq+rbJKrJL+jgC645g@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the pinctrl-samsung tree
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:29=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 30/04/2025 09:50, Stephen Rothwell wrote:
> > Hi all,
> >
> > The following commit is also in the pinctrl tree as a different commit
> > (but the same patch):
> >
> >   0a5b9be31f78 ("pinctrl: samsung: use new GPIO line value setter callb=
acks")
> >
> > This is commit
> >
> >   9e4c444755b1 ("pinctrl: samsung: use new GPIO line value setter callb=
acks")
> >
>
> Thanks, I will drop mine.

Thanks Krzysztof, my bad I didn't think about splitting the series across
submaintainers, I should have. I hope this doesn't collide with anything
in your tree.

Yours,
Linus Walleij

