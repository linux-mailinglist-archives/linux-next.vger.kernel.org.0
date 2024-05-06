Return-Path: <linux-next+bounces-2175-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9621B8BC579
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 03:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C73E81C2108F
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 01:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A0C41C77;
	Mon,  6 May 2024 01:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RrMDhjy2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F8F41C6A;
	Mon,  6 May 2024 01:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714959219; cv=none; b=LxrWRtn4HzvWs7Mfb7xv8NZbIhGAeXahA+PGvvTslk3yppa4/En9rJyQ+TfeXtfsnSLDJWwYYCpNDJQBmtoBq9mgB8YarGS4nwPSTupmL1liXrKHH9VOPyFMLDKoTBDnQtcE+6qDmE+LeDcwHCMgBRDzJbTB5PBaQRekc7UtkFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714959219; c=relaxed/simple;
	bh=jluhbbPZBzEENo8Dosrj0AaGPNtNoI6PA0Pw07RZTno=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FP88JdL36G2M34h26fWqI8bZh0stV6LjVJxWPIQ5nWe2Fkvhpq55u9SiGOzB3cXunPLIFJmeP4XvoKtvRBeb3/Zl9SvIJl6h8j4VPL/wCoP3hZAeQuFugyz39GKD20hNRuPSdbZ6k9suEB97ECVvWehY/PN3hM9XxTMFJVkJqH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RrMDhjy2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714959215;
	bh=jFfHdl/7nNlv3txdZkmlOUbbAl/hf/+FmOAAViSKgkM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RrMDhjy2PmrGUZdMFmUVpy6br++zNU2DS44JGl3zKZKkxXmF7W9EJTvR5BDlBS7Bj
	 UEsJ8pr9hyzoWadsGKIfaVFUToBDcN0sSNWLlTCkmbMaAk2SA6ycepQ6Ffhv3Pc2Y4
	 M12C1cNSY5CAOwND5KxaRnzo5UoUx/Dt9wIH/u9lmnSqaKTX5dGVuN35NfXIj+44Q2
	 g1JT+bvEBgGQ9ZEIHKDgXXBC/BNN+p++pFnqwketWDXP5e5DDkXdLS2TIOiTf/lyAZ
	 agfTPLtjYBI/oyreKA6xeN12Li82TLmzw2aC3HLhawghnNxwZenzijBfbIgl1WGl6P
	 x2ta5TI2WJUSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXkSv11FWz4x0x;
	Mon,  6 May 2024 11:33:34 +1000 (AEST)
Date: Mon, 6 May 2024 11:33:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240506113334.2a04044e@canb.auug.org.au>
In-Reply-To: <20240426070902.0cfa1282@canb.auug.org.au>
References: <20240426070902.0cfa1282@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q6r_7dtV5MzWWikJ=JPh=vd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q6r_7dtV5MzWWikJ=JPh=vd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 26 Apr 2024 07:09:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
>=20
>   2d7a4bf4bae8 ("Bluetooth: qca: fix NULL-deref on non-serdev suspend")
>   4405182b7a15 ("Bluetooth: hci_sync: Use advertised PHYs on hci_le_ext_c=
reate_conn_sync")
>   5a0265dc7990 ("Bluetooth: hci_sync: Using hci_cmd_sync_submit when remo=
ving Adv Monitor")
>   5e7d1e242697 ("Bluetooth: qca: set power_ctrl_enabled on NULL returned =
by gpiod_get_optional()")
>   9c049d8a7595 ("Bluetooth: Fix type of len in {l2cap,sco}_sock_getsockop=
t_old()")
>   a3aca621101b ("Bluetooth: MGMT: Fix failing to MGMT_OP_ADD_UUID/MGMT_OP=
_REMOVE_UUID")
>   aec46cd4ebff ("Bluetooth: qca: fix invalid device address check")
>   d19d765596e7 ("Bluetooth: hci_event: Fix sending HCI_OP_READ_ENC_KEY_SI=
ZE")
>   df5efbdaa7d5 ("Bluetooth: btusb: mediatek: Fix double free of skb in co=
redump")
>   e10bb8abb81e ("Bluetooth: qca: fix NULL-deref on non-serdev setup")
>   e4e20e0a1700 ("Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x0bd=
a:0x4853")
>   f33b1c9d33d9 ("Bluetooth: btusb: Fix triggering coredump implementation=
 for QCA")

These are now causing unnecessary conflicts :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/Q6r_7dtV5MzWWikJ=JPh=vd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4M24ACgkQAVBC80lX
0GzgaQf/eR8m2lvct6913jGJhXadM+UnB0wLnMYnSTB1r7TJiMe+79hIlGnwMQ08
ROYkhVMUPb2m/1K43OW1nPP/AMRjHMB1HvyQuZ7s43auf0ml4sHRwTT8V/LnN0F6
Qssx9ntpElTUXxlbfNrZ63romrbB2VWForZfRDRA3couhcpBvuaITaJ0hyrFJIgW
oudkahPOfMkKracaX4z0hmFIA+5KLBZtDWvADbWs5piOmCShGsx4TKgAidXsTxT2
hLa5Gw4BILEZzzToJhSMkt6olH7ZFStVNAkQ8Ke6X7dy3BXX++qWxbmvVlfFqUX0
5iBIdFGwJ6wFWcsBF7m3zh3xEa1WCA==
=Y0oU
-----END PGP SIGNATURE-----

--Sig_/Q6r_7dtV5MzWWikJ=JPh=vd--

