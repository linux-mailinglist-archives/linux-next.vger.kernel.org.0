Return-Path: <linux-next+bounces-8353-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4473BB7CCA2
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA9B1527A09
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 11:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47074281371;
	Wed, 17 Sep 2025 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyv+EuqV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50DBA45;
	Wed, 17 Sep 2025 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758108850; cv=none; b=UrMYhwTQSefSspuQMmyZlK9WzpZdb2NeLto6FIJlfENUQDOG/4FBIQoW4RuY/kqpGk+ke1kaaWYtsEwVGn3qLEcXR6oh/ewrwPBk8nED/C5edQ6t94YNAsPHquYI5/8xV818+Y2tnJ6d9eVHzKkXTMZEtoz+0WENpIo667YCeRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758108850; c=relaxed/simple;
	bh=Pym4Hl/uD7n31XzfGlFJ4FP0sMyge/+RVU8nqvrtyiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KWfIN71x6qa/jHEk9K1LQ6NqBoxiSMo5xVaBzBF0e5ey894Z4tliEOcmuIEgQYir8P9yi4OUwn8mb9D/G2pyLG79ydX06ITCOUswIxS6YHM+QAD/u5cYLxiU8zgClCKfLva/319p7A80fK8tFDGeE0i2pdWtaGDfv3meTFQ0OJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyv+EuqV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA19C4CEF0;
	Wed, 17 Sep 2025 11:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758108849;
	bh=Pym4Hl/uD7n31XzfGlFJ4FP0sMyge/+RVU8nqvrtyiY=;
	h=Date:From:To:Cc:Subject:From;
	b=lyv+EuqV07hL0GuHD7TeWVXWWaG+xc5kVHkJUUZDsv2+KHsWh53DFp3wLwU7kms37
	 uRnuyla+zzv4hxBL0+rYbuFwy443Y6odqVNbO9gNiIYCYQYQPr7WSB+bTXJRzC567h
	 Q92nfT+ljIG+bnpOCNy6GySuMK9HFCE2okGVDnYfOJz5rdyF/NhB3oiZ+JiKLXFaX4
	 5DvVigR6mtrTeGQSkUKOrxIIyzDFpL13hsugVM5/ieHEhRC0zCUsS9sxcXCSJXka+8
	 foL5aE/q6yQnJ6HtoPS196jhaqr0x1E17zoFkx09DQoZnKzLbLWCy5a+C44KwgoNK1
	 TgDwnVl3b5wTA==
Date: Wed, 17 Sep 2025 12:34:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Pavel Shpakovskiy <pashpakovskii@salutedevices.com>
Subject: linux-next: manual merge of the bluetooth tree with the origin tree
Message-ID: <aMqcrced3cFk9SCl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hhaGiQv3TnEaUrV3"
Content-Disposition: inline


--hhaGiQv3TnEaUrV3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bluetooth tree got a conflict in:

  net/bluetooth/mgmt.c

between commit:

  6bbd0d3f0c23f ("Bluetooth: hci_sync: fix set_local_name race condition")

=66rom the origin tree and commit:

  c49a788e88e48 ("Bluetooth: hci_sync: fix set_local_name race condition")

=66rom the bluetooth tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/bluetooth/mgmt.c
index 50634ef5c8b70,b9c53810bf06b..0000000000000
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c

--hhaGiQv3TnEaUrV3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKnK0ACgkQJNaLcl1U
h9Cu9Qf+Kz+BnB5CGxNKW3jKFrg74sRPQfOl2F0Cu8IggZF303B8EaIqje3wBCeH
29SyFW3pTKk8oom5CTiC+XiA+6i1zdi4K4jQJ5EkLscDkvYflW0458cL3wMwlYHv
D3XV2ovmFQlR9SHIkNZSyvd9qX/NEsNJIVCHvt2F3PrM0KXZIZ1zUluaj2or5qAi
PtQ8iD1l3jW4fACeQHmW1Gqsf5K/47OtdUvdDqOzL3LKqWVaDs1U2jk0yIaaFOdF
SmnHY+qp6YedS7M0NbqKCmgIauIV4T76EI/hW65xLbuvmSYoHkIqIqkgD6SkEf5a
vxoF/aHxIQGA28EVg0wrIb8bGM7cqA==
=D2VM
-----END PGP SIGNATURE-----

--hhaGiQv3TnEaUrV3--

