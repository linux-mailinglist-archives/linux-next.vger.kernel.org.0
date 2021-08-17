Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86BD3EF548
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 23:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbhHQVx0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 17:53:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44385 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235384AbhHQVx0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 17:53:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gq4X30qyxz9sVw;
        Wed, 18 Aug 2021 07:52:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629237171;
        bh=NgaKXsEwN908HSee+oELBPDTqhLBPCGeU/n4p93/2sY=;
        h=Date:From:To:Cc:Subject:From;
        b=CU5M/9upO+HZtMt4HQcPU1U6ddCGm/FVrywNCzTgKsnSvnPFO/eNf8kXwhGU+q0Qp
         hp7FwnKRUcfiz/DTEijas6QbDINcC87VlzafGoXFhP3sO1BTH9HPYvRDCdQCKnXi8U
         jMDg0bUxgibFsPwqYCq1Ok6byVaPQmWu4sybczb2akGwNId2elqHmgybWJhTVq8k3b
         +/SSsbN7+s0aHZPmj3WdCI9sfd23Ybl1IrhDwcyRjF3oH6COuhUJ0fu0UNlBfiojDv
         hWLqZA2gPNboKALcpuj0NF2Q+PFsd8Z8VmYSSk04Sd3PtmCChvCjEixyizKV3zuXk6
         45pJGHpUPbj2w==
Date:   Wed, 18 Aug 2021 07:52:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the i2c tree
Message-ID: <20210818075250.08a593f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UTePGFdnAmFi0gV.lLgtBa2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UTePGFdnAmFi0gV.lLgtBa2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  eef7fa1001c0 ("i2c: iop3xx: fix deferred probing")

Fixes tag

  Fixes: 489447380a29 ("handle errors returned by platform_get_irq*()")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

So:

Fixes: 489447380a29 ("[PATCH] handle errors returned by platform_get_irq*()=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/UTePGFdnAmFi0gV.lLgtBa2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEcL7IACgkQAVBC80lX
0GzaXwgAg2yWd8OgeOCnYDWSLCChAh+6XteAgEFcQB/ksr7v3MWvm82Q93YpCSF8
LtL61xpEiwwxsW+NvZkXl8kTZeUdNzxQrDARJTB1i+MTDFW9q3rZiCk7jGNKI63m
SNxSWIF+Fg1WlEPaouVUnEWUrZ7SNc9qFAlfG/IdPohpRvu6Ro+URFDR4/dpId+A
wFQsKRGbU5fRSHTEHDH1DBfl7Pzk04PPUWB3MBCAKQWGUmc+PuSyTZWqwtoaTxdJ
dYL43dutWS9ZkvgdhPjp1ICScceDn2KMDzN/ogovInUVO3Us7Dgkh43udKj4ylek
xF93wasDc16GlXA4g33H10gGNEdSnQ==
=Ng5Z
-----END PGP SIGNATURE-----

--Sig_/UTePGFdnAmFi0gV.lLgtBa2--
