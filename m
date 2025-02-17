Return-Path: <linux-next+bounces-5472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECCA37CDA
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 09:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE4816943E
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 08:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7DB19E7FA;
	Mon, 17 Feb 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swhK/EsN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039C919CC02
	for <linux-next@vger.kernel.org>; Mon, 17 Feb 2025 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780031; cv=none; b=AxA8lOScIXlE4alzUKzTp7GiOQvdP0nSYyfsTHIlPW6+yDlnPxz5qO1B/xGLjuu7+3FoKSbUPV/tsR8mSEgNIMTURAKtNKWYEoo9BOJbkd0ksPFnLradQ1s7nLCuVHo1akZnFMVJsMDeqJKNg+fQDUtPQ14MoF7DQZDtfJFFWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780031; c=relaxed/simple;
	bh=2vvsH++oEpgrzni4cOBmpiTecWbiP1mZzNBQJfLduOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJA17J1vZVrPrOEa69ffVpfK3WIFylDc6hJyaeNhcmGUID2FJiuHMCdcaxg9HTdiNoFXmS+1GG3tmWIXPHQn194RWM+ZFVkMeUMvLxpr/NCpOxZ39W2g9wLJCKpE+4SBfdhz1Mqw34MBFm/bRUkkfg0N05pC3HCgkqMgdhHVhmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swhK/EsN; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso3094426276.3
        for <linux-next@vger.kernel.org>; Mon, 17 Feb 2025 00:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739780028; x=1740384828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vUvD6Wb4bKbXDA5rYCKjnBSk2CkpRNTlFl4Z6+I6yk=;
        b=swhK/EsNTxGla0Xy7CyXAsMcXkOOXrL3RuJNT0MbNVkZX066uW4mOHMDkroiohShaA
         K5NzmeUU05YkhxJHxW926A3xsZmXAmr2hFtqbP87YkVMLg8XNuGL8BXWutOughgF11Y6
         ge+o7WwJ2I7rf3hNqUMA17sghumRwYx0YllNUWNI1i23O8RFgt5iODqNl3MZcSRPU13H
         YE1VZO/jr85NSp4OrVN3gu/Yzv0KkrNGfNyThEbaNUkZWpZq2pvMKDFbP1ZV/+/pDoYc
         EQR+0SRJcFR/vIc3r636iCVsxDy+T0NUHP7VwQgpipwiGw3boUboab++ZaSmecz4rYKE
         Xdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739780028; x=1740384828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vUvD6Wb4bKbXDA5rYCKjnBSk2CkpRNTlFl4Z6+I6yk=;
        b=lZwIdT6Ywt8voUe4Snl+zuP+sWJ3TkxA/FvkUyj3QSrEPPs34Cu56XgDCO6PGICMkR
         RX1heUhlZBtn6U/Yrq1Xe3GQBvLmVoSYzGK1l4y/frRjuoR72aNoyu6lwhiQr9/KMQuB
         Z9aZ9OyJ/aLwYVf+fSkdGlHT9c6sz338Ya0kLm0e7DBhfel+hPJ+IlVl0/FsynTvENdp
         Z4dxj5t/Ow1i9GNLGNEwqRtsGy0VVRoAjckRF1ZZfrs+Gasasev0QMYj7K7dNdD8jriw
         x2/QqAlikMI2wQjlK+abMXa7L0Szpq9E551et9PN5TMO6unBZJmrJ6CzgNucXzA6uuy5
         HA6A==
X-Forwarded-Encrypted: i=1; AJvYcCU8F2mbIhZvaKvrZpyOggKpEnCjWA1cTs58eqRf+y9I1z8ivwkwP1sV5zOBTUHdRRvqshtNgyczAoUg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mTIy3ACAFJgWwERnCpaPAqrVYKPrb2MAzeyPmjylzFU7v+5h
	9e0jPuvPPFUmBk3ai5UBsSAe38cNq3gdxXUrGX0kSat1ps/xqEahhuKsRsBjI/OQb/N+Ehd+2Gy
	IppJ7jREXtBVRyipxnlX48gSGVoyQKush+TrQIQ==
