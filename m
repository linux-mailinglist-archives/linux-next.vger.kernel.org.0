Return-Path: <linux-next+bounces-3266-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5194C719
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 00:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6EDA1F235FE
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 22:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F616157466;
	Thu,  8 Aug 2024 22:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uhWLTXBo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A666C4A1E;
	Thu,  8 Aug 2024 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723157372; cv=none; b=jM9dEDIvfvVsSV48BIeAcbrIr7JyT+1zpfXGJ7f+FflYYBGYuqH2vDJVlFsFkj0xC2HQTE+U2Z10A4QxMJK+xeIL869MiK4fvOwzphkO7w2Noi+Ws9siYqQXx5wU1Zou4+pmPIhtmsMHk1DRA23FspLKv5MHtJa93EDNNEHzwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723157372; c=relaxed/simple;
	bh=9hwX0TU1qbPLQWSdVJNAey0FJcfWzwiP9ZbVEbzWrVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RaZ72jiLDOHcnXM/ds7Mz2PXlS/y6kO5EElVqU8DuECAR8ix6Z27odbDaONafIu3oKnzpuDVrUxIg3qOKqjfL1KI5lzHm1wK5YKoU18rZFzn6/KNY2V54pgoUowBxx0B5LuZBQHtQ4R7e9+fEXGK6LbGbCdtOS6y480qQ6Si6aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uhWLTXBo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723157367;
	bh=4TtSvUPkZUS4NRwddAiO486mdhbo3u9LVtUgbjQAn5Q=;
	h=Date:From:To:Cc:Subject:From;
	b=uhWLTXBoDEQLB8kqu0y+DV76y1J99OhenLzxhuXwLG8svgJXvmbFbmEb4IuJTUNn6
	 O++uUhG0Ee9rUCaIkFxA324M2Nex98+VCtWCLL55VH+yaIt6BQWjKnfUhVnPf1wJAp
	 gZn6cxi3n3sp3/96UUceRwtdX35ICQsAHx0+2KzT7f1/Lb2j5XFG8D9bhhnSqAwRxB
	 BuCrQrUo8NSFYqLMQUxU55z0ktFEx/ZOqLQFw1vfHu12s+j9ZfsWKx/OUswsE+1gx4
	 DeJ4LmtjpPLJ5pX9AVU5nkYWhrcYEzddji2wzVQo9/vqHnw7gx+OH4Qlnb1TmeZfXL
	 AwkY1ykzeBaHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wg2Kg68ylz4wp0;
	Fri,  9 Aug 2024 08:49:27 +1000 (AEST)
Date: Fri, 9 Aug 2024 08:49:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240809084926.0dae2813@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/po08RnGMoys+z4Qg=vhn606";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/po08RnGMoys+z4Qg=vhn606
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1e69bd3ba19c ("Bluetooth: l2cap: always unlock channel in l2cap_conless_c=
hannel()")
  2360f368524b ("Bluetooth: hci_sync: avoid dup filtering when passive scan=
ning with adv monitor")
  3c9b2c902da0 ("Bluetooth: hci_qca: don't call pwrseq_power_off() twice fo=
r QCA6390")
  786cd197c92b ("Bluetooth: hci_qca: fix QCA6390 support on non-DT platform=
s")
  9fba2e3f4ac1 ("Bluetooth: hci_qca: fix a NULL-pointer derefence at shutdo=
wn")

--=20
Cheers,
Stephen Rothwell

--Sig_/po08RnGMoys+z4Qg=vhn606
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma1S3YACgkQAVBC80lX
0Gxs/wf9GfVMSQsbipFQ2e6jqldgERTWwq3cZT/ydQP66n3SYOtD6HaVRg3cVH5I
Md1xpDmwCv4ri7ixlJS+jrCMoBUQDpS8cYBNU/lOUe9hbXsPdytBFkgUK7KCL+ob
Fv2iTug9PP2EZ7ivPd2Ykpp2q5V8nhxPAsWyxA1PW+bwOr23VnSY2RerKjn3OAUN
MxaVc+NDL6SImDZbhVCa1MmZ810W8RQ12aB+UNKYQ6CVsGfyTD/rNatJjQrsNoQS
I8gy2G92LEAnpnBSfiz4wYpvHZZznNw4U+V3SDKnDup5YqoVBLlNSx94f0x2Mp6L
gpAXLj/C4YkICfxy1j0+PzRJXQ6ZVQ==
=8OQK
-----END PGP SIGNATURE-----

--Sig_/po08RnGMoys+z4Qg=vhn606--

