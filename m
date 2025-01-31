Return-Path: <linux-next+bounces-5350-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A89A238E9
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2025 03:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8468168B22
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2025 02:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3A11F95E;
	Fri, 31 Jan 2025 02:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FqX1ZOUt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F1322E;
	Fri, 31 Jan 2025 02:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738289806; cv=none; b=gRZXjUS1NaoMVoa8zsZK0kRtUsLpn4nwo1Y0dsp//y4SRHHbezwtl8xhcE9lckpAG3z3ISAuKiPc8Lro/lP0vgdZGgiUnv8ueFN6RuvVUzjJtncOfCFOavTxuMDVP2wEwEhY/ncswxOpZMjefEZ6DdG8dwhw+ft68WoQ73lIVeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738289806; c=relaxed/simple;
	bh=SbLPZgOZu4CBZqdOTYcp3BX+9z5SFhHRmajt9/wtoU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TWz4ikpeCpPwyRV0pssZvhrPdZijci3yE9dHkglcPGhvIcBHbrMgazqfjbiZ5X3P/ERmiF/fDXztFDn7EeXyQyOTyaKprHPhROFfNUg7gwpY5Bj6iAjkTaEHJsrFdahdcCy2ab6kBpygAMxeQueYGuFXgEMobjp+ZOFF/nnzyIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FqX1ZOUt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738289787;
	bh=97VohWajLO1g/sru8Iv7aMxaauEymtmEnZwjRA/zKAo=;
	h=Date:From:To:Cc:Subject:From;
	b=FqX1ZOUtgyOknh+3mltqAfoblUHrkp5I3RLzX7XoM1BCZmujX7qWahHoy3Ux37pUY
	 oBZHCO1wAgkBDRco7Uu2dldbZGRnyWDTOQ4Jua78vkXtNyGhZ0jJEVrImXKgqqAoQf
	 EXX3QRHHDE/POq7GTXeJGFAlVQlaRAgyLf6g7jr5ROc2wj7k5djqCdBUtHab9J7rmH
	 eWjT7oDyABaaZ+qCyEgFCY9y3ZfRkwQqhtBtGwt46vGA407uI+gvaEJDly5LLcYzrD
	 6qQNlgSnKbIJNgGTEqAQzzoSgROsIbhgBNAoBxZ/aUmZPFr5jKdXntNWkZ0bKusGO1
	 B6syZfR9SbeoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ykfdk4PWKz4x21;
	Fri, 31 Jan 2025 13:16:26 +1100 (AEDT)
Date: Fri, 31 Jan 2025 13:16:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Networking
 <netdev@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250131131633.75083adc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+CpSWtHTpXJtIiyq9muWSrf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+CpSWtHTpXJtIiyq9muWSrf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  07b6216dfc34 ("Bluetooth: Add ABI doc for sysfs reset")
  52f17be9931e ("Bluetooth: btnxpuart: Fix glitches seen in dual A2DP strea=
ming")
  56cec66d6163 ("Bluetooth: L2CAP: accept zero as a special value for MTU a=
uto-selection")
  9e2714de7384 ("Bluetooth: Fix possible infinite recursion of btusb_reset")
  ec5570088c6a ("Bluetooth: btusb: mediatek: Add locks for usb_driver_claim=
_interface()")

--=20
Cheers,
Stephen Rothwell

--Sig_/+CpSWtHTpXJtIiyq9muWSrf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmecMoEACgkQAVBC80lX
0GzhyQf/bmDTGrAgO87ESR0hGengMQCo0CHOAtRWCEP7T25TV39l12HgbsBLcOKx
WoVUZnv5sVi33pIDbiMZZLVNLhPNxo+TxVsypAjQTQZ0t0lA/caQX3Ucfw3PbspA
yf06Uluar9oF8i60Z7h6KC/XiX3EzzkUqSiUFCwXBG3L92avh+rdVOFz/IyF3tF+
iocy9NppkIHC01NXAkqP18VQcvRllGSF4NcfWWBGBeYKyMotAuZNcwGX57+SncHd
vLr7e8IlBP6IamdaRME92pVa0cdl8t9iz9n545M4Q9ArfX8DyUuUnj7KuWOL4gvb
MfG4yC0F0omkZrw6y0qPHt1t3WkKLA==
=/7XI
-----END PGP SIGNATURE-----

--Sig_/+CpSWtHTpXJtIiyq9muWSrf--

