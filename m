Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25143305112
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbhA0Ekx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:40:53 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34759 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730485AbhAZVFe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 16:05:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQK4N5Dtlz9sCD;
        Wed, 27 Jan 2021 08:04:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611695092;
        bh=Bdi89iIrOSoY/5aUkpGNQ3wsJYaEu4YLqMGPizyGMBc=;
        h=Date:From:To:Cc:Subject:From;
        b=nGkX1DNpeBgGNvJkkDS66lsdzias3VAcETuor+gmp+KwVl1Dk+2/QI/AUbEOEHkkG
         LrO2dhO6CnYC1+1LDBgTaQCBMOCSAlscQb/2vltdZuB29kuu2zaYS7MXlepEQdz4oG
         Uais80A8Lv+oSAZv3DSN4s28lp/DcxYwk861FU2mxyl0qwvmVxaaZA2Vm2DZv0tJq1
         JpCNLIbr+4VGJOX0z/Fxk/GuxXwVrImjsh2oQuq7ZwOVBvsln2+59X8h27un6Q5kQe
         a52gHQ8sGKSanyKeUpN1sl/JIIJB/x9Z2Mea4NxwQr/9oE3/8ugJcD7Uv3mWDx4Gjs
         IWqimhlC4VR0A==
Date:   Wed, 27 Jan 2021 08:04:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard@nod.at>
Cc:     Hajime Tazaki <thehajime@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the uml tree
Message-ID: <20210127080452.693bad14@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JFlU20CfwW8qu3KsNmES2w1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JFlU20CfwW8qu3KsNmES2w1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  bcd159483b30 ("um: ubd: fix command line handling of ubd")

Fixes tag

  Fixes: ef3ba87cb7c9 ("um: ubd: Set device serial attribute from

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/JFlU20CfwW8qu3KsNmES2w1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQg/QACgkQAVBC80lX
0Gwmggf/REID1nt/2P67r1iKeOw+O7YgZKRRy0wktd+DnyTJt8l4A1BY/z3kQA5M
8oOV0TxJn3Q+A7qj9IrvcsZ67Ih+NqF/dZlDZqBsmPifvMqEGQGNp+Ri1spBgBsr
2QThSSHHFeRns93j/w5nH8hQ1HuI9lj+TjK0eotc37QscS3PSjn4JlDU2Ls0icHr
T0sI/oB0gvUxYuisOBC0QGTuZvCV0wuF0858RK06akiKP2+Gwl5H7glTd8BrVrQb
UM7srs3yN49yIgf9yyYNnYxPVbBQhJn2y97y3Lg0DD5Q6Qjc7sl84pETDFAbDTp+
FcZqTUqpVgombRzm29nj6yBHcZpX4Q==
=lWFF
-----END PGP SIGNATURE-----

--Sig_/JFlU20CfwW8qu3KsNmES2w1--
