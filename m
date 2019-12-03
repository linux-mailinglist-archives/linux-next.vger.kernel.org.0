Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0261210F4EB
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 03:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfLCCXG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 21:23:06 -0500
Received: from ozlabs.org ([203.11.71.1]:54115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725954AbfLCCXG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Dec 2019 21:23:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Rm3n2LsCz9sNx;
        Tue,  3 Dec 2019 13:23:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575339783;
        bh=EL9ZyahnDGpSzzlhJ1wKUfVIQDAdvKJz012rP4TCPs0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q9D3yRsJL7riVhL8NHHJa2KtQWnAkF95p5pT6aNGmzgrs90EOg7VyCDP0Bu23v0/g
         a/6gqy4VuNywJQ5sUPdmFRUDqVoormLWZoNSZE+esXLj7CsS/bEJB16HICU0m/zX+/
         KpVi0pthEWNiTWwIE4xjwkX9nnkSeIHBdiCOLLJjuYovXN0KTkQapSMIoETSRtVdtI
         zphvoNlcS5khjPSNDE1wVFdogx7Eb1R2nlQvTV/qdyRUfFhp53yggf0w6lG5QwvIdp
         KvCRVQ1ok+PMtwiCMs/jOAL+C5APXlm2B3+1UJO28Bl6JpRTL44VEG5T032WqcM6ys
         Rwb5s4vlWauGQ==
Date:   Tue, 3 Dec 2019 13:23:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the y2038 tree with the xfs tree
Message-ID: <20191203132300.3186125c@canb.auug.org.au>
In-Reply-To: <20191203002258.GE7339@magnolia>
References: <20191030153046.01efae4a@canb.auug.org.au>
        <20191203110039.2ec22a17@canb.auug.org.au>
        <20191203002258.GE7339@magnolia>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G5fteeX4WpkVraxOJWz9wJm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/G5fteeX4WpkVraxOJWz9wJm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darrick,

On Mon, 2 Dec 2019 16:22:58 -0800 "Darrick J. Wong" <darrick.wong@oracle.co=
m> wrote:
>
> On Tue, Dec 03, 2019 at 11:00:39AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > This conflict is now between the xfs tree and Linus' tree (and the
> > merge fix up patch below needs applying to that merge. =20
>=20
> There shouldn't be a conflict any more, since Linus just pulled the xfs
> tree into master and resolved the conflict in the merge commit.
> (Right?  Or am I missing something here post-turkeyweekend? 8))

Yeah, it should all be gone in tomorrow's linux-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/G5fteeX4WpkVraxOJWz9wJm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3lxwQACgkQAVBC80lX
0Gz2Pgf/W+qtlGWltx8FwrLej5hHElz+9Qsxf9biRtTbhblZybgbQ4mICamyW0DR
dhCUsa2GYCVwAZ/m+eMyFjvpu+Z86PA5sqNWY97ZV7hF9pnWYoxDRb4q/lJyXGLv
z9QffiYs/l9J7CJNoT/KcCJvcLLz/DU79LB/nUQv4TK4+UOFpYKx+Deq8xK2G5WX
w5romAXa2JCbGFfXy5Cysr2v2Tqpc4/9IbJ/qC83H2ZA2NK6ajG5pryydXBoTco2
16rGnqQISq/+VZ8wr1G5OMxM8kueXJx9N566+OX4RqoEuIdsqa71pd7udRO1u78r
j4VZj8d4hpWSwwJBLeQDh2pMC/5aAg==
=074M
-----END PGP SIGNATURE-----

--Sig_/G5fteeX4WpkVraxOJWz9wJm--
