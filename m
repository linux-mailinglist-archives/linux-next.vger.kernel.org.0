Return-Path: <linux-next+bounces-4651-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342939C0029
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 09:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF78282439
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 08:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D2E198A19;
	Thu,  7 Nov 2024 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IKHA8CwY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60110C2ED;
	Thu,  7 Nov 2024 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968815; cv=none; b=VyOUzGI/TvjKD0Wky/2QC1yyzMvBNJvpYpLJCiPQz56jek39Etqj9wsm0duSg7dK33/yhzcbfLO8JwLmueW8tAuM/RM9DQ7uGuoLfJ/AYSicgRDf2ltfwDqKC9zzLr/QAcxn0HtKtOP0eNLjpNcYzqov2Fm+VZklYp/tU9oZRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968815; c=relaxed/simple;
	bh=TpYShUExYvm7kJ4e1nlvnzhHxD0XrFMubWRtYTnz9Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aJFG0HOmlSJjZ1NNTek5PSj7YdIKRjBTnwqczFk04SPSSY3uvbq91LCYY/bQayPCccZPMJyq1nMkB8w4w4SfvmVtj32MAZatvs6/qHh3U/DfDBBCu3D9OoX4c4g/F6YPRzPP3uJ82Ox8Q3xPGt/yUFcPNkiRYpLq6okGbdRu2sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IKHA8CwY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730968807;
	bh=poincw61PlfiW0LVhcDLz1oOTLwuUTeCmPWNQS6qr/M=;
	h=Date:From:To:Cc:Subject:From;
	b=IKHA8CwYrK7HgFgkFddR+cblOV2ypTq0dMH3fouh5E+Lj31j3A95hpmH0ZsnLsI9Q
	 J91PPLRrkNqV7YYXpplUoOR6qPzl0UlB6GDXY0jd12XNs2PewpRZh9zcELWr8+xiQa
	 HC0r9SalfZOjxETiFvSzOsGHdSFtwlRbZmh6MtJRE3lracyZPzA47WxOXLq3pFpA5a
	 5ccRHAglcm69IC59ujxvpcZFu1wTmTJ2nmzfFqBPhaDAZy4DTXxzkxC5rn7A3wYyye
	 rmDxkAmN2Wz+7cfqOQiygl8ow7seP/FN0JEywyWSt/mS/jae6mYYxQN0tlpH0Jlbpm
	 ELMSuL/cWq53A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkb9f12yxz4wxf;
	Thu,  7 Nov 2024 19:40:05 +1100 (AEDT)
Date: Thu, 7 Nov 2024 19:40:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Hans de Goede <hdegoede@redhat.com>, Mark
 Gross <markgross@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ilpo =?UTF-8?B?SsOk?=
 =?UTF-8?B?cnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Suma Hegde <suma.hegde@amd.com>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Subject: linux-next: manual merge of the driver-core tree with the
 drivers-x86 tree
Message-ID: <20241107194007.1d247bde@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DB9n3HK=V.Wg8hI_Bm.3f+9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DB9n3HK=V.Wg8hI_Bm.3f+9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/platform/x86/amd/hsmp.c

between commit:

  9df193087b9e ("platform/x86/amd/hsmp: Create hsmp/ directory")

from the drivers-x86 tree and commit:

  b626816fdd7f ("sysfs: treewide: constify attribute callback of bin_is_vis=
ible()")

from the driver-core tree.

I fixed it up (I deleted the file and applied the following patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Nov 2024 19:36:12 +1100
Subject: [PATCH] fix up for "sysfs: treewide: constify attribute callback of
 bin_is_visible()"

interacting with "platform/x86/amd/hsmp: Create hsmp/ directory" from
the drivers-x86 tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/platform/x86/amd/hsmp/plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/am=
d/hsmp/plat.c
index f8e74c0392ba..748bbc356484 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -75,7 +75,7 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *fil=
p, struct kobject *kobj
 }
=20
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 struct bin_attribute *battr, int id)
+					 const struct bin_attribute *battr, int id)
 {
 	u16 sock_ind;
=20
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/DB9n3HK=V.Wg8hI_Bm.3f+9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsfOcACgkQAVBC80lX
0GztaAf9HE2YC/07oyyqtSRyKGVKvCMeHz6fsA8TKtG3+lfeJ9pzVPmBA3I30Nki
zS1Si6vxCEUHhqB9E/LrNlLCjnQ5QGNkWaBsQSgJLrIunXVhroSjNz/fnRcGVkpt
WGgo1gDE9OR3KCqxmZXjAlsdSBc78husXOVIphuhsEaDBYwp+QaA7xtbz/tU83l7
GbOY8Uef5TzDt/+D2G6686EZKvC+vCYyzdRxIUK7JYG2JSyxFl2452S82vmLF8aK
epv0etE+6gGQE9KgUNWtY6+a1F/SE6AqCXCKHg5E1iLf5pqbQFU4e/Ae07kRdjRq
TN0m7P3DN1frmg16hh4Se/MByaXcIg==
=g6Iq
-----END PGP SIGNATURE-----

--Sig_/DB9n3HK=V.Wg8hI_Bm.3f+9--

