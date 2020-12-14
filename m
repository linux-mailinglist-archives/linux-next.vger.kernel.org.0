Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C5C2DA2AD
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 22:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393552AbgLNVnq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 16:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392109AbgLNVnq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 16:43:46 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18277C0613D3;
        Mon, 14 Dec 2020 13:43:06 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvvyG1V2zz9s0b;
        Tue, 15 Dec 2020 08:43:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607982182;
        bh=9zZ4CaJ1f9yKLix26zpf+IqButEHk07/UblP1CruQGc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b4mnC5oIz14QoU6jId/JtbDuMe3QiiUOgA//4uhZK4fzI/Chn0GElyK0t+q0fNNrW
         e6AppecIgxshLXVCFBg6017mH8SABibD2B+tzk5/F/d/QVuqyAukAp/wxnfpkHg6u5
         AESmYw431tOcc+bAGzFa93Z0HhGVn2BvyBSuLp5z/Q5Fz39ncThG1u8ejtzTes8Xn6
         NkYIY1xedppB0OnztVQS6om0GwdR4MkP1F22u+K7CXZoC9fkD2nfMcoW57OkyCtuL1
         8o1i8R9BvNnKolrRkxWj4Zai6HuA2CtBM2VOPwsPuZYg3XSN2rll0TR+fjilemDubn
         16Clny3iNcTug==
Date:   Tue, 15 Dec 2020 08:43:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20201215084300.3543c433@canb.auug.org.au>
In-Reply-To: <20201214213612.GS6430@suse.cz>
References: <20201202150149.42543862@canb.auug.org.au>
        <20201215070956.6852e939@canb.auug.org.au>
        <25c43226-f937-0866-9c0b-46867bd04cc7@kernel.dk>
        <20201214213612.GS6430@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yP56w+C5xgj2Oxokg8e0qTf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yP56w+C5xgj2Oxokg8e0qTf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 14 Dec 2020 22:36:12 +0100 David Sterba <dsterba@suse.cz> wrote:
>
> On Mon, Dec 14, 2020 at 01:12:46PM -0700, Jens Axboe wrote:
> > On 12/14/20 1:09 PM, Stephen Rothwell wrote: =20
> > > Just a reminder that I am still applying the above merge fix. =20
> >=20
> > I sent in my core changes, but they haven't been pulled yet. So I guess
> > we're dealing with a timing situation... David, did you send in the btr=
fs
> > pull yet? =20
>=20
> Yes
> https://lore.kernel.org/lkml/cover.1607955523.git.dsterba@suse.com/

I would expect you *both* to at least mention this conflict to Linus ...

--=20
Cheers,
Stephen Rothwell

--Sig_/yP56w+C5xgj2Oxokg8e0qTf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/X3GQACgkQAVBC80lX
0GwUOAf7BCupZhrH2m2TJVGAUKCPwPHu4YXNRd6qZwz5TD6ZnwIh9coLFVzi8DaO
ReDNKTw1vJDUK8x5Aa+J4AWvsRIZehVTjX1b7l0TMizYHLL/6xR+GUEBauaIUjmE
z4T/vheB0eP+hfqvOdOhAe6YKoODs9ShXzQyHZNPPaG6YY91qjhwLYVmqE3HpLdl
ScOH8T8PvuafJMbKaJoDGUHI5Tn39NiP4poo06mKQzD0ssAkm0YRrTklQnCjUe8n
bpM2h0G+n7vuq3il6uMCRtciu0Z5pNUuCrbv3fWrZqPxAGEBWvEITMb4lYcx4CA5
nTEUUH3aSi40uo3kCrZ5v9R1XlslJQ==
=A+gw
-----END PGP SIGNATURE-----

--Sig_/yP56w+C5xgj2Oxokg8e0qTf--
