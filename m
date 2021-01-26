Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB03305CE0
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 14:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbhA0NRm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 08:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S313724AbhAZWl4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 17:41:56 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DB2C06174A;
        Tue, 26 Jan 2021 14:41:08 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQMCM09f0z9sCq;
        Wed, 27 Jan 2021 09:41:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611700865;
        bh=OLB+OLGQwlnvJO6+9RbUrl4BULVG3ohyEFraTUk3akQ=;
        h=Date:From:To:Cc:Subject:From;
        b=UgsFqBiPILsLxPJ8xnhZruHnq7WjMHP1taFTR6NcpsuybGj84hdHm/J4shjQQXg3w
         yI8cQggfQ/o2IEp5LW7J0MZ/qYIA0wHnMmCVAFvcCrDj+RAhz48LyhDU4V5aZdAIex
         8qY3IVF9JL16qyZ3oDmfFbesMAbsCgoqOTkjsZZtw5vfj6myMvDvsDifOSS8R+DTvW
         fORTHoopXoLeWONp0rny1T3ShtrPLzMjMLBXPf1MH5+hlSwTDBv007r6Y7S9Y7pdGT
         yFbB25f0PO+fvJcAucdG4PeLktEhzWN5thk5o7tHkkD76bcrkGl/xFUt5MnTXu44Y1
         hzp77LrAtTe7Q==
Date:   Wed, 27 Jan 2021 09:41:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pidfd tree
Message-ID: <20210127094101.2100177b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xR7k3ljwo/KcUXBhSP2ClfV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xR7k3ljwo/KcUXBhSP2ClfV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pidfd tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/xfs/xfs_ioctl32.c: In function 'xfs_file_compat_ioctl':
fs/xfs/xfs_ioctl32.c:441:20: warning: unused variable 'mp' [-Wunused-variab=
le]
  441 |  struct xfs_mount *mp =3D ip->i_mount;
      |                    ^~

Introduced by commit

  f736d93d76d3 ("xfs: support idmapped mounts")

--=20
Cheers,
Stephen Rothwell

--Sig_/xR7k3ljwo/KcUXBhSP2ClfV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQmn0ACgkQAVBC80lX
0GyhWgf/Ub7cOl92AW5uIPB4UgZCHhRXDYLJhTbB1iPDL70RGclPcZwQrMkf9K9d
29KiLZQk4NwQ4rxg87p9AIccfaNC6ZR/Q2pJoDNmm2YKodrIisAcrTuXDP9TSB8b
b8y+PeXfQDUjU5YGVI/WQ9ydD8jjrxJ4wcRGA9fpkIIlNr1aDaiFLHAWsh7XS/d1
9+J+J9a5nU2s/xdF5rWITbRPmL5KIlaxANeecYmAf97XpnCNunT4QFj3h9cdU28E
XgjDEfiJJ7oOqvLhLHWGmuIB/Eu7F30PxVq36bX1tE9uDoi8qG/K8PP2bok7LRXT
1J2ZbGLwkwFfbi+8XJFExn6nPUXlvg==
=khil
-----END PGP SIGNATURE-----

--Sig_/xR7k3ljwo/KcUXBhSP2ClfV--
