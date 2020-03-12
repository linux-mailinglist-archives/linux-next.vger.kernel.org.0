Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2317218276C
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 04:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731613AbgCLD0a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 23:26:30 -0400
Received: from ozlabs.org ([203.11.71.1]:44415 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730913AbgCLD0a (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 23:26:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dDkq36lzz9sR4;
        Thu, 12 Mar 2020 14:26:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583983587;
        bh=Vqhz4oPz6+GlKPKLUpS/5i0N+4wqT8IhNWcg72VVWbE=;
        h=Date:From:To:Cc:Subject:From;
        b=RvYeK+tEiz2ABakSpVk3QvWsAYF/eTsdj5jwVZICmsX0jTEZEhzl0YXnqUWTPhDc8
         M/VYG8fX7UjRgnsIVlYU6aUHut5R48VjVEZZW2c4JRmsdAyUZW4eKeseRxdYSQfGc8
         MnWovnhuZpeDV0QEG9yzSc2NLNbXnHd8YoNaPUXraA9dWnwN+nnnDeQkQX1a1rFwE4
         yxKj92gUFEa2GqAu2Yk/B0J0GkFLlfM3RF3B0XStKEl6OfW67Bg6IwL/4sO+nxNqic
         qAPR2BzONyMNGZVLiRUT5sJlBCr3MZ5hv46eE7f9VfuAxzVycbi8rVGfVhQANDSQtf
         EActIs4AdBe9w==
Date:   Thu, 12 Mar 2020 14:26:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the scsi-mkp tree
Message-ID: <20200312142626.3cd37db5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wooh=7Uhpx3zXUD3rJPtp6s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Wooh=7Uhpx3zXUD3rJPtp6s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  643fbcffa541 ("scsi: hisi_sas: Use dev_err() in read_iost_itct_cache_v3_h=
w()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Wooh=7Uhpx3zXUD3rJPtp6s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5pq+IACgkQAVBC80lX
0GzWSAf9HxG4SDu/MdpAfKLf5+qz1l4Kjlg7Azv8Y4UM3oNsTkrq10yyiRbaJ65F
VrryYnBIpZHkaQ8196wnNL4rREJifuZPX5c3OWnzal441XVeBI8vxzZKk21Ueqb3
65tasnvYcJ2CNw7N16ssY/WPHFZBzriWlYVo9OwxeNiXOcs3GcTv3tzFJJXuLybv
85bBRSwj5TwZQiBCeIkDDD3+W7MriMNhQxGU2bOIqoF0QXdEA+DttnpFApbALPTE
LXbmhL8J7rIVFYlsoJsIMB66jwEiLK+OGDztFgvOsi79aCjOb+aj6MYoLLDQLox3
jApYcxKagN3bLSXdDXP2cAdUg93GAQ==
=A1Ic
-----END PGP SIGNATURE-----

--Sig_/Wooh=7Uhpx3zXUD3rJPtp6s--
