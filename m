Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1CF32DE43
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 01:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhCEAVf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 19:21:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhCEAVe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 19:21:34 -0500
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E95C061574;
        Thu,  4 Mar 2021 16:21:34 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9B1791280606;
        Thu,  4 Mar 2021 16:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1614903691;
        bh=eew3oq7VQDIoDJo21SjosiBCWbqB3d2W64nn6CW6XKY=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=jakFpu/t4MwFPnydlAXV6nsPNpbGcEhUfXlp2BfVE5mykleAHmkpavqVZUN3vHuWh
         rMj30/F+DbFA5I0mUhsaNFKdnQPTMWGfhDvd5o5jkNH+XW8olCEXX6Z2K1I+dvq56S
         wSk99jpaALFukPo3ir6aU/lfXuXuj/Pana83jXw0=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id eWCfSk2Ry1ba; Thu,  4 Mar 2021 16:21:31 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3FC671280602;
        Thu,  4 Mar 2021 16:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1614903691;
        bh=eew3oq7VQDIoDJo21SjosiBCWbqB3d2W64nn6CW6XKY=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=jakFpu/t4MwFPnydlAXV6nsPNpbGcEhUfXlp2BfVE5mykleAHmkpavqVZUN3vHuWh
         rMj30/F+DbFA5I0mUhsaNFKdnQPTMWGfhDvd5o5jkNH+XW8olCEXX6Z2K1I+dvq56S
         wSk99jpaALFukPo3ir6aU/lfXuXuj/Pana83jXw0=
Message-ID: <9a15538c1cc29270d306a4fff6fd9089c9ca56ec.camel@HansenPartnership.com>
Subject: Re: linux-next: rebase of the scsi-mkp tree
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Thu, 04 Mar 2021 16:21:20 -0800
In-Reply-To: <20210305110402.70ff1080@canb.auug.org.au>
References: <20210305110402.70ff1080@canb.auug.org.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-DdVS56qsxir+ljF6RfnE"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--=-DdVS56qsxir+ljF6RfnE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-03-05 at 11:04 +1100, Stephen Rothwell wrote:
> Hi Martin,
>=20
> I notice that you have rebased the scsi-mkp tree.  Unfotunately James
> has already merged part of the old version of the scsi-mkp tree int
> the scsi tree so that commits f69d02e37a85..39ae3edda325 in the scsi-
> mkp tree are the same patches as commits fe07bfda2fb9..100d21c4ff29
> in the scsi tree.

It's just the flux from Linus announcing he's screwed up -rc1 and we
shouldn't base on it ... it should all be fixed soon.

James


--=-DdVS56qsxir+ljF6RfnE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCYEF5gAAKCRDnQslM7pis
hTP3AP463dSQhrj5tMLNwRvscqMRtCZjirSX5dNeotvjtDImaQD+IuG7gc2WzkIV
o/VfFlKDaK0Byyn1xM/eIfwpr2QEsrc=
=8wfl
-----END PGP SIGNATURE-----

--=-DdVS56qsxir+ljF6RfnE--