X-Gm-Gg: ASbGncuihWrwzIZpD/CLAwGb3ebvsJIHr0nshlpw+QvTxARcn6LUrgAsWHW8jlkdMPS
	XE8sJpOYK6dxvxLrNvNlIjw2ZZ6UWG94bv3+8/BJOZdy2VTr1PAhtyT4jgw5ETOzRQROPsm98z2
	6ZebEthKPNKSYJzPaBeugBIryrqg==
X-Google-Smtp-Source: AGHT+IGhG4JmDjohhAOxK6zQC2HkB4OQJvmeeLoUtAY1aE04jtCBv0KkcdwOEK/nu8lJGd5cCt6O3CicDfDqEiyc1HQ=
X-Received: by 2002:a05:6902:72e:b0:e5d:dced:9ce3 with SMTP id
 3f1490d57ef6-e5ddced9e5amr3523969276.25.1739780027735; Mon, 17 Feb 2025
 00:13:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217145642.410f6a1c@canb.auug.org.au>
In-Reply-To: <20250217145642.410f6a1c@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 17 Feb 2025 09:13:36 +0100
X-Gm-Features: AWEUYZmKr-hV9zmc9eGWoJMPooRZiXyITAh8y2fKaHgSl5uWAQAPKS7Kw6ypn9I
Message-ID: <CACMJSesMvFBd3cvCZgD+02puEMbNgrxKgSvJtu23rt6fAAOMvw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the iio tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Angelo Dureghello <adureghello@baylibre.com>, 
	David Lechner <dlechner@baylibre.com>, Guillaume Stols <gstols@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 04:56, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   drivers/iio/adc/ad7606_spi.c
>
> between commit:
>
>   d2477887f667 ("iio: adc: ad7606: move software functions into common file")
>
> from the iio tree and commit:
>
>   8203bc81f025 ("iio: adc: ad7606: use gpiod_multi_set_value_cansleep")
>
> from the gpio-brgl tree.
>
> I fixed it up (code was moved so I used the former version of this file
> and applied the following merge resolution patch) and can carry the fix
> as necessary. This is now fixed as far as linux-next is concerned, but
> any non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>
> From a1072aac97bdaf3042fe2def4d7e6e7fa928cfbd Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 17 Feb 2025 14:52:30 +1100
> Subject: [PATCH] fix up for "iio: adc: ad7606: use gpiod_multi_set_value_cansleep"
>
> interacting with commit
>
>   d2477887f667 ("iio: adc: ad7606: move software functions into common file")
>
> from the iio tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/iio/adc/ad7606.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
> index cb3de1bd15b4..7d83bb320249 100644
> --- a/drivers/iio/adc/ad7606.c
> +++ b/drivers/iio/adc/ad7606.c
> @@ -1259,10 +1259,9 @@ static int ad7606b_sw_mode_setup(struct iio_dev *indio_dev)
>          * in the device tree, then they need to be set to high,
>          * otherwise, they must be hardwired to VDD
>          */
> -       if (st->gpio_os) {
> -               gpiod_set_array_value(st->gpio_os->ndescs, st->gpio_os->desc,
> -                                     st->gpio_os->info, os);
> -       }
> +       if (st->gpio_os)
> +               gpiod_multi_set_value_cansleep(st->gpio_os, os);
> +
>         /* OS of 128 and 256 are available only in software mode */
>         st->oversampling_avail = ad7606b_oversampling_avail;
>         st->num_os_ratios = ARRAY_SIZE(ad7606b_oversampling_avail);
> --
> 2.45.2
>
> --
> Cheers,
> Stephen Rothwell

Jonathan,

I'm repeating my offer here - I can drop the iio patches from my queue
and let you pick them up to avoid conflicts in next and during the
merge window. How does it sound? It's still pretty early into the
release cycle so I'm fine with rebasing my branch.

Bart

