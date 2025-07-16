Return-Path: <linux-next+bounces-7576-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDD8B07398
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 12:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54D837AF0D6
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 10:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1600123FC42;
	Wed, 16 Jul 2025 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UWA9t05O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABE1953BB;
	Wed, 16 Jul 2025 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662275; cv=none; b=JD/AlQO/rc+svyRXW16akDrBqCKnaxPa5bsdFaUvRnWBRmZLHLmsKGs5OULA7VfjB5zX5lvg1LHV6oGw6Oe4PqDhDMMjNK46Hp3IhW4J3ENgnZKcVUEVfKLQg2pEuJCIMxKTVC3LcpH9Xoe/Mbdw86KbzuXLzMPv/OSBlbYVdes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662275; c=relaxed/simple;
	bh=kVqBarDBzux7mrOq83OjSXA5lkRDcsJ4deVVFlFxAZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f27ZFeIclqLzS/z7nyOHuqENcaOotqxvm+8nRqry9Yf2ypNsCH7idDO+S4YJND4AUB3HwkXjIGBZR2ddFbgg3po/oiah7KDPaybi+kZap/zgtxr8UnfTiDphhsZKQZMjYY/Ft/Liy2teObJRjFBp8v85S335Ee6rB6f/DgNEbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UWA9t05O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752662153;
	bh=vOeca4e7maPNKquBg58Cxv87XhtRefH5lxy1aUyTnpw=;
	h=Date:From:To:Cc:Subject:From;
	b=UWA9t05O0QdEDdKFwiNs1IaCyqDp8CTcCvl1q/HBkiSZ6M7BcVfTnPfveJ9hG1RII
	 kuxymcgFaYojr3Ie6Hv4vyWiRqv5SoM8NPTGA0SKPQuly69aMlrtPNdyJzjlZ6JbpA
	 iUx+kOYJRBEHpRziBSU4B3ZZlnpKbTmCrsYSOxqwTt2Ae1mQ+QtFoHYusDIPmm+Bdc
	 gfPpgBMlz0tyP3B2EEPxO+AWiSP7aR2r+njrcGltpHftZ3lC30ue+Tk+YaTikrFlii
	 2dYGpgxzXrL49AKaGyr8mC2yuITU5g9IvIrPYFWntigtq8Fp7svFMHB1mX5dDJDNrW
	 HaiyiRCK6CIJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhssP2tltz4wvb;
	Wed, 16 Jul 2025 20:35:52 +1000 (AEST)
Date: Wed, 16 Jul 2025 20:37:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20250716203748.5a4ad396@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vJE9SvNmPxKEX8wO2fpKA=.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vJE9SvNmPxKEX8wO2fpKA=.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

include/trace/events/block.h:416: warning: Function parameter or struct mem=
ber 'rq' not described in 'trace_blk_zone_append_update_request_bio'
include/trace/events/block.h:416: warning: expecting prototype for trace_bl=
ock_zone_update_request_bio(). Prototype was for trace_blk_zone_append_upda=
te_request_bio() instead

Introduced by commit

  4cc21a00762b ("block: add tracepoint for blk_zone_update_request_bio")

--=20
Cheers,
Stephen Rothwell

--Sig_/vJE9SvNmPxKEX8wO2fpKA=.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3gPwACgkQAVBC80lX
0Gz1eQf/fzZ5Vi7G67ELj8k538tVl63xeC3hH9ZUJ464gErab7FVinmMfQzc6K0T
PpbV0qTkdMIuJXeFkjm+ctc3yQb9Gwr4czvFJ/zwe1GB23Gjz3t3TUwHgbERB8IR
Dgj7LJ5Q/QW9RWaYENPrVtMS9dqOPoi8TMirpXWhq9wgVpa39ZMHSEa+daOqLPKy
t1UPfzP48b25TmJqpNFoLDQlWDc9FKywOXjml3B9+lEMtkfzk3RXCSKaC1tJhw45
DynuYkV7eqQiLRunDWEoa3TQNj0rgSQYt7qyPKTTaaCssyeCn9uIk+d7NSyWd2f5
NB6ikVN/PDQrJnVbBCMfxtVNMbpTDQ==
=V+eK
-----END PGP SIGNATURE-----

--Sig_/vJE9SvNmPxKEX8wO2fpKA=.--

