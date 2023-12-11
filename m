Return-Path: <linux-next+bounces-320-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7380C2DD
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 09:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB1141C208A7
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 08:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01AA20B19;
	Mon, 11 Dec 2023 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gl7pQfnq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AD6E5
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 00:15:42 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-db8892a5f96so3867374276.2
        for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 00:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702282541; x=1702887341; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TXq9YTAU0K/Wyg67l3QF0mK1qAP+uioFbjUi30daDLE=;
        b=Gl7pQfnqeul1cqU4KjVecz+bNXrsTQXRIeny73E7zkFiC5jlDfMIjww7TeGgCkTMlY
         ZyLsSesDpAd5F9nveBiu0fSL07Q8ZEFwKzrlGDtWI7jZUBhKJXAXBWgWEf9IFdCoVyZT
         8xskZmgoLVUZ5iyMCcBulBxn+57jj4XowtU+wQd4lbhicECJ6dAVOZskPOCjPUasyO1m
         ZxonGzVX5mC/POYCPXaBaY0bbzHylJwldCdh2rqfHuMynYb0IjMqy6qdKo+ezUSGJnsR
         Xa7JlqdKlNNfRxXdo4Aza9JDgYi70Nri8oKh2kuICobsWtD6EkCY8gi0zJHNs3hpTaUs
         JVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702282541; x=1702887341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXq9YTAU0K/Wyg67l3QF0mK1qAP+uioFbjUi30daDLE=;
        b=N/2VH95QC19+IcrSt6x6hdm2jQPwfGSfkXQyOIVswSXNiorgxgRr8hRPcU1gP3J2V1
         LGcEy6Lm789YRyYhasprPzzayc+azAb4Eow9w/bi0rZCVNg2wVdOm+vu6XvesU0ZtVx1
         fokLP4Kzxm1MWhccKfxY6PEop5H/kGlKQ/8//xb7FDPol3OIDPTpJZ1Aclit1Kivr9TI
         oHaSUSSHIhyuih2OizsV+gcNqJBOHcFYN/DjrBGehpj8P9ywANkOsoqmP5bLM6we6a8+
         Q4NdgX7z91F+0HPt50I3qh+675mQX5HghGvobGCsVb2fBC4QpXtwGm/Fdn5z0uPgjm9N
         3m8w==
X-Gm-Message-State: AOJu0Yzj+AVNU4vwr08p0/zopkJDHS1j50x6vK+VdTIcHef9ByT6C/b5
	8527pxOyfCH810cYF0CvlrKg0omqqMgEOB8/9EESuw==
X-Google-Smtp-Source: AGHT+IEqQ1QWl9N8VrJdERt7hZAN05TSsYkaTWMXlqSVGHm1KL+k3i3fwo/Z1+5pnTt/WgCjEwjtbr25GU8ej2hs3FE=
X-Received: by 2002:a25:8f8f:0:b0:db5:4b23:534 with SMTP id
 u15-20020a258f8f000000b00db54b230534mr2204353ybl.17.1702282541327; Mon, 11
 Dec 2023 00:15:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211145056.23fbfd7d@canb.auug.org.au>
In-Reply-To: <20231211145056.23fbfd7d@canb.auug.org.au>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 11 Dec 2023 09:15:30 +0100
Message-ID: <CACMJSetGz1fCnqS_HPTLyV8dOWOUtO07-bZKKXu3=3Lk2PGdyw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl-intel tree with the
 gpio-brgl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 04:51, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the pinctrl-intel tree got a conflict in:
>
>   drivers/pinctrl/intel/pinctrl-baytrail.c
>
> between commit:
>
>   c73505c8a001 ("pinctrl: baytrail: use gpiochip_dup_line_label()")
>
> from the gpio-brgl tree and commit:
>
>   6191e49de389 ("pinctrl: baytrail: Simplify code with cleanup helpers")
>
> from the pinctrl-intel tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/pinctrl/intel/pinctrl-baytrail.c
> index 3c8c02043481,9b76819e606a..000000000000
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@@ -1173,7 -1136,7 +1136,6 @@@ static void byt_gpio_dbg_show(struct se
>                 void __iomem *conf_reg, *val_reg;
>                 const char *pull_str = NULL;
>                 const char *pull = NULL;
> -               unsigned long flags;
>  -              const char *label;
>                 unsigned int pin;
>
>                 pin = vg->soc->pins[i].number;

Andy, please pull the following into your baytrail tree:

https://lore.kernel.org/lkml/20231208083650.25015-1-brgl@bgdev.pl/

Bart

