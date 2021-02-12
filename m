Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD93431988E
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 04:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhBLDFb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 22:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhBLDFa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Feb 2021 22:05:30 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0907C061756;
        Thu, 11 Feb 2021 19:04:49 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DcJJF51gdz9sB4;
        Fri, 12 Feb 2021 14:04:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613099086;
        bh=SuZej8WQXBfRkGTEIpuSPrN3xpsE9aKlbnRSFEdMKo8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N0+TXtAlRz4lpImV1SiBr+ET2hbbJ1qBa3rAL4nrXqDLMkPsPNZGyNzMosqK6NXGJ
         Tq8igx29Ssgqym595BHeEn7W6DHrIQkl8tklGR7wz+wCr4S4V2RF//ocpOCjypb6/z
         3ooCir+kNixSfU7/WbUEytHkMz881njN+E7rPyqdhoc7pbmnEkmF/EotbaVo9rZs9e
         ESyUQtyhZEMR/Qy3Pam06k7sNHBGnxEQuqgUglCU50j/xJki6IkJrmpHWXuPG9a7ah
         fB9BnKvYmAiN53sakP8sAClMRD9ke4y+tnnTSjkGt0nPvXUjZQwAucpgPl7NXLaBw2
         ZmapVzs/JvaPQ==
Date:   Fri, 12 Feb 2021 14:04:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     David Sterba <dsterba@suse.cz>,
        David Howells <dhowells@redhat.com>,
        David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the btrfs tree with the fscache
 tree
Message-ID: <20210212140444.5d72dfcd@canb.auug.org.au>
In-Reply-To: <20210212010740.GP3014244@iweiny-DESK2.sc.intel.com>
References: <20210212103810.170b93e8@canb.auug.org.au>
        <20210212010740.GP3014244@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lsZVkmULR3qq5YYgkmyLEpI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lsZVkmULR3qq5YYgkmyLEpI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ira,

On Thu, 11 Feb 2021 17:07:41 -0800 Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Fri, Feb 12, 2021 at 10:38:10AM +1100, Stephen Rothwell wrote:
> > from the fscache tree and commit:
> >=20
> >   325a835476e3 ("iov_iter: Remove memzero_page() in favor of zero_user(=
)") =20
>=20
> I don't seem to have that commit after fetching linux-next?  Should I hav=
e it?

It has not been released yet.  Hopefully it will be available in less than =
10 hours :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/lsZVkmULR3qq5YYgkmyLEpI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAl8EwACgkQAVBC80lX
0Gzfggf/bsVWIOLSVCH14blHLKpN554FCr+Zs+yMN7tFgZAsrOCiaQZhNvNaRM+L
SQ5K9Ac5CAm9iylof52x+FVfS/GdP3TcomAadBT8lUEeOJz/D+Glbkwb6b3gD4Wy
6FKUCECX3SbyPFwD1iNE1L1XXnC/7EhW72E8H1rxVbD3gGCxtU89KXctFP2pA5BF
kh575uiiXDuZUoSbVkXePC4nwm4Dt5UnzCZ/VBaKS/++qMSt2jCZDj2kdnaB79xQ
HnxIGO/qQS+4PsY0b22EcsGeGDzhjjbwkMTZZ3VCKQFOeuw1une/1FJxLkJPbWf5
s53shc4c/K2LtmDMx2lkV7uEi2J+Jw==
=PNts
-----END PGP SIGNATURE-----

--Sig_/lsZVkmULR3qq5YYgkmyLEpI--
