Return-Path: <linux-next+bounces-2573-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA5090BB68
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 21:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6AC128487A
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 19:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818131741D7;
	Mon, 17 Jun 2024 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0nXugsC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A59D53E;
	Mon, 17 Jun 2024 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718653971; cv=none; b=ItkmiZD0+pqfg4WkC5Fk/akJ/MLn7GxFm7B1efhBeNz9zvgHfgH+qvofJE+B73LgJxjOFLQb8hBiy5WI6GXpZRxmvwZ/IrnWqhtbS7+hGYyqaT1HVGUPDrTlgudIrBWgwx5BP9WtKdVGBfJKEKlbWbFYfVH2UQY5KJwA5qrdHAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718653971; c=relaxed/simple;
	bh=8tk93bqRF+37KbOLQkTuGDjKahwCGQIXkCnA/etAVYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Egov9nlPUHuGUyh88tyueeyCzlmbuIpsTuVmNxKXxh0sVfHNRcKJD8pEa+pniX5ZRpGkignwhWJOezZpGkcOe5u3OPPzy/8N5Yo0wG6ex8K4DtWRYoACzt8oLxYJeN6yYqGVS1j+aN37jgvT2SXFAnIBUyJplT0o/fHZv/8NgoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0nXugsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2F3C2BD10;
	Mon, 17 Jun 2024 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718653971;
	bh=8tk93bqRF+37KbOLQkTuGDjKahwCGQIXkCnA/etAVYw=;
	h=Date:From:To:Cc:Subject:From;
	b=L0nXugsCZWVdZQAqkRGlJ2rKMo4flDvC8YPtjOyvcSbMM5sx2sbwn5v1R+nN+U8yy
	 2vO7G199sfBI7ZLfGgK7K3GsP6j7ACmnvblbbG4lsvaDHjQN6wPRc+BE6GVNfwATW3
	 4oZ6Vj0NFIgnrZLoPvC4vaQ6r3fOtY5ERMnJc4AgtjFb9LyCrAbU9nFgs+SPKxTvc7
	 055/3QfQSyZO3HucxjUhqTkIPWkLqqS/ICl33PNl5OsVKHxPdFaYywaJMOCkYGbNR5
	 3TMpZJgMoCvOPbgWK55lt2MR7G+/H93UC3f54FYJAiAA9PTmGqICXSryZL0OLZqEfh
	 9m+UiEFXInRLg==
Date: Mon, 17 Jun 2024 20:52:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Gustavo Silva <gustavograzs@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: linux-next: manual merge of the char-misc tree with the qcom tree
Message-ID: <ZnCUDSypSIPCTfJ8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZKnrXZL2gijoXAbb"
Content-Disposition: inline


--ZKnrXZL2gijoXAbb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commit:

  1fabbb0888c3d ("dt-bindings: vendor-prefixes: Add Schneider Electric")

=66rom the qcom tree and commit:

  202ce3eaa6912 ("dt-bindings: vendor-prefixes: add ScioSense")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index 56ad56d7733e9,044e2001f4e3a..0000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -1264,8 -1254,8 +1264,10 @@@ patternProperties
      description: Smart Battery System
    "^schindler,.*":
      description: Schindler
 +  "^schneider,.*":
 +    description: Schneider Electric
+   "^sciosense,.*":
+     description: ScioSense B.V.
    "^seagate,.*":
      description: Seagate Technology PLC
    "^seeed,.*":

--ZKnrXZL2gijoXAbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwlAwACgkQJNaLcl1U
h9By0Af/cvkpxd9DH2Ao3qfPDM4R8D06Va1JBCPQ4o3PPpLMmO58lDAtnLyS8+Z/
gLj/dx/B/J28/FwazqKoV9hY9PJCva7VHbkxjdcXSxkVfHwU4c/ddssdt52pYO/j
UB9CRlkmYleSi3Qt+l1PnzY5M6Js7zg9h7bRBVUwWRkegDLz2BSj97Q4jTAGELtG
nPJX5S6IvT838rKs1tDui1+TD9BDBLZ3agrfywGIrfRBcqiDozcSrbaEryfVkUzV
SAFy1gH8CJ2jW9B8XfQfUzwyQv0444vSJXxa1eFrva6RUVXBQgcbe4Sh2aj5VZUc
1WBeIyJjAGMPVLmdJvz4AchxmqXaIw==
=e9ru
-----END PGP SIGNATURE-----

--ZKnrXZL2gijoXAbb--

