Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5C9198581
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 22:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgC3Ui6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 16:38:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49757 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728165AbgC3Ui6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 16:38:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rknq2Ls8z9sPF;
        Tue, 31 Mar 2020 07:38:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585600736;
        bh=C3Z9iExlzgA+CO0y5PX3zyo5hFv/Jnt4v0MRi1tgpZY=;
        h=Date:From:To:Cc:Subject:From;
        b=AvnSksACatso4LoODuSqMKfcDmKlp/BjOTtHsYmVm9tjeIomqC9MIQ8iimFAVCAVJ
         dL9fW3X+ggvtFndD3OmZ0/A+dM0yqi61UcdlGowDKqERZEDfit0K5h/TgWC7sp/lEj
         UV+Vj7LQR7NWDW4rPt5p9GxT8TlapsoYul4ICEQ5nqgxfEsiRiCOQe2296I+L5xenV
         obvRJ/P28QdKDyQeyp1oeCQAZrdTZ545VkGsnChO7tqQMql75QtPqLnNL1TxlDWIZO
         2A4461PnSr3ErrACfX/Yw8zElE5D2Di1eO7bMTAt/NqdrO0zt/KIIVF8anMJztqzmX
         ZswDO5nywrHRg==
Date:   Tue, 31 Mar 2020 07:38:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20200331073852.54e44b21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cRKgrK9AnlN/kCMsx01VwK_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cRKgrK9AnlN/kCMsx01VwK_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fb3ffadca55a ("PCI: pciehp: Fix indefinite wait on sysfs requests")

Fixes tag

  Fixes: 54ecb8f7028c ("PCI: pciehp: Avoid returning prematurely from sysfs=
 requests")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Did you mean

(probably not :-))
Fixes: 54ecb8f7028c ("Linux 5.4-rc1")

or

Fixes: 157c1062fcd8 ("PCI: pciehp: Avoid returning prematurely from sysfs r=
equests")

--=20
Cheers,
Stephen Rothwell

--Sig_/cRKgrK9AnlN/kCMsx01VwK_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6CWNwACgkQAVBC80lX
0GwlDwf8C8IUu6dk8Kx6NvhdVwFlmXlB1z3QnPhPPsfmp9m0wQwstuQeF80cZ2aH
/YzOhc5ssavwuqXH8qtRPPwHMQzmUVKh/janV1f97a/9bZq82PiFXcRCTBOKnjMp
F0wleNiiQB3xHmO6GN25KkqDn2iOmJeY92c1vl7ZXS/+xzqNxtDdt97okwVdhZhW
I4sF5DfCqs8JIx7FfGvl4R6PC99vg6O9Z+qxBCul4kU6f0eUEOgTjk4mJUluYAn8
tERAH06ctRLByR00/EKcWXlQV1TRlHfRCNK+3B5wv0l8Qlljw+3y9KloyRQY/N1e
ieNw0BgAF3mJMBxOw4l6Tp4mC9K5qQ==
=PD1z
-----END PGP SIGNATURE-----

--Sig_/cRKgrK9AnlN/kCMsx01VwK_--
