Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D3B32A99F
	for <lists+linux-next@lfdr.de>; Tue,  2 Mar 2021 19:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1577225AbhCBShY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Mar 2021 13:37:24 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:54968 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381691AbhCBIbu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2021 03:31:50 -0500
Received: from antares.kleine-koenig.org (localhost [127.0.0.1])
        by antares.kleine-koenig.org (Postfix) with ESMTP id 62256B1BA39;
        Tue,  2 Mar 2021 09:30:49 +0100 (CET)
Received: from antares.kleine-koenig.org ([94.130.110.236])
        by antares.kleine-koenig.org (antares.kleine-koenig.org [94.130.110.236]) (amavisd-new, port 10024)
        with ESMTP id eKGK8R-UPJng; Tue,  2 Mar 2021 09:30:48 +0100 (CET)
Received: from taurus.defre.kleine-koenig.org (unknown [IPv6:2a02:8071:b5c8:7b00:36f3:9aff:fec2:7e46])
        by antares.kleine-koenig.org (Postfix) with ESMTPSA;
        Tue,  2 Mar 2021 09:30:48 +0100 (CET)
Subject: Re: linux-next: build failure after merge of the powerpc-fixes tree
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210302112131.5bb7b08b@canb.auug.org.au>
 <87pn0is3wg.fsf@mpe.ellerman.id.au>
From:   =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Message-ID: <6113ab65-7b3c-07f0-2813-76ddaa4c7236@kleine-koenig.org>
Date:   Tue, 2 Mar 2021 09:30:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87pn0is3wg.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rzZpUA4AhhBZ0hqwZjgvzr69OjxvLCLK7"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rzZpUA4AhhBZ0hqwZjgvzr69OjxvLCLK7
Content-Type: multipart/mixed; boundary="gQWsuGHVas7owk6hu4v1tveWztpbPdDEK";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <6113ab65-7b3c-07f0-2813-76ddaa4c7236@kleine-koenig.org>
Subject: Re: linux-next: build failure after merge of the powerpc-fixes tree
References: <20210302112131.5bb7b08b@canb.auug.org.au>
 <87pn0is3wg.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pn0is3wg.fsf@mpe.ellerman.id.au>

--gQWsuGHVas7owk6hu4v1tveWztpbPdDEK
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

On 3/2/21 3:09 AM, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> Hi all,
>>
>> After merging the powerpc-fixes tree, today's linux-next build (powerp=
c
>> allyesconfig) failed like this:
>>
>> drivers/net/ethernet/ibm/ibmvnic.c:5399:13: error: conflicting types f=
or 'ibmvnic_remove'
>>   5399 | static void ibmvnic_remove(struct vio_dev *dev)
>>        |             ^~~~~~~~~~~~~~
>> drivers/net/ethernet/ibm/ibmvnic.c:81:12: note: previous declaration o=
f 'ibmvnic_remove' was here
>>     81 | static int ibmvnic_remove(struct vio_dev *);
>>        |            ^~~~~~~~~~~~~~
>>
>> Caused by commit
>>
>>    1bdd1e6f9320 ("vio: make remove callback return void")
>=20
> Gah, is IBMVNIC in any of our defconfigs?! ... no it's not.

Would you accept a patch to add the driver to one of the defconfigs as=20
an excuse for the build breakage I created? Which would be appropriate?=20
ppc64_defconfig?

>> I have applied the following patch for today:
>=20
> Thanks, I'll squash it in.

Also thanks for catching to Stephen and to Michael for the fixup.

Best regards
Uwe


--gQWsuGHVas7owk6hu4v1tveWztpbPdDEK--

--rzZpUA4AhhBZ0hqwZjgvzr69OjxvLCLK7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmA997IACgkQwfwUeK3K
7Alusgf/ZA0f/3fntS+TPuUVpXIPbiu6zO761TKBOhnMsfdAxYGc4rgbvOmbNuWq
Vsi9LKxvxPAasfr25zto/oF3eX9pH6bq4kl4gfYbDolGnI5Uy4Ez4N3pz5b3OVyQ
MMG1fKLHz3hksGRCf8EEg4wAoEPtxILg50jeI68cU82Y+USc4G01RuTg8ZooYYTY
81fNfbcj9nNOG3iGe9fyJoEaCDtIiMK5GZrJ9osOD/bl6VUF1jl+41FbXZohS5Ii
Jx4U4i8gL7V0iIfVsd0RYa5FzKqdRc1vwuUM2tx9dBVsp+ASQ7isKdoAm7EL82Lg
lIJGFbazOpXfLPCSjRIUiJa7DFrvfA==
=W0cN
-----END PGP SIGNATURE-----

--rzZpUA4AhhBZ0hqwZjgvzr69OjxvLCLK7--
