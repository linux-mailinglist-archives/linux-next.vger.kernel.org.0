Return-Path: <linux-next+bounces-3474-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ADE9623D6
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 11:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3D61F24FDF
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A46115D5C4;
	Wed, 28 Aug 2024 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="VhIuDHbu"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE115852F;
	Wed, 28 Aug 2024 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724838331; cv=pass; b=IjurVvn9ThOVIqcMc98SMBaA82DSgr2yRmpTmQv+kkmRu0zlUD8NoiTy4NIQwt4u3kHmsCe1g5VxAYPOp8k80ZvymZaJ2+EGrKLktZe27qhKPoAH6F/n0LJqCe6Wt21M/qp8ccQkxFpFhnbKkziYLJ/K+ByAm8S5YhmiN5aKLRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724838331; c=relaxed/simple;
	bh=xxHWjXbGYDdv1SsBXuLwy1+mW782cDB+n1vw4d4Zg4E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hmG9nzWJ4LWaTZ4qT5od1glSem7vaQ9RPulzNMIVs4cmlZn0KzdbFciRShNWzhUGzQM/s/K09nCc29y4I3kozoCCI9yWlrJkB2wZ2pNDp4p5hFiuWwbXn3lZjByy8znx0eG5y0WlNLdBPxSxZiEohHkIgIPIRJ8yO9wKuO5/Ncs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=VhIuDHbu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724838325; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DT4b9oVB7qEss+11or95LFMXePqwEVvfQl62TT6YhWcOK/jx5jzZQbGCAzx1FFUoNGcUmSiw93cUKhmOhZK/lReOaibabu+z2q0RZgvXzvMGNmCqE+XWk9Hmj06ga6aGhNnjXbE92rSvT4IiA0kB7bQ9LyzbXzdHu4MB2BrhwTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724838325; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5SYZhpIwAJcr2xrpIC+OIjn/gOIRzSfwVo2MQq25g2Y=; 
	b=ja2UJbYPHrnJqiKoiKyZ+5jFpJ7BrsLAYZ9kCn8kaJEc6X3vgY5HXIo1jBFDhiz0p8EUlIblCckBKvHczCSK8EYIDaDfbnJrMHEmomnWomNoiOOV5QZV1/5VM3yOl4hxrwgwgl7IHdpVsZS6OCfLNPfoK9dJtyirqhG3syfMbZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724838325;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=5SYZhpIwAJcr2xrpIC+OIjn/gOIRzSfwVo2MQq25g2Y=;
	b=VhIuDHbu5XAJZkYq29cOtMCffL8ImX5xnQ3I0ccIWs3KkwxbyX/bFZn0TDtRtawS
	h6MBo92Eq4sqGTbexuxOG0JaMaaD5jCQzcjdu87QcZpgghxRQYmsFaaB5BVty51DPl9
	/zAclJCCY4Jgqc7kRdYZLYb1HWsfJlSxDHwcO2Z0=
Received: by mx.zohomail.com with SMTPS id 1724838324132287.374471093676;
	Wed, 28 Aug 2024 02:45:24 -0700 (PDT)
Message-ID: <57440a796530c153cd0ee3e7b11c2fbab9887fbf.camel@collabora.com>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
From: Martyn Welch <martyn.welch@collabora.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Andersson	
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Jassi
 Brar <jassisinghbrar@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Hari Nagalla <hnagalla@ti.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Date: Wed, 28 Aug 2024 10:45:20 +0100
In-Reply-To: <20240828150900.7ffd7588@canb.auug.org.au>
References: <20240822142603.3608a26d@canb.auug.org.au>
	 <20240828150900.7ffd7588@canb.auug.org.au>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Wed, 2024-08-28 at 15:09 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell
> <sfr@canb.auug.org.au> wrote:
> >=20
> > After merging the rpmsg tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >=20
> > WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> > =C2=A0 Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
> > =C2=A0 Selected by [m]:
> > =C2=A0 - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 ||
> > COMPILE_TEST [=3Dy])
> >=20
> > Probably introduced by commit
> >=20
> > =C2=A0 ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4=
F
> > subsystem")
>=20
> I am still seeing this warning.
>=20

OK, just taken a look into this. I think the issue is the result of the
inclusion of `COMPILE_TEST` in the Kconfig entry:

  config TI_K3_M4_REMOTEPROC
         tristate "TI K3 M4 remoteproc support"
         depends on ARCH_K3 || COMPILE_TEST
         select MAILBOX
         select OMAP2PLUS_MBOX
  ...

Looking at the entry for `OMAP2PLUS_MBOX`, that doesn't have
`COMPILE_TEST` listed under it's dependencies:

  config OMAP2PLUS_MBOX
          tristate "OMAP2+ Mailbox framework support"
          depends on ARCH_OMAP2PLUS || ARCH_K3
  ...

If I understand right, either the `COMPILE_TEST` needs to be removed
from `TI_K3_M4_REMOTEPROC` or added to `OMAP2PLUS_MBOX`.

It appears that the OMAP2+ Mailbox support can at least be compiled on
x86_64. so I assume the correct thing to do here is to enable that
right?

Jassi, I assume there's not specific reason for the OMAP2+ Mailbox
framework support not having `COMPILE_TEST`, other than potentially
being added just before it was a thing?

Martyn

