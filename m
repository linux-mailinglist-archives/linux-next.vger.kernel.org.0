Return-Path: <linux-next+bounces-5556-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA09A43037
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 23:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1634D3AFEB1
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 22:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B65F1C8639;
	Mon, 24 Feb 2025 22:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dzwkFCTG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C915B10D;
	Mon, 24 Feb 2025 22:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740437158; cv=none; b=ViGGkDJzl6cFnHhidT5DRwNBLh4/OBdPDe9sIS2C1EJI73T9lMOSh3vSqq7JJkmSAIU2g8IVDT42fsp7YLu4ehVKS1htlo7048mTFYYpYpbpAmhjpq9eE34zFilWwZxVirQwh4Wp2963Ahw5bZE8wUK/AT674yJvxiAl0pw65Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740437158; c=relaxed/simple;
	bh=fw9oTcSXegVf07QbdB2fqLC1txFxRYJ6ssp60Q9K+/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BMvukUzp9pSOZNxhUdVR28G2khiPS+KeydzDN6VaEtJ+JClxOc2SzUwKrcgiDOpIBvu5/+LndVHEYvsUJXRIWsd9gdMT8VhjipzYXvDRwyiK6r/1I5CT+8aiX6cfJZMeqgvcLiZoRZvoVwed+H7QpyjmxuAxpQ34IsHd56HQfFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dzwkFCTG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740437152;
	bh=MQUqHl3mEegWqvY5jEX/7Z5JLTYhc0M4o3b44r7C+2o=;
	h=Date:From:To:Cc:Subject:From;
	b=dzwkFCTGmORTKLAuXc8vqkLWb5hr5Ulsq0P7QqG9mrkSEmFF88m3gOfpcidaexwKB
	 D0Pn1a5IFOWs5Nouium9JMqhWzR9itgxhS5iXGnv0XlNz/90gt5JAeut4nqyrFYu6N
	 1TtmGw+ZuWh43/L/vNjRiJFJzDSXvVUslWYb8q4zEOcyZugBYpBeQr/beAYSb6L3kA
	 8NirlEpPKapEm+jhR04fY6lI5ZWF5tslZZapZYBuprHnI8X0XKCVP+syK/qOvggtku
	 CKvP22xVWCW8u9U4/0NCAyX6rHvv8dDpCWoPq3f69kVbY87X6zlWP4kZxjedLWzVgw
	 eELDjdNaHDG4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1wnC2V4lz4whq;
	Tue, 25 Feb 2025 09:45:51 +1100 (AEDT)
Date: Tue, 25 Feb 2025 09:45:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yufeng Wang <wangyufeng@kylinos.cn>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20250225094550.07b771f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AIvKsybOh3zi6yl92M5NiS4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AIvKsybOh3zi6yl92M5NiS4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b995427e8a85 ("tools: virtio/linux/module.h add MODULE_DESCRIPTION() defi=
ne.")

Fixes tag

  Fixes: <ab0727f3ddb8>("virtio: add missing MODULE_DESCRIPTION() macros")

has these problem(s):

  - No SHA1 recognised

In commit

  9709a9145ffe ("tools/virtio: Add DMA_MAPPING_ERROR and sg_dma_len api def=
ine for virtio test")

Fixes tag

  Fixes: <c7e1b422afac>("virtio_ring: perform premapped operations based on=
 per-buffer")

has these problem(s):

  - No SHA1 recognised

Fixes tags should be

Fixes: SHA1 ("subject")

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/AIvKsybOh3zi6yl92M5NiS4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme89p4ACgkQAVBC80lX
0GyiBAf+PEel7MN4UV1vvS/iTpt8zUyqqjkWW1OkpY/WvmLHpdxXVa/78iCXDKtw
wrHMFnJs5TxK/HyEOWpLac6zw870toMIkqRmnxMj1tsKHZw/1HSloSL0XL6dGAML
zB6gn2prKS6MTCaZMjTe2NzollWOhqPIaCWHwIvg/wKZ8oeP42LQjxuS91zPMeZT
hcQgQKFsTzNWFI/YQrsgRxVuojFgkZK8yDKf/+gHWACN0f/4+sTGS6s9pcPaJATG
NSBYJTVhDWRfPkhyQiEIpkCQ5Ir6po9iRVabAoXH9qucJRNusw4zzAeLzHh5uwxv
cytsQLxKZ3MQI3YIaIjDUgChyy3GOQ==
=vKIe
-----END PGP SIGNATURE-----

--Sig_/AIvKsybOh3zi6yl92M5NiS4--

