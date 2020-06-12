Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AAB1F7FC8
	for <lists+linux-next@lfdr.de>; Sat, 13 Jun 2020 01:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgFLXuF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Jun 2020 19:50:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbgFLXuF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Jun 2020 19:50:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49kHX90FPGz9sQx;
        Sat, 13 Jun 2020 09:50:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592005802;
        bh=YaUSe/3jMjb3GMzJf2b7UpGp9KDpxGa/2D3YEl9DgQU=;
        h=Date:From:To:Cc:Subject:From;
        b=P/u+yOXKhtU0H5tF0mq4C8mVCAz71fx64wyR4ZNnWKfoJdt3Xca/Kjv45qug8/FBy
         vWerKerJD09bJOwKScMN+1Cse+hV3DNo+UqJ0N1tP1tRk3CGfG97gx9A6zwYTmCluh
         oI+HrM+mpL2DE3UBW56VQRgKhLQHPvcV05Srs3u3NwfoTv4P/5TVTTj+pigcg3IUS1
         A0T5WkmYeH6JpL844oYUJsT/XYJFPVmEXSgc10ySrQNk7sdq8sqESfJvaI0JRqQ2NJ
         7smWzEHf/fe2nsLbzVS1EAATgTpxiBeUwjhKnlFYgzCt5uPLZPjarqJ6FuZq8N/E0W
         QyEYB6Pqws0Kw==
Date:   Sat, 13 Jun 2020 09:49:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: linux-next: manual merge of the crypto-current tree with Linus'
 tree
Message-ID: <20200613094959.05d121d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oeTGdJte5dvEadvZ+v6GZoL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oeTGdJte5dvEadvZ+v6GZoL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto-current tree got a conflict in:

  drivers/crypto/ccp/sev-dev.c

between commit:

  835ae3bb530a ("drivers/crypto/ccp/sev-dev.c: get rid of pointless access_=
ok()")

from Linus' tree and commit:

  832910f2e6b5 ("crypto: ccp - Fix sparse warnings in sev-dev")

from the crypto-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/crypto/ccp/sev-dev.c
index a2426334be61,aa576529283b..000000000000
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@@ -394,7 -395,9 +395,8 @@@ static int sev_ioctl_do_pek_csr(struct=20
  		goto cmd;
 =20
  	/* allocate a physically contiguous buffer to store the CSR blob */
+ 	input_address =3D (void __user *)input.address;
 -	if (!access_ok(input_address, input.length) ||
 -	    input.length > SEV_FW_BLOB_MAX_SIZE) {
 +	if (input.length > SEV_FW_BLOB_MAX_SIZE) {
  		ret =3D -EFAULT;
  		goto e_free;
  	}
@@@ -631,6 -635,13 +634,7 @@@ static int sev_ioctl_do_get_id2(struct=20
  	if (copy_from_user(&input, (void __user *)argp->data, sizeof(input)))
  		return -EFAULT;
 =20
 -	/* Check if we have write access to the userspace buffer */
+ 	input_address =3D (void __user *)input.address;
 -	if (input.address &&
 -	    input.length &&
 -	    !access_ok(input_address, input.length))
 -		return -EFAULT;
 -
  	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
  	if (!data)
  		return -ENOMEM;
@@@ -745,8 -757,12 +750,11 @@@ static int sev_ioctl_do_pdh_export(stru
  	    !input.cert_chain_address)
  		goto cmd;
 =20
+ 	input_pdh_cert_address =3D (void __user *)input.pdh_cert_address;
+ 	input_cert_chain_address =3D (void __user *)input.cert_chain_address;
+=20
  	/* Allocate a physically contiguous buffer to store the PDH blob. */
 -	if ((input.pdh_cert_len > SEV_FW_BLOB_MAX_SIZE) ||
 -	    !access_ok(input_pdh_cert_address, input.pdh_cert_len)) {
 +	if (input.pdh_cert_len > SEV_FW_BLOB_MAX_SIZE) {
  		ret =3D -EFAULT;
  		goto e_free;
  	}

--Sig_/oeTGdJte5dvEadvZ+v6GZoL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7kFKcACgkQAVBC80lX
0GwevQf9FJx6pTuxK869Sy9FWnywSAbBm+MJQGvfF+Ms/lpHMJsxRGtyVuqzpYsP
oYFbOgvog+ojjCrrffIJEe2sa1UWTDBeVqEF8TTWjnAbYkn1up6jh4SYRm7OXWiz
YYuB/XNjZfWwBjFEWGs4fQKJQ7PfaNEx48R8HLXR+schRXJwFWtMAEMIm7bqcYT4
jHYuAEOIfeQezPl85Q7Ey7sE9J2l1jeBSdHKlydnaE4hxF1Ta1DtaLlHuXrzc4jE
XeMANSlJAQqNSrFbKbIsEdwEVBsoaIz7+2HIrJBo1CQ3zE0JVt5cxLgoi1dvJ9Jr
xNHfCM7DxPIVhEZyKWsi0lVOB7mZnw==
=W5G7
-----END PGP SIGNATURE-----

--Sig_/oeTGdJte5dvEadvZ+v6GZoL--
