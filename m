Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E89CB4417
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 00:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387828AbfIPWiy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 18:38:54 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:51820 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387590AbfIPWix (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 18:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=tCYzz5zSAyNLvbuiFvhHQTnEYtPkNqQHmaQnLBL2sfU=; b=Ot9C6Pvu4f+zfTHJjI7/fqLhV
        v31RPzM8PSIvYFgajrNwVzyoGUUc3FGHmmJqOwtzF9Bh7zd8D1lG9kWJ0mb6qx7btxDVZP9qcFNqZ
        gNrFX5s25pgY+JdVdGqGJYTP81LBoAc0eSrOnrGx1r8DeO803W4EKkSdaRUcHmOlBJTZM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9zdz-0005xv-AO; Mon, 16 Sep 2019 22:38:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 8B6722741A12; Mon, 16 Sep 2019 23:38:50 +0100 (BST)
Date:   Mon, 16 Sep 2019 23:38:50 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 16
Message-ID: <20190916223850.GQ4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ay2yXV/JY6JHtWz/"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--ay2yXV/JY6JHtWz/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20190915:

The arm64 tree acquired a conflict with the compiler-attributes tree.

The ia64 tree acquired a conflict with the dma-mapping tree.

The vfs tree acquired a conflict with the ubifds tree.

A workaround was applied for a merge issue between the drm and kbuild=20
trees with a patch sent by Xinpeng Liu, Austin Kim sent a similar fix.
There are further issues with this merge that still need to be resolved.

Non-merge commits (relative to Linus' tree): 11922
 11682 files changed, 762897 insertions(+), 376399 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There are also quilt-import.log and merge.log
files in the Next directory.  Between each merge, the tree was built
with a defconfig for arm64, an allmodconfig for x86_64, a
multi_v7_defconfig for arm and a native build of tools/perf.

Below is a summary of the state of the merge.

I am currently merging 310 trees (counting Linus' and 77 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--ay2yXV/JY6JHtWz/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ADvkACgkQJNaLcl1U
h9BvMAf8D2aZsMcFhAdjgIYZ8t53eZZdHGBz17D1qh7hP6DbeP/Kn74Q3UfLM8MV
xmwRP8iiTHh6r2oOIefI2m1C66s6f4wy0Mi7rFJFj0mPZa4fqQtgzxWnRsQpkxMT
y1XJEYFBGZiMWuZma8iOGPeovC7gElNLfYe5oUeQyG+ks/63lMoD2uJ0cig1qXmo
I4raV9eUQs9Cp1v3Qr7qGLXQaHEIFT74HFZ+F+njxEgQ9tiyZ33q/ELgcz4iZx0S
LagL2HgUqkoZGrEMFVonwpLTG58hMhrNwXb4/RihhiewEDr5gdUSF+j5qn5gEl30
4cZY/RfNj5YIYL19tui28Evx787MuQ==
=Q/0x
-----END PGP SIGNATURE-----

--ay2yXV/JY6JHtWz/--
