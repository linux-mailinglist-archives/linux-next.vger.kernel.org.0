Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B77526CF28
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 00:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgIPWzB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 18:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgIPWy7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 18:54:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EDDC06174A
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 15:54:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsFm35pmgz9sVC;
        Thu, 17 Sep 2020 08:54:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600296890;
        bh=ALfqkhXecz3xjiWH5VA0Zac2vyZx14+HCwEv1KacsOA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Bg5xRTNPkO10k87vvPh7pb6et+RraAS/Hn+HiP2QVYnLOZpSEyW+acSgExuYcLV5S
         0Qp/dSpiA8gkz8LU+EiqDBrSlvAfaZ1cUiG4yEoVzIXl9hVew2eVjiuvWpFJdl677T
         L13pPRig1f4sydP5kdSEdeyBA9c09tgXeIiQo10KTqO66zusmIOrudxqqbGqmLT9eJ
         t7EVf6hvuonX0U3NNqrCzcqbpnhhRDtzY20kRgLu6d12D4ZaSAU00bgZDk37llka0c
         vEspIsWWqsbK8OJO0O3gYAoYLx0r8C3GzBd0DX/MPD5EFBjY5eowY6ECjad0UHXkGq
         Tvhc9OUOAfdaA==
Date:   Thu, 17 Sep 2020 08:54:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-next@vger.kernel.org
Subject: Re: linux-next: add s390 set_fs branch?
Message-ID: <20200917085138.0bd1998e@canb.auug.org.au>
In-Reply-To: <20200916162846.GE7076@osiris>
References: <20200915155534.GA11180@osiris>
        <20200916095437.77e7365d@canb.auug.org.au>
        <20200916162846.GE7076@osiris>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5Y/wiLZmVkb=.jqa8IBPGzQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5Y/wiLZmVkb=.jqa8IBPGzQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Wed, 16 Sep 2020 18:28:46 +0200 Heiko Carstens <hca@linux.ibm.com> wrote:
>
> Ok, so we have a "for-next" branch now:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git for-next
>=20
> If you would include that in linux-next then you can drop the
> following ones:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#fixes
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#features
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git#set_fs

I have removed the s390-setfs tree and updated the s390 tree.  I like
to keep the s390-fixes tree separate as I merge all the pending fixes
early and they get tested separately.   That should not stop you
merging your fixes branch into your for-next branch as well (to get rid
of conflicts or you local testing).

--=20
Cheers,
Stephen Rothwell

--Sig_/5Y/wiLZmVkb=.jqa8IBPGzQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9il6UACgkQAVBC80lX
0GwNIQf+IBIvRgq8sWJvLCoFD3RkW9x0jzjuzWQWngAMWYn6doECKKdGMu2XUsdl
dlI0mhC18uNKhzLhd/Bss0Srx+dhSvJzQPIJrxo6YqgmxAHD8cukTWNegHtVabgn
DABuCZy3360Xyq9yHu1oJqUEzTcXO5xyIiG/uDUgBCCrH+bY7PAMRPQ2GohxjEns
IDrirWT54+dZrcq09LKIfoyLz2DAE/BPWU36TmzG7u+sOykaJ0lodUDizsjDF2Tk
3AIgB523dGJGCBz2IoKrGgmFyvOHvUFdn5v58/TBTGA1KUa4mCnJjaeDAjiMmiov
/DcuJ5ZUzAFnc5FZGhvgt5yMsO5fyA==
=Thgv
-----END PGP SIGNATURE-----

--Sig_/5Y/wiLZmVkb=.jqa8IBPGzQ--
