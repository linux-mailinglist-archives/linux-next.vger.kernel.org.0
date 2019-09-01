Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD7AA4C46
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2019 23:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbfIAV0f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 17:26:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50581 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728941AbfIAV0f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Sep 2019 17:26:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46M5r83p94z9s00;
        Mon,  2 Sep 2019 07:26:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567373192;
        bh=UUnQe3VO7dn9iidyyYWuJbwGL4ZlD7iABjxXSNn7mEE=;
        h=Date:From:To:Cc:Subject:From;
        b=qJt9dXqktmwv1NOrV232P93W5gPta/wIwIZq0vYUZAn2fSA7qtRZw0PP4J9e8pAB1
         dQk0fF2UYP6DpQeHbYTjHF33o+4v9B4DrhsVUPBkWJgOnTOVjGFFpOkuEdFNUeQjgy
         Cx5xjEQhquy2LlsW5NsbC4OOQPd0ZYP2/fGpLS8Irvx2jn+iYOV+Jrf4w59FhTuiHJ
         VtqtccD4zUj5h4dn+uXoEAL26qxssEJ+MCRo7s/x+2H2sJBY3K80VZq60HqwmUMzy0
         BuUyYqZiTa0LZQi5Aqa/yompi5ob5dU/MXUP8o6jplnpMY148daTM/s+CBSn8IvdSc
         3vZ8Y4AKYa8OQ==
Date:   Mon, 2 Sep 2019 07:26:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs tree
Message-ID: <20190902072631.310ccf95@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3C.66g/4o==NACc1U3hbP3B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3C.66g/4o==NACc1U3hbP3B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e013ec23b823 ("fs/namei.c: keep track of nd->root refcount status")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/3C.66g/4o==NACc1U3hbP3B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1sN4cACgkQAVBC80lX
0GyGgwf/ROtl0gOe7y98vhIpw6opPjbPC4uP7ZbjNu/2RXA4XgzoyiniqZwOSRk3
UVs9HiZXIIumLig18ys5TnGHwPtPOmGQN8fzckth2gbyEewP0ilcYOAf7xIdcgh5
geYgAjS9b7VEYPBDWNKEnmrIMjAUkBL+Cx0QdSo+PKPxnfipTc6AfR96qDXHwIad
34FnB5ECWN1n1k42CZFaD1eOcvw2VLweM7Vo3kpbVQaigBT60KO1vsOr+wQ1XNJ0
W7FR+j8MBNm30uMnBg2grXEcrUJYxKJyIcpbY+mR9g1Go2dJZsn3m72uC3vPUqTT
wyWTsU4hH5wIMflZDuaeca0kUKZW8g==
=9MrC
-----END PGP SIGNATURE-----

--Sig_/3C.66g/4o==NACc1U3hbP3B--
