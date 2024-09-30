Return-Path: <linux-next+bounces-4021-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 758D598AF46
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 23:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D2CD1F23181
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 21:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638791836FA;
	Mon, 30 Sep 2024 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ByVQxTPw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B317B505;
	Mon, 30 Sep 2024 21:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727732477; cv=none; b=o6GnPWW3aZ1HfjDvqNkoqZt0Fm7kDSmU8p0pvol32s7tytVNWXgED5XKHXtp/YwG80z6JUYVkLb0kkxLm0G3UDQ6RMWRaJEycZlsW+jdOj5yore6rAfCDVcKEHsQH9uJHxcOXbNvQDgTqjcpZoz6BFYEmKMtATUqBD7L5Ib+Yig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727732477; c=relaxed/simple;
	bh=4IinHqr+/md3qn+UxQNMUpjAWkbOeGAan1X9UPhNOwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZB04o3dSwI1QLCujlITFDuV2WYUc2T19XqKednPI56sdv56ergn28LT/Il3BULMIMMhdg5SK+frX3wZ4lxMp4gkftn9paPn1AKrJ+CJjUWJ3ZgnxXy0Q2/j+R1zDNqsRK5/ZWQcp6entALfcrSvYydN+9dbvHaa2dsYkS6zYEIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ByVQxTPw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727732468;
	bh=OffnNWuBbWbAvjzwLr6zn2VMuAUinHRNVJP0ql8iBc4=;
	h=Date:From:To:Cc:Subject:From;
	b=ByVQxTPwSiLuYFPzbxozTSFlj/Dpj5Ob8/FoE5jmsei6g0I1BcYdL0qsZilKnxUZF
	 IytPg7eaDVDg3ew96Pq1O5yMHWYF6EfLReMoJtu2cBbI5HKuSBeCIoWEzlA9AJ8QXC
	 iN6EisIw5PhzVjr03aNy4/0zqgUY76vzf+OOLB02yhlSHYNgM7lnrtvDr6BIT1snvP
	 GmyxgsxYbSdms3cd8mfJWAuVdlwJGmWk7HxmNNGBR7SkfCYY7sWW2GonWnOQfAfzcP
	 Xfq2lFvWMM2fxf0KnERtGmzmeFyJXQcPLm9F6PR64/wECkrv6rmGdBZuwswZljmDKH
	 lf/rjXif3euUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHZJN3WNFz4wcj;
	Tue,  1 Oct 2024 07:41:08 +1000 (AEST)
Date: Tue, 1 Oct 2024 07:41:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the reset tree
Message-ID: <20241001074106.2a545de5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5pG3THMfR_c=E5.pLa_9RGC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5pG3THMfR_c=E5.pLa_9RGC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  5b93105afcdc ("reset: amlogic: add auxiliary reset driver support")
  e66eebb88564 ("reset: amlogic: split the device core and platform probe")
  33e712a6dfc9 ("reset: amlogic: move drivers to a dedicated directory")
  2941bb7a8c43 ("reset: amlogic: add reset status support")
  85873c151943 ("reset: amlogic: use reset number instead of register count=
")
  1392f6d3692b ("reset: amlogic: add driver parameters")
  45d73c01b0a3 ("reset: amlogic: make parameters unsigned")
  49ae3e0e55f5 ("reset: amlogic: use generic data matching function")
  ac1bc5f19401 ("reset: amlogic: convert driver to regmap")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/5pG3THMfR_c=E5.pLa_9RGC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7GvIACgkQAVBC80lX
0GwSwAf9FVWLWbb/l3e7SBGVEFz/iqjsVKOseaJHKemgeL0eE0BKZXsyDyDzqRxk
cFk36f8pr11E0cU0Fx9DYc9YzdKatSauKuiLqeRv4lGG3b1i7aC+7cRIhlBQrF7G
Yip6hFdIdDCarGdW4PMnZY1IAag64m0h8j0A1dutYrJrkSDfrmb+Zk467tgQ7hdK
2rhowpAhBjYh1dXm3fxBtAtneTnJx5TWnx1D/yGJRSoRlfGs14mQMdNr39warZbq
2Ne6kX2D8Jckj6eaCVKY8+8Axyq8PcMgyeaK387HdMjrLrQDcvv6pgwADHoQc6ua
SU6hrYRq6opA2ipNv6xmdV4mFq1+5g==
=9blz
-----END PGP SIGNATURE-----

--Sig_/5pG3THMfR_c=E5.pLa_9RGC--

