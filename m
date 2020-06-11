Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FCF1F5F59
	for <lists+linux-next@lfdr.de>; Thu, 11 Jun 2020 03:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgFKBAf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Jun 2020 21:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgFKBAe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2020 21:00:34 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B03AC08C5C1;
        Wed, 10 Jun 2020 18:00:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49j5BP6d5Lz9sRK;
        Thu, 11 Jun 2020 11:00:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591837230;
        bh=R2VskCiChqNhN7qCRPxY+44lyDDirsoZ14BhweOLTgE=;
        h=Date:From:To:Cc:Subject:From;
        b=sVsoGuoYbIfyYiH7XW9ebyOUC3eMp/zArev7Rn9nJhbN1oIaVoD4zlX5RAu1/4B/W
         Kvezdgq3o8eLrx7GV24Jaez2wA7oINFt9iSRqtm3ReHj3RvbCT+Em4v+GmLRT1JqXf
         EgLLsVjIzSxfll35Px0e8Gp9Fy3RDdOx2smG1jlLrYv/P4rfB+h/kWjTrNLvfcS+Mf
         TtnGZKXpo3GZJ/OGstKfGInVaXkUPNGiJIgOiBPvX/fgRHkWv26pX73NPX24mE2aLB
         IV7GTUe/La9kACp69Dor5eCmGcWlgrr0AzTj6sYULhQDJAJW+fT4KPBxVUIf+wWqIp
         1E2EMxDESfmNw==
Date:   Thu, 11 Jun 2020 11:00:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200611110028.4c4e795f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2n8WZErDihOtxara9yS6JIb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2n8WZErDihOtxara9yS6JIb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/compiler_types.h

between commits:

  a5dead405f6b ("compiler_types.h: Optimize __unqual_scalar_typeof compilat=
ion time")

from Linus' tree and commits:

  1fd76043ecb0 ("compiler_types.h: Optimize __unqual_scalar_typeof compilat=
ion time")

from the tip tree.

I fixed it up (I just used the version from Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/2n8WZErDihOtxara9yS6JIb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7hgiwACgkQAVBC80lX
0GyNHAf/Y/tmfyUNXuvEQ6KmMVZM3vXhr5Hd59q7eabp6LPFWKFHFtWycivXOLbi
d9AX4S5Ml0ZEYAZofxlKJ+RJ2wLuwuAWqdqmzFcjJyWTVT8wc1+XLKAoGdXU6PKF
vjxRmTIEP38zq7jYgHIJUMyTxEr5qca0uPT4Z79nKCaAlSjbpCp5ZGxcCx+EsuoU
BVb/0Ersyb26jysyvNNcaZTiMyXe16kVy/V6xNpT94DYGnnah89vodW7pe2rdJYV
Cly3NMgUBqzvt4AhiPgUMWxRCQIFEt6WgRUAo8YTo/nfqKohNHUuySnQ3EEe96lV
l6SEA7joGMC8Uyzzh9r2yM1Tgg/2PQ==
=/PfC
-----END PGP SIGNATURE-----

--Sig_/2n8WZErDihOtxara9yS6JIb--
