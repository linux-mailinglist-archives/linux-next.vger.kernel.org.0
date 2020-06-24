Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492A8206D46
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 09:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389349AbgFXHHr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 03:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388525AbgFXHHq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 03:07:46 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B81C061573;
        Wed, 24 Jun 2020 00:07:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49sDk75Sxgz9sQt;
        Wed, 24 Jun 2020 17:07:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592982464;
        bh=cL0oMWJYXSDVQxiQID8bINxCxFjC+uhhFeI3e29bY0k=;
        h=Date:From:To:Cc:Subject:From;
        b=tqqTQmobpJ1nddIl6G1GyDqGl+2gVtpeVt/ks387AFEzJC68zHYwwg4ljWbTxtBzn
         gLrJRinlKDjMNcjnIPL9fjMf3O0j88U7I5IMr5wVksllW0JjyGdS6vGztbWYxcORee
         197ED6wwvt66JSrxuWC6zlMkrDQPepNzdfbfYm2y4qtNc0/GKuBBfqkJKy2aKS6Eed
         GdIYXieix0UgSF+MMWDju5Hh4Kq77yE1oq1Si4rjpqr/a5msJiOJKhs4LLHULB8Z9Q
         lvFQW8yPsB4iit6V6LEsIXM7aDPGSVuQ7Cf0BRXQH9AUahpQSQgbGui01nuY2EeLep
         OZK+Z2VqHkh6g==
Date:   Wed, 24 Jun 2020 17:07:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Subject: linux-next: Fixes tag needs some work in the scsi-fixes tree
Message-ID: <20200624170742.4e9e9c96@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bo+DGo6BUaVlD_O19V+svB9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bo+DGo6BUaVlD_O19V+svB9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  46da547e21d6 ("scsi: lpfc: Avoid another null dereference in lpfc_sli4_hb=
a_unset()")

Fixes tag

  Fixes: 1ffdd2c0440d ("scsi: lpfc: resolve static checker warning inlpfc_s=
li4_hba_unset")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/bo+DGo6BUaVlD_O19V+svB9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7y+74ACgkQAVBC80lX
0Gyp1Qf+OEQmbJDNjHDxdfnb4AYsrlb3V8qC9sn80GT7l6QrTn/VaSZYTrylV1q4
EsVzCCSZ4ey44V6IB+iBtSY6nc4wRaw/jQAAzeHSuOQzkGF8y3OMQgpvhc7lXqqB
7juYYWFbPdv2AyZAVp3Wo82KdwAtn2LCmL1XMQ2AyHVTRmVdZMuYFA3Un/w/18ZE
hoHVtQFW493M+YpMNxMlxP79INTgv/pVjVqjWuse9ZzafdkysfKF7NLuJNNMBAWQ
3fIr1rbcYt+3wUOwrdpOUvqzbJEi+oASQDxGu0S6r0da2Vjn495D1mUzscAMIrel
gVwAvxgRMBEmYXEFqnsISVgxymstJQ==
=Hz0Y
-----END PGP SIGNATURE-----

--Sig_/bo+DGo6BUaVlD_O19V+svB9--
