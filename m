Return-Path: <linux-next+bounces-8615-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 91450BE958A
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 16:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70B0D4E2EBF
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 14:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A27C3370E3;
	Fri, 17 Oct 2025 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jlSTYU/P"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2023370EF
	for <linux-next@vger.kernel.org>; Fri, 17 Oct 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712744; cv=none; b=SaFWLI+BzaMOnQZxCVauwyyLydNyOwgDqxmuD9Ilm5cqKPw6mZne51neQ2cjnypYP/J6QHpEoIsWYaqDrZzwi0+z5hPuRsOMrqt0bU9WUev8TWHjYIiL8v8IFeSIe2eYo5maN/m9BxoA+9i1lAl54o2CZuTLGWZpfVRWbTWb/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712744; c=relaxed/simple;
	bh=VnfXtL2xC4VzguJRr7gehYXlYD1fT0JPfUxMRmpisNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edZr/KbeVOKe/wjtZL21UiBlQm05LAA4aSlInSIXHVWWiF5Gf0hBKr4JWzJhUnL/cUNbQLNVXeOimgPlQ/bIf6cbT2r4Sq1Kx+iCEpm7s73Pr8P3lqTBBUwFltcYgW2zllK6JYRFFkA/LgpBPOqxwmyzWLNQrSPtuPX7CGAPEUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jlSTYU/P; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59054fc6a45so2387014e87.3
        for <linux-next@vger.kernel.org>; Fri, 17 Oct 2025 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760712740; x=1761317540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sfzPDcrhLkEpvH58DO2RFlCkKiwdjaDP32oJmQSiwg=;
        b=jlSTYU/Pf4KHQOo2/sYFqPfhPJ9nnfwcScfGSjZi94CI+WmL8Xt8ulJ5dHtxrI95ZP
         gnwH5eWEHKzR8eTuss4+x81t4MXnDDPz1FdsdKImXbNEZtJzkIBRX7CErXppymB5KPMD
         HngoC9ylRJPljk2WnWw13ohmjvI4CQwj1HbVj0K3lD+xQ6jl+TujcQJn6wymWWFp4X8r
         IN85GyJmiNn6/o41oHp/ay0FprfN6guLFCHhkcapQ1FKYEpbRq8n2V5e+ZjF8epZa5iO
         qiMDgzZLH55CJWxg+/DWgTRPuNME15kDdwAMhU3Eg1T7WolQK2AD548xhOz71Fol+cQz
         /VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712740; x=1761317540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sfzPDcrhLkEpvH58DO2RFlCkKiwdjaDP32oJmQSiwg=;
        b=t/HF9SEYmqEZ8xuOPwOVQntbbNHakshVnPt5BG+/iYYD70BaHSj6mFu+uuVmZ5vyAF
         xQWIzmyGIsInsbcOaT7Bau38meC6wbSggT31hDDM7bY2HT+lJh7K61cvtaZqavSQakHa
         e94Koly4re4/VUm/tj/Kcv3Pdjtj2VBqIbDeevnFwggzRfZjAfQiOUZUR8THEJ4fzBV6
         D2zBUj79Hn3icS4cMUIU2ndJswnVNfzd5mQuE3j/ZUoV7Hx8qAhk03He1U/j0g66w1Gv
         OK+tycODmktQvvHMfSfaeR2YqhmT0icbBTQNNQsOxcfc83f5xyd4o+9MhR4IDe2E2Eb4
         RzGw==
X-Forwarded-Encrypted: i=1; AJvYcCWF5JB5/v2+Nzv8zkp8r5JieN/Es5suhaXm3+rEtMQpC+IPwSoa4JeykUVa8VvqbSyvKSEBt/1lOA9y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi4RCbeQ7fSRvdrnct7Md+GkpRLUQksYn3vPX79LQo0iFOB95E
	V/LmTBCkyAFwhCpWHX3x/UKd1EQwlzTWq2KOoTEVFKHaQCBjpJnJKo37FRwVmGMbVHWXUxU9E9A
	y3YdYYE5E3bR99P9JvNnVrOAoKILzFCar3b4FBqh+Wg==
X-Gm-Gg: ASbGncucMgOf3V38tQ10L0abdTe6J/pZxNBB8WrpiK4Hr21Ll9RrZQw4gJZsML9lmPl
	WKMvT9zp+SCil6+W4nPE2M+j/9IOrasDzW75NcHNDe6M5ggA8UFg3UrJiBxd9HgLzbJA3icT7+n
	abkh8P32pos0hhmi7Zg+xjS0Aa7ifibeK41SuJu6mWIID8JriuAAWEFqHp3VQk/nfVNM5egZAtx
	JYj9zxN4bCypfCfPMavApRtQUyxuskn2clO9/dnwOpwAShgInkwOL8frOpSklHPBLm4Q8Y1vTGv
	jaxYqdqJ58aSKQu+
X-Google-Smtp-Source: AGHT+IE72wOQZ+LIs/OXsye4cWPFFSe4QVTCmvrbwwx51cB1q/UrQK9+rzRhjrj+Cx4wEHABWKff44JhW3HgrfK1oZk=
X-Received: by 2002:a05:6512:33c9:b0:591:c60d:b852 with SMTP id
 2adb3069b0e04-591d8597bccmr1632259e87.43.1760712740520; Fri, 17 Oct 2025
 07:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPJW8HIke5pj3doX@sirena.org.uk>
In-Reply-To: <aPJW8HIke5pj3doX@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 16:52:08 +0200
X-Gm-Features: AS18NWCt-sC4eLPZuRtwoQG-DMUhSZhvcy_XwuPsgyaFXgQS-NGNCRoftf4DbFc
Message-ID: <CAMRc=MePe-dxinjBMu1NZGNsCrj2gp9UF4AfZinrQbYBjmNQQQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 4:47=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the gpio-brgl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-qixis-fpga.=
o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-qixis=
-fpga.o
>
> Caused by commit
>
>   e88500247dc32 ("gpio: add QIXIS FPGA GPIO controller")
>
> I have used the version from 20251016 instead.

Ioana: Can you please send a follow-up fix for this, please?

Bartosz

