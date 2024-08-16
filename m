Return-Path: <linux-next+bounces-3338-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA1953FC2
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 04:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBDDB1C2208A
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 02:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC47B47F4D;
	Fri, 16 Aug 2024 02:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bSvSh/J2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BE33BBF0;
	Fri, 16 Aug 2024 02:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723775837; cv=none; b=rXfO3ZpB8SYwtWjZlSa6m3eiedwI3fA7zMS2D3dyIzRUkenAgo2HNPcv/eBf0mdrCt4ecxpIkCVFLPlbAoy4MsEE2YwcMuULfjSEyH/IQHtHS4CMiZ7neNdNY4eAeLQByevah9l5C4+1MUTkLR5iod5R3vsECBwZKU3sfHN5IC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723775837; c=relaxed/simple;
	bh=vggDPjbhV3B731uzAW1Ngq9NG5Q490vhaIBLHRvNpfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VY4IfAq7z78VQ6QvveI3id6S1O7O7hOQhtPUY9K8Hnh7VP7tsAJy2x4/qUvLrWxZl5GPnxBKDm3u5jQAagOixTt7q/7BOVNg62aI692y8tw1EuosH8BZ9Jqxrbe95HFdDurNvD7ARVQyDvnA4CHZvMH9p2sVZ2VUMRSOr8wmCFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bSvSh/J2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723775829;
	bh=7s/vjw87jUi3EyQnj3hLWyZPai0CczgO0DX3b1l3Htc=;
	h=Date:From:To:Cc:Subject:From;
	b=bSvSh/J2hb2N2BsyUm5oi3rsPtyBIt6zbT5QKfLawC/fO7n3Zq4pEoBClkI7+5ojT
	 g3R42UXj0YsMn5f5Ttpd9b0ple7I1fggKgdBS/kZyFqt9TzF+H8I2BcFr8/3QiIovz
	 Ty0GvXBU0HpgwHWdy3tnToIV8I/GpY1n7iSCnoD7kdJlhCGq6qFbKXBMGk2LCcIXG6
	 1a/JE8pfAuDt0BnnlEx3EqlHG3wHdBnOtP1KyXK2gjS8pMKwOLs7NOMzFl0QTGZDTh
	 bph39iWbSTsZ4jMepi/+VlzWCt5sq8+laNlC5tpRgJt6ID6mBfMI0dzFu/1kNmqnir
	 LAt749e4LiRzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlR395xqyz4wd6;
	Fri, 16 Aug 2024 12:37:09 +1000 (AEST)
Date: Fri, 16 Aug 2024 12:37:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andy Gross <agross@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the usb tree
Message-ID: <20240816123709.3fbfef5d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ve+44h0LhE=v4GlSvcK3nXi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ve+44h0LhE=v4GlSvcK3nXi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the qcom tree as a different commit
(but the same patch):

  3c2360f1a50e ("dt-bindings: usb: qcom,dwc3: Update ipq5332 clock details")

This is commit

  34b8dbef668a ("dt-bindings: usb: qcom,dwc3: Update ipq5332 clock details")

in the qcom tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ve+44h0LhE=v4GlSvcK3nXi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma+u1UACgkQAVBC80lX
0Gz5fAf/VC4+LPcpETCzuACb0mCtf1pGW76tVCKHxVlTRGsspKgLbrhUhuIgZowi
Oj9N0bs0t67aED0qXwqrQG1/rI3v5zJn8sKu2FVjFzILsf6RZMhYyD6xzs2K2vte
a+5LQzu0r7MIkV85ourBubao2pc+hnFGOjkEo+aNJtREtkRGMcR38WkgU1COM3/H
8gHH7j2jUaEIUj8I8B+zH3ySrP+7AOTlIS9K1oPqUkDXrrhK2PYTOWquDR1T9bpX
aSLe4XGR2+0iHB6ZweLkbWpaOISv61EIJDub07pwnN/BAvr74yssq7bXbZ5cybh6
+WKPkF9raBDqk68SPRsmNRk97CFJdA==
=Hc1l
-----END PGP SIGNATURE-----

--Sig_/Ve+44h0LhE=v4GlSvcK3nXi--

