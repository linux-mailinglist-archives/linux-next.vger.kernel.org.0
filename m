Return-Path: <linux-next+bounces-93-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 906687FAD28
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 23:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C180A1C20C16
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 22:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EBE487A6;
	Mon, 27 Nov 2023 22:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+KKjfYW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273375FF6
	for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 14:13:45 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-db048181cd3so4554097276.3
        for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 14:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701123224; x=1701728024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKi3mY9gEWYH12Kzcguh8/xdDNFjc2yj/HRXk8xcrl0=;
        b=L+KKjfYWy/HWQtj7IlGC5nSnq0AROWcLD5UtCMeYYDckNMm9+TvZx4bOq+jGix8UMQ
         kHW1POQ3O2L3HwW43G8rTVKsnGmaaSkc7mCPo6HDsezcZdCAk1yHi88kqq4B5pwXdA/6
         YzONWZksgUxHjk4ffekDD+4IzdmqzeZ2un8eBu3pgCTaLEjiewElOZKbXVbL796ZZT6Q
         9IC/bi+X4SP3/PZhn1aJEoTUcZBqkQF1ohWlE5mkTcWue93O2+IMCa4YUSBGnYa8En7u
         Aot1zHGFiD/GDTxlMM5ZbS7s7at9bUxfhk2Mx0q0QAUQ4u4l610Jmgb/G8aDw/XZajf9
         Sujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701123224; x=1701728024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKi3mY9gEWYH12Kzcguh8/xdDNFjc2yj/HRXk8xcrl0=;
        b=OQz327jihKbiBdhIbdNT/sQw8CmljZOmB59Ed7fwz7FHHDZXe4ngx8HF/gYQwG8qPK
         DuvB6NVNfByOspP1KH8r6jMDwHuAxCc0vd5DtsMh+ad9lOD8q86ewNtDk2ZesFLiMs8L
         RKzNdKuBXDuOTUCvXX3hPV3KhGpaw6jsuz1F5MqredJnF57jfBJd/bqLhw41bihXykps
         ya/MVKs6JvTx8/6nt3N1keYV1QNxecUgJ/I5qdXHt+aS+1TqqG+jzHMM3Je6RENVFM3S
         jcbVOkmcC9Y1ErzGBUMmrhbjfQrXhOc80++AC18orGSejhcv3KZ48kvs5Q5ALocQ8InI
         RL1w==
X-Gm-Message-State: AOJu0Yw61z6imvBjrtrvyJQWEjlqxVW6ENSyWMB95fKDy5wIy2kxlT7a
	Pm3nnEeKH9z+PmAJmdDq+8+sMv72mQa1WyMsQdpa6g==
X-Google-Smtp-Source: AGHT+IFgZ18g6DnXLy7RFiYscXNiAu4gCNhHYaxDE8NSduVNzVKpXKWsD8UbOdacoRARcYAA9beD8h6cHEgYoT90gZo=
X-Received: by 2002:a05:6902:49:b0:d9a:cd50:b99a with SMTP id
 m9-20020a056902004900b00d9acd50b99amr12883192ybh.12.1701123224146; Mon, 27
 Nov 2023 14:13:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com> <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
 <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
In-Reply-To: <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Nov 2023 23:13:31 +0100
Message-ID: <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
To: Maxime Ripard <mripard@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, gregkh@linuxfoundation.org, rafael@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, angelogioacchino.delregno@collabora.com, 
	ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 5:29=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Mon, Nov 27, 2023 at 05:03:53PM +0100, Linus Walleij wrote:

> > > Liu Ying (2):
> > >   driver core: Export device_is_dependent() to modules
> > >   drm/bridge: panel: Check device dependency before managing device l=
ink
> >
> > I just applied patch 1 directly to the drm-misc-fixes so we don't have =
to
> > revert and then re-apply patches, because that is a bigger evil. (We ca=
n't
> > rebase these branches...)
>
> Erm, you did wait for GKH or Rafael's ACK to do that, right?

No.

It is a bigger evil to leave the tree broken than to enforce formal process=
,
and it is pretty self-evident. If any of them get annoyed about it we can
revert the patch, or both.

Yours,
Linus Walleij

