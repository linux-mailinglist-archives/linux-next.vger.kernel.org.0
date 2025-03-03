Return-Path: <linux-next+bounces-5637-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A41A4E756
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 18:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97EED8A236C
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 16:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F68A2780F0;
	Tue,  4 Mar 2025 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijEMHlay"
X-Original-To: linux-next@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A082780E0
	for <linux-next@vger.kernel.org>; Tue,  4 Mar 2025 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741105549; cv=pass; b=XtvG3D/vOVhwi2C3zlM5qhxtMU0QOCjl1ZjSumCBDLzn7Jhf9EsQnOh08MZNu5ipxOWGxKAGbt/aKM6x/T5ThJx91OnwZNl6AdHJ5XX21+hc6/4w1qZTknHGSi3FSvaVZfpo3CSp3XM9vmqA6Fa3s8KXT+F5q6zM2YXYC+68QKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741105549; c=relaxed/simple;
	bh=XqgYTASZdBx3dZT6GACGqxIac1H6OFQPjap01jrQ3Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3OejKsuQwC9o85joz0PhbyimAk/ic1WWV/7ZPzljU8rRhEXK8anw7zCIX+lofHC9gDCVleQdUKyZj4Ed+Rt0Ps7ZzAWbI0SISVv7CPW0Bqym1sBVJ5cz7J9ZWV0PT6Lsa0IasHnlDH/bkcDE8oTP3v0Gk7lvwHP3RPPVQ7hNn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijEMHlay; arc=none smtp.client-ip=209.85.128.181; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 25C7E40D1F40
	for <linux-next@vger.kernel.org>; Tue,  4 Mar 2025 19:25:46 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ijEMHlay
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gx207NCzG3Fp
	for <linux-next@vger.kernel.org>; Tue,  4 Mar 2025 19:24:06 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 1C7274276E; Tue,  4 Mar 2025 19:23:33 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijEMHlay
X-Envelope-From: <linux-kernel+bounces-541162-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijEMHlay
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id CE5C642378
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:33:55 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw2.itu.edu.tr (Postfix) with SMTP id A1BB72DCFF
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:33:55 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 002A8188BC85
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58D51EE006;
	Mon,  3 Mar 2025 08:33:40 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A461D9A5F
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990818; cv=none; b=Cbe40tanUPbVifQ7TsKZ/5uSIIzwhqDLHkquQK3tvYzpd/VhPdfXD3fanoCFOlFUSEwavRndUIfK9CNGU/ipFpzFzNYm/Epf8NLOTqnqj0J09jyzCTANV7lRGhrMNp6ANnDWBn4boaDhjTxMcyj7BzA9G/KztkBO+bptKQN6LUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990818; c=relaxed/simple;
	bh=XqgYTASZdBx3dZT6GACGqxIac1H6OFQPjap01jrQ3Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecGOl3EL8VV0molKNssovEvu9wQ1rmyXnGu1OqIy1sH492S9vz6vIFd6qEsWz/AbaSbPD3Y3EykcsUS2wqaY9qYOh4fTq0r+P8fH46uqw2sgvZLJ+J8WIR67F5csojKON1egwT20OH4e9/uFqTJMcBy8QU1qB2MIqx7YLEYopNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijEMHlay; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ef7c9e9592so31381237b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:33:36 -0800 (PST)
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
        b=K7CIyKfBvSn5W7CLmJVddJRgUTSC4QYVeJ8j+7mxl5AJysY0quY0cle5qnUeuEikml
         4NmbhCXqe08IbtOICeOJwshotJn4WkLfgLXyyGKEQexbeRWGvCZ2vrYs0xstj8RYRLEA
         pddzB5oLFf9TP04uxgdNF5B8vkqAqqGkAfHgR9Ig+7vDpWOFpigin3zMVToEXXm2JPrr
         27sWhgPkPN2nABplQ6TN+KEP2JrJSfDhhRTkrd5SBFmbzkhQGyxSWY/peVGovCxXWRF+
         ng5v7P6UgYmD856Z2fyp3/KOPYUBi0U6qCmLl7x+ZsxOJsA3/Q3dCScjdN+mXdYw5DJ2
         cAJw==
X-Forwarded-Encrypted: i=1; AJvYcCW6RKAXB8vLQo7wQ1r53ps8B2FWY5rIxo1paEBLuk+qj2GGdSW/s2gSB2wb2bSqO00HxB4qx+IsX0TS6MM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI6A1Ry160B0n6ztCVsqRmuzkLajFln61SOuaX/mpGG8RjFSi1
	5nfqPazLf7fbJZtUWqbh3nUbypvcvYzV+iqSpI8C1zTBSLR6PYKYitPJQOVN1YFuBv4RVUgCr9T
	wP8mi2PRe1xw8TKFP4JEvD4sc/qll56cuXenmOw==
X-Gm-Gg: ASbGncuYKoRXscXKr9ZmUFJ9FgkCccCgIa6vacjA+mEakBNwlWfEyt5KRYLsHFnE+wP
	ZRRiAnbBuTmdfpiPkuekcfq1tJ6Om2Edwjcxk1VKgW+qb3Qi7YWtGCdRAXt65De0ndHPeDx1OVf
	V9EGYoOJE3jQBcyHLG2gPS7gs/IwYqcKauRy8MOPP1b0DYXjFbPlNQDiCkag==
X-Google-Smtp-Source: AGHT+IFhPa98pn2QSRV9xraHD57hSB0tHBrG1WLyodlq/Zyqez6QyfJ7io6YPk6jd+qrCZBolOvX6WV57bvRbWW8SOA=
X-Received: by 2002:a05:690c:618a:b0:6f9:7d7d:a725 with SMTP id
 00721157ae682-6fd4a0fbb9emr155711297b3.33.1740990815366; Mon, 03 Mar 2025
 00:33:35 -0800 (PST)
Precedence: bulk
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
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gx207NCzG3Fp
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741710252.86555@LUjy+J6p/dIi1iV1e12kDQ
X-ITU-MailScanner-SpamCheck: not spam

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


