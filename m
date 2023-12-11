Return-Path: <linux-next+bounces-326-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DE80C697
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 11:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADCCB281452
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 10:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536401773A;
	Mon, 11 Dec 2023 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X7SEk9AN"
X-Original-To: linux-next@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48392D5;
	Mon, 11 Dec 2023 02:31:03 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6FB71BF206;
	Mon, 11 Dec 2023 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702290661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UWTlNeIFjmJ3ht3J2R7jG8wNl/cHwH5GVR0Jqd4/24w=;
	b=X7SEk9ANBgIMGnxT4dzeCUTZ61TIqy7RYbSP1eVbTw1aBSi3NQ1048OsusBh0QOHjjzUu9
	sYthyizBu/CY8OBjR0WVvhMnJ0v/N6PF65ze+UNs15N+geiglqmQjGje+DAB1W3UQpwp1W
	4Wh55PVyLlsTDORnf28gWurV+nZpr9HXLbO0Z8OmDzPOmsbUTIcV3GiA5xXR4YBORDWznj
	M1i/F0zd60tR/kurO2aJf+U52cW+viykR5f31/W8NabHbkT9fZvpzm4uONLV673TrhSEpZ
	PO9fZAmadO/O/s5FWGOJ+mu918OimwmGypZtFv38R+5JZHyRD4mOM8MNl5rxeg==
Date: Mon, 11 Dec 2023 11:30:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nvmem tree
Message-ID: <20231211113059.094f4226@xps-13>
In-Reply-To: <730b71e2-9c3c-4b40-86a6-0794615222fd@linaro.org>
References: <20231211164916.6f0d2357@canb.auug.org.au>
	<730b71e2-9c3c-4b40-86a6-0794615222fd@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Srinivas,

srinivas.kandagatla@linaro.org wrote on Mon, 11 Dec 2023 10:23:40 +0000:

> Thankyou Stephen for the patch.
>=20
> On 11/12/2023 05:49, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the nvmem tree, today's linux-next build (i386 defconfig)
> > failed like this:
> >=20
> > /home/sfr/next/next/drivers/nvmem/core.c: In function 'nvmem_cell_put':
> > /home/sfr/next/next/drivers/nvmem/core.c:1603:9: error: implicit declar=
ation of function 'nvmem_layout_module_put' [-Werror=3Dimplicit-function-de=
claration]
> >   1603 |         nvmem_layout_module_put(nvmem);
> >        |         ^~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >    ed7778e43271 ("nvmem: core: Rework layouts to become regular devices=
")
> >=20
> > I have applied the following patch for today.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 11 Dec 2023 16:34:34 +1100
> > Subject: [PATCH] fix up for "nvmem: core: Rework layouts to become regu=
lar devices"
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >   drivers/nvmem/core.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index 9fc452e8ada8..784b61eb4d8e 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -1491,6 +1491,11 @@ struct nvmem_cell *of_nvmem_cell_get(struct devi=
ce_node *np, const char *id)
> >   	return cell;
> >   }
> >   EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
> > +
> > +#else /* IS_ENABLED(CONFIG_OF) */
> > +
> > +static inline void nvmem_layout_module_put(struct nvmem_device *nvmem)=
 { }
> > + =20
>=20
> I see no reason why nvmem_layout_module_put() should be even under IS_ENA=
BLED(CONFIG_OF).
>=20
> Updated the patch with this fixed.

Ok, works for me. I will send a fixup with the doc change (see the
other kernel test robot report) so you can squash it as well with the
original patch.

I am surprised we get these now, I actually pushed the branch on my
Github 0-day repository and got no negative report within 3 days.
Anyway, I guess they have to prioritize the requests.

Thanks,
Miqu=C3=A8l

