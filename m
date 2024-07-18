Return-Path: <linux-next+bounces-3071-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F27393489E
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 09:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAD4D1C2165D
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 07:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960764C62E;
	Thu, 18 Jul 2024 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="WyC/VB/u"
X-Original-To: linux-next@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66EF24211;
	Thu, 18 Jul 2024 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721286814; cv=none; b=CoFIHaTHuQiWl+agCAP25w1U/rz8xoGtraeEZhcsxQ7EzaTT7R0jN0/GOCVZnVkaQ+9Fj9WWz4FovkRfubKEdxIS5DJ9QunRnpIpo8bR4aSqPF318Io7zI1n/+XuYoTBiz0jyhVTiYL1x5kv3e1yw9TodB4QqKQqq5Z0sH22Uk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721286814; c=relaxed/simple;
	bh=yZ2QaQ6p9Z+RtBrpzPLhsQ3P78x2NI+aDTceKi1qjjw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtvwv5ef2geoNSiA3bX0wXVDwAavKJJ8gl/sI3tV+ixnMQHdIpTGPBCiv8/kqH0LPJ1SlCkrskupXpNvKLIB1V3RvlfohuK4slV7OuJcxf4giFNQW/allRYObDz+hhMnFQJyT16pKyKGtnHDSrFW2R4ffnK7CyEQCeYSN6t1yl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=WyC/VB/u; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721286812; x=1752822812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZ2QaQ6p9Z+RtBrpzPLhsQ3P78x2NI+aDTceKi1qjjw=;
  b=WyC/VB/uDI0T+LZ5oe2hVL/TeCpC76GDq+SviFncyvaZSurXzgRh/xkx
   XP3EqbUFiYHb1nl12eE+QnYN5MnyAqXX9wMja0ab1106KVQz9ZboS2Ol7
   CiQuL5YnSU4nnNkCDM94ug4Qssp2cihHqy7zotXmzEGNJmLOoAaaBXZAm
   UxlcHcOxL5qubxifryvkdZRx7Mbs4agr1p431fHb8FgmBahlz6rVcpFrZ
   mgr7Kl6H7gO8X2xMp6XfwvhU4P9LcpSwl5KpQYWEp1oDzoZ1jWrLA0HBm
   6t9iE/8DjdYMPO/gJGPGbLzL2eEQswqePNDqhowX+thvlX4b2CLEx9CFM
   g==;
X-CSE-ConnectionGUID: 4xvfPWz5TieNyLJ40wg/zg==
X-CSE-MsgGUID: 1vgItF1PTx+dbdtiJd3f7g==
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="asc'?scan'208";a="29361118"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jul 2024 00:13:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jul 2024 00:12:55 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Jul 2024 00:12:54 -0700
Date: Thu, 18 Jul 2024 08:12:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the riscv-soc tree
Message-ID: <20240718-playing-mulberry-a1494425f9ee@wendy>
References: <20240717081456.57ee0709@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LtI7V3OW/Rv8FP1a"
Content-Disposition: inline
In-Reply-To: <20240717081456.57ee0709@canb.auug.org.au>

--LtI7V3OW/Rv8FP1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 08:14:56AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>=20
>   c813ef3c5f6c ("MAINTAINERS: drop riscv list from cache controllers")

Yeah, that's expected. I had one commit as a fix after sending my PRs
for v6.11, so I sent that one as a patch rather than a PR. I'll drop it
now, thanks.


--LtI7V3OW/Rv8FP1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpjAUwAKCRB4tDGHoIJi
0pSIAQDoo4fV87WN//rrAarrWir9zxyX0CKRh0UogJZ95MSp0wEA904JekTuhfUA
6v+bjsuEFzweVOfug+XjAtEs2W2y+Qg=
=Z4J8
-----END PGP SIGNATURE-----

--LtI7V3OW/Rv8FP1a--

