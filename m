Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08BE354E65
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 10:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbhDFIT6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 04:19:58 -0400
Received: from ozlabs.org ([203.11.71.1]:44547 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232355AbhDFIT6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Apr 2021 04:19:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FF0nG4kKMz9sWQ;
        Tue,  6 Apr 2021 18:19:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617697187;
        bh=kQjZvN3NYUkWgiLUsC9xiLd60Ewn6Ytqg0/8IymAuNk=;
        h=Date:From:To:Cc:Subject:From;
        b=h+IQZ50mZqb06R2bRccZYuv8WZaBZpUkfEBAfQLQW05BHM4G8V0fuQLMjffcHRpkU
         HXYGtApn274vvdkXFR61FWpMhFfApk26pMb4LLtVJzPeZW/UPjUveovdK3WeceWei/
         tbzEAkfgnrLh1wSn5QKKUHZ4ADTEL3FZ6q/bIghTp/eQPRUOXpXAXv7Yi9JNqyOt1T
         TgTJ/VCDdJo+6mPRNyA7hdCqPj1VLd9OrDAIU1nMGkf7iKPYfFj+fvcYrhD3BEo7pc
         03f6zuPsu1sBl/TGIDa9tDXZwMReLHNTLyQi5cPS4+S+zbUawogt4qRVEYP2HvqWBp
         ED9iBerADwnwg==
Date:   Tue, 6 Apr 2021 18:19:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Subject: linux-next: manual merge of the driver-core tree with the
 devicetree tree
Message-ID: <20210406181945.2ae6fed1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/94fiwa_B8GO=zN=lWyQHY/d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/94fiwa_B8GO=zN=lWyQHY/d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/of/property.c

between commit:

  3915fed92365 ("of: property: Provide missing member description and remov=
e excess param")

from the devicetree tree and commit:

  f7514a663016 ("of: property: fw_devlink: Add support for remote-endpoint")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/of/property.c
index 2046ae311322,2bb3158c9e43..000000000000
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@@ -1243,7 -1230,8 +1248,8 @@@ static struct device_node *parse_##fnam
   * @parse_prop.prop_name: Name of property holding a phandle value
   * @parse_prop.index: For properties holding a list of phandles, this is =
the
   *		      index into the list
 - * @optional: The property can be an optional dependency.
 + * @optional: Describes whether a supplier is mandatory or not
+  * @node_not_dev: The consumer node containing the property is never a de=
vice.
   *
   * Returns:
   * parse_prop() return values are

--Sig_/94fiwa_B8GO=zN=lWyQHY/d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBsGaEACgkQAVBC80lX
0GzcqQf+JCjLFKiFsOS8RYim7OurvscL68DZvWTv+66tS1B4llWHY8PmQX8gPPt3
pyyZ3Hx8zuybJRPpBgB26o105ANCRSyXWUhamNaHYEGxRwS0e8iwBiGch0gxUVM7
JZ/hMQ+mZ1D2ud4eskNInb7GZZQ+cTZKHdtfuPmjHKf0dbGWJNs6WMje6JvIixoS
9SXbC+YUv7lzVI/I7bekU5142qlcSI8iDKDLPTQtfhfsfD3gDDMR+FfWsQId0zOy
ZyIH1kBXc++YwZ5G2PtB5xFqPHHRFN4HvBqtyCHlGL2F+nxSZL6Mv775dTPqsON4
kdXgc1NWzdwGAnbtmwQofz8Di8/LGw==
=xjar
-----END PGP SIGNATURE-----

--Sig_/94fiwa_B8GO=zN=lWyQHY/d--
