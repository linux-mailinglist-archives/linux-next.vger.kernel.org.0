Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBFC32DC82E
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 22:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgLPVOu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 16:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729173AbgLPVOu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 16:14:50 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3623C061794
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 13:14:09 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cx7Cy2frzz9sRR;
        Thu, 17 Dec 2020 08:14:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608153246;
        bh=/G6mDv+Uv3wK5+tclU/13a1ncuS3WkKrWTj0HFGCY5M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Nm92wUsP7uyBNlPrbdexvd7TlXM5TVDmOujlWA3Qd3coK06IZtsWzyd/F7XHk1uDX
         68jNdNhSOrtoDAenO6Z7vQEPP+jsclP0oYsE0TMfMBFmSIPOYBWdz40g0kzLs/e6gh
         izmhWwBz5Ka6rFidSW25uP9zgATC5xp3zTaxQwoZa7eXwq0z87k7lH+Az+ZzacGgps
         E2jkgYkoOUxLPkH0x4K4tMzHwrNMb34QZ4Y43RhvsFraQGeNnyZ5GKDgtE+Rz2Yn7D
         Ws5/73aBOGSC/46iY6c1AikDl7E0Igrg6PxIpJTrOOral4yxl6DC/dRlDMGrosse+L
         gvTAN1WJx0tMw==
Date:   Thu, 17 Dec 2020 08:14:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Branch change for kvm tree
Message-ID: <20201217081405.212bacb7@canb.auug.org.au>
In-Reply-To: <c651fd52-e402-1474-38bc-6965470823cb@redhat.com>
References: <c651fd52-e402-1474-38bc-6965470823cb@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5_Da.d8_mJdHiNBunjR3ZKd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5_Da.d8_mJdHiNBunjR3ZKd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Wed, 16 Dec 2020 15:10:56 +0100 Paolo Bonzini <pbonzini@redhat.com> wrot=
e:
>
> linux-next is currently using kvm.git's "linux-next" branch.=20
> Unfortunately I have just learnt of this fact; KVM maintainers and=20
> developers have always used the "next" branch instead.
>=20
> It seems like until a few months ago "linux-next" was a symbolic link to=
=20
> the "next" branch, but something must have changed since then on the=20
> kernel.org side and thus the branch is frozen to last August.
>=20
> Would you please make the change to kvm.git's "next" branch?

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/5_Da.d8_mJdHiNBunjR3ZKd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/aeJ0ACgkQAVBC80lX
0GzQWwf/fI6UHPMM1MPR5VIVdBoHVcMoTgMKAwvu9pZ1jiY+3yiRPjUNN5AinofR
aaAkzXxRFfWWYWRwIlLRLT6XD3PxjGVwgkDsRAGjW1TtnIwg/5iYm818BkDYJUCc
T2sy0dZsVUjs59VY1VIeoWMPYU3rGaJf+FkBkmhGhKPQS44f+nkh1nx+Yyd7UeUp
C0URDnawgz53GWvwZpoYXONhgClj7OCDMHgDN4jjk1oLns9AOPVWWe7CFmju5pTB
uCvVPyyBz/UYzoqXxcgv+6HEQyk2g2CfiCoR9PCoD9mi2usSOEqp/3WO57FPfmuu
SyQM/5l1hkBcS1VdTf4wNMQhxiMuTg==
=AxvK
-----END PGP SIGNATURE-----

--Sig_/5_Da.d8_mJdHiNBunjR3ZKd--
