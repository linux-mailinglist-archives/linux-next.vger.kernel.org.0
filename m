Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B059F7DFD65
	for <lists+linux-next@lfdr.de>; Fri,  3 Nov 2023 00:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbjKBX72 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Nov 2023 19:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjKBX71 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Nov 2023 19:59:27 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E5A182
        for <linux-next@vger.kernel.org>; Thu,  2 Nov 2023 16:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1698969560;
        bh=/y+pbfTLVzTuJrRe9hg51QuNlORDZSSLl0X8v/rkrEQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TRdLbaVk7CL4aiiM46MrfIlUy3vfMO1cEgf0/uH6P6TodnnFRIT+ake1iNpAMM9Ty
         0J7Ufyorg9GfDICIMT6XYdX05v/TiWgAClN5PVgR6LDEeSIf80RvTIg9jk5KB7R4ZG
         4CSLMAf2aCltc9y+VP2OQFex7mHx6ugedjTLvMMio/weNHFlGC8WyeoDQVRlj4Zm+Y
         s7hKS+M1R9S5w0WhDzvHlDuAWryUiyfw8MR1Z2efnqQDXq+QPFpa6zeVGxBzFKT3/7
         P/rvymC+tArjbK1HwKfOknD9bRKpDJGhybWb5tJuxcSU6CSCOCrCLhmyiOqltLFdP/
         /06tzqzqP7THw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4SM17X3Yjxz4wcj;
        Fri,  3 Nov 2023 10:59:19 +1100 (AEDT)
Date:   Fri, 3 Nov 2023 10:59:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Costa Shulyupin <costa.shul@redhat.com>,
        linux-next@vger.kernel.org
Subject: Re: Upcoming merge conflict docs/powerpc
Message-ID: <20231103105918.42b71666@canb.auug.org.au>
In-Reply-To: <20231011144237.0224c928@canb.auug.org.au>
References: <87o7h65l13.fsf@meer.lwn.net>
        <20231011073907.7567ab89@canb.auug.org.au>
        <20231011144237.0224c928@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jGPMvVDhLoK+lRFPTvp4Iqj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jGPMvVDhLoK+lRFPTvp4Iqj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Oct 2023 14:42:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Wed, 11 Oct 2023 07:39:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Tue, 10 Oct 2023 13:34:32 -0600 Jonathan Corbet <corbet@lwn.net> wro=
te: =20
> > >
> > > Just a note to say that the move of the powerpc docs under
> > > Documentation/arch showing up in in docs-next shortly adds a conflict
> > > with the powerpc tree, which adds a new file (kvm-nested.rst) to the =
old
> > > directory.  The fix is just to add it in the new location.   =20
> >=20
> > Thanks, will do. =20
>=20
> So git is quite clever.  It recognized a file created in a directory
> that was moved and just moved it there.  All I had to do was "git add
> -A ." and commit it.  (now to see if I can automate that :-))

This is now a conflict between the kvm-ppc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jGPMvVDhLoK+lRFPTvp4Iqj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVEN9YACgkQAVBC80lX
0GzbOwf/WVbTysoUSiQCY8BKY2WjEmWw+6H7YsDB+Y8KeuKQwOsPr4bH54Z+YoBg
md9wF3Ol5XHd3E6D+jq8/021HD+DKp8kenTZ+yegrEFW/2fqfmnV4U8awCpb2t9a
YNZuJGv5EHSOQUOpzwKNDBNqNfobxc84o21MAfOTSAhMiL+1EI2bqDa6YQNaaF+7
Ku1/cNWi6AUC2p9M1eQznIwcqua7l/wi6HVVTjH3ysZ5uaX8BW+4gE46ZehwT8eT
YNNTPoqx5J2uyY4osA4vh53PdVBvmhjEXdZjRA0fy9pWEU43dwtmf+2w4tfmrA40
hKAagltb98vgYkbjG8Ajj8RGpmDKvA==
=gGmM
-----END PGP SIGNATURE-----

--Sig_/jGPMvVDhLoK+lRFPTvp4Iqj--
