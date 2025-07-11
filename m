Return-Path: <linux-next+bounces-7489-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C17CB01D6C
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 15:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BEB31CA5DEF
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 13:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B7A2D3226;
	Fri, 11 Jul 2025 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="rQthupUU"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E189A2C17A8;
	Fri, 11 Jul 2025 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240453; cv=none; b=Ixe3MHvFhc+P+VVn1OX9x3qd6U3G6eFIq2i0F06gzq89Nl7aY95s5c6BloFzghkO/NgDtVuY4pASF0sgQRdqgpk0DgCPwijZn6lptYhckddF1RgJg6oeXVW7dENoVBT++AwOZNgPA/WAbGxxInQS0rN9AU11SD70Ymh1JPOiOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240453; c=relaxed/simple;
	bh=YN26AWrIu/S88By70x5njNG8qlLiZKgnQ9UWWvJodN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6MoGNBkxiOQNj7SKeMgWF6WUpw3cVNDn9eW/Xcjkt+TSknoh/MBCJK1EMGFKZzwLm0/w80zg6GrS7Xkp32yOKcVaIZj8o+TKItZ6btqCAVVJMZepQGmrM/I8RP2kjIPv5XTHwusgBSZ92uxZa7BV5Ar9YePXZlKBKtHPISmlvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=rQthupUU; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GGp5j+3hapyHyypoA8I+a5VwgWifTXcTTtGVTAThur4=; b=rQthupUUtqHwHMLddG2jNJHyE3
	yRPYHlCQFEKzQHC8vaEKbXyUBmZFv2guxTJaLV9jiqmzse/x+3Dj+bsgZrxVgyTWBHjZ+FSxdOGue
	hKMMDNAKYyqs5OrB5PaAdK65b/er1XyuHAe1DISaopInO4FAi5tgaXpeVHjq2mGnDBdj1l2yaCQ0T
	CRkOSmug9YNHbJueUIsrVTHn1Wg0F5JMaoHkzrifyUmsbM/GfT+2iadSnTZmzKdnIEG6SXYo4OxMw
	6eleVdB2ze4ks5EpOehml0y9pjD8x66aF7YYe6cHMpETdsDxJVIwsqY1rsDGzVf2ONft9MxyMfuPA
	3sH7+muw==;
Received: from i53875a0e.versanet.de ([83.135.90.14] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uaDmX-00089Q-74; Fri, 11 Jul 2025 15:27:17 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the rockchip tree
Date: Fri, 11 Jul 2025 15:27:16 +0200
Message-ID: <16000452.y0N7aAr316@diego>
In-Reply-To: <20250711082614.69765ef3@canb.auug.org.au>
References: <20250711082614.69765ef3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 11. Juli 2025, 00:26:14 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Stephen Rothwell:
> Hi all,
>=20
> In commit
>=20
>   fc276de7b63e ("arm64: dts: rockchip: adjust dcin regulator on ROCK 4D")
>=20
> Fixes tag
>=20
>   Fixes: tag because there is no functional change here. I don't think
>=20
> has these problem(s):
>=20
>   - No SHA1 recognised
>=20
> It looks like that Fixes tag was incorrectly picked up by automation
> from the mail thread and should be removed.

I've amended the patch now to drop that Fixes non-tag.

Heiko



