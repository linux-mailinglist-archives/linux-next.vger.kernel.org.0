Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABCB442D02
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 12:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhKBLqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 07:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhKBLqt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 07:46:49 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5C0C061714;
        Tue,  2 Nov 2021 04:44:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7ND4GbPz4xcJ;
        Tue,  2 Nov 2021 22:44:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635853453;
        bh=LKS/UOAC5wuVUICjnTKq5vvzZND76w3GGAtk8ppE2Ek=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=L474jENH64o1ywrnnRiEGkAcurPJD5biVyMwTPsXGqlLMi/rRY0P+sIo+ovQoM6sU
         T6j2fCMzxsORYptJQG+kUU/zzEgqQwsKYaWTVrEY8FabR8TnHqnw49k8pimkkhoqk+
         7po3a7XbDTYqUCqyhiGtJvZV0s36Y/Bmuvr9aHD8cmBO2awg+I0NLvY60Gw1smOdB4
         ZMLEXZM5JV+gpmODY8wyFPtvj5omFXgMfXCF2+jSvId7577XDci8BYb+VZrjJ021tu
         g+jDHFFWapPuaJKc63wWvG0jfgRDP4MmDCvEdW1yZb9ijKsRBcXbep0LfAVb1BcXCd
         pnpG/+HnC9UDQ==
Date:   Tue, 2 Nov 2021 22:44:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
Subject: Re: linux-next: manual merge of the btrfs tree with Linus' tree
Message-ID: <20211102224411.53de0883@canb.auug.org.au>
In-Reply-To: <20211102104244.GH20319@suse.cz>
References: <20211101105341.5fde8108@canb.auug.org.au>
        <20211102104244.GH20319@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6z2Gybn2nev/T8qy0Z8ZmgT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6z2Gybn2nev/T8qy0Z8ZmgT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 2 Nov 2021 11:42:44 +0100 David Sterba <dsterba@suse.cz> wrote:
>
> Thanks, it's a bit different that I did as a proposed conflict
> resulution and Linus resolved it in a yet another way. I'll refresh my
> for-next branch today to minimize the conflict surface.

Thanks.  I really could only try to pattern match my resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/6z2Gybn2nev/T8qy0Z8ZmgT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGBJIsACgkQAVBC80lX
0GyMswf/eu3uQwFCnid1BcEt6FEAzmH/zYOdvwBru52lZIb2h31MomMCX11rMkjE
npd/zulz4ufuet9AKiyD1gzrX0pkiuVqejHEJ3ASljDMQ3cnIzX1U9LNPLk/2iZ5
nDDhi7IgzklhTy4dmWLVfY+Q9yZP9zSQ7TY2KGIbW1Uz6E1x79lWnICRvmOzv1Ea
0MvwKgD86cFjJUrKdpzSxJhHJT0vAfjEmZbYmisq5uECFg01U0fxIGvsYPT7hlQg
yIUNLaYWq7UxtD5EOy/LtH+kRlbogagaxJkTdCfboPyqfatMNko8w8lS8wimyazl
RuwHrcGYTL+YwdbclCd7LkWrxGH0uw==
=oNqd
-----END PGP SIGNATURE-----

--Sig_/6z2Gybn2nev/T8qy0Z8ZmgT--
