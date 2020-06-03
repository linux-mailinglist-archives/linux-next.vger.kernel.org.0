Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A27F1EC717
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 04:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgFCCHy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 22:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgFCCHy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 22:07:54 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E602C08C5C0;
        Tue,  2 Jun 2020 19:07:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cC3r1V72z9sSc;
        Wed,  3 Jun 2020 12:07:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591150072;
        bh=xuJUjo7+YelOU3llC+D80IQp+Ob0+zeNH9Y00+TBzq8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DBucrm9e9f6+ABOFi0eeIagnW9RiJMsh9GXYtLGZtCYal2MteBR1Y0LXeOfa0b2pA
         LTNByuMyskgkxMZMPkZDmqkPJF/ubABjlqAiOCC+CsG0QESWukygyh1789Nl6NwV7w
         q7oQIrKX6Y/nn+++rfZXmyPHTiuVX6YU0XFpxxYP7Q8ZP3Zav+kQpDadV1wCg+ecRi
         h6MIkymt5dPnWnz11BcXx4urD2W05BSuHgOnrkmK/Xp4Z+n28TihUr3inQ2MbD/V7H
         JIf7IP7wOSs7qA0Zdq2er+3nLGtV+Nmj33YTIMBdx+mVBurlDNlloJHnAYnS2WL/qr
         9CWPJIpnN+wyw==
Date:   Wed, 3 Jun 2020 12:07:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 btrfs tree
Message-ID: <20200603120751.5cc12744@canb.auug.org.au>
In-Reply-To: <20200525211128.1cc8c00d@canb.auug.org.au>
References: <20200525211128.1cc8c00d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cT2T2oAM0oRDooaP4vznsSt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cT2T2oAM0oRDooaP4vznsSt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 May 2020 21:11:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   fs/btrfs/inode.c
>=20
> between commit:
>=20
>   f31e5f70919f ("btrfs: switch to iomap_dio_rw() for dio")
>=20
> from the btrfs tree and commit:
>=20
>   2167c1133b8b ("btrfs: convert from readpages to readahead")
>=20
> from the akpm-current tree.
>=20
> diff --cc fs/btrfs/inode.c
> index fb95efeb63ed,8b3489f229c7..000000000000
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@@ -10075,8 -10538,8 +10060,8 @@@ static const struct address_space_opera
>   	.readpage	=3D btrfs_readpage,
>   	.writepage	=3D btrfs_writepage,
>   	.writepages	=3D btrfs_writepages,
> - 	.readpages	=3D btrfs_readpages,
> + 	.readahead	=3D btrfs_readahead,
>  -	.direct_IO	=3D btrfs_direct_IO,
>  +	.direct_IO	=3D noop_direct_IO,
>   	.invalidatepage =3D btrfs_invalidatepage,
>   	.releasepage	=3D btrfs_releasepage,
>   #ifdef CONFIG_MIGRATION

This is now a conflict between commit

  ba206a026ff4 ("btrfs: convert from readpages to readahead")

from Linus' tree and commit

  a43a67a2d715 ("btrfs: switch to iomap_dio_rw() for dio")

from the btrfs tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/cT2T2oAM0oRDooaP4vznsSt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XBfcACgkQAVBC80lX
0GwXpgf7BWVbLYzCGUc0tiK9692M42gzHZXfa//AnE/kyeHMFchJ/7Is1We+MLBg
0O0fewPAvbOXbkSapFskQ6XSRfQelXykpO24o7ja93BbOXPVobRVSDPRaTg9uVbO
+B6viJkN0z8T9tZRMOOcu9ZvkbVSNE2tdT18PwLioFV8o2Sv/B/ZswBQnxm2JI1S
E7rCzIZ1w5nVk4IPytvQDhKPShahtb/36RGI2r1A3ZYFmnnmH7+yRElnUbC7Y498
6KWKWwS9sAO6tDyhbmj+urowN85ZyVTiQ11Phkti19goFGU9SCMCUk5QEp7YCYqi
zxIALg2EAjI8Uc0SlbCP8LgbuB0+Kg==
=5L+u
-----END PGP SIGNATURE-----

--Sig_/cT2T2oAM0oRDooaP4vznsSt--
