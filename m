Return-Path: <linux-next+bounces-4447-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6169B0A50
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 18:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D1DE1C2123B
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 16:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFADF1FF04A;
	Fri, 25 Oct 2024 16:50:42 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3F1CF7DB
	for <linux-next@vger.kernel.org>; Fri, 25 Oct 2024 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875042; cv=none; b=P3tkNZlZqvUDB17417XcBG+9teKGCL5yNVkmCnODDDitPHmlYHejo1i+Sr01Cb7BgpJcOQJOYJFvn2hl5VrdDLD9HHxs6U5uQ+ELD3t0QLwm3ZPVD3yZ/JCyDeliAUmI9myKjGeCb1xYEh12YOTTF0tlX+ZqeoIfopm0+rbtZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875042; c=relaxed/simple;
	bh=oPasYCPFr0s+XvHk6AdFIlrDAzctc3mlxjjeQsYysEk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=py5jUoMPzlrgB54CQ5WsAz39QJJvaTJ6GVvTeciyw9yIvA87bo52X0KGSnTww2wICcPmgufas/oo7wpkW6vFTnTOFS4ztG/0fe8syMYgM0IGo9Rq9n1B8vMY5xjup72m+38Zk+XOVm6CwBo3nhRFZhEWi2rrklOj7YDr/p9WrkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4NWC-0002bt-Gw; Fri, 25 Oct 2024 18:50:32 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4NWB-000OlJ-2Z;
	Fri, 25 Oct 2024 18:50:31 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t4NWB-000Er6-2M;
	Fri, 25 Oct 2024 18:50:31 +0200
Message-ID: <f8a93830ab97cd8f7043d15d7d063a57a2e0ebbe.camel@pengutronix.de>
Subject: Re: [PATCH] misc: Silence warnings when building the LAN966x device
 tree overlay
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann
	 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 25 Oct 2024 18:50:31 +0200
In-Reply-To: <20241025183801.0133a0a7@bootlin.com>
References: <20241025145353.1620806-1-p.zabel@pengutronix.de>
	 <CAL_JsqKebRL454poAYZ9i=sCsHqGzmocLy0psQcng-79UWJB-A@mail.gmail.com>
	 <bf1a5649cd680213d66b249684b18afbc6083b6e.camel@pengutronix.de>
	 <20241025183801.0133a0a7@bootlin.com>
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

On Fr, 2024-10-25 at 18:38 +0200, Herve Codina wrote:
> Hi All,
>=20
> On Fri, 25 Oct 2024 18:17:30 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
>=20
> > On Fr, 2024-10-25 at 10:40 -0500, Rob Herring wrote:
> > > On Fri, Oct 25, 2024 at 9:54=E2=80=AFAM Philipp Zabel <p.zabel@pengut=
ronix.de> wrote: =20
> > > >=20
> > > > Silence the following warnings when building the LAN966x device tre=
e
> > > > overlay:
> > > >=20
> > > > drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_prope=
rty): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-=
parent =20
> > >  =20
> > > > drivers/misc/lan966x_pci.dtso:42.22-46.7: Warning (simple_bus_reg):=
 /fragment@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges =
property
> > > > drivers/misc/lan966x_pci.dtso:48.22-52.7: Warning (simple_bus_reg):=
 /fragment@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges =
property
> > > > drivers/misc/lan966x_pci.dtso:54.22-58.7: Warning (simple_bus_reg):=
 /fragment@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges =
property =20
> > >=20
> > > These nodes should be moved out of the simple-bus. =20
> >=20
> > Ah, thank you. Herv=C3=A9, can you send a follow-up to fix these?
>=20
> Yes, I will do.
> Is it ok for you if I send the patch on Monday morning?

Ok, I'll silence the warning until then.

regards
Philipp

