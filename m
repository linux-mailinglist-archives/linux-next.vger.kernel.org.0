Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9F22C7F74
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 08:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgK3H7e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 02:59:34 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727803AbgK3H7e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 02:59:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CkyKm1T6Bz9sTc;
        Mon, 30 Nov 2020 18:58:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606723132;
        bh=n9SzWS71AWCel52eHVFJAmlub4wFDrpbx/ATuVM+pc4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=l0fUyLjuk0haBCPmnfcLOlogoNxc1n+ptkyw0ZugeAoCYBfWqcWHyQr2d75W120tC
         B4eORP51UVmb9X4hOSOIa/52TIedgCfncGCcCcS4m6EYirqYgftuyR3xk7OrFmGlk8
         6A50TSKeuaOqQ3HvKm0qKkg1eAJAnUiigqyprEVpakYmFHZmazyx1rS+LHOhN641+X
         iDFW59w0JUty1I+H3VDraPEFoGAMBirltDkkmbtPfGJEMgddvuWJRu6eYBvIzXkmyz
         jd7ajuwR+Ao9AFsDFCUsMoSYQJJA/aDvwMI3hDiIwjjul5wjxGm+2FG/YSLrxcnF5M
         VU6wdqA7KFDGQ==
Date:   Mon, 30 Nov 2020 18:58:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mark.gross@intel.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86 tree
Message-ID: <20201130185851.0884bd9f@canb.auug.org.au>
In-Reply-To: <ae231b40-e1c8-6995-d45b-ddab6a04810e@redhat.com>
References: <20201130044331.4abf7b91@canb.auug.org.au>
        <ae231b40-e1c8-6995-d45b-ddab6a04810e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FkNt36fslEzBP.Nr_GkVXAH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FkNt36fslEzBP.Nr_GkVXAH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, 30 Nov 2020 08:43:21 +0100 Hans de Goede <hdegoede@redhat.com> wrot=
e:
>
> Question, how important is it to fix these ? I normally never do forced p=
ushes
> to the for-next branch. But if this is considered important to fix I gues=
s I
> can make an exception.

I think it is fine to leave these, but to try to not have more in the futur=
e.

> Will git rewrite the commit msg when this is set ?  I'm at 2.28 and don't
> have core.abbrev set. But I guess this needs to be set in the gitconfig
> of the creator of the patch; and this has no impact on "git am" ?

It will not rewrite the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/FkNt36fslEzBP.Nr_GkVXAH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/EpjsACgkQAVBC80lX
0GzG4Qf/Y6deDl6OJZ6SW/trKbrYKWbq2PEZy1IvUxPJPPFcCNiXCAX1ut05GspM
azjHY3Qtv5Aok+F4ARQLNCeE6AjO+eCF/6FDFkfgYJZgT1N7c/lDyJd0sdPKw8dN
NrUfJj5pA7DeHKvLah8hnJiu+f+RbctIitMQv+IRoNbOetyb9Z7s1Ga/PDb+1FN+
DvryKIoHA153wxVDNffQn96cGxn+gmCo+8bTT3yw5JfGppxLniu4AcVMs+Zwezia
qPLFg6emVyPM0EHECfGpeKHUzT/06sbxaDaeRSB+M4/TS/aJJM3gmDlL1GkgorOn
BV3ICE2UUbPII7rp/i0ZJTjt8WKluA==
=Pzc2
-----END PGP SIGNATURE-----

--Sig_/FkNt36fslEzBP.Nr_GkVXAH--
