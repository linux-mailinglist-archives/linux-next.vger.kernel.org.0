Return-Path: <linux-next+bounces-4608-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A709BB6A1
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 14:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2DF1C2221C
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 13:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCBB70829;
	Mon,  4 Nov 2024 13:47:51 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2730C7EEFD
	for <linux-next@vger.kernel.org>; Mon,  4 Nov 2024 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728071; cv=none; b=TPcI1HIAAwaLLiYd0acxaN9FBYtIiihusBicP/XOovjSGUUkilWnDT+FcvPYU5p4GhIZ/7R1QnmRsJ2K0TaRFf8oIo4ahnHkEzJqWTeQk0s+eBvugRmAVfQA9swXFBJJ6R0EfEfV2K3Eqiw/5xaoepILmNtTofNSLjk+tzOmUQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728071; c=relaxed/simple;
	bh=F8zjRma3PeVfYCzJfvrQelK0l9hyDiCWuPTWjeZFPOQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KzIsA3Y5NpEhKUoxHbiHjiEOfNGVxOzm5fz/VttTT0qc7h8APnaZPFpsqvhimFT8nyAjvwE/lx+ByKvVc1fIkMS1EUvQS3UucdU4tS53FVzhjBhAQfEA3aoa90KDWON++sFlkdO/7ew2+xa2fojqXqOeqlGrR9oItLNmcskuiuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t7xQj-0004ok-Rl; Mon, 04 Nov 2024 14:47:41 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t7xQj-001zYZ-0t;
	Mon, 04 Nov 2024 14:47:41 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t7xQj-000EVu-0d;
	Mon, 04 Nov 2024 14:47:41 +0100
Message-ID: <6e8b3c1d4c5232e006030f03a9b06a6294970d6c.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] Fix dtc warnings when building the LAN966x
 device tree overlay
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Herve Codina <herve.codina@bootlin.com>, Stephen Rothwell
	 <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Allan
 Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>,  Steen Hegelund
 <steen.hegelund@microchip.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Mon, 04 Nov 2024 14:47:41 +0100
In-Reply-To: <20241031160122.40cf61e0@bootlin.com>
References: <20241029084338.194942-1-herve.codina@bootlin.com>
	 <20241031160122.40cf61e0@bootlin.com>
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

On Do, 2024-10-31 at 16:01 +0100, Herve Codina wrote:
> Hi Philipp,
>=20
>=20
> On Tue, 29 Oct 2024 09:43:34 +0100
> Herve Codina <herve.codina@bootlin.com> wrote:
>=20
> > dtc generates 3 kinds of warnings when it builds the LAN966x dtso.
> >=20
> > - missing or empty reg/ranges property
> >     .../pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
> >     .../pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
> >     .../pci-ep-bus@0/sys_clk: missing or empty reg/ranges property
> >   Patch 1 in this series fixes these warnings
> >=20
> > - Missing interrupt-parent
> >    .../pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent
> >   This warning was quickly silenced by Philipp [1].
> >   Patch 2 in this series fixes the warning and should replace the patch
> >   applied by Philipp to silence the warning.
> >=20
> > - Warning (avoid_unnecessary_addr_size)
> >    /fragment@0/__overlay__: unnecessary #address-cells/#size-cells with=
out "ranges", "dma-ranges" or child "reg" property
> >   This warning should be fixed in dtc.
> >   A patch has already be sent by Philip to fix it [2].
> >=20
> > [1] https://lore.kernel.org/all/57793bb01e02f03e215dfa6f8783df18034ae2e=
a.camel@pengutronix.de/
> > [2] https://lore.kernel.org/devicetree-compiler/20241025161307.3629901-=
1-p.zabel@pengutronix.de/T/#u
> >=20
>=20
> Both patches in this series have been reviewed by Rob.
>=20
> I think it is a green light to have them applied in the reset tree.
> Your opinion?

Applied to reset/next, thanks!

[1/2] misc: lan966x_pci: Fix dtc warns 'missing or empty reg/ranges propert=
y'
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D344ea0d36b8c
[2/2] misc: lan966x_pci: Fix dtc warn 'Missing interrupt-parent'
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dcf3e10cc0e88

I've dropped the Makefile patch ("misc: Silence warning when building
the LAN966x device tree overlay").

regards
Philipp

