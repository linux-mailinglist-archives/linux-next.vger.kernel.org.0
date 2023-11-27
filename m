Return-Path: <linux-next+bounces-89-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C27FA598
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 17:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A126B212B7
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 16:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B112534CF1;
	Mon, 27 Nov 2023 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SysesZok"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8310198
	for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 08:04:06 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d9beb865a40so3916237276.1
        for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 08:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701101046; x=1701705846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7kfcTFnc1EIcTrfufgAiSWZaBI8ZkU3ldDxmrr3WA8=;
        b=SysesZokp5xWO/Fl8lCVgEy4lqfbu0NZ+qRRLJz0pnmy8n3ZM57d0McKSVo1ATYsKm
         si1rvtagc74oDGvjO3pj90jlH0tvynj1d5K9qyHb+wQDYLtFhlKN0ZhjCjkluSl3Ki+B
         RYleH2fpS7CUf0SPHcv6y2qzXTlktyeveBrxo9rNo/BM4v66fPEPgaWk1/U8RQR9Gm/r
         aZgF205XF3qOZw3QqyjcL6XF5qZDH2yoQp4EwPj3mVxFEtgQY9OUb4HQ/GZPzKZvydIm
         ZiYnuS8ZANwUxaw8yJApwHzHjU+PpvmlQcHCVzf8+d1tej059Spj/e/t7Z6ddgYLMbkO
         mFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701101046; x=1701705846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7kfcTFnc1EIcTrfufgAiSWZaBI8ZkU3ldDxmrr3WA8=;
        b=CHfA6KKtODzv2krCFCN3o5sJlWz0rYGmisvO5Vibu0X+KeTK9BX1wEjMkYenoNe4AP
         kY0QfcQP50Ko7shB9cyqV456BUoemcwy4MjnxMEDsfhFF0MWnoci5s6VAHkXPcqb4gU1
         Spn27SBkBmOWzvk7qOxW7Ai1Gc0U+MiPfZiHTnkVoCBSFC1vJaRMoYNGgjzNdiE8fMxX
         45iB3Re5p0SEMq5WkX90OcujPmXuCo8TWnjm9IT1wdvs3ApWpRYSNV16L0P0S6oPJmTz
         /B1UMu52WqQi+Ua1XIlpBQ9r3mDkqvBB7skbuqWMqI0h4glb2tuif47Y8NS8YAdgvEMC
         FSUA==
X-Gm-Message-State: AOJu0YxmX3fZ0Qqk3pkoh+9+VOPCtqWTY4JfOFzUwVx+hEOctyQz4FMf
	zPKwsQPD5hHOomGQRCWOkBGK10CRySpqjtc8M7KyWg==
X-Google-Smtp-Source: AGHT+IH34yJLIkZJKXuCRnBcCqV+kUWFq5pvwWNuBFGfgw8Ppgvz1en2RopG7eerUDrKPKL790hzAPbQaxQoDiQvtbQ=
X-Received: by 2002:a25:ea45:0:b0:db3:9994:119b with SMTP id
 o5-20020a25ea45000000b00db39994119bmr10785589ybe.50.1701101046011; Mon, 27
 Nov 2023 08:04:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com>
In-Reply-To: <20231127051414.3783108-1-victor.liu@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Nov 2023 17:03:53 +0100
Message-ID: <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
To: Liu Ying <victor.liu@nxp.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-next@vger.kernel.org, sfr@canb.auug.org.au, gregkh@linuxfoundation.org, 
	rafael@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 6:10=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:

> This series aims to check panel device dependency upon DRM device before
> managing device link between them.  It fixes eariler patches in v6.7-rc1
> which tried to manage the link.  Without this series, the link fails to
> be added for dependent panel devices and hence relevant panel bridges
> fail to be attached.  A real broken panel is "novatek,nt35510" defined
> in arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts as reported by
> Linus Walleij.
>
> Patch 1 exports device_is_dependent() to modules as needed by patch 2.
> Patch 2 checks device dependency before managing the device link.
>
> Note that patch 2 is already in drm-misc/drm-misc-fixes and
> drm-misc/for-linux-next-fixes.  Patch 1 needs to be reviewed and picked u=
p.
>
> v2:
> * Introduce patch 1 to export device_is_dependent() to modules as needed =
by
>   patch 2.
>
> Liu Ying (2):
>   driver core: Export device_is_dependent() to modules
>   drm/bridge: panel: Check device dependency before managing device link

I just applied patch 1 directly to the drm-misc-fixes so we don't have to
revert and then re-apply patches, because that is a bigger evil. (We can't
rebase these branches...)

Yours,
Linus Walleij

