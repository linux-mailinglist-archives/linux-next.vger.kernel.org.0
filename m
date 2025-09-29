Return-Path: <linux-next+bounces-8516-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3137DBA9045
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 13:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE0421C0DA9
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 11:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BAE2FFFBD;
	Mon, 29 Sep 2025 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quHdzgy+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4D2FFFA2;
	Mon, 29 Sep 2025 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145389; cv=none; b=kxdvmaTpHiXfhy2ep9g9TxG9KwJAOJ9yIJkSGeHI8pfQKAOPjwmaLupqjpEvbiwQx8xTdcJCA/Qx4TQzeD1yBv5MlANyErKj1nl2eWXlPT/ljncm621G0966YLrFpiwoZeWQJq74gOARO9XR+QGVNpMz2cMRgaJ1Dldi2u9Fcs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145389; c=relaxed/simple;
	bh=SBwMHrycTOXO0q2NOqKHGVP5+6yScnR4QVm7qzevbpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvcp3fl5tTzItRiCHHnOLN9S7Bf3yaCXDTYHavsY/zZe7rm3IZl14gL+YaB7LEZPWc491Aji+VYIKKPIxMC5hBfIkISvTAjjdpV49eb2SQ4ay+6MLC9k24W2lS2WgwjIXw3j9gom6thopui1tMSNdiYliwfok55jW/luluNMaIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quHdzgy+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA96C113D0;
	Mon, 29 Sep 2025 11:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759145388;
	bh=SBwMHrycTOXO0q2NOqKHGVP5+6yScnR4QVm7qzevbpo=;
	h=Date:From:To:Cc:Subject:From;
	b=quHdzgy+Ib0U5fdYZnxCk4PDSxe02ad7vh3ZNB3+vn5J3ATzGSzGLyZaMI5fZD6ks
	 qODr/3LfOkq4aIMOtHfgmRfFFbmFHl8RMn3OQ1dabUotvhWt2sHGN9+W4OM9BfUpjG
	 1VyEGLeu78k/52uZtXelaaccuMS6eoqe0ZvJRbViIwYll3nAp0h6A3W3kzLA5psDzE
	 vg8IfXbnMpVDtNY5T9s0AcTMKN35QCk6/3luEpL/X+BOb8WSo3bjd4T0gtfdApUp+U
	 sU/jyTQUmnZvDW7kMCAU5+VGsAuYR3v7Q2qO1FnxA8kOYFaQsPNdJ4e7M2AcAj2Z2Q
	 rofZnhYTynsGQ==
Date: Mon, 29 Sep 2025 12:29:38 +0100
From: Mark Brown <broonie@kernel.org>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Vincent Mailhol <mailhol@kernel.org>
Subject: linux-next: manual merge of the net-next tree with the v4l-dvb tree
Message-ID: <aNptonyTUxn7dm4B@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fY3DkGzFe7vwW6Nc"
Content-Disposition: inline


--fY3DkGzFe7vwW6Nc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  .mailmap

between commit:

  1b2263ef32920 ("MAINTAINERS: Update Vikash Garodia's email address")

=66rom the v4l-dvb tree and commit:

  39b8e0fef155e ("MAINTAINERS: update Vincent Mailhol's email address")

=66rom the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc .mailmap
index 2a60b2920d22e,ddc4ca07267db..0000000000000
--- a/.mailmap
+++ b/.mailmap
@@@ -819,8 -818,8 +821,9 @@@ Valentin Schneider <vschneid@redhat.com
  Veera Sundaram Sankaran <quic_veeras@quicinc.com> <veeras@codeaurora.org>
  Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com> <vbadigan@codeaurora=
=2Eorg>
  Venkateswara Naralasetty <quic_vnaralas@quicinc.com> <vnaralas@codeaurora=
=2Eorg>
 -Vikash Garodia <quic_vgarodia@quicinc.com> <vgarodia@codeaurora.org>
 +Vikash Garodia <vikash.garodia@oss.qualcomm.com> <vgarodia@codeaurora.org>
 +Vikash Garodia <vikash.garodia@oss.qualcomm.com> <quic_vgarodia@quicinc.c=
om>
+ Vincent Mailhol <mailhol@kernel.org> <mailhol.vincent@wanadoo.fr>
  Vinod Koul <vkoul@kernel.org> <vinod.koul@intel.com>
  Vinod Koul <vkoul@kernel.org> <vinod.koul@linux.intel.com>
  Vinod Koul <vkoul@kernel.org> <vkoul@infradead.org>

--fY3DkGzFe7vwW6Nc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjabaEACgkQJNaLcl1U
h9CAxQf+KZTPrt2yyInbH0ORWoTQ7pMgztDRpyfpXmZQjS1OVJL2PFsY5yiLzGpe
ByYBAt9GvT/pPOeQ7zH41G5Czv2wCAmBnzHOaPpXKBkWaPy8ShlidGklACMuUYtO
PeojKUqcuSdWPxoURJ1xT51nLCqLnR9yHONwmmcgrZ+7YFdBv27WeBdBRHu5ljpo
mqFOvkYMBqsiUxhWfpW4B+SU9EhpGqr/0Um96IKPjRFMeZWMh4jfcY3cd1E+5gKI
2TsZRbwg7GhN3IuyQogrIPxASlIy07P49BbzJqZdV2EmSYlTZtLFTDh2fFkdKnwa
X+Q1a4Px8uPXx9cH3t7YZnVxJfB6HQ==
=1F9g
-----END PGP SIGNATURE-----

--fY3DkGzFe7vwW6Nc--

