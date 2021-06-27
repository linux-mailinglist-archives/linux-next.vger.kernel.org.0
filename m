Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACBF3B55E5
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 01:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhF0XqG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Jun 2021 19:46:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42831 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231508AbhF0XqF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Jun 2021 19:46:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GCnPR5Q0Tz9sW7;
        Mon, 28 Jun 2021 09:43:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624837419;
        bh=OHpdAbTQLet7qOxWfN8qjTyOIqguqvCQBStulRo/pXE=;
        h=Date:From:To:Cc:Subject:From;
        b=kfj2zGAalXTsTuSe1HmlQ4TYQwnb3oiChN8zV8y0gzwUldZ60CUzTJBjyfsmK5vLd
         qBl0kD0V/yV0e6Qv41sXotFPlKDjYFwI/mvnjFG64vamJgy0OndFRGRV/NxbfdhSnC
         CkGHRsDYwbULDwut4PoCOIu05XfLmyhFrfuwR+T+z+lirq9uYk2rL0CFXtHiO6b7ko
         t3+8Oarg7whqcZIN22ebCXlut3UKPAzDzP0ZqGvQEe1ZpFNp09cH/2fpjHSBdLrKit
         cz5rtffRZo9tBQ30kyz0AeYuOrPgu4mLo4Kwga0w52al4JPmqUxuNfXGhlVPTTMPrG
         RfOnDVjYypD1g==
Date:   Mon, 28 Jun 2021 09:43:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Marshall <hubcap@omnibond.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the orangefs tree
Message-ID: <20210628094329.56de86cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2Wf+LRNEMqK3Ab+g8mvEfw3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2Wf+LRNEMqK3Ab+g8mvEfw3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the orangefs tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/orangefs/inode.c: In function 'orangefs_readahead':
fs/orangefs/inode.c:252:15: warning: unused variable 'file' [-Wunused-varia=
ble]
  252 |  struct file *file =3D rac->file;
      |               ^~~~

Introduced by commit

  030bd4f13d75 ("orangefs: readahead adjustment")

--=20
Cheers,
Stephen Rothwell

--Sig_/2Wf+LRNEMqK3Ab+g8mvEfw3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDZDSEACgkQAVBC80lX
0Gxbqwf/T+9YP4eIaK1ao0yJIoQytRP27DadMjmkYLiWypvnOAFL2QQFmaSuZtex
FBGucp8UtiVYMvOQOkEFv0xgF9H9L+j1c03szVQV/BsRwh7SQKeW/gXegsIRapFp
iWdBPzTUmas6fBiDdGpGBbg+zW7r9/O9/BazsH4YiDW51mdebZN+N+53bVWbq7xI
aMeExYm4L/svRZ3B6CjBotta9cphhw+N+gcf3QlMsmbQ/qLxTG1qychHQdBvAGjc
CWQkNbBWiQH7kiqym13qfrgoTohGFOWGe9I1RpO2abta+TMaB3o6vzMdZQU1AADp
+h8oYaAjyNW5C3NURwzPq30ug7wQdg==
=9dJ9
-----END PGP SIGNATURE-----

--Sig_/2Wf+LRNEMqK3Ab+g8mvEfw3--
