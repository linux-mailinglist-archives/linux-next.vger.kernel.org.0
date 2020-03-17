Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD1118786E
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 05:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgCQEVz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 00:21:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43387 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgCQEVz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 00:21:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hKkS2T8lz9sR4;
        Tue, 17 Mar 2020 15:21:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584418913;
        bh=RKizELq7+yJhhSQqciMLy1s3drq2vyDrZAPXBp7AUwU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I+6r/pEQFQJY3/w5V1gMgeKqcrc3atyQ9isB3PujllSUyo5yfOmy7gs3Test/f0SK
         SM2N+Gs1hHgWAJ4tvHHZnzlDbqkVB+J/PTpU3mLq4LiPWDf6rxOH2e3+ptirAxTEk6
         d/fEZxJnEZNqeXyOCubPpEjKew0OI4DXXBV3eo6Evf2ZhkLvzbTsFMQyTpiouTiR8p
         obvVgYdxEMH+LssiiPThkHO+wJQM4w/oeN4A0YTd6szDLRRjbD7/HhP1+0luoC2YLK
         GlFfqDbiCJZmwTTiKftpunwa/aS8TtN5vNTvfcJR28LNFIKqWDa0e7PLfaeNkROl/R
         ZpmLenanE5lxw==
Date:   Tue, 17 Mar 2020 15:21:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robherring2@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the
 devicetree tree
Message-ID: <20200317152149.3fd4db28@canb.auug.org.au>
In-Reply-To: <20200316141436.2113f68c@canb.auug.org.au>
References: <20200316141436.2113f68c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iz78cqsaLHjNqxnrr_JEJc3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iz78cqsaLHjNqxnrr_JEJc3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Mar 2020 14:14:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the usb-gadget tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/usb/generic.txt
>=20
> between commit:
>=20
>   431a30b7d495 ("dt-bindings: Convert usb-connector to YAML format.")
>=20
> from the devicetree tree and commit:
>=20
>   dd2d0d1fac2b ("dt-bindings: usb: generic: Add role-switch-default-mode =
binding")
>=20
> from the usb-gadget tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc Documentation/devicetree/bindings/usb/generic.txt
> index 474e74c06522,67c51759a642..000000000000
> --- a/Documentation/devicetree/bindings/usb/generic.txt
> +++ b/Documentation/devicetree/bindings/usb/generic.txt
> @@@ -34,7 -34,13 +34,13 @@@ Optional properties
>    - usb-role-switch: boolean, indicates that the device is capable of as=
signing
>   			the USB data role (USB host or USB device) for a given
>   			USB connector, such as Type-C, Type-B(micro).
>  -			see connector/usb-connector.txt.
>  +			see connector/usb-connector.yaml.
> +  - role-switch-default-mode: indicating if usb-role-switch is enabled, =
the
> + 			device default operation mode of controller while usb
> + 			role is USB_ROLE_NONE. Valid arguments are "host" and
> + 			"peripheral". Defaults to "peripheral" if not
> + 			specified.
> +=20
>  =20
>   This is an attribute to a USB controller such as:
>  =20

This is now a conflict between the usb tree and the devicetree tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/iz78cqsaLHjNqxnrr_JEJc3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5wUF0ACgkQAVBC80lX
0Gx06Qf/QRzhPFQwQOaDLY3laMHmeBdggzpkdsPFLHpmoV2lGREsZh1zAuqzbG85
dmk/SmeP2xFDzNW2kf3hEBPFdgUAP1bXrKze/TqKdMngYgiOrZ+i2PcxRx8McTJu
rDOpmvr7VoBS14h9bq8mlUw3KroXsQ5XQQ+2t2muFsWU9C54fEXmVCIoWPuNgPZI
rqrEJTrj/pmU9r23HiOmZ6dXAgSgSGjK3YRTLc0/BvysauGS5S9ZGjzUdMbhqeGY
a9n+JhQdIyOml2+RAGtJQIAAhozHRqQ/WgweWpHKTpMizjhH1Igyc52qTuoMeRva
lmGpF6tKY3MBKq030U5eDGMwHrQwOA==
=rYA6
-----END PGP SIGNATURE-----

--Sig_/iz78cqsaLHjNqxnrr_JEJc3--
