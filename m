Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF4826B5F1
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 01:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgIOXyw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 19:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbgIOXyl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 19:54:41 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF96EC06174A
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 16:54:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Brg7f339yz9sTN;
        Wed, 16 Sep 2020 09:54:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600214079;
        bh=it0zLSV+kH7rGzSw0ZiyUwdKnF/8Y/hm5PrzkBZ5+VY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kaRvW04pSmAEPf+udd9+SqcNEWhUkXPAR2d9+ESrmfZXRpCV/dDimXh0Ad3GmemrS
         Unos/1NfCn4a98eoP9Lw9S3VvRcd0q3gKXS8UbfdeQz80Q6ti4eGNInY+rXrl8RiuW
         AlyEWY3FR3NwdQ2ds/q/+allT3DIdUT2JGtZwt+R7k/u/tLdvxOFPQDi6fBMBYvf2s
         jcbVddZu4wy2Vi/QqF7eKtaohyDc5aVcQ4S03IDEEb9DWJ4ZFTFZvWFxOP5Tbj7DwA
         pK/oLPzAAOUGRbcrOT4xuJvlMdy6TUtFuRKUC4NWCljCgxYpYkCknl2iJ0my0zkYgS
         wjpOVuCDvPwAA==
Date:   Wed, 16 Sep 2020 09:54:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org
Subject: Re: linux-next: add s390 set_fs branch?
Message-ID: <20200916095437.77e7365d@canb.auug.org.au>
In-Reply-To: <20200915155534.GA11180@osiris>
References: <20200915155534.GA11180@osiris>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dPvRM8P=YR7O379G7UyICIr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dPvRM8P=YR7O379G7UyICIr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Tue, 15 Sep 2020 17:55:34 +0200 Heiko Carstens <hca@linux.ibm.com> wrote:
>
> could you please add the 'set_fs' branch of the s390 kernel.org
> repository to linux-next?
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git set_fs
>=20
> I'm wondering what the best way would be to deal with additional s390
> specific topic branches and how to get them merged into linux-next?
>=20
> As far as I can tell other maintainers merge all their branches into a
> 'for-next' branch, so that you only need to pull one branch (and don't
> need to deal with requests like this one ;) ).
>=20
> Would that the best way for you? If so we could simply do the same for
> s390 as well. Please let us know.

Yes, normally maintainers merge their topic branches into a single
"for-next" (or similar) branch for me to merge.  However, in some cases
I carry separate topic branches.  So what ever is easiest.

I have added the set_fs branch today (I called it s390-setfs).  If this
is going to be short lived (or you decide to do the merge yourself),
please try to remember to tell me to remove it when it is done with.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/dPvRM8P=YR7O379G7UyICIr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9hVD0ACgkQAVBC80lX
0GzNfwf8DDJC8yEinhKCJ+edBW7szG/vOhewMVDKqmmsksm0tPSBBiYSzwuT/K40
JWGDdGAfD2P+nrIH221irx+fj/YlYYne/CkfqaE2oUULdOB6wWQiQ7J/2J8TtizK
pwyxMRpnhYfSj4Z91NCXXapyZaylA9Bsf5B+fOdRu+xdmRJZa86UYNzgeSXYdBzo
REZKUtFrukzYmdb+CyIkpzauSy/QZCAcNJJBAXKkArcnYXaivxhxIHava1U/2Txv
DhEm6ow7d2NPxaI1jN47kjIzYugjN+npBtcuqxJLsbCxySZDlKO7s35e51Tps7WO
ppieuyxqMaaaFEBkzjY78T7Qqrs98w==
=UCRQ
-----END PGP SIGNATURE-----

--Sig_/dPvRM8P=YR7O379G7UyICIr--
