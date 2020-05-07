Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D651C9E55
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 00:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgEGWVV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 18:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgEGWVU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 18:21:20 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4D8C05BD0A
        for <linux-next@vger.kernel.org>; Thu,  7 May 2020 15:15:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49J7886TnGz9sPF;
        Fri,  8 May 2020 08:15:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588889753;
        bh=UTNxqGlhyw1+6NIpWUANYBfOotHXPKmDM3eHlModi2w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nHNlPbBe8SYocrcUNPbYFqBG1swFA655L0WeesU8AIxXxg66qv78wSVcAjT0Ht2gE
         jQkjFfDFUNwAR2S/04wV2sifJIGJhqVi7xiJGUXV/aaBar1kPevLTmOTxy8y6SRfok
         sPctIFBK+jVuxPn2ofR51u30RrhGKmYYkm/zrmKC60/3lbDHT/E+6ggpS5c5z2ai0D
         skNAAylDRF0BHZwraU4wbXWA2BmD/Zeq0Q63/BaqCPbAlVRS3SiV1kBzKeGO189VSt
         zUpvPza+jgvTtbylXYMhNt4Zk3hvHIushagchLCiPqzZnp5chOLwTbSef7H96db7RI
         UBm2jhrIB+tlQ==
Date:   Fri, 8 May 2020 08:15:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Schaufler, Casey" <casey.schaufler@intel.com>
Subject: Re: Please add Smack tree to linux-next
Message-ID: <20200508081550.3414833a@canb.auug.org.au>
In-Reply-To: <22f94d61-de26-c858-2571-ca6da12b56f4@schaufler-ca.com>
References: <68401d6d-190c-75ec-b311-b47b0b8a57a5.ref@schaufler-ca.com>
        <22f94d61-de26-c858-2571-ca6da12b56f4@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RLND90Z+D=sZ2i4bC7Z0gX/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RLND90Z+D=sZ2i4bC7Z0gX/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Casey,

On Thu, 7 May 2020 09:27:03 -0700 Casey Schaufler <casey@schaufler-ca.com> =
wrote:
>
> Could you add https://github.com/cschaufler/smack-next#next to the next t=
ree?
> I believe that I have addressed the git issues that I had with the previo=
us branch.

Added from today.

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

--Sig_/RLND90Z+D=sZ2i4bC7Z0gX/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl60iJYACgkQAVBC80lX
0GxXoAf7Bqj9zPsrJi3eDclOy/UBLpf3/JIZUj6hNcDdqBPiH7c9Jvrb1s8e8Gtd
Q+sZeg7rn7XDfmAHHlwoLioljdSxErdYJu57OKvu9WwZtDzqOdC54iYb0FiJEKoa
YqsHwmPDpd3oJ+IkVD49RQi8uj+8xu7KPoHd3jGMaT6sIV51ET8jMmEoCBBr9aD3
tBomzfuo2PJgKKgcgtDNaxNioXQGDKHEaJ+Tmi7Xvf1jpBmXWMCHSaTTld1map0c
rVokFLTyNK8Vl4V80fI3y8FCbEjEgHOU1v/gUJiWYiEK3RSTVqBYpACud874KvD1
M9IMjW3G5Jc92lJb/a+mDPsLdEdY1w==
=fmtw
-----END PGP SIGNATURE-----

--Sig_/RLND90Z+D=sZ2i4bC7Z0gX/--
