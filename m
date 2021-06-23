Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2254D3B152B
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 09:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhFWH6a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 03:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhFWH63 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 03:58:29 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C59BC061574;
        Wed, 23 Jun 2021 00:56:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8wYy6pB8z9sVp;
        Wed, 23 Jun 2021 17:56:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624434968;
        bh=dFjgjrGzKqK0Sh1ApgF1a/SmVTexP434P8ROZMiZwUI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=s8gpUwaitzWnXzbw1Z+3iaLaSC5dQYX6hHCsha73veSB9wLJMYMXQwAMNBHgdMPDr
         n82FUWg5cHLo+av6jCubYcp3XDYpKOvLRjzNCA2cDsh2L8k3IkYjuaG6vQsYtoWnzA
         pH1n09xNihu0i26Se/HGnR2sgFxKLp/+qzNEghZPY+Y+oFVtwMtnSFq8OYC23NFLFS
         VL7V4z2O1sdw8j8/kn3ZwKodVW2Xr+kjslk9SZHCH4eLoyOhXy7KvP/V5yjMq7nnsY
         PtQH7R1/eimUlZ2Ny7CPk9ayiB/tvpdSd5yUyJmo+Nun4uh+aaZbIkXZrBY3E3coxq
         4QJ/9BA2gaVig==
Date:   Wed, 23 Jun 2021 17:56:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Greg KH <greg@kroah.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: linux-next: manual merge of the soundwire tree with the
 sound-asoc-fixes tree
Message-ID: <20210623175605.20b012cc@canb.auug.org.au>
In-Reply-To: <20210622171936.1c147fbf@canb.auug.org.au>
References: <20210622171936.1c147fbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2VFaH5iM_RIW9RefxXo/8Hu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2VFaH5iM_RIW9RefxXo/8Hu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 22 Jun 2021 17:19:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the soundwire tree got a conflict in:
>=20
>   include/linux/soundwire/sdw.h
>=20
> between commit:
>=20
>   d38ebaf2c884 ("soundwire: export sdw_update() and sdw_update_no_pm()")
>=20
> from the sound-asoc-fixes tree and commit:
>=20
>   031e668bc1ad ("soundwire: bus: Make sdw_nwrite() data pointer argument =
const")
>=20
> from the soundwire tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/soundwire/sdw.h
> index de9802a24e7e,ddbeb00799e4..000000000000
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@@ -1040,10 -1039,7 +1039,10 @@@ int sdw_write(struct sdw_slave *slave,=
=20
>   int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
>   int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
>   int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
> - int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val=
);
> + int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u=
8 *val);
>  +int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
>  +int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val=
);
>  +
>   int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
>   void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_sla=
ve_id *id);
>  =20

This is now a conflict between the char-misc tree and the
sound-asoc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/2VFaH5iM_RIW9RefxXo/8Hu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDS6RUACgkQAVBC80lX
0GxRmgf/QE+bX0xfhbPYpvdV2EurG6gr7KOjoB5yjLZEE/zOqxSKT/y8WLaUlmul
e2M77kEtH778ovkaiW2h0Ue94gSGgUPq+FO1gUk0O6acuE1AQFz5nT48zRuxybxy
1R16V6xS+tdxCgDI//QlEuTvkLFqAvTAKZ2M3p11D730hZWlveUqQAwk86364LmM
LpUu8mFtgKgCW0lr5XjXpN3zJUJHG6slQEKDZ7CqNt4eTyshTt/0OHH9zy/KEWED
LYNpVvgZasjJAsGtZ6Yk3Ta/lXyMmDhPfzh2b6J/UK6sEg9rJl3UYUJMXxb+WKbx
fdTRQEL+SWepGrHfVtMX6s0KTqV30w==
=iTXS
-----END PGP SIGNATURE-----

--Sig_/2VFaH5iM_RIW9RefxXo/8Hu--
