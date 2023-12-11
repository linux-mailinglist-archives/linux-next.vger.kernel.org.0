Return-Path: <linux-next+bounces-333-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 484BC80CCD9
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 15:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB83EB20C55
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 14:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1547C482F4;
	Mon, 11 Dec 2023 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hrBFkik9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66A759EE
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 06:04:21 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-db538b07865so4718640276.2
        for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 06:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702303460; x=1702908260; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9CFck6j5mISD+nr8l97lbay7YxJi1mf85R6XUu8mP+0=;
        b=hrBFkik9oFxUX5wMVj4LYekT0SWiYmqBBGl6FTPR6MPSllkOg/0ZVVQ9tGR1/FGMln
         ehidZO6X6MKpQUs6JCDXX/26IVvykFkqW6drujkokWf+fFbfInaywyX9vttSsf5+Bvvz
         wtY8c29HxMWGuFpjqTukIz0SrcTj9U0U288BmOevNDKzwtwCEwYISCryh+EVJzuno3jR
         lmeJpIurpKpd1YUpu53gEjnjGc4Mq2sG+LnRXIlDCmcgkyi+ZnaahQKpAwEkRYe2thP5
         IKWypKlyyOWerplf6iTcnIZr52rL0nc2gDYDbQl7v/HLcjvU2Ev6OMGTrBE2N8iILrtt
         TZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702303461; x=1702908261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CFck6j5mISD+nr8l97lbay7YxJi1mf85R6XUu8mP+0=;
        b=KoAU+W7/0LCQwhWBunrClydo4Ysl/8FPl/Cl/cJcQQ1X1HqTq1TTv9cvov3UeP31zp
         IOgrs/XVPfnc9DMmOFeZW3HI1aJ8icGmEurWddeMyPxeJ3xn21yok6SI5BUhQUa7D4yf
         dG0nMy9uM21r+TYOIzfOSoEdLst9eHpvJV8OvRrgSihk8Fu23qa1IxrygbMxfypIbpZh
         TQxkrePGDxrwqZecQE1VYB/zJyreGbwAtyeII977LCx66o1/kjPWjDLlOAVVMuzCkHoa
         b1UgbQT2o26pDA2o1fq5vCxss39hXhHHG+7U5hKx1arTxC3IzbNHcD+cger+mK0obs8c
         d12Q==
X-Gm-Message-State: AOJu0YwIkGE7fajzgvAW97ZChnNT/9SQ7snFpbUWovfVYqDMcIbtA/nY
	GZhO8tnHDDOcfQk9PnQb6bbDgT3cp8rojG8PZf1eXg==
X-Google-Smtp-Source: AGHT+IFJfV/y2PnGfaQT/1mvy7rqc46THwn/8r5BmZmLNDkolpvzIx6WNKWKCigIVsmNcnTu01u0CSEZ7fib68jKE6k=
X-Received: by 2002:a05:6902:4e:b0:db7:dacf:ed9c with SMTP id
 m14-20020a056902004e00b00db7dacfed9cmr2473744ybh.125.1702303460564; Mon, 11
 Dec 2023 06:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211145056.23fbfd7d@canb.auug.org.au> <CACMJSetGz1fCnqS_HPTLyV8dOWOUtO07-bZKKXu3=3Lk2PGdyw@mail.gmail.com>
 <ZXcRMTFitYohcFfS@smile.fi.intel.com>
In-Reply-To: <ZXcRMTFitYohcFfS@smile.fi.intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 11 Dec 2023 15:04:09 +0100
Message-ID: <CACMJSeun5bCUwkVZPXpc5mKqyj_XztUHTXafuz5Psc_8LCKkuA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl-intel tree with the
 gpio-brgl tree
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 14:40, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> +Cc: Linus W.
>
> On Mon, Dec 11, 2023 at 09:15:30AM +0100, Bartosz Golaszewski wrote:
> > On Mon, 11 Dec 2023 at 04:51, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > > Today's linux-next merge of the pinctrl-intel tree got a conflict in:
> > >
> > >   drivers/pinctrl/intel/pinctrl-baytrail.c
> > >
> > > between commit:
> > >
> > >   c73505c8a001 ("pinctrl: baytrail: use gpiochip_dup_line_label()")
> > >
> > > from the gpio-brgl tree and commit:
> > >
> > >   6191e49de389 ("pinctrl: baytrail: Simplify code with cleanup helpers")
> > >
> > > from the pinctrl-intel tree.
>
> ...
>
> > Andy, please pull the following into your baytrail tree:
> > https://lore.kernel.org/lkml/20231208083650.25015-1-brgl@bgdev.pl/
>
> I can do it, but why?
>

You were the one who asked me to put these commits into an immutable
branch in the first place to avoid conflicts with the baytrail branch.
:)

Bartosz

> Conflicts is a normal practice during kernel development. And I believe this
> particular one will be solved by Linus W.
>
> Stephen, resolution looks correct to me, thank you.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

