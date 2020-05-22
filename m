Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5BF1DE5EF
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 13:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgEVLz3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 07:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbgEVLz3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 07:55:29 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B20C061A0E;
        Fri, 22 May 2020 04:55:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49T4gJ3t4fz9sPK;
        Fri, 22 May 2020 21:55:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590148525;
        bh=69rczOgogyh6sfiXEO8yNDt+ClD5m3GoNda6QblSqXs=;
        h=Date:From:To:Cc:Subject:From;
        b=BOclQh3kCP2dhXE0MpuUWMT1/JLWo4S7BJEqqBkKFv5FfE4mUauHbuLldiRWvLT/H
         SXPNWbnWOz+xfzynLevukV2EAbFFQsifOxppath4iN8tNyTURvdU1KGxk0he5Q6647
         MvqmqGOVIprmSqgMLbSRnennkqey5I/W0x69w8J6/4vT+0M/W1voqpqUof4u3MklYQ
         NmVLB7E+diJ/p2nJjLOGA0l0+jdcXBsUQHQ8bIQ8vDkB5F4LAC/Og0bPdqZlXSXENk
         5mJGViu2xRndB7o1lt8Yn6P/7xWaCItUuwpJ13NudW8D0SBurr7wjhruRZHOLj8FXt
         ZAzKntvkCKByQ==
Date:   Fri, 22 May 2020 21:55:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the akpm-current tree with the userns
 tree
Message-ID: <20200522215522.2e448b3e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dLbKeFQca2jmBRt+C=c7IZ_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dLbKeFQca2jmBRt+C=c7IZ_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/binfmt_script.c

between commit:

  ccbb18b67323 ("exec/binfmt_script: Don't modify bprm->buf and then return=
 -ENOEXEC")

from the userns tree and commit:

  e20ecf0e2723 ("exec: simplify the copy_strings_kernel calling convention")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/binfmt_script.c
index 0e8b953d12cf,c4fb7f52a46e..000000000000
--- a/fs/binfmt_script.c
+++ b/fs/binfmt_script.c
@@@ -110,10 -121,8 +110,10 @@@ static int load_script(struct linux_bin
  	if (retval < 0)
  		return retval;
  	bprm->argc++;
 +	*((char *)i_end) =3D '\0';
  	if (i_arg) {
 +		*((char *)i_sep) =3D '\0';
- 		retval =3D copy_strings_kernel(1, &i_arg, bprm);
+ 		retval =3D copy_string_kernel(i_arg, bprm);
  		if (retval < 0)
  			return retval;
  		bprm->argc++;

--Sig_/dLbKeFQca2jmBRt+C=c7IZ_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HvaoACgkQAVBC80lX
0GwnQAf/UxvyX7h4LoxgQbZ4ysBN8FX/G7vSAzh5GedpxcFfVinniKO3mQDVrn+a
J4t1rFv9mh3Zwj8D8Nr83RSbgnZn0uPAiCbl84ylab9iVWvWm2JVhSfwjif+iS52
h2m/sr4aACe/9uONJ0ocry1YVSouGNo71CF1UGp+2Fpgi60v1qfxHBmjm6iFTM9V
4WMU4F5yYLeGTGmCfxShszDC9CTwifVSf15aimZI8J4/7cOMI8chvExBcatHKpmU
qwYpQnCPp2nSjXhXIsZ+ggfJZhzS8EL43YGqIq7AVcdqzhBnsRQl6FbliMe9QJml
N/YsYH9spfrXaBHrgG8XMUF1TPVA8Q==
=jnQ2
-----END PGP SIGNATURE-----

--Sig_/dLbKeFQca2jmBRt+C=c7IZ_--
