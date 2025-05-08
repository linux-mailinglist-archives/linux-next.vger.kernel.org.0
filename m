Return-Path: <linux-next+bounces-6617-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F946AB00BC
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 18:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03D584A340A
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 16:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAB8279916;
	Thu,  8 May 2025 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x91ysBp3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDA778F32
	for <linux-next@vger.kernel.org>; Thu,  8 May 2025 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723203; cv=none; b=qRAARR/BUB9ZRXchUxW2JsFnFaR10IIFzj7vldIT6eq0FrhgYC3rzZcANjnOmIi25Y5Hyckl+eEmIdCeHM2HH4KBrIeEYB/ckHkP+ajEm3fjUCwZuH08lynhhPNx4JrRErN5/Amg4Y0f2OEtpsdCccck4d5nKTwI8EiqPn3GOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723203; c=relaxed/simple;
	bh=A3HqkW7aDDTHOzi2+D49zHOXmOdStXA0YniMLxFenjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgR8MaFRZCYxw9WolbqSdDqQCwgDzgE/fVa1lwphVM1fOgyjavk+BqgEHaSaId0/CwuR+z1vpv7wp6dhjxZ6k/yDbzVf2UsPLPdTDOtjF0jkdDMJ9cJm602MK3hRRM+l6KInYi4/dvajAsrbqF2/RxysPh3zw4Xpgb6CLakgrIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x91ysBp3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad216a5a59cso28007466b.3
        for <linux-next@vger.kernel.org>; Thu, 08 May 2025 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746723199; x=1747327999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj8+B8E9Q3QVQEn0PNEcuTgtl8cWzr1M4iPPxBLdmdc=;
        b=x91ysBp3eTczUZsOGhvekx0FtHdooYHC3OEDVk+MyQu2eiXdPi0nmUGSiE3E64oy1l
         D8lJf/qYVsn4uwWvpUtcOD20NNs/kYIsRlQDNc4LFWvNzxJPMXEw5pST09rsnBxXymz8
         fhlztJuKxt3MN8ZQ6m18dJp3ynDQliK2s9sjg5flaPIT08bFVy+q9TGIvz2eoL8tcUoX
         EiwvHiLGhKDMsn6Ep/HpyjRStcYVtq3mGmSrQ1fdMIivNsmUwlh5CGvLft2KPkhKt3We
         Bo97qJcSMTX4jOP93hFJZlr0dd+EChQX+FOBSGJ0Ax4OcrjnnY55FKGMYkCotDaAJKhS
         HHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746723199; x=1747327999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj8+B8E9Q3QVQEn0PNEcuTgtl8cWzr1M4iPPxBLdmdc=;
        b=NyQhpfVw43e5yYs5O0H0yVvP/Z/Gc6eGzuYGll2/sXhjGoFUpcKI+rHJFzNu+BMbWJ
         p7881ymnknXAcEsANmays6fWbCChcStYfGyvlBI+JJPCoRLmRj2dLCiEjLrPLZNGfCzC
         cv3LJIP/hzpgXlyDAFSJi4XK5M48EkhSN4Ltd35Bw7fZcKb0yE2hfya4WTd9I3K+W7Gp
         1CiyKtDC9463U1+X2jO0hpsd8i+b2s46muC2ot+b+0QIoDzgg6Hwo1q2loxE26YSUu1C
         FDiPpl0ekczs2AwyYp3i/GOJHugtsIRBGqGM1A6M5PXjqK9aJh2XbGQZzUBKAZcw4JgO
         4NDA==
X-Forwarded-Encrypted: i=1; AJvYcCVNmhycYHQ/r2kB0ADGuj2mwq7LLcgs5BF9QyQuA3xlDAT0TH0825QRELcrnQZTUJqSA4G5kZG6s+yK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4UoFOjH7doeh1aOnSO732YnmY0sEos4VSj5MHp2CezZgKaICY
	ZD2ts8GN+3oXnTRdX5ekaVZT50kqaCyGujJEYqsPnxZ8RzJ/Cahjwi3jJwBC2q0UHWrAwx68eMk
	xnGE1rxv5/P5BoRqMobivLPUe3PcuFSbUgVe+zuJk212WoFOmlg0=
X-Gm-Gg: ASbGncuykryGZpoSlumGNo0bW2n2On2J9/7QCptiQ8B4Cp5oDYNW8XqIBuA4I4J5Uwa
	WUEtN/fHUhpQ1VOQeIB8VoIX3kFg7dMHAx0GPO+ixlVKBnxDeKwCXukLNArMmMkTM9hova1NGc/
	ogY+MQyKeYjV+id2DqAZ+06N9a/cKqadRWEds87DOPfCpXxrDBALdPNQ==
X-Google-Smtp-Source: AGHT+IFIW8hDR5O7TC1wEUAbE0Vso3v7lGrXdmwwMrkD4n+cAV/8DvW1Au0lXsn/gzG4q+JJ+RRglNyRgDqKujWZr0s=
X-Received: by 2002:a17:907:86a0:b0:ac8:1798:c2e7 with SMTP id
 a640c23a62f3a-ad21927d5e4mr43816466b.41.1746723199496; Thu, 08 May 2025
 09:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507172858.5b7d087c@canb.auug.org.au> <dd75d8e7-5d28-4d4f-890e-a61afec75858@infradead.org>
In-Reply-To: <dd75d8e7-5d28-4d4f-890e-a61afec75858@infradead.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 8 May 2025 18:53:08 +0200
X-Gm-Features: ATxdqUFJ8YOAQD9NpygdNcyuUrgQFx9We3w2ZSBc2F6FNDlujAaiMvQxhH91UyY
Message-ID: <CACMJSesSAgQWYfZ0X2wJhzHPv15o0AfBYxXVi79dcZZTqhpCrg@mail.gmail.com>
Subject: Re: linux-next: Tree for May 7 (drivers/pinctrl/: PINCTRL_AT91)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 18:21, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 5/7/25 12:28 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250506:
> >
>
> on x86_64:
> # CONFIG_OF is not set
> CONFIG_COMPILE_TEST=y
>
> WARNING: unmet direct dependencies detected for OF_GPIO
>   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - PINCTRL_AT91 [=y] && PINCTRL [=y] && (OF [=n] && ARCH_AT91 || COMPILE_TEST [=y])
>
> --
> ~Randy
>

Patch[1] is on the list, Linus just needs to pick it up.

Bart

[1] https://lore.kernel.org/all/20250502100841.113091-1-brgl@bgdev.pl/

