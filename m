Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9053733CA
	for <lists+linux-next@lfdr.de>; Wed,  5 May 2021 04:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhEEC4I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 May 2021 22:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbhEEC4I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 May 2021 22:56:08 -0400
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C34C061574;
        Tue,  4 May 2021 19:55:10 -0700 (PDT)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4FZhCC6sXQzyQJ;
        Wed,  5 May 2021 12:55:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1620183305;
        bh=PKD6mAt4CHLEFMPwKBiak/1A67nn78rq8xH2ssz/7Yg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DG6Irciwl0nEOUZm+Tbs1pa0vo/+Zz5TqATLnkvAJFPmb/gC8Hoxj2sEW9f6XAyw6
         BjDN5NXe9XJymTZUrnOYCbFAhHs/wl0LckuLVgeiwqP7O2IPx0DW7H1+uc/WFzZLrh
         MHwmcdTvG6TDgBdnS71o+0EuzK35oZ00dneAJXHGaSf6qTOjGyFcKoJfrcmBQYqdUE
         9zHgnFdkuMC2ni+KNQf8HphUTydbKBCskhJ7J9rbRoFZUhzzPYEn8ZpWOdbKjMZ1zB
         bbWZJoouIjSNYx9ajXA54/MzozFAeHvrJpZiEPBW0ytfIJVz27rV0x12gfp1Yzh3O0
         +NegTIw42opRQ==
Date:   Wed, 5 May 2021 12:55:01 +1000
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     "Shih, Jude" <Jude.Shih@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>,
        "Ma, Hanghong" <Hanghong.Ma@amd.com>,
        "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
        "Wheeler, Daniel" <Daniel.Wheeler@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210505125501.22acdf7f@elm.ozlabs.ibm.com>
In-Reply-To: <DM4PR12MB5133E6A99840D1E8542C0D23F7599@DM4PR12MB5133.namprd12.prod.outlook.com>
References: <20210505093907.6e6c9556@canb.auug.org.au>
        <DM4PR12MB5133E6A99840D1E8542C0D23F7599@DM4PR12MB5133.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/824ZQ/8Upqk_a_OFy/cUm++";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/824ZQ/8Upqk_a_OFy/cUm++
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jude,

On Wed, 5 May 2021 01:08:48 +0000 "Shih, Jude" <Jude.Shih@amd.com> wrote:
>
> This function is used as below. This commit also passed the auto
> test. Is there anything different between our evnrionment?

The function is defined unconditionally, but only used if
CONFIG_DRM_AMD_DC_DCN is defined.
--=20
Cheers,
Stephen Rothwell

--Sig_/824ZQ/8Upqk_a_OFy/cUm++
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCSCQYACgkQAVBC80lX
0Gwy9Qf/Sf415sxVDYqMOuOJPA5/QbuX+/H6/VRamc+TihsUTPQWtZ2gUm0bEUEO
KyHpAxRdYcFSn2vgopwK2zly/MgsjHV45h0ASFx8asDyYY/d7R1NYr/xJqqwZ46/
LJlFHWOODkj1TL59QXJEbX4dCVurGzNRUynpgZ4U+6aTgzJ9JA7B8XPMrwwZoiu4
fnQgBc29PEcqeupgy98aqix2ny/JEfrY6ftgoLpe2hR1buSB1/StTpn8nw4JvK3+
G1i9rfPPABM17x7Ssv7vuyA78u/88GhQedvE7V4u4qq9BwwdpoWwPyH4kBaL1TDo
hRkVW+CN8T69NXcFMktNNadVCQ4pFg==
=L4SY
-----END PGP SIGNATURE-----

--Sig_/824ZQ/8Upqk_a_OFy/cUm++--
