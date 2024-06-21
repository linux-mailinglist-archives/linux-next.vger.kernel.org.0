Return-Path: <linux-next+bounces-2629-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7E912C98
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 19:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66AD41F25ED7
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B8215FD0E;
	Fri, 21 Jun 2024 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzi/yily"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3950854FB5;
	Fri, 21 Jun 2024 17:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718992058; cv=none; b=Lriz/XHB6QDSpKXiPhmF+WtGukkCCN64YTHPl3nQtrQX5NzjP1anr3m+yISpR4Xhc/jkSy+mT8O550X1n7jr03XgRz9qXF18cvhKYNvzzk0lq80/o/c20tN1tsbSPtXjS6FzCqfhj12XBf9bsHfe8buff+u4snmc4rFOwLz9xDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718992058; c=relaxed/simple;
	bh=aqx777HwFvNcT/eoFXPK+umOv2NCOdADxPLgOhv7eIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NA6Aur/zmoU+nmzyBVywfSewIYDCQcrX2jWMEQ4cqc/bWAvGx+8GS3BU4zqz2uvprYUFHIlFg+wk4WF9mVN3zM3B2h7thDXr/X4oJAJX5kNFfCKLnAkmX+iI5hy6sVZYGQGVHENy71+rK+GVS/gRgpXE1k1Phhf0dPpQfKwcJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzi/yily; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCD9C2BBFC;
	Fri, 21 Jun 2024 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718992057;
	bh=aqx777HwFvNcT/eoFXPK+umOv2NCOdADxPLgOhv7eIk=;
	h=Date:From:To:Cc:Subject:From;
	b=jzi/yilyBcEOU+wEadoe+lJlhDGhYmP38JUSYi9ArLCBwTbeyXLUjmYrPAUBY0Nex
	 sSNlOtJTW1nDytLQLzMY8JNg5GZpq2XE2u92PmUF4Jljf73YRglNrumee12Yd9EXWM
	 HWH+U4x+zo+kRivJTKdbOT47BQhY0Iy1qT8L0KujsE9cDkm3J7WUojZw82JeZ6aDYh
	 ZNrF73DsLoXlkiaAlFoiXArykkvabkqUeU9YjcD10VD5X0L8ZEGVyqHQBv0qFBbHyL
	 MPlZDgkI3RhJLFFD+LewihSQAIoNg+h17Eip3P0bYcFxtR+XcJqYVLPWY5FlpZ4jcL
	 FEmEu6P76J8lg==
Date: Fri, 21 Jun 2024 18:47:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Gustavo Silva <gustavograzs@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tejun Heo <tj@kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the sched-ext
 tree
Message-ID: <ZnW8tfHMHBKH4yj9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhPS/foK5T+Eokda"
Content-Disposition: inline


--yhPS/foK5T+Eokda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  MAINTAINERS

between commit:

  f0e1a0643a59b ("sched_ext: Implement BPF extensible scheduler class")

=66rom the sched-ext tree and commit:

  4c4daafc996a8 ("MAINTAINERS: Add ScioSense ENS160")

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
diff --cc MAINTAINERS
index c3a397c60b693,24d372f7653ed..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -20032,19 -19947,14 +20043,27 @@@ F:	include/linux/wait.
  F:	include/uapi/linux/sched.h
  F:	kernel/sched/
 =20
 +SCHEDULER - SCHED_EXT
 +R:	Tejun Heo <tj@kernel.org>
 +R:	David Vernet <void@manifault.com>
 +L:	linux-kernel@vger.kernel.org
 +S:	Maintained
 +W:	https://github.com/sched-ext/scx
 +T:	git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
 +F:	include/linux/sched/ext.h
 +F:	kernel/sched/ext.h
 +F:	kernel/sched/ext.c
 +F:	tools/sched_ext/
 +F:	tools/testing/selftests/sched_ext
 +
+ SCIOSENSE ENS160 MULTI-GAS SENSOR DRIVER
+ M:	Gustavo Silva <gustavograzs@gmail.com>
+ S:	Maintained
+ F:	drivers/iio/chemical/ens160_core.c
+ F:	drivers/iio/chemical/ens160_i2c.c
+ F:	drivers/iio/chemical/ens160_spi.c
+ F:	drivers/iio/chemical/ens160.h
+=20
  SCSI LIBSAS SUBSYSTEM
  R:	John Garry <john.g.garry@oracle.com>
  R:	Jason Yan <yanaijie@huawei.com>

--yhPS/foK5T+Eokda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1vLQACgkQJNaLcl1U
h9C1Vgf9E4/oGzPyppL2Wj4pAosIPYjDkqeBvbpvJoJJfsqCT496C4znB0cMbiaL
aUqc1SA9y6PLnRAJyO2vR8h0Oo7OqNjV4AwQZuKSkfnoaQGhucv0jHHf0YmGoRZs
k9TcNpeoMFATq72YKI7nLak/xCrbOgnMvga1QyqUKV9xQi1dkQhqNWr6uA6PczfY
FwsWsm1YqFgxreZh+wEIVCKCpSUWg85QC3OHTm6TakCOpZoTLBjL3G8W2xExIVSB
fAxEVT8nYpurocg20N+5S4J6+NWlx9cWy06R7vFvF9Q5mb9jq9JNqGSmiF+2BqnY
oJLxg7HnVTIHZlp/h1XDE755KEDUzA==
=W3i2
-----END PGP SIGNATURE-----

--yhPS/foK5T+Eokda--

