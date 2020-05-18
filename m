Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDF31D8AA9
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 00:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgERWUE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 18:20:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59829 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbgERWUD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 18:20:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Qtjt0xN6z9sRK;
        Tue, 19 May 2020 08:20:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589840402;
        bh=FjIS8vGcrmSBHisqyc6vQi6ntIWxCy8/k3LeKa2MooY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Uu4Xg/jrFle3EYUUFxbo03dp1YHPRpC5g+ssrda+pIvKzQkO/4saBL1iCVtp9AsqW
         ggwjQv11wGZhUkQEfIVoWoQsjMw9K4EjMEyde02gQ7UF1EP/gvzbff+u1e6GTYqu2t
         /hkI5DS2WSK3/LGx0mJr7vLKpn576v0KzV+cHvsH4GWE9fcgD/0PA1We8I7pEhgS/1
         xp4tVQ12oh+CkZ8FemhVQyrBFlTLz3pdA8btVlPcmQPnZonF3+g64Rayj6CzAnTxHn
         0bqbEh+QJeyV7AedhIBjTDaC0S4+BApT+1r/QCMtxS3o6PYW8kYHnFB4ZJkmKsTo0q
         FSNwhebIsSNqw==
Date:   Tue, 19 May 2020 08:20:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: linux-next: build failure in Linus tree
Message-ID: <20200519082000.4909cfe6@canb.auug.org.au>
In-Reply-To: <20200420214611.17a6411f@canb.auug.org.au>
References: <20200420214611.17a6411f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+y.HsfQv2rB9O.Ik0uuV71p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+y.HsfQv2rB9O.Ik0uuV71p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Apr 2020 21:46:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> [reported by kernelci.org bot]
>=20
> For a while now, building Linus' tree, the linux-next build (arm
> qcom_defconfig) fails like this:
>=20
> ERROR: modpost: "rd_full" [drivers/gpu/drm/msm/msm.ko] undefined!
>=20
> Caused by commit
>=20
>   e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buff=
ers")

I see a fix for this has gone into the drm-msm tree.  Since this is a
bug in Linus' tree, is the intention to send this fix to Linus soon?

--=20
Cheers,
Stephen Rothwell

--Sig_/+y.HsfQv2rB9O.Ik0uuV71p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7DChAACgkQAVBC80lX
0GzAMQgAk9kFf0Hv9JzbJhxAzxEScWAk04rJZiWTVJYtQ0ICFJwTQzP4z91rQpp3
k3mDPLu4bgxd7rGw7kHGUs4ADFUC8LQRhBRDmyThLDvYJciuhhXQS7+C9tG1kI5c
RmsSkEahr203+NXRPOkBOGSN+Tg1h5SxMnBcx+WWumgXZupcDVA1FflDx0gxJOyN
h9GQk+h7cobMcUxuCS6q5G1PhjzOOGBOow60EblopwGSka1oE6Vmdr1wVnhEKjEJ
eeWIReXeHn2Qsmvs4iN/aIV3fvjCc+HeFAJr3+TemtGX8UZCHmAJxuZGea8Mbahk
QXsqwbuCDr6BwAYiM591FidxGRqAHQ==
=U7Ry
-----END PGP SIGNATURE-----

--Sig_/+y.HsfQv2rB9O.Ik0uuV71p--
