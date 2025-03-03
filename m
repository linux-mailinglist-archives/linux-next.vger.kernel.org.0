Return-Path: <linux-next+bounces-5629-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9DA4B967
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 09:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5A067A4586
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 08:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD8E1E5B66;
	Mon,  3 Mar 2025 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijEMHlay"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619671B0406
	for <linux-next@vger.kernel.org>; Mon,  3 Mar 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990818; cv=none; b=thhUBQAqc4vh2rOFKJmFpJSdBsr/Hq4pEsBPlSo/GZl4HvbY+MdxJFO1m5qpyEAKqjvt8rseh5YrUTRLOIJwv0c+sNGjroX6NZyCx7UegE3gm+x4l1Og2hbSxTaL6Kp0SaYzmXQG8ONpYlMs4jsw+glCmPWaNDtPWgHeCYh3AIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990818; c=relaxed/simple;
	bh=XqgYTASZdBx3dZT6GACGqxIac1H6OFQPjap01jrQ3Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecGOl3EL8VV0molKNssovEvu9wQ1rmyXnGu1OqIy1sH492S9vz6vIFd6qEsWz/AbaSbPD3Y3EykcsUS2wqaY9qYOh4fTq0r+P8fH46uqw2sgvZLJ+J8WIR67F5csojKON1egwT20OH4e9/uFqTJMcBy8QU1qB2MIqx7YLEYopNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijEMHlay; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6fd2fca1cebso24966727b3.0
        for <linux-next@vger.kernel.org>; Mon, 03 Mar 2025 00:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740990815; x=1741595615; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wRH5h3jTo2TqZdNdrwv2V8lANzprbc02HuVK7lPEI4Y=;
        b=ijEMHlaylh9ufY//YE2QixzWX2oNQ/s5TQpOLDKNPu27/ykB14HaVlCcHLhbbCLmu6
         Elaeq3kJjD1F4imrFnHvZ1UJT066IsHa7j4K0m3X98aeQ0RPe2Ey5wkLRwF6trQnIEi6
         tEIRyD1AuaOLT9Jh6WfZZ6GLH6psUcu6sMw/IHizL4+O7dvStVXRFtkSBYhwIzxniCAk
         TS+WtcqnMxWReKMnBKYp8BEiDsx/fVRQxz0usHTvcqvOTjAtP6yA2LqN5SsocjbPjSkW
         zYOEP/X+CQ/qHkwtxqMTjri+OxRFueuCFgsaMOlT7/lSpXv7h/HWC/W2sV92UBk2eWeJ
         jLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990815; x=1741595615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRH5h3jTo2TqZdNdrwv2V8lANzprbc02HuVK7lPEI4Y=;
        b=C9yiepFD1Hllnfxs9mXXeVntQLt2Jfd48hMbbwXo2mkTPkHInCjysfoCdVRl2gCGHF
         zmxxQiScy2gYRY2anx57e4nCRVADlNr75vaDa6aj0aFgK8r6wdbrblny79kgZb45G362
         a3iYVgcq02WLp3doQXRChIkTq2o3U/4/Z3oQA2VwKCUznhxQyL/rUatlg0FZuKy6OBa+
         IJfRwtaYNEdvOu42c4ZmA+ZSr7AohB3MUhQthHlgA6fsi/AX6+2a6EvULyqMhctN1buj
         lCDmXtFiJKlSTQvhj5W0RyxIDzQt9qKK6YYIrCCSSbtRd1UVXeLdMGC1riBeajGTz0RB
         If6g==
X-Forwarded-Encrypted: i=1; AJvYcCXGrd5Cx5OmVU3CB/8euLREBkBHdY2tB5jHnivrcLMPPfWXlOPnTs12+eFm89AjCJpWg9o4CMQgzA0e@vger.kernel.org
X-Gm-Message-State: AOJu0YxVQkzo4On4K6ec6EHFwxvbwoaX3aQz9p870fxUfz2wDwwBGyPU
	jx7pa1iOysY3YoXh6ZDLlwjcp321lpGpp2uindxAiw+72JTliRju3z8DjBJuiPh0ckBcSJXU4d2
	AKaHBnwo0d9i+WLSWp9tjxucO/SczjlY6AhKiTPhWCOPr/49i
X-Gm-Gg: ASbGncs9saGb6ljvdKU+N7uLiwRZu0sgqt5tnYxl9Kwj7bNm3ql0O/LjzQ4KkS7dzeA
	IQaVLCIiUVhxZWB6fZe/THi8VTfGzmx1xjem69uQdW2Lr7NMd543WReUoBbyHTLgE/EH/6coDwN
	48AkvXsFXAyl3q6HhbWZyxp+BR71PDW2GaqRjrBrQcYwp/oHa+EnTRGvGjgw==
X-Google-Smtp-Source: AGHT+IFhPa98pn2QSRV9xraHD57hSB0tHBrG1WLyodlq/Zyqez6QyfJ7io6YPk6jd+qrCZBolOvX6WV57bvRbWW8SOA=
X-Received: by 2002:a05:690c:618a:b0:6f9:7d7d:a725 with SMTP id
 00721157ae682-6fd4a0fbb9emr155711297b3.33.1740990815366; Mon, 03 Mar 2025
 00:33:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303165722.53c98069@canb.auug.org.au>
In-Reply-To: <20250303165722.53c98069@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 3 Mar 2025 09:33:24 +0100
X-Gm-Features: AQ5f1Jrmi46iuNkJxouNj07VOlPBAuSo8t2GayjfEqGDs0ABzz4K6g8LYoX6T_k
Message-ID: <CACMJSesVtZqZeodT5Fd5kmugxGYJn4KjnAzHpcvyGx8Rz53DbA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Mar 2025 at 06:57, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   drivers/gpio/gpiolib.c
>
> between commit:
>
>   64407f4b5807 ("gpiolib: Fix Oops in gpiod_direction_input_nonotify()")
>
> from the gpio-brgl-fixes tree and commit:
>
>   e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::get_direction()")
>
> from the gpio-brgl tree.
>
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>

Hi Stephen!

Thanks, I pulled in v6.14-rc5 into my for-next branch and fixed the
conflicts there, next should be fine tomorrow.

Bartosz

