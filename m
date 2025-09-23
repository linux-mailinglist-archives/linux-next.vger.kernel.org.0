Return-Path: <linux-next+bounces-8446-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0888FB95C43
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 14:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1652F19C0A0E
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 12:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AC232128E;
	Tue, 23 Sep 2025 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N950wpQG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784252FC86F;
	Tue, 23 Sep 2025 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758628941; cv=none; b=crQE5PXygtVXMaE998RyzdkwjEeRFH3ZI2QHrvdl2CdHxTx3c6tZkXAFhRAphe6YYC1hlaIkPGpsUk4kd3tExN13psg4d0jd2EfR6e+Tokzr/qo7JSxn6BvLdv1k8fTTbVHplwgDIhOwGuj6yjiQjf8L3wXjvW9z0JPvo1wJ1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758628941; c=relaxed/simple;
	bh=vfU9Jv7l/LFQE21VT4y6UJV5BM6uR9ucoi7hWXp2wSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azBZ1y+Po+pvUuY6B3lACekhB8BlxCqQ7NPq8rSRU7PauPMlh5pY0hCKK9vhsbpWbmKA81yhOxnD4lyjapmYthkw5HNQL7uLEWSq4Qs+2WshmTye0zZavnXDJ3kIYenmOesZFwJkayBVxE4wll/ZSt7c8Tyq+NyWqn/d3OcTsH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N950wpQG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F83C4CEF5;
	Tue, 23 Sep 2025 12:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758628940;
	bh=vfU9Jv7l/LFQE21VT4y6UJV5BM6uR9ucoi7hWXp2wSs=;
	h=Date:From:To:Cc:Subject:From;
	b=N950wpQGCsIgIAEziNDtvTxUoaZHfiHZ8VICDwi1sSeOGN9zFAHJ1zBEMjOfjmY7K
	 xljzdbhVlZ6OvJh2PrCJe6t9kcmIknnzvYYOHKJ1eXgXEw5dmQKkJDzkwnf7ytge4I
	 gOyItrn502VJtiJWZVYP61DdzWXpAVhMieFayvWMwRqwmZfWVKSaAUsb2BVGytKGVj
	 RQVx4GZN2t4BnpDLECqg4jnvgnWm9QMHrAPmioEaarm5VayoksATcfYTYaJirAGDvq
	 fjUcoetLIiekvCZFUB2TDUxAx+HetlpYnoy8TQQcAqKliCx3INcUKT2PRCvjaztwM0
	 mu43jM23lUUqg==
Date: Tue, 23 Sep 2025 14:02:17 +0200
From: Mark Brown <broonie@kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoffs in the device mapper tree
Message-ID: <aNKMSd1hhaeWvQ-A@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zEpDXLo2SHaqx0ax"
Content-Disposition: inline
X-Cookie: Filmed before a live audience.


--zEpDXLo2SHaqx0ax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  9fddffbf6aa35 ("dm-integrity: allocate the recalculate buffer with kmalloc")

is missing a Signed-off-by from its author.

Commit

  9fddffbf6aa35 ("dm-integrity: allocate the recalculate buffer with kmalloc")

is missing a Signed-off-by from its committer.

--zEpDXLo2SHaqx0ax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSjEQACgkQJNaLcl1U
h9Boqwf+Nq1Afmt7KnEAo7Zwv6CyeTcLpce0eG9niifwWouVrJJQbngc9GbpsyIM
3X9OsWWPjWOcHLv2lNvVN6wUtHSjfClD533t/uUlhQOmjjsdJATCcM4kYE/VPR/G
JRbpbop6J65osOTHPXI1jvUubg2Nfsf5AN0wPE0rUDlJONnqWyaa3cTNGqa8FljP
sShI7NsP2ztlsvGRDl9GyxUPqWCyoWKBVXoi2BLhl5K/1oWLrdtm6t/exio2mhDf
n5dRtLd405ThkRiewqHELMJRIu9Hl1zv2Rk1U2laXWabvedW2gWao3bpas1XOyJ9
DHsrDy7E++BsuTsqbt0aH5v6Da7aGg==
=18LP
-----END PGP SIGNATURE-----

--zEpDXLo2SHaqx0ax--

