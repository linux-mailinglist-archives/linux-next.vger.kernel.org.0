Return-Path: <linux-next+bounces-126-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B67FD9B3
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 15:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 513E928331F
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 14:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B8232C96;
	Wed, 29 Nov 2023 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tv9+mf4h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FD41735
	for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 06:38:48 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-db527023652so551390276.3
        for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 06:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701268727; x=1701873527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VitFHUDO7lpbwwEpDiSX9K6mtclW0i9+NRl7WDJQuXM=;
        b=tv9+mf4hYoDk2xZVeAIJdYreaEHWjLUGLhDOAO/tn2VtPl6lwH9TdhaWK5+dWBHTU4
         Plp9EcaGrWtxPw54QBz0jC2vfcArJEWLQzq7Q3WRpwE5oJqfhrveKQC3fZl/Zam3RH+p
         eEcgM6MfrA5GQdmWd/0Yjm3fF0Y3GZmJVJLGK+v9ToKXjFM3h5XB77bIAbFSoUNgFsk/
         h756/FEFdU26kTXFBRKjbRhSf1awhRuxTIwOQ/aiYHa1c2OIE9QExxyVqcm1eBjdhHL0
         edgecgfP2kut6lfEGYrXfNlmPUOitk2bY2MjtDwD589wjrkIGSiz7i1mNGgMA9CMG0So
         P+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701268727; x=1701873527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VitFHUDO7lpbwwEpDiSX9K6mtclW0i9+NRl7WDJQuXM=;
        b=SPOGwGtGqyVGtJ+vU+ewiNDYgQAcpHJ08iEFwGZhzu4clQ/yyGExvT+Jg0KqILCdhq
         CwkbWmQc+amVsOHlUGlw7+GOkIqReNagko+8sP1j8C+DeAn2sJJvs4UFcmREL1xx2Uw/
         kPMmARlvNWmHMpn14PZNeHNV/3uhsKey3pJpwYbIZPoennrRlla0JnheGGy/Kl/kYtZm
         u5kKMLo9xhPQE5EHIUGE+Vn5zY8SCfaCHF6dLIniVVS4GXDJ6iraETwL0wtGJDW+CjFh
         ShFW2ihs+JyrmAZuijtGw9Ir2DFIsBsmGXrJ+IICfAdw5da4O9C72OWtFvWM2GIU1+iz
         xt0g==
X-Gm-Message-State: AOJu0YyhGtQ9Zt6pJMlZCdefnI+w32OfthC1xey1kZ7Y06fCemirgLf4
	Wkl/63w+tZe279mhDRZqNZA3TSHM1d7evPMmwQH75+489S3hFtKd
X-Google-Smtp-Source: AGHT+IFn9m5/2pvXGrsuZL1JkkJ7wo07TKiyWdKmwMqkGOMa7/9+521wEHRtk/MN9ZsmYdiUXcwuztNOZ8LxPBTuDFQ=
X-Received: by 2002:a25:fb0b:0:b0:d86:5a8d:6e34 with SMTP id
 j11-20020a25fb0b000000b00d865a8d6e34mr17592236ybe.29.1701268726832; Wed, 29
 Nov 2023 06:38:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com> <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
 <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
 <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com> <d33ovl3ox2u74jbik2bcraeqiqplqoc57p4quapdyydqlyzrf5@vlhszortxfio>
In-Reply-To: <d33ovl3ox2u74jbik2bcraeqiqplqoc57p4quapdyydqlyzrf5@vlhszortxfio>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 15:38:35 +0100
Message-ID: <CACRpkdb1DmH2NJ2nBRtGaB+9Tmbn1tzXafDSpZVxjCFnexz=3g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
To: Maxime Ripard <mripard@kernel.org>
Cc: daniel@ffwll.ch, Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, gregkh@linuxfoundation.org, rafael@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 1:32=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
[Me]
> > It is a bigger evil to leave the tree broken than to enforce formal pro=
cess,
> > and it is pretty self-evident. If any of them get annoyed about it we c=
an
> > revert the patch, or both.
>
> Yeah, I definitely understand why you did it, but I don't think it's
> something we would encourage in drm-misc.

Hm OK I guess, it can be debated but no point in debating it either.

> We've discussed it with Sima yesterday, and I think we would even need
> the extra check in dim to make sure that a committer shouldn't do that
> without dim complaining.
(...)
> Sima played a bit with it, and it should be doable to get something
> fairly reliable if you use get_maintainers.pl to retrieve the git tree
> (through scripts/get_maintainer.pl --no-email --no-l --scm) and figuring
> out if only drm.git, drm-intel.git or drm-misc.git is involved.
>
> If it isn't, then we should check that there's the ack of one of the
> maintainers.

So check for any code that is hitting namespaces outside drivers/gpu/*
Documentation/gpu/* or include/[uapi/]drm/* that it is ACKed by the respect=
ive
maintainer for that area of the kernel?

> Could you write a patch to do so?

Patch dim? Well my bash skills are a bit so-so. But I guess I could
learn it. But did you say there is already a prototype?

Yours,
Linus Walleij

