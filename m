Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA2F30219C
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 06:18:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbhAYFRw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 00:17:52 -0500
Received: from ozlabs.org ([203.11.71.1]:47501 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725272AbhAYFRv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Jan 2021 00:17:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPJ5H593Kz9sT6;
        Mon, 25 Jan 2021 16:17:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611551829;
        bh=d6wH0tewhj2bTX9Py+IDUHXdALC/jLkfFA/RuTcPyzc=;
        h=Date:From:To:Cc:Subject:From;
        b=gmRlcwysBMsyZfCEoqaIMtPmy0JEXVucpm2BMAKFfW25pohCiOFcS50ICHdWCSSon
         hVPHJle+OcJHyPIZ1B7xN7MccgoOQUbZyTAaJ28zFCVIbBToQmG8SNo4OEzj3CgDY/
         HgT7c3uxPXWOy2U6O6oEUbr8vETF8IMNGMTijz3qw0Z6VFTZOrA0Yrcq3Qu8B28l1t
         dkXHtQcMgqID1tSYdm/RDOblcFT2v+jdrHe+GZwBygLQN0DBO6/BB5KIsFYovHnt7/
         ffGHLAdnMuE+6WpoF4GUkhVMpjZUlGIn3SN/qShlMrjkh/WJguQ5umyCe7iwAp6oYX
         nhRUa4mmMRjxQ==
Date:   Mon, 25 Jan 2021 16:17:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the vfs tree
Message-ID: <20210125161706.05873f95@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nu1zmlhzmy3bv3chsysBAyR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Nu1zmlhzmy3bv3chsysBAyR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/coredump.c

between commit:

  8a3cc755b138 ("coredump: don't bother with do_truncate()")

from the vfs tree and commit:

  643fe55a0679 ("open: handle idmapped mounts in do_truncate()")

from the pidfd tree.

I fixed it up (the former removes dump_truncate(), so I did that) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nu1zmlhzmy3bv3chsysBAyR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOVFIACgkQAVBC80lX
0Gw/0Qf+JFgUcVZNwP9lt7ECeC/3/cLkYiapiJW1WjcRHewkur4tuMZPwzG3OCeG
jZCml+TrGMbxvGSV0KzoERAy732EDvGzqmUERwIfQcssNpxQ5OqvXYz2Ey/7hyq3
jqIzPw0V+9vZRZVIAD41ClxzHNje1bJBh392wXv5/mF7Okgwu3OD/U6I1qMVhVWV
JSxuKaSIigrpnRSzA/K5QaKLvGX9HXxS3yXvHUjgccATnz0jlaf/d5woM4ZOdOPD
PC8aA0Pj8F0D141L7Ta5AufwswA4Ud5e610lgyF1VAHIwymhUnUDzQ4YPtRMNRk7
5N22AcYiQWm8Vhk/dqphmjGUIzxVxA==
=bpqY
-----END PGP SIGNATURE-----

--Sig_/Nu1zmlhzmy3bv3chsysBAyR--
