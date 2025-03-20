Return-Path: <linux-next+bounces-5900-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 443A8A69D6F
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 02:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F284A8A4277
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 01:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA96190674;
	Thu, 20 Mar 2025 01:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UzQNWl+t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE7342A87;
	Thu, 20 Mar 2025 01:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742433139; cv=none; b=QgRZS7fP5VkaqrODNr0ZECvgRhnqdR53l/6a/AMrkDPjvokB53ZKND/qXHRqxb79f0PrQIbG6N3/T8nrRaRvWxqJJESxhZRA3Fyc6BO5dpYgbs5D+6/jzAH+QpMPsK10tx02KfJsSjwlF6KuKs7FQc9hi/mikgZPTlWNCUBrp1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742433139; c=relaxed/simple;
	bh=GYGrOUIBUZnQHu9iS8ckntEE91B9bSFs7aMwx22K4Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hQ2CPpEoq0amYXL59jZp9zCVIr/RZ+U9k5J5HZkKi5xJvtAudkVABnEzknP+IjQjrtLj/HDFJsb6IJEBrT64R9qTf4HBue0TYXVGdLGpFic/z5m1iowS93SvItc4rKLNl+e8lfNGuYRwBYiXzRiaru+dBh3Xph+W5hfrpNMjDgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UzQNWl+t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742433135;
	bh=5V45ZEeEN9azq8Z1wvZ/lnudiWjP/pM/N5iqwbNAGYE=;
	h=Date:From:To:Cc:Subject:From;
	b=UzQNWl+tg3uAyi2KbVc+ocODIri+3dInWJIARnvkdxye74VNXI6Mcq+LF/wFFBFIV
	 SVbieeg8eSAtGqngZDq3iPRNZlO0oDsgyu7xP+w1dn0Gz+odBwTCCjF0EqBGIGRch+
	 BFTe7Kn8n0fgLNFglUnEdVY1vb3gCNFkpOxV78Rp2VUjL1c+9m5HlCdp2/1cds4def
	 RlF8LJdxMpfjLNxU/Zi81WBVqmlykY/0s/uyaMjfyqi2MT12as9XhidJq60Luj7bFU
	 fgGFKjVDy6v861fAHxfdJTfkMOMigWuXZldEfS2kvaP+IjB8Xb9QY/utut9gJ+kHDG
	 2tuVCABxXgzqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJ6xT6lpSz4wyk;
	Thu, 20 Mar 2025 12:12:13 +1100 (AEDT)
Date: Thu, 20 Mar 2025 12:12:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250320121213.4483e436@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s48VE1EEALnCI05DmxU51g4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s48VE1EEALnCI05DmxU51g4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  712e0e2e6abf ("Bluetooth: hci_event: Fix connection regression between LE=
 and non-LE adapters")
  d0239dfa783c ("Bluetooth: Fix error code in chan_alloc_skb_cb()")

These are commits

  f6685a96c8c8 ("Bluetooth: hci_event: Fix connection regression between LE=
 and non-LE adapters")
  72d061ee630d ("Bluetooth: Fix error code in chan_alloc_skb_cb()")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/s48VE1EEALnCI05DmxU51g4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfba20ACgkQAVBC80lX
0GxG+Qf/Za68hd4PIM7nGYYqxWep/yeiJu6fq5VoIG7u0sO7rLasbFtJlPOmtAGp
O2tz+yCZQwXnqqQfKVShQadMRaR95SSkZdD7UHyiUmHbK2k6A3XTH45Z09kTx+q2
wT1CwwzbwQA1o1y3r3lU1CNLA6XOocK3fVMlljIxRvkF1sGIchCvbNDQ2neT1u2X
rEuCYX4DidrhV9PX4eZnpNbBxZz/Mpvr25MIcNHGqNosaHRwCqgUReCW3nU+eYyZ
FBwcT7hIQZ0StbAXzjhA/mFU+svk/I4TaPqP5QeXBo0JmjB6z1aV18iyaOulCaT4
BJ44i5qTkAA9DnpXvOcV+hmmphPNqw==
=EjV3
-----END PGP SIGNATURE-----

--Sig_/s48VE1EEALnCI05DmxU51g4--

