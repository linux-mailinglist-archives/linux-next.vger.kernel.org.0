Return-Path: <linux-next+bounces-5229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 111FDA13569
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 09:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EF0E1884E65
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 08:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334371D6187;
	Thu, 16 Jan 2025 08:33:30 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B68A1D5CC6
	for <linux-next@vger.kernel.org>; Thu, 16 Jan 2025 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016410; cv=none; b=oBC2PyBNC8D4Y0uC7+deIx6Oz46YuAiEJ2F0yMK5E8zi6EmctdWrY9GPoYdae954Tb6XrtTdqTJtHvzN6MYptMtjcYjjcg9d/PNr+bYU674J82J5dD6/Gb0gi7V8eT8DT+SbSSA4/gfjiubB9zKMGbTfbwdbrDQy6rpxni02ViI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016410; c=relaxed/simple;
	bh=07Dg8uV9f9ACBKEUxU/AOqd91iKdtF2bNVuHc722bvg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UJH/W5IPkz1Ofc5ERNuK/BFLqofa+zjZn4so0Xe2ISBWitCkq5DnvuOHulv2f5WYhMYNxi5mTdUf+mjxAkFtq5BzM13w7RKyiQDuKeMQyBEW5bzkgg4GbTZwnlpYvkH8emPNr+TF/0mXYPFZ0nrXofEu8/6NQqQ4NvAGyfsNXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLJT-0001hx-8a; Thu, 16 Jan 2025 09:33:15 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLJS-000Dn2-0a;
	Thu, 16 Jan 2025 09:33:14 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tYLJS-0001nF-0O;
	Thu, 16 Jan 2025 09:33:14 +0100
Message-ID: <e62c5ee057c924a1dcc2f37d789b49f160b1010d.camel@pengutronix.de>
Subject: Re: linux-next: duplicate patch in the reset-fixes tree
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	 <linux-next@vger.kernel.org>
Date: Thu, 16 Jan 2025 09:33:14 +0100
In-Reply-To: <20250116102149.0b0feb88@canb.auug.org.au>
References: <20250116102149.0b0feb88@canb.auug.org.au>
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

Hi Stephen,

On Do, 2025-01-16 at 10:21 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commit is also in the arm-soc-fixes tree as a different
> commit (but the same patch):
>=20
>   055884c45d5f ("reset: rzg2l-usbphy-ctrl: Assign proper of node to the a=
llocated device")
>=20
> This is commit
>=20
>   1f8af9712413 ("reset: rzg2l-usbphy-ctrl: Assign proper of node to the a=
llocated device")
>=20
> in the arm-soc-fixes tree.

Thank you, that was an unnecessary rebase [1].
I've reverted reset-fixes to its previous / merged state.

[1] https://lore.kernel.org/all/c5eb7690-85b8-4f44-b8bb-598badf3b729@app.fa=
stmail.com/

regards
Philipp

