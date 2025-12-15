Return-Path: <linux-next+bounces-9406-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3BCC009F
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 22:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E5C33032FD3
	for <lists+linux-next@lfdr.de>; Mon, 15 Dec 2025 21:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E57C30F80D;
	Mon, 15 Dec 2025 21:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AHfTp5/n"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27BD2494FF;
	Mon, 15 Dec 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765835131; cv=none; b=aGlHkFJpvG+yofweo3f0laxYSxFdr3cZZcu/I5tfdLT+RkNiAW6UEpBvRb9LedVB+srOALp4PvF5phILGrwOoDN2jip0kFrNEU05fHhqNmBdAVQRdwiPZOM+cZapzMdPVqcTS7mgRCdWVICY/WSeSMyIxaU1mZxbm5fpD8BIbEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765835131; c=relaxed/simple;
	bh=eCndhkm1LypTOD0UQrMs5ZrJ2c+5gHOo6KIESCep4WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxFmbmssE8QG6xNEbCH2lZ5o4du5DdVLOj1SwmrFE5BXE7w9C80s04Vj68jyIV/ndkK6Ixkc4Ek3U7W4oTLiTgf4zK0EBiZnxAmLqj2+uCWkQ10kcoLg0HNWjI3EjbCqsP1Ais/Dcs23dpcZt2Rh1GoqeLzJKhTQ2snG/HFQF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AHfTp5/n; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CQzo1IVoZ0Ps933P0wUP/pLvFSWWXfQ6yWWMrZDEgoM=; b=AHfTp5/nnfHm8RwX5NtHdUCu13
	mZZBy9bhiceWJ/G8aHZL1P3N/jClLlpHziUm2STWOZyoAEYqNe3QSaIJ9vJQlp/EP9HFR/EB4qafR
	NjuNNC6KQR7bMSRSyhVOUoHfFwJw/T/9VU/hCx6Jo5DaqZT6IpJgXrq5kdEpeFUdF5IRq6EwlQUbE
	zQYxMeXFDzpIlikO8JVZvYvM/MNh89Xv1kF9rDf6PRrA0uQgg5Y63ms9bgezhVWVYNvj9wo5HXGE9
	3ZutQV/yYqh05nsvP7/P97FhttZaT//h40B+lwSC7iIuxRS+EN5ZjVFbVQROA6y1yRHnWiKTs2Y5u
	0mrm4bMA==;
Received: from i53875adc.versanet.de ([83.135.90.220] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vVGNV-0006s6-8l; Mon, 15 Dec 2025 22:45:13 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc:
 Martin =?UTF-8?B?SG9sb3Zza8O9IChQcm9iYWJseSBOb3RoaW5nIHMuci5vLiAp?=
 <mh@probably.group>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rockchip tree
Date: Mon, 15 Dec 2025 22:45:11 +0100
Message-ID: <3347325.aV6nBDHxoP@diego>
In-Reply-To: <20251216074028.4921779c@canb.auug.org.au>
References: <20251216074028.4921779c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 15. Dezember 2025, 21:40:28 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Stephen Rothwell:
> Hi all,
>=20
> Commit
>=20
>   96029ffeccf6 ("arm64: dts: rockchip: Enable dual 2.5GbE on Rock 5T")
>=20
> is missing a Signed-off-by from its author.

darn, missed this while applying. Thanks for catching this.

I've dropped the patch now.

Heiko



