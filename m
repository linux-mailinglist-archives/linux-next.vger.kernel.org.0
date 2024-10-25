Return-Path: <linux-next+bounces-4442-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1DC9B099E
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 18:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95BFE1C23ADC
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 16:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AF415853D;
	Fri, 25 Oct 2024 16:17:41 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B470830
	for <linux-next@vger.kernel.org>; Fri, 25 Oct 2024 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729873061; cv=none; b=Rd7PQDvrzxA1dK+U7QPk0XHk2bm81deq3SzxTB5lazZY0H3ZYlXP7mbp8pJI1KZStkapYHgZi/ltqrHuhKelo7OxuKtufRZZP4iC2gN7A00aeq05B3FR4r5BCoSsS//5Q3Vf390WoeAf+EOTuxEDVGyGJj7XL2sirwwIgmlOGB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729873061; c=relaxed/simple;
	bh=GV1aYIXwS/aqFerkB9pkXH8XtWSjfwQLzZWXYXdaRsA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LXzXUcz7TvwIAN6pSeIIqSy4VWNa1M7ChQf1ENoCvxG3jooHRZVwYsRb/oa8nca91I1h2EqcGtvsccmkIN/RNd97uMcID0TrrzOZGedzOD3QvZkX+lB/7LKY6u+loKYdtibYFugtpC/vCB7Hteet5lQ+3FXns0Al1R+QSu9LA7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4N0G-0000Zy-HO; Fri, 25 Oct 2024 18:17:32 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4N0E-000OeZ-1x;
	Fri, 25 Oct 2024 18:17:30 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4N0E-000E9f-1k;
	Fri, 25 Oct 2024 18:17:30 +0200
Message-ID: <bf1a5649cd680213d66b249684b18afbc6083b6e.camel@pengutronix.de>
Subject: Re: [PATCH] misc: Silence warnings when building the LAN966x device
 tree overlay
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, 
 linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 25 Oct 2024 18:17:30 +0200
In-Reply-To: <CAL_JsqKebRL454poAYZ9i=sCsHqGzmocLy0psQcng-79UWJB-A@mail.gmail.com>
References: <20241025145353.1620806-1-p.zabel@pengutronix.de>
	 <CAL_JsqKebRL454poAYZ9i=sCsHqGzmocLy0psQcng-79UWJB-A@mail.gmail.com>
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

On Fr, 2024-10-25 at 10:40 -0500, Rob Herring wrote:
> On Fri, Oct 25, 2024 at 9:54=E2=80=AFAM Philipp Zabel <p.zabel@pengutroni=
x.de> wrote:
> >=20
> > Silence the following warnings when building the LAN966x device tree
> > overlay:
> >=20
> > drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property)=
: /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-pare=
nt
>=20
> > drivers/misc/lan966x_pci.dtso:42.22-46.7: Warning (simple_bus_reg): /fr=
agment@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges prop=
erty
> > drivers/misc/lan966x_pci.dtso:48.22-52.7: Warning (simple_bus_reg): /fr=
agment@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges prop=
erty
> > drivers/misc/lan966x_pci.dtso:54.22-58.7: Warning (simple_bus_reg): /fr=
agment@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges prop=
erty
>=20
> These nodes should be moved out of the simple-bus.

Ah, thank you. Herv=C3=A9, can you send a follow-up to fix these?

> > drivers/misc/lan966x_pci.dtso:18.15-165.5: Warning (avoid_unnecessary_a=
ddr_size): /fragment@0/__overlay__: unnecessary #address-cells/#size-cells =
without "ranges", "dma-ranges" or child "reg" property
>=20
> For this one,  dtc should be fixed to also look for child "ranges" proper=
ty.

Gave it a shot:

https://lore.kernel.org/devicetree-compiler/20241025161307.3629901-1-p.zabe=
l@pengutronix.de/T/#u


> Aren't these other ones all W=3D1 warnings?

My bad, you are right. I'll drop them from this patch.

regards
Philipp

