Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECC4C2890
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 23:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfI3VSM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 17:18:12 -0400
Received: from ozlabs.org ([203.11.71.1]:44903 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729190AbfI3VSM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Sep 2019 17:18:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46hwH55jwxz9sPd;
        Tue,  1 Oct 2019 07:18:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569878289;
        bh=1mEA4xwhRbxGuczCIfw2IuZyscWuWOg24jsY/OLdadw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g6iRAOE+lyeZz2NOqoFdZoG0tG9carZG1Buy+oEWJJbAqUIJfff5EfC6S2Y9Mu7rz
         KltVRrCZau4PKzUD5F/HUl0vTANQQ2a00V20mNdUB6q/LfEX5ioxaBXtdN4D3S7bjh
         t4isjtf+eXCX3D6vc3zLf5bH6QYdmPhr9gGCxlqjltf1HuCRIMgOSboOT4071sM13W
         9lzg3Hr1+GNPVkuynoTfm+ChrsdgRVmXdbK0jraw14Wfup4E/WlCqSp4yFUnHN4WVx
         4vtOPUxRPhRIXc5XDOqExMtd+7Ng36gKP+PAcF3Uu86xAOokoEKQxIsGxf8IN6DNja
         5LgFsXVOKFAtQ==
Date:   Tue, 1 Oct 2019 07:18:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Gao Xiang <gaoxiang25@huawei.com>
Cc:     Mark Brown <broonie@kernel.org>, <linux-next@vger.kernel.org>,
        <linux-erofs@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Chao Yu" <yuchao0@huawei.com>, Miao Xie <miaoxie@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: erofs -next tree inclusion request
Message-ID: <20191001071809.2d9aa557@canb.auug.org.au>
In-Reply-To: <20190919120110.GA48697@architecture4>
References: <20190919120110.GA48697@architecture4>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ow_/GIm5is3fmJ=3TGV+Omj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ow_/GIm5is3fmJ=3TGV+Omj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gao,

On Thu, 19 Sep 2019 20:01:10 +0800 Gao Xiang <gaoxiang25@huawei.com> wrote:
>
> Could you kindly help add the erofs -next tree to linux-next?
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev
>=20
> This can test all erofs patches with the latest linux-next tree
> and make erofs better...

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

--Sig_/Ow_/GIm5is3fmJ=3TGV+Omj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2ScREACgkQAVBC80lX
0GzQrgf/RMOZptYLQcyn8LIj0INbJu3TYymh1/PaNtbIuVO9p8/VpKgUaCfLO2L7
5yrmAgnlDNoUjPTXTAD1mazO6MO126vobx9sA96DdH225d57QhSz2QtEJnOU5D5C
jgKEuyd8E11y5HnHeyoaKE9WcgzhQeHrlqDyOh0TeZR/NunyWB9YeiNYFJvKWK6E
vmD+JutUuL7y494qIX6YHxh8F/d99Ag/zhep5cG93HGDW+/zwrr+8LfBYudoqfHa
hENVtn84AZlDcBEECJeMx+Phk8CjFgm+dmtdnfBy78FfIp4wx+hbdj/qjapAWHRQ
8KneSpCGqIfsFMbRzkK0dw36FTyJOg==
=6uv6
-----END PGP SIGNATURE-----

--Sig_/Ow_/GIm5is3fmJ=3TGV+Omj--
