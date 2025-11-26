Return-Path: <linux-next+bounces-9225-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8CC89F47
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 14:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F963AAC92
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 13:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FA12765D4;
	Wed, 26 Nov 2025 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8a+ha1e"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2359E27602C
	for <linux-next@vger.kernel.org>; Wed, 26 Nov 2025 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764162798; cv=none; b=V8nh5qdvEagPByFaZqFgcpVcTTjY9ZDzmPzWo+DCaGi3uC4AF/4Dl40gMy3846jGbPvIptKmubeQXLvRbTVqxCO0xK45tjrn4/ZfTVE5+/OaWntdOTCzYNfIU96jl75r6BxoaMgoYuHdsW/lbiqaSDZ368YwUrv7iyFAhfgMlFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764162798; c=relaxed/simple;
	bh=kQM5qsnL//ZJkZMh9tLs3eLdFe/nlMcmYnI0k3VYMm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFp2mnAC+d/8gj37+Zga1Hv1sCDOk4pMJMkLmYEATQ/V3pg+Wi677jKwPXNL1PSbhstpzgYio69Ntg3G3gVOzHMHruBh0Td/nYrWwGbClJndgy1+O0WWE7MMWvLNvrmyxuMZE1UzVTCEsBvDfqhgL6t4oKIm3em34JErN4HV0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8a+ha1e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B20CC2BCB4
	for <linux-next@vger.kernel.org>; Wed, 26 Nov 2025 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764162796;
	bh=kQM5qsnL//ZJkZMh9tLs3eLdFe/nlMcmYnI0k3VYMm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l8a+ha1eeH2yA0oILirGauWCC6U7Jx/JoOk7ADTxriXNhASuwUmLlWiCs5kYNm4Op
	 6XNxrEostauqV/8PQcpVLuQCwEhH1uTFPcnmxqy5jBQ+psmfrEgpVU8TniZmioQ3st
	 MEPwMoPS7TOoV3EUwGm5UAUebojwpX7G6ITzQx0FWjPc2s4uXXmu1FOrgnNbVA4ReK
	 8srbPfocSbBdiOKPAJCRWnSbsIwIkDXhPBsRupFGoI/BZqXvYDjSMCB2rr62X1l0hE
	 VeMzXT+KTl6+IMeAh5tiMOIBT3chQIqCrZzcBwzT49zz341nTDd3LN0ZEz7UwkwA/l
	 mpqDX1V4Dpt+A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59431f57bf6so7157799e87.3
        for <linux-next@vger.kernel.org>; Wed, 26 Nov 2025 05:13:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVl7UhDJsw55x41ommsgeUoCa2VAHJ2kCvBhsxhWcLjKcohIbHGws49u2Xcr23glWOF6nOGph6HNSV/@vger.kernel.org
X-Gm-Message-State: AOJu0YwYYhrNceZ2pKw39JMUSyv/BinSq+qtc7m0c/a4bjBPyQyBl4pH
	94PsDv8dpESHDrnkQ1YjpCzKEb0L0z7gEF7vvp4pEBsQE+Y+mjniCWejC4hp2O6Exgbk1cI1PIe
	BuyrGcz+8JKHg+H/VqBVI1Dq5lp03fUbW42+/ekWHIA==
X-Google-Smtp-Source: AGHT+IGnxfuv/w8mMVX2aB+rHOQLgECwTUIQeAqwasXlnyq5xKWyJzJsqDqtuQCV9ee/0edID7j/VfV2gMgsRG40dFc=
X-Received: by 2002:a05:6512:3a82:b0:594:282d:f40c with SMTP id
 2adb3069b0e04-596b5277be8mr2625488e87.31.1764162795120; Wed, 26 Nov 2025
 05:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com> <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod> <2023112739-willing-sighing-6bdd@gregkh>
In-Reply-To: <2023112739-willing-sighing-6bdd@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 26 Nov 2025 14:13:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
X-Gm-Features: AWmQ_bnz6SpAZkE0enjhk9B-isNCGLXdzB_nbMX-AJzZrxJLh-qpR4CJt3SMChk
Message-ID: <CAMRc=Mc3T1u1sa0P+78dfhtoyBPc+9zsJ5sGP=ZLR+S=h16vZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to modules
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Maxime Ripard <mripard@kernel.org>, rafael@kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org, 
	linus.walleij@linaro.org, Liu Ying <victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 7:21=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Nov 27, 2023 at 05:38:13PM +0100, Maxime Ripard wrote:
> > Greg, Rafael,
> >
> > On Mon, Nov 27, 2023 at 01:14:13PM +0800, Liu Ying wrote:
> > > Export device_is_dependent() since the drm_kms_helper module is start=
ing
> > > to use it.
> > >
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v2:
> > > * Newly introduced as needed by patch 2.
> > >
> > >  drivers/base/core.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > index 67ba592afc77..bfd2bf0364b7 100644
> > > --- a/drivers/base/core.c
> > > +++ b/drivers/base/core.c
> > > @@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void =
*target)
> > >     }
> > >     return ret;
> > >  }
> > > +EXPORT_SYMBOL_GPL(device_is_dependent);
> >
> > So, a committer just applied this to drm-misc-fixes without your
> > approval. Could you ack it? If you don't want to, we'll fix it.
>
> Wait, why exactly is this needed?  Nothing outside of the driver core
> should be needing this function, it shouldn't be public at all (I missed
> that before.)
>

Hi Greg!

Sorry for reviving this old thread but I stumbled upon it when looking
for information on whether anyone ever tried to export
device_is_dependent() before.

I have a use-case where I think I need to check if two devices are
linked with a device link. I assume you'll prove me wrong. :)

The reset-gpio driver is a reset control driver that mediates sharing
a reset GPIO (defined as a standardized reference fwnode property
"reset-gpios") among multiple users. reset-gpio auxiliary devices are
instantiated from reset core when it detects a consumer trying to get
a reset-control handle but there's no "resets" reference on the
consumer's fwnode, only "reset-gpios".

It makes sense for reset core to create a device link between the
auxiliary reset-gpio device (the supplier) and the reset consumer
because this link is not described in firmware - only the link between
the consumer AND the GPIO controller.

Now in order to make gpiolib-shared.c code (generic support for shared
GPIOs) happy, I need to handle the side effects of interacting with
reset-gpio which does a similar thing. To that end, I need to know if
given GPIO controller is a supplier of the consumer described in
firmware OR the auxiliary reset device which is only described with
software nodes.

The logical thing to do would be to use "device_is_dependent()" but
this thread makes me think that won't fly.

What should I do? What's the "correct" way of checking if two devices
are linked? I assume that fiddling with the supplier/consumer lists in
struct device is not it.

Thanks,
Bartosz

