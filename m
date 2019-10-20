Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3ADDDC5D
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 06:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbfJTEMp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Oct 2019 00:12:45 -0400
Received: from ozlabs.org ([203.11.71.1]:55935 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfJTEMp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Oct 2019 00:12:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46wmZg0d2Zz9sP3;
        Sun, 20 Oct 2019 15:12:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571544763;
        bh=vUO5FyjRz6us2s8d9hUuODU6VYygG8CADYAuTgIgPQ8=;
        h=Date:From:To:Cc:Subject:From;
        b=NAiqjLYkB0mVWfKcxdEufPATVODOLwFthu5PGkbiywyhDbeWeOEW22MzYCpfTbjw2
         Q2eYKRzaKhJT8Puv/FJ/CxvD72IuiE1iZJ5PR6EfivKyl0CMWSDyFhh2g7SPDas8gD
         dZM3RrWZeEw6k9QrNdjHDfDXIAPPWycA/346rXUQwSVXNoPh9tCI2nOhx0THAXx5rK
         BW0/uUJ1ph1sGWIr8BbyKOZ70vhdHVmds/GFKIRkdRLHOyjaG+Tbz9XKgureKVKU6X
         7sQ8etVfFsIO+YHzwiQzpDeLbSJKt+sBHtKPp5inW4wc7R90OPGEIHGAHNUNRj8M09
         /HkkCfF/44awg==
Date:   Sun, 20 Oct 2019 15:12:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dominik Brodowski <linux@dominikbrodowski.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: remove the pcmcia tree
Message-ID: <20191020151241.3e9d1575@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bHsc7ua3qy8Q9=guUcWhEhP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bHsc7ua3qy8Q9=guUcWhEhP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The pcmcia tree
(git://git.kernel.org/pub/scm/linux/kernel/git/brodo/linux.git#pcmcia-next)
has not been updated in more than a year, so I have removed it from
linux-next.  Please let me know if/when you want it reinstated.

--=20
Cheers,
Stephen Rothwell

--Sig_/bHsc7ua3qy8Q9=guUcWhEhP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2r3rkACgkQAVBC80lX
0GzM/Qf/az35Nnwu0i5xGwCrrWyMWNID2MdjkQazRPVF9pxvIOnDMHu9L0cCEPLX
KoZqfhtCMzrJ7GQgIJvvnBU9RiuLqXbX2SuJo7NqAVDNRsPJ465j74/z2vCsP7mT
/cNKshJ8lYH2Vdh3UCVjHLUCVhJ4diMfKz6y8iqjFjaov9EVCNhV+ve7T7742ch8
z2iLX3LzCIo6jevMqcMGugD3XykJgFLMEYgX044LX09pwEqdYU/gVWmCWbgLwY9o
FgBpGq3uFckqOcBZyy5wT+j3vP0w9ZnzqAiDm/Yn2jPdoDT/wxi5fnqGOkB0sWWR
YOSsmx8Y40WODRD0sqAszObfUK0SVA==
=a7gz
-----END PGP SIGNATURE-----

--Sig_/bHsc7ua3qy8Q9=guUcWhEhP--
