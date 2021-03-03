Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD0432BB76
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343707AbhCCM3h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354915AbhCCGI0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 01:08:26 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD58C061756;
        Tue,  2 Mar 2021 22:07:46 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dr3Sc0g41z9sW5;
        Wed,  3 Mar 2021 17:07:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614751664;
        bh=0o5aIi2qjzi0mE36JTrLm3NjOuZ7+Jo6eQZPy66Pq7Y=;
        h=Date:From:To:Cc:Subject:From;
        b=IC8zn6KUlXL0KBzXBgyD/QSNb/bLY4XACsP6niPFZntVgIMu+VKtUPZ6h0/fM7Qu6
         pq1IVUoCNUayXJDXxwTSRs4khOaNCRZtgwgO+TlZny9Fw7e071rk8VV11OKjLlpQZo
         pDSurBovxQnR5FrB9pzcJJKNUncLHak+MGc82TWFlP1lfI9AWcIwp8VYpyEhDyPqzg
         kzNHon1nmPaG9gEnlGZedzz6z4+q+FKAmiwSseiGJqiyN6+sU4GQ4l7Fiw3K716QtF
         ezJPI24ARGv3flamaJYtyo6wsI2SVCMmwwFhpr4AM8s5pAIrUuZ5xWV7IzC1Z+Dpt1
         yfMOPChNGI9Jg==
Date:   Wed, 3 Mar 2021 17:07:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the fscache tree
Message-ID: <20210303170743.69ceaeb8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XdPmex1RJKaKBXh9yKZIVeF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XdPmex1RJKaKBXh9yKZIVeF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fscache tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/netfs_library.rst: WARNING: document isn't includ=
ed in any toctree

Introduced by commit

  cefbac2d6fc5 ("netfs: Documentation for helper library")

--=20
Cheers,
Stephen Rothwell

--Sig_/XdPmex1RJKaKBXh9yKZIVeF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA/J68ACgkQAVBC80lX
0GzV5QgAlToWg9Uw3xHSibsruvaK3HXnKZ2hIat2x/DLCCpkoKEBrmH1MY78PlZQ
Ma6OeCMGVAZ5RD1xn1noLEhdikeI/Afit9zLhqsII+jojWSF+gcQeF6l0ioz+qwW
/VpUN8pLMtWCXznAhNUP8d4nFcb4c0tA3cYu9/IISSwcS330PraO1Yb1zsaFv5Ow
255Vx8RD+9VJchuDBu0N0oeAD28IFI9YdboIExKBFQjzuZoO5/n0dsm4mTJWJCKG
MUuvDQzOZjzZ8RV20ZCbKBVvaalDK0/P7NLDhMUF34ZoCLnaxk71uBur1ldQpxwu
and2k6o6TxqEQOINMLqGMchYfrGtSQ==
=RsUL
-----END PGP SIGNATURE-----

--Sig_/XdPmex1RJKaKBXh9yKZIVeF--
