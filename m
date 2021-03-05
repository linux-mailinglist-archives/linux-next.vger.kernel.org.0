Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7112B32DE32
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 01:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhCEAEQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 19:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCEAEL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 19:04:11 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AEAC061574;
        Thu,  4 Mar 2021 16:04:11 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ds7J370Jjz9sSC;
        Fri,  5 Mar 2021 11:04:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614902649;
        bh=AN30twrd6tkzHV6B93awH18ER6sEDLxGk8NgrJ4M9lU=;
        h=Date:From:To:Cc:Subject:From;
        b=GHJVRkJ6JUrqeclg1VPUkrqRqURJAyM08cLMo4cRPebbxHTwNRzOA9d3DTLF3PcpU
         g8j6I3DFoBctN+mKn2byWrxoDmqp8uQaMWyhusZjnxnefYy7u34+Fum5UsWsWuanTX
         t/NCgrVWhwVYuzW+0/yCCzR9OldMEimPJ5PG1cZ2YvXbNUyeHqjxnqxsGHfjVcCUDz
         u0A9lxQ0JjhgK/4AP/obaA792pBItves5hcqU7/UvYr0WLQjWa3I8vavkx9eXE1KGu
         qAPXh2VAitjyZdjQQ6MA8a1obUwjLgyesOH82FWh3O1RrwJBUj5EaEG+YIx9vcl0LP
         WUpphUvXqEqhA==
Date:   Fri, 5 Mar 2021 11:04:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: rebase of the scsi-mkp tree
Message-ID: <20210305110402.70ff1080@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KuIQu.YyvGTpyb.Qj2aB3._";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KuIQu.YyvGTpyb.Qj2aB3._
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Martin,

I notice that you have rebased the scsi-mkp tree.  Unfotunately James has
already merged part of the old version of the scsi-mkp tree int the scsi
tree so that commits f69d02e37a85..39ae3edda325 in the scsi-mkp tree are
the same patches as commits fe07bfda2fb9..100d21c4ff29 in the scsi tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KuIQu.YyvGTpyb.Qj2aB3._
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBdXIACgkQAVBC80lX
0GyIMAgAgV1g54gqI/uaoe6OziKF9w/37WE4kKeAcGusE0y9QabWxF12hdlMMwLD
FLx+U3HUzIHw+08ScoGSPRRO5ggA1SfXd2cHqa5EWT01bVQfjwcmOCzJgDR3yICP
Tq4TZ15yOPDcBk+nP4pOP29kjh74uOoY95FclIK4rCtqsX1TvLAbHJnEli6N0gq1
O0MsqeEy3yyDzyvT22eSYPJ4laLj3BUZ4WlCGvezCopqVfE8D6Zao9Y6g3bzrTwr
BpalpZ5ARIUd95TPOopxcKGZcyiXh+aHnx4xcNDXndyEZrpkCLahGKxCZBzesns5
XDi4+iLjcrj6zU4+mQuuOTeeXlInuw==
=DAb4
-----END PGP SIGNATURE-----

--Sig_/KuIQu.YyvGTpyb.Qj2aB3._--
