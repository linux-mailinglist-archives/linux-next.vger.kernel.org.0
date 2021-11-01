Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6EF24412DC
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 06:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhKAFLc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 01:11:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34169 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhKAFLc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 01:11:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjLfc5kZ1z4xbC;
        Mon,  1 Nov 2021 16:08:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635743338;
        bh=q0tgWNqQxXtIs21SXw3TEC35sXSDod/5iuj0qDUEfzU=;
        h=Date:From:To:Cc:Subject:From;
        b=O1Norf7jge+JKsMSujuIPoESlD/co6KiaBSTjT4qhXI8hEy/PZ1/eaVRNhqBBZ09F
         +LwjoymeseEUGqx9Q8orPfRIGWSMUH1gE+0Uqb8nZE9regRGM6g+zVc0o1ejty2UMM
         64oJIIZO2sMWz3tfwdJMXSvE+dMCeIOa7IJquxOa6f79AnoaqplWko7RHcnseZ2kuj
         L9Ql8i/RoF/uUEUx/Wj+5v6kSaGB8ro2EVHAzEx8mFV/CUAlR1EfwmBggbQYduE+Am
         r2inGJ+xt1DErBnznq4f1urPtDCQ3LACWByjbswuyDk+kKkU7UE9wxvMK9cI84gqrp
         RdiIzjEBpi9Gw==
Date:   Mon, 1 Nov 2021 16:08:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Bart Van Assche <bvanassche@google.com>,
        Christoph Hellwig <hch@lst.de>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: linux-next: manual merge of the scsi tree with the block tree
Message-ID: <20211101160855.34eae992@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yOHH5qFdP.4WI_U851l/oFt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yOHH5qFdP.4WI_U851l/oFt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  drivers/scsi/ufs/ufshcd.c

between commit:

  0bf6d96cb829 ("block: remove blk_{get,put}_request")

from the block tree and commit:

  edc0596cc04b ("scsi: ufs: core: Stop clearing UNIT ATTENTIONS")

from the scsi tree.

I fixed it up (the latter removed some of the code modified by the former)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yOHH5qFdP.4WI_U851l/oFt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/dmcACgkQAVBC80lX
0GzN+gf9GM3/YWVGnNUSBCd7WWWfu6Kk7G45UHL1CqsEhF/d57nmYZWp1x2nYW8h
gbn5OBYygBmg1jI/bU3fIotxfp/MKsC+fUUbTEYWh4d6vm/U7kGamTbjEonl0Sbi
qLu5UG8J7xpiJbNfNkYH4n1SdXH15XsplAjlVsQsQ4O2gW7yrn4tiNnYvnQ4Lu2f
r/K3jDUfD16BwwRpPByJ/qKPUT09U6RtWxCeITZoBLC5tHXNxnbQBkQKcTbkz7ra
kSNSVYlr9prA/J7R9ZTrBdViBT376jO5kV5GvYmBUYNUb2QMKnHnWtwHCkxZWWgK
JEovGkyDLcYHm6ORXTr9aeeKd9WBzg==
=4qYW
-----END PGP SIGNATURE-----

--Sig_/yOHH5qFdP.4WI_U851l/oFt--
