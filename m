Return-Path: <linux-next+bounces-2914-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D14A92C8AE
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 04:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEA5028455D
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 02:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC17A168D0;
	Wed, 10 Jul 2024 02:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fA2mxAxF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44D15E88;
	Wed, 10 Jul 2024 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720579372; cv=none; b=OvBO+HaSXDwQo3re82yBlnr4WOxKs9twDadcMeV2MS+UTfpsIk6J/iio2BuD94GXI4fFpB84KDyvaFcPAz055jLtZIQi6uPJkhbuxZfwcG0sPjqcZ7t8hvPQ8vbsUqqQDcylkYcWXhI/NoVubv96jlFDLFJlL9NQPmMsHiSKv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720579372; c=relaxed/simple;
	bh=1h3QyzQU561HbOt/U8WA2ONjhAe+eN3J1JsOTMPxifU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SDAURtbQAinBISUqTx10lMCfF5MUCusPVlmHvZBqBCdiWa0SUvD5ux1fjF1mOVPqlevvIn2AW2KyTGR2X4F9yvksiH0u1+Q1sHXhSPvbnVoq1FrEm/UEFrzG0+Eme0Re211l8PAFz5QUBaP9olUpR+fVnizVcs7Yz5bgcpbo7mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fA2mxAxF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720579369;
	bh=7aSGrHd5dL68BStdePJKytEf34AsakPky4yk+YY9lGU=;
	h=Date:From:To:Cc:Subject:From;
	b=fA2mxAxF4yyS2Rfgo5zFvtIpTwMqJ7RWKZabLb1+JIdoxgWL99KZMYFVoE9CS8Upr
	 VMgJ1PaANQHjiSTlwIxKJNLBvvyC5VOLV7s52fHZyuhFhtwEApU789XC9ygDVvClMn
	 O45lRfyhkd9Btehm9LQTt0zdg1ug9Sv0/bHsSoAdOfRZFR7iEX16q3JPmN7ioLpzQj
	 vO1La4SD4tOcEqqkcTFMZVDtDrkcWZBfId37zH1ORp2dEkWlY9egSWyT3a724XdV9l
	 hMLcv585nIYteWeDffefXzlQH7RVIcFT1elsG/p9SxcTJfztIL/g4KdZHvqgaOaGEx
	 6GCKR5swJe6NA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJhwm0G7Cz4wcl;
	Wed, 10 Jul 2024 12:42:47 +1000 (AEST)
Date: Wed, 10 Jul 2024 12:42:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the ext4 tree
Message-ID: <20240710124247.1180c19b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yZNse3IwUdAju_q5TTHk3Y7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yZNse3IwUdAju_q5TTHk3Y7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the ext3 tree as a different commit
(but the same patch):

  89a8718cef85 ("jbd2: add missing MODULE_DESCRIPTION()")

This is commit

  96544a93eda4 ("jbd2: add missing MODULE_DESCRIPTION()")

in the ext3 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/yZNse3IwUdAju_q5TTHk3Y7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaN9ScACgkQAVBC80lX
0GwzLgf/RTfl2mHWaPXSWgYAYF3PCq+PcNQ6RBW7ljk9MCsWZpzQODAO3T64TpbY
1b3DbDP01g9ZM0JPvnrG1jB2gZytYhwnhgCHKI/AMU80FV6ZJsLfMdLA5zKHoIGQ
bHgc+BpAFX6UI4K50UooCNH8M1moAAF3OZ3wkkD6vvvU5B7NZRQSWrbetmMiAm0E
spEbPX7/3EW4o+L7IpQX6GreC08EcB3W4H40Yekm+UCPTkcb4gmmlUx0x4SYm6HJ
Xxh4lF9gUIhOC1MkLX9uuLZCDAIRT1foNXnbBDd9ch224tsMSIeWeucKHJe0ZPYZ
f5l6rXtWp0vf4MfrGa55QNOYvPxk5w==
=bTGL
-----END PGP SIGNATURE-----

--Sig_/yZNse3IwUdAju_q5TTHk3Y7--

