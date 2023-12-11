Return-Path: <linux-next+bounces-332-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2842880CBC6
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 14:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D28A3B21347
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 13:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C560247773;
	Mon, 11 Dec 2023 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aMnK32FX"
X-Original-To: linux-next@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AF12D5F;
	Mon, 11 Dec 2023 05:53:51 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2049AE0009;
	Mon, 11 Dec 2023 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702302829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G91nbRDQvTxgKQfiCOALo2gwKx6l/eFwHnf5hoG+LM0=;
	b=aMnK32FXCGdwAu4nD5lUDStjrPYv6UY2bfRpSkznOdBUAROGO/gyK7D1+VFSOQDkJUtoGR
	BarM4TsD+NCHH2SuhVCXltjhSLdHnImDZLJBe8PJlvYn6m8s5erXweYoiZFAPk9kZTcC/0
	y6ZkMzWSgwOk4G48XP8ND6/H3hCETgVcVSjLkRCcOyFmHARjfEbBulMoo3NTmrseHtd4F8
	ybQJt6ww22sW755aErcs/gxkW1unfwNLR/OUTV+jBgJjyAnULZx/JfYkAXg2eeDhYe4Ava
	pIyi0beOnuVE1ndW8y4xhtVoN09sdubK0SdAGRNY07BVgefVUR6hIfYJhfcsBw==
Date: Mon, 11 Dec 2023 14:53:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nvmem tree
Message-ID: <20231211145346.6665a16d@xps-13>
In-Reply-To: <ad69788c-468e-403e-85fc-a3d82add5041@linaro.org>
References: <20231211164916.6f0d2357@canb.auug.org.au>
	<730b71e2-9c3c-4b40-86a6-0794615222fd@linaro.org>
	<20231211113059.094f4226@xps-13>
	<ad69788c-468e-403e-85fc-a3d82add5041@linaro.org>
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

srinivas.kandagatla@linaro.org wrote on Mon, 11 Dec 2023 11:10:19 +0000:

> Hi Miquel,
>=20
> On 11/12/2023 10:30, Miquel Raynal wrote:
> > Hi Srinivas,
> >=20
> > srinivas.kandagatla@linaro.org wrote on Mon, 11 Dec 2023 10:23:40 +0000:
> >  =20
> >> Thankyou Stephen for the patch.
> >>
> >> On 11/12/2023 05:49, Stephen Rothwell wrote: =20
> >>> Hi all,
> >>>
> >>> After merging the nvmem tree, today's linux-next build (i386 defconfi=
g)
> >>> failed like this:
> >>>
> >>> /home/sfr/next/next/drivers/nvmem/core.c: In function 'nvmem_cell_put=
':
> >>> /home/sfr/next/next/drivers/nvmem/core.c:1603:9: error: implicit decl=
aration of function 'nvmem_layout_module_put' [-Werror=3Dimplicit-function-=
declaration]
> >>>    1603 |         nvmem_layout_module_put(nvmem);
> >>>         |         ^~~~~~~~~~~~~~~~~~~~~~~
> >>>
> >>> Caused by commit
> >>>
> >>>     ed7778e43271 ("nvmem: core: Rework layouts to become regular devi=
ces")
> >>>
> >>> I have applied the following patch for today.
> >>>
> >>> From: Stephen Rothwell <sfr@canb.auug.org.au>
> >>> Date: Mon, 11 Dec 2023 16:34:34 +1100
> >>> Subject: [PATCH] fix up for "nvmem: core: Rework layouts to become re=
gular devices"
> >>>
> >>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >>> ---
> >>>    drivers/nvmem/core.c | 5 +++++
> >>>    1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> >>> index 9fc452e8ada8..784b61eb4d8e 100644
> >>> --- a/drivers/nvmem/core.c
> >>> +++ b/drivers/nvmem/core.c
> >>> @@ -1491,6 +1491,11 @@ struct nvmem_cell *of_nvmem_cell_get(struct de=
vice_node *np, const char *id)
> >>>    	return cell;
> >>>    }
> >>>    EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
> >>> +
> >>> +#else /* IS_ENABLED(CONFIG_OF) */
> >>> +
> >>> +static inline void nvmem_layout_module_put(struct nvmem_device *nvme=
m) { }
> >>> + =20
> >>
> >> I see no reason why nvmem_layout_module_put() should be even under IS_=
ENABLED(CONFIG_OF).
> >>
> >> Updated the patch with this fixed. =20
> >=20
> > Ok, works for me. I will send a fixup with the doc change (see the
> > other kernel test robot report) so you can squash it as well with the
> > original patch.
> >  =20
> if you have fix up ready, can you send it.

Actually I mixed up two e-mails, I think this is all what is needed on
your branch. I don't have anything else. I thought there was a kernel
doc warning but I cannot find it anymore, so I believe I read my
e-mail too quickly.
=20
Thanks,
Miqu=C3=A8l

