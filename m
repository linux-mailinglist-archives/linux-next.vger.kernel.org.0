Return-Path: <linux-next+bounces-4438-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 878DA9B061A
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 16:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A1A9B21876
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 14:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF581148828;
	Fri, 25 Oct 2024 14:47:08 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018C13B58B
	for <linux-next@vger.kernel.org>; Fri, 25 Oct 2024 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867628; cv=none; b=foX76zYxPH280ABbaWtDzJScfzxYtgBCfcPWvced47boVaKHdWIr2DtIu2wWckXf5q/DLxW0lEgH0hRD9FkM3k6REc4Q0H2P15h3TsUpidncf+8Nqu9FD7o7Etq21o2ne82itLPx6YqMX2HaEifBRwDicaMh2yudV+PDeIWsLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867628; c=relaxed/simple;
	bh=Uzkr6q47eov0IbRLSpaLxWzPtpQ7YKN5vQ+eSXa1cIg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GZWwawlGfSj5YtcX4IOBECQl+3TdD1E810IbjeSxJyZNFqTT4pcq2y/hYRUfzTfUmAReX3B3TTzBwbjvwYjweNG9HmwAjhyBvpznbtJWffllITH6vnE1SRu6loHVQe0M7uH1iukxXk2ivmTQCY3eAkc1rBgCf1JqU4L/2zw2yrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4LaZ-0000em-Lb; Fri, 25 Oct 2024 16:46:55 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4LaY-000NuE-22;
	Fri, 25 Oct 2024 16:46:54 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4LaY-000BjX-1o;
	Fri, 25 Oct 2024 16:46:54 +0200
Message-ID: <ad2a190a1f93edb787478ed3433b154b9753f7c8.camel@pengutronix.de>
Subject: Re: linux-next: build warning after merge of the reset tree
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Date: Fri, 25 Oct 2024 16:46:54 +0200
In-Reply-To: <CAL_JsqLvUygPQYhsaCuRjwPXJrKR9sASWWLvrSTsBdR44SBbuA@mail.gmail.com>
References: <20241025110919.64b1cffb@canb.auug.org.au>
	 <20241025082817.28056f52@bootlin.com>
	 <CAL_JsqLvUygPQYhsaCuRjwPXJrKR9sASWWLvrSTsBdR44SBbuA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org

On Fr, 2024-10-25 at 08:44 -0500, Rob Herring wrote:
> On Fri, Oct 25, 2024 at 1:28=E2=80=AFAM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >=20
> > Hi all,
> >=20
> > On Fri, 25 Oct 2024 11:09:19 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >=20
> > > Hi all,
> > >=20
> > > After merging the reset tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > >=20
> > > drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_propert=
y): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-pa=
rent
> > >=20
> > > Introduced by commit
> > >=20
> > >   185686beb464 ("misc: Add support for LAN966x PCI device")
> > >=20
> >=20
> > This warning is normal.
> > interrupt-parent is not present in the oic node. This was discussed in
> > https://lore.kernel.org/all/CAL_Jsq+je7+9ATR=3DB6jXHjEJHjn24vQFs4Tvi9=
=3DvhDeK9n42Aw@mail.gmail.com/
>=20
> We can't have warnings especially in things outside of arch/. Doesn't
> matter why.
>=20
> The choices to fix are:
>=20
> - Override DTC_FLAGS in drivers/misc/. You can set DTC_FLAGS_lan966x_pci
>=20
> - Disable the check in dtc for overlays. We've done this for other cases.
>=20
> - Add enough info into the overlay to avoid the warnings. This might
> mean the overlay has to be applied up one node level. It is
> duplicating a few things which are in the base tree. This is my
> preference because it makes the overlay stand on its own. We'll have
> the same issue with dtschema checks too if we don't do this.

I see four more warnings that look like false positives to me:

drivers/misc/lan966x_pci.dtso:42.22-46.7: Warning (simple_bus_reg): /fragme=
nt@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
drivers/misc/lan966x_pci.dtso:48.22-52.7: Warning (simple_bus_reg): /fragme=
nt@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
drivers/misc/lan966x_pci.dtso:54.22-58.7: Warning (simple_bus_reg): /fragme=
nt@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges property
drivers/misc/lan966x_pci.dtso:18.15-165.5: Warning (avoid_unnecessary_addr_=
size): /fragment@0/__overlay__: unnecessary #address-cells/#size-cells with=
out "ranges", "dma-ranges" or child "reg" property

Setting

DTC_FLAGS_lan966x_pci :=3D -Wno-interrupts_property -Wno-simple_bus_reg -Wn=
o-avoid_unnecessary_addr_size

silences them all.

regards
Philipp

