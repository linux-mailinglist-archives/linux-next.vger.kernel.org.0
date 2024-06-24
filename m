Return-Path: <linux-next+bounces-2644-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C902F9152B0
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 17:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85647281869
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 15:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFE719CD07;
	Mon, 24 Jun 2024 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpYXIQcm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B219B3CE;
	Mon, 24 Jun 2024 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243706; cv=none; b=NhjYPnhUUqYDYqaXhm/JL23FRPOUeygKcaJLD9vpj9kYL1M9u5B+r9+sWh5rJfES159HGvsZPWURsmP8NtVG3Ea73visYRSGMsHt1i4hR7YDTGgIc7qGl+ljsEipvTmasTBwJhNJ5wcDYAGOVxTxCJCgVCeLUnWbWkgaKIEgulw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243706; c=relaxed/simple;
	bh=J1IgWE+3IlU9Yb1Tk9FND0iDyJTW4Nt9mwUhwpsMalU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B69Fygvr3OXV6Wr2Zw//et8Tcm4k6YYWIWezywgkdFMAfsCCbE+sv0GF2T3BZ0P8pL/oa9uBDleOXpkIhUQAsjAmpLkTt7exNo3KEpIraOwKPEX41oXvBJ9kkxz6ACtLkJhj8dWmD6HemHqEd3o/3d4DtH++JVjh27hFMGhSokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpYXIQcm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134CDC2BBFC;
	Mon, 24 Jun 2024 15:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719243705;
	bh=J1IgWE+3IlU9Yb1Tk9FND0iDyJTW4Nt9mwUhwpsMalU=;
	h=Date:From:To:Cc:Subject:From;
	b=EpYXIQcmJYJoECi5q0yaOXKQnsLK5LhnEdJFI4SdUYw7kPD7yD+f+bDkkg7KKXPd+
	 2i/lZL0sALcJk/RzotAJjbEtFxzRs+j/FGrlwHTNEUrSuxGQROdv8guZddqp8TymId
	 U3b8RNwuFj1BwmxKd1Zisk6G71SiUAJ49zEXt7RS5mXuEcDL+of1WRtkg3ZJ7BvdQI
	 dFsmAVpIiCmLZ8FsD7eqzl9KaugIAXTbKdHT9sm8H53NnX++ZD6CQ1lBIptfX+2H+Y
	 S2thaEv92RLFUx50B8d8SN22+V3Mob6bqEwDbaG+fzsxBj7MqFrKvJzCdMbFqyaK8k
	 ot0H3xaHkEAJQ==
Date: Mon, 24 Jun 2024 16:41:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Connor Abbott <cwabbott0@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Clark <robdclark@chromium.org>
Subject: linux-next: manual merge of the drm-msm tree with the qcom tree
Message-ID: <ZnmTtQyxH6hFGmO-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tF+rPnmXMmmPiY27"
Content-Disposition: inline


--tF+rPnmXMmmPiY27
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  include/linux/firmware/qcom/qcom_scm.h

between commits:

  158ed777e330e ("firmware: qcom: scm: Add gpu_init_regs call")
  178e19c0df1b1 ("firmware: qcom: scm: add support for SHM bridge operation=
s")

=66rom the qcom tree and commit:

  90c3e2bc9ecbf ("firmware: qcom_scm: Add gpu_init_regs call")

=66rom the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/firmware/qcom/qcom_scm.h
index 9f14976399ab8,a221a643dc12a..0000000000000
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h

--tF+rPnmXMmmPiY27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5k7QACgkQJNaLcl1U
h9DtZgf+JWDavVOeEGi+W3qXnBC4EOr8J0+Gg1g/JMLxXDHBFNOBKSAGt3q+EKqH
zqCTV9nCyAc7Nd4SNVB1L1aO4iWu6CKvETAHlou+Et0oKLV/IwB3hbArAoTcLMs3
Tx/JP5lDMKFW8GPFD/Y/Sg4igRVbPOPWEYiY8IULxt8REJHHzyaN7Ry1hKhiSg5A
zpzLi2lhCwb4b5fpK8Y0hAnsnimvTj7d84YxJzjMRoCsFhRRLcRIx6Zfzx7hU1i9
nou9zDIIHOBPeXzsEYYETkmEguS9BNbdaafB2e1HAIg0jZnfI6r2h/jPybdw8W2x
iulizHUxtdfdJ4hPEoy33USJZyoIEw==
=JN2W
-----END PGP SIGNATURE-----

--tF+rPnmXMmmPiY27--

