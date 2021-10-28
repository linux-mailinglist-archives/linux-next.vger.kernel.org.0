Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A12543E0BF
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 14:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhJ1MXb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 08:23:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54211 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhJ1MXa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 08:23:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg4R24CPTz4xZ1;
        Thu, 28 Oct 2021 23:21:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635423662;
        bh=hCboHI7lN95339dseQTlz8zWh/IwrYE8xrkV3rLUulE=;
        h=Date:From:To:Cc:Subject:From;
        b=rEETi90aNuAhHpxZIdyuTUuA1EFA8Sxd4BqQL8hrHYdBAMAGegyxbg8LQz4xqC38U
         0RHj3ajI9b1FSc6lTYCtXYPYO8y+w31zub0d7L7kG3ub/Q2a5ILdT1JP0N/K8Mintd
         Ch2kKdJrCvXMMvpfMPv062FFESmPG27s9VZ9Asv3xv4XL8ntduqLgtPVg1y1qU+zF5
         vXKaGmINjQalTfYU83H1l0ToWfh2t+AFFb6UtsvieuC1MPAucbGSvppNgA0Fjw8Xbz
         iyl1uB+lxgoxlSBXWIi0ImiOlFNlg5JBc861U6gTrmH3c4VEMahoUoHYWvDpalmfRq
         Eve0IawJILMUA==
Date:   Thu, 28 Oct 2021 23:21:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jan Kara <jack@suse.cz>
Cc:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ext3 tree
Message-ID: <20211028232100.03d394fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rM0dgqzZr27hO9UjKH7Q3Tq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rM0dgqzZr27hO9UjKH7Q3Tq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ext3 tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/filesystem-monitoring.rst:60: WARNING: Definition=
 list ends without a blank line; unexpected unindent.

Introduced by commit

  c0baf9ac0b05 ("docs: Document the FAN_FS_ERROR event")

--=20
Cheers,
Stephen Rothwell

--Sig_/rM0dgqzZr27hO9UjKH7Q3Tq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6lawACgkQAVBC80lX
0GwPtwf+PNz1/JhFk09yNeR1vnt3PHLmUehMNwZbn6z+lOlvnimYGGqxpuH8lk1U
Wt36O2/gbgIVN8hvYu8Lhn+MnNqODzeiUD1Fv/xxD5g/h/AWqGdXHdRmdkfXqsA1
f7Vlcq/F+E+VUywjy3YFbPfOdXpgyb36slz61cRY5oJkaecAl3PzSRJvNRp5TvKo
xfFzmuDauD61CW6e0RFHDrcXQHcpMninx3d0YypZLfHCIw0vLaQAJM22qyYGlhtY
GkHNH/YK1HkQM320v4g47nK3/eN/08uuTGB/oCx5VMHHEWiXA48nBDeXsTlGNPQ5
1h6FnHWKzBhXX5P6nDGoqxbTLtIYnQ==
=0W3K
-----END PGP SIGNATURE-----

--Sig_/rM0dgqzZr27hO9UjKH7Q3Tq--
