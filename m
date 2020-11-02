Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87F662A3611
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 22:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgKBVhg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 16:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgKBVhg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 16:37:36 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1741EC0617A6;
        Mon,  2 Nov 2020 13:37:36 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQ5qJ5WTBz9sTD;
        Tue,  3 Nov 2020 08:37:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604353053;
        bh=7rpW1Mb32DfOkhwiOa7Tx0Ai8GDdJ/hmk946rvTZ72c=;
        h=Date:From:To:Cc:Subject:From;
        b=Fyvvoi6gwAAjJxJfkqG4Ao64zEW3MBOL6Jr4FDPe/tOxfDoYoUV4bm5J4pGdg2QFt
         iDedyscCakmbD+Mns3+UUegKNHsdo9nk9pO7qnmLKcCsIkadZx0sL6O8wbh4EBPhFl
         6OzGVj/1Dx9H8lq7m99GEJTn7EWOfhetuypxUrcqMDqXAWZnw6Jj7/ZJGDKsMf2jyG
         RBsUtHhiSsDQEynPVqeWyOdDd7baa1Graf2QOmIKrBXwy+lgRODIxPTbRGOKIkEa9C
         c7uZfO+3aIGUBLhoFrhKO0IBap3WRuYANn5DMgmtZBYAQxRRkyhCSqGIY9UwYo68Ad
         2ghsn6sGWT/TA==
Date:   Tue, 3 Nov 2020 08:37:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Bob Pearson <rpearsonhpe@gmail.com>,
        Selvin Xavier <selvin.xavier@broadcom.com>,
        Devesh Sharma <devesh.sharma@broadcom.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the rdma tree
Message-ID: <20201103083730.539fe81c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lk.ZAxSxMhtzy7dof_tlO9n";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lk.ZAxSxMhtzy7dof_tlO9n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  32fabd9b163b ("RDMA/rxe: Compute PSN windows correctly")

Fixes tag

  Fixes: 8700e3e7c485 ("Soft RoCE (RXE) - The software RoCE driver")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Maybe you meant

Fixes: 8700e3e7c485 ("Soft RoCE driver")

In commit

  b67ffe884bdd ("RDMA/bnxt_re: Fix entry size during SRQ create")

Fixes tag

  Fixes: 2bb3c32c5c5f ("RDMA/bnxt_re: Change wr posting logic to accommodat=
e  variable wqes")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/lk.ZAxSxMhtzy7dof_tlO9n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+gfBoACgkQAVBC80lX
0GxKxgf9EGuPZmL8Y1T7ZKCJSAjwrirsRLTTcXzJqOOwt5bKvFAd8Jo/0oOYbN7f
ZQwziLicXN9W7S8spCbfXTgAcfTfRlu7NZDHJ1hIuVTeMO7sOsIDMJUjouv5cfdq
WUXrW4jTFXQjXuk3IPFDnDfKAs5c1RxRj6lItX1Hl/Q7vqGbA5+B7qK2npD8GuQJ
FYzKXY8OymETbv4FJthndsb6E9lt1azzKOTyrphKakiiAhrj16/KiJDoPzxN1GXg
rcxjAMTIago6rFlQZb+J9IwJt/AhibwQxRpDmBUY6kP5VgAIWQDqErt+BpnqZou7
SDP4e1iWWtrJYaLE1XXvbjec0nx/ng==
=it1J
-----END PGP SIGNATURE-----

--Sig_/lk.ZAxSxMhtzy7dof_tlO9n--
