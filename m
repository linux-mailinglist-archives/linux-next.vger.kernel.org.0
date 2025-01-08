Return-Path: <linux-next+bounces-5098-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0DEA067A5
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 22:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6606A3A7094
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 21:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE840202F71;
	Wed,  8 Jan 2025 21:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkpBIZbc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01DA185B6D
	for <linux-next@vger.kernel.org>; Wed,  8 Jan 2025 21:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736373495; cv=none; b=FOXSsPSPMIZBb6nOpM7Wzqc/8oNlvyQfUEb9hZsy06WHP7yQgmoSUNGwjKszyAmmhYyic/hgHYJs4X2JQXJNxXF+R6zJvZ8Mb0lviNmXPjMkfOIcG31Ru/s0zPVSm0N0zhUI0wkEAbKqFdkHtXQCrmcIxo7OuwiWvyEDEZG3moA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736373495; c=relaxed/simple;
	bh=FK+mUlSaMByfEKQbk0i52ivBETDpB6Oqqapu/v4nYVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clGASrWFRoF30zUhh10bYghdaB2hC+i1gvSKTWee9IhFTADke60CTH9X2GgwbM0W7xq8aoDx1ZFi4C4mjdErZTC6XHOhcsSWCFuDgRAeteYrBrXXl2SLkGHRWcwQBtC8Iu8Cp+PSok6C6iS1fjxOP2aMxHPDB5fZxAUl5bunDeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkpBIZbc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54252789365so326732e87.0
        for <linux-next@vger.kernel.org>; Wed, 08 Jan 2025 13:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736373492; x=1736978292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFYATKO+mWKt0qwy0OMR/DtoOIxTyVQl/6FtXcEgSKQ=;
        b=NkpBIZbcww/kXYpCk9iu6PSIr0mngEoPJIREsTyhgk72m3TQ7y9sask0CcH3uMuhQU
         NGDHWmeBn9dvr5Zxom7JogqE4C/yh3V8bSh3VKuUNhShKyOrDpL9P4EY4U0/ZTzpuYKN
         NGYeXlluKouJIVaot8sloNssosZsuddtB6UZVakEsmrRQh9dXcEVd/ALU9PVMti+k5UK
         J8T8O87rb/59oZi05kg2v5ePu31NBH45wRl1mvWo2ww/a4R1k5nAnSgUmtDQ237g/Ynx
         LHz1Rkuil5NIb6sqiP7lJB2RvCt6DBDSoQ46wSoID+7pnhJuV0I0rVv62zm79d6uRsxJ
         x3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736373492; x=1736978292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFYATKO+mWKt0qwy0OMR/DtoOIxTyVQl/6FtXcEgSKQ=;
        b=mEMXJGvG6ME/qNQmriyPHBDnpQVdCzmASty9qJ9ODmMzO+pX8ELNn/Z4PCUmuXPepY
         1HgoOV703tHvqfTOFxq9QSBrM5nm+NNMDj4c5BESox8KuLi8jV2Vm2lFN/cVqYom0bYw
         fF0PHLOAYsmfGgDolEgCRrOisrBFF0A7cQaEOGdrHJSPN+8HUM0+ftBCbZeHh5VymXOR
         DctMdH338aa5rVq2/2xyhcjZmjur29VVfzCwXV68XnYDFZBz+Mc5xD8q5rkf8/mm+f0k
         wtEkwxeN3VpG+iuBidqh/p9MDRJ99V+UdZW+54zHjMH+BlfC2pDuP08OHQGW/OkGSiKm
         Y3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPK/m/Cb6JY1/+NxshOouYGLSo3pOrZHRgszPLeXsnCCPsuoEwCYwQw3SiT2x1WRgTR4LbZhdaUI8D@vger.kernel.org
X-Gm-Message-State: AOJu0YyOk7juXwz9WE+gKq6fUu8nwiN2vfCbJGERHU+4RixcyYHu2cQB
	kfDU/YKqiKRXHMsap2uI4Rwo9S+AeSYbqMlMk+rQfW0gJjemV1GnB6pFmi3Xnal28jB9ETLoHcY
	i4GOxv3daZfjGcVydlv/0LB3UX/bYN44UgLvFDw==
X-Gm-Gg: ASbGncsx/wrF/NGbDMxOfMt/tmdiAuoxLkas6BAmjAutGDzfNCRjrlgJ+eVnyMnCcAu
	DSWpJU7mz1zd4P+czl/0JfU4aI486uWOXOwTK
X-Google-Smtp-Source: AGHT+IF6FRgGu2Y5ZSVfAz/nCPG8riz5KgAZwVw2MztqazfiXPEQfTfteXwkr2V320RNlMyG6euTCK9pqq8B6dbCofs=
X-Received: by 2002:a05:6512:124c:b0:542:6d01:f548 with SMTP id
 2adb3069b0e04-542845b1761mr1066240e87.5.1736373492050; Wed, 08 Jan 2025
 13:58:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106164630.4447cd0d@canb.auug.org.au> <20250109084737.574cfb99@canb.auug.org.au>
In-Reply-To: <20250109084737.574cfb99@canb.auug.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 8 Jan 2025 22:58:01 +0100
X-Gm-Features: AbW1kvaaBG2CASaNrTz0EXgN3Jy9VE65-7H9_9ZihV3ZHN2Zw-d3AXt0jzg_GAY
Message-ID: <CACRpkdZuo-GX+3xjpbLZsDUddEBbKVpfReH=+Ce=470bQ55BgA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 10:47=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> On Mon, 6 Jan 2025 16:46:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the pinctrl tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: In function 'mtk_pinc=
onf_bias_set_pd':
> > drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:606:13: error: unused =
variable 'err' [-Werror=3Dunused-variable]
> >   606 |         int err, pd;
> >       |             ^~~
> > drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: At top level:
> > drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:602:12: error: 'mtk_pi=
nconf_bias_set_pd' defined but not used [-Werror=3Dunused-function]
> >   602 | static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
> >       |            ^~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
> >
> > Caused by commit
> >
> >   1673d720b7e2 ("pinctrl: mediatek: add support for MTK_PULL_PD_TYPE")
> >
> > I have used the pinctrl tree from next-20241220 for today.
>
> I am still seeing these errors.

Sorry for not attending to it earlier.

I fixed this up by just adding a patch deleting the unused
mtk_pinconf_bias_set_pd() function. That should do it.

Thanks Stephen!

Yours,
Linus Walleij

