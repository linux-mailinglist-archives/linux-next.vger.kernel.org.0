Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E5913D130
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 01:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgAPAh2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 19:37:28 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729110AbgAPAh2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 19:37:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47yldd5QYKz9sR0;
        Thu, 16 Jan 2020 11:37:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579135045;
        bh=GbTt+rKa0V2mpaEa87nv0cC/Exer67Ry1d8s0Ahz1w0=;
        h=Date:From:To:Cc:Subject:From;
        b=Q1y7+qBrzUIndY2aaSQNZkTDMed3sC37GDZKbSeXuzT8/r3GG5/g8JyQhfho78X38
         3PLd3mRPcYSX/+esXQ9awFbjh+Xex9dvOL5srLf8TYA/eMkW3qZEQ2n3OClEB8MMFn
         HCBEpL59medOPPWMIdL40Y/n801lEMItsjSwp4wUsRPIay5Sw+U4cq7O6kVvnz/kDN
         /d54N8SI+2VNQ0gKOkDSHlK7pK1eGUD5qjQ/FSWrzmeSoue7ec66MqTmfQPrCxXWOa
         dBA6iILQsTOtTAGdMbAVRPfwseMNb2+BNlVkoBlueE50x1YIyVaQAHgl8ry2t2/Jr/
         +VpsuO4VzKKlg==
Date:   Thu, 16 Jan 2020 11:37:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20200116113725.0223f18c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fzDzLL6F/gLixfTVWdm9Y72";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fzDzLL6F/gLixfTVWdm9Y72
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build
(powerpppc64_defconfig) produced this warning:

fs/xfs/xfs_inode.c: In function 'xfs_itruncate_extents_flags':
fs/xfs/xfs_inode.c:1523:8: warning: unused variable 'done' [-Wunused-variab=
le]
 1523 |  int   done =3D 0;
      |        ^~~~

Introduced by commit

  4bbb04abb4ee ("xfs: truncate should remove all blocks, not just to the en=
d of the page cache")



--=20
Cheers,
Stephen Rothwell

--Sig_/fzDzLL6F/gLixfTVWdm9Y72
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fsEUACgkQAVBC80lX
0GySSQf8CfAFnI3m7FiUt+ghaT7pAAinT5QZxeWmF/OD3jULbGZmtvFnDIhwMLXx
pat7wO4rb0NK46aCuDqJR5+1UpbHbG+kMofImfuFWBdkUAxDpeOjgFpg1hgZpQDq
GFG72BD/Xp4Ggfwq64K1nvNxyD5ujzjHNYFGUeC+uExda4u8DSFBKMU0XNIcatKo
obOkvEx7mz7IRLqhHlpRBilyoBXT5qRDRYieUYrdw827Exm/vRhKxd97TJUC3u9K
snbiRabSQKUSKjjvbAidUWmHMylodYZp/AIB5PNGUaioCsz+4YY3l4vdWKHPmRV2
2pfobsgBzAkh0c5ktruLnQe1c59aig==
=BD0u
-----END PGP SIGNATURE-----

--Sig_/fzDzLL6F/gLixfTVWdm9Y72--
