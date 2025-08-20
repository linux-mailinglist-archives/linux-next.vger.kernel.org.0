Return-Path: <linux-next+bounces-8032-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D80B2D466
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 09:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 361D71C23354
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 07:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A452C15A5;
	Wed, 20 Aug 2025 07:02:31 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912B158DAC;
	Wed, 20 Aug 2025 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755673351; cv=none; b=FxKnHyoV1gtMVdFVA7HjSWJZjgzZElpSpeOLMy/eea14zn9e960ygVXEbtXmciKONoAXbtJhWjZLl1067AQN+4Kg/AhIQoQes9mwWnvuq+HDEsEmN4J6fYBXrv0safGR/X8XbpHs7JO84T2RldOgZXbf6siCU2R0tGeMggcwlDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755673351; c=relaxed/simple;
	bh=jVqQhjeddwNoB1/ZHfH1bxrD8cV5PpPIbyK4ZcpRwsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDQf2k1DnPjnUS4rUATNIVG740wbFJ5i6jIH5zTPd+D36Yo5SuIGW8qWbSWw3iOK/yT+XAV2efAZ3FWazq28QDA3xzKNCPr705/t0MqsH7JxbnDhklFQqDzfePx0TTI2ihWQLvpoQZYkFL/H7pBZLX/qRzcIBEjGtsXSxyJb0ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-50f88ee8ac3so1894549137.1;
        Wed, 20 Aug 2025 00:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755673349; x=1756278149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85tJujt3Cd6/zX3fsN1kUuMkB+QsEeF2UMzbEd7Xnu0=;
        b=Yico8VhqVDgOPtrENBiL0R6dF+AecV3HKVawGsZAXm9tGQgI64oLQVs7setZJ+c+Fj
         hCGfaEXkS3B7Ju6F8wT3pUpoLp1vpKyPz4mMGwBfBHqUus1QOOcudUNAyk6dsZSghmtm
         qNyrVvR9f3LPN4B4CzGFFAELTBeYDDqFGbye1aLAik7VtAl0gz733TO0Bsqkegm6V7ja
         Lxzif4Y6LplIIdxJP6m1Ri3Tu6aKId8shW4GecJPSsSxa0R9klL4IOSo/OT2/uh3tXrt
         S2AQJGRNsSnDw5UNabcQNGzYgO64JHL3B14VVVm6yExIoLBjQPM93CdDQExGyVYCki3n
         xsrA==
X-Forwarded-Encrypted: i=1; AJvYcCWbsMq78ASFTwNSixBPw4EAjfKvnDknqmeTLOG+4gAdfONz3x11P22KgcC7q7QkttU6DKohZO8Kc3+r+Ig=@vger.kernel.org, AJvYcCWw7GJk7ncZ3NbwbyZ/BJMlDmTDN2eCZRkQ1tiKLJihg7trars2Q8O6HfN/y1hTRILYomvQKAdrayUJRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSlw/tu7hvPG2LyVSblGJWdN3os8XEMVwD/LukQ9dRmjKxa8Y
	dRPW/oP6Hh9sDM6BsEsHu4en9JvFph9bROVxjRX8d6w4A8pXYMIrvKzrHCxKVDIv
X-Gm-Gg: ASbGncuoJmpEkYFebQ66op0YAckxXm9FuLvbrkoWI6Stvhk3aOjOhbTjKnZEj3N/CEy
	6hgZKXgkbnlqtFYFiR7C/pCJ2n3gc/qXMDlNHlZ5Zd0r+Z6mTrLEAd/7l6kBPdKEiZBkVitc1ln
	+VPDLWm2lbmulyFHd4uMTlRRbjo4Hv9i9llrkAhbNghZynhROk9wO6yWk2tFsxDC+6nnpyii18g
	G1Z6o4loYZpwrx/7dXjsdV1cRIvhmHGEVsSWGoiIsRxCtuHfqQrsaPG/mAG4vEuiNk5GXlqdJ9N
	iUCKXYfrTO213GkAEihKAIX3w8lR2Es9OhXjRShb8KI4A6KyH3FgN9whNuYCAkxg9mMxU3vrCSQ
	Ver9EXEpCk603Y2cUjmzEYRfPN7wXD21XHGC/GRv2eI9EKjhOgTapCPHx9FZ5
X-Google-Smtp-Source: AGHT+IECgH62KqW/3+98eOWyRkVfxJEhH3syADkoP94pPkNqLHSKeBgZB1pz81uXyla+MwJGOZN3LA==
X-Received: by 2002:a05:6102:5111:b0:4e7:db33:5980 with SMTP id ada2fe7eead31-51a4f53cd8fmr552839137.11.1755673348812;
        Wed, 20 Aug 2025 00:02:28 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890277e3798sm2713458241.7.2025.08.20.00.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 00:02:28 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-890190c7912so1475146241.2;
        Wed, 20 Aug 2025 00:02:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+ezRuhwjSTF994z5BiuXSeb1kf/W3AKEjmAAv4IIW1HUJSk3wv85lF/BKMmQt2Fa/5agB9rMsCC/moBI=@vger.kernel.org, AJvYcCWU60Fc8b0wPw1JiChHGKvS7EPJ3AVyooV4cXSP+5hprERK8/SISbgiJkK1mws+1YdGMdcZSwKq/Ym0Qw==@vger.kernel.org
X-Received: by 2002:a05:6102:160c:b0:4e5:acea:2dec with SMTP id
 ada2fe7eead31-51a4ee317c2mr493455137.7.1755673348317; Wed, 20 Aug 2025
 00:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820130227.5661da82@canb.auug.org.au>
In-Reply-To: <20250820130227.5661da82@canb.auug.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Aug 2025 09:02:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj6dQqmdFYuHPEPL0pxefZ8m9kA5Dq_ZA+YRw4vLvreQ@mail.gmail.com>
X-Gm-Features: Ac12FXz1IMAhVxBalWq_PYPKJ7-EuWxsMXwLZzxpmE8VkWIbqwB7yZCpfW31JVI
Message-ID: <CAMuHMdWj6dQqmdFYuHPEPL0pxefZ8m9kA5Dq_ZA+YRw4vLvreQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl-renesas tree with the
 pinctrl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

On Wed, 20 Aug 2025 at 05:02, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the pinctrl-renesas tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/pinctrl/renesas/pinctrl-rzt2h.c:161:14: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>   161 |         func = pinmux_generic_get_function(pctldev, func_selector);
>       |              ^
>
> Caused by commit
>
>   90f2896d7dbb ("pinctrl: renesas: Add support for RZ/T2H")
>
> interacting with commit
>
>   afe1af86ff05 ("pinctrl: constify pinmux_generic_get_function()")
>
> from the pinctrl tree.

Thanks for your report!

> I have applied the following merge fix patch.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 20 Aug 2025 12:42:30 +1000
> Subject: [PATCH] fix up for "pinctrl: renesas: Add support for RZ/T2H"
>
> interacting with commit
>
>   afe1af86ff05 ("pinctrl: constify pinmux_generic_get_function()")
>
> from the pinctrl tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -151,7 +151,7 @@ static int rzt2h_pinctrl_set_mux(struct pinctrl_dev *pctldev,
>                                  unsigned int group_selector)
>  {
>         struct rzt2h_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> -       struct function_desc *func;
> +       const struct function_desc *func;
>         struct group_desc *group;
>         const unsigned int *pins;
>         unsigned int i;

I will fold this fix into commit 90f2896d7dbb ("pinctrl: renesas:
Add support for RZ/T2H"), as it does not depend on commit afe1af86ff05
("pinctrl: constify pinmux_generic_get_function()").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

