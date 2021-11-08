Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C2D4481F4
	for <lists+linux-next@lfdr.de>; Mon,  8 Nov 2021 15:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239635AbhKHOjN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Nov 2021 09:39:13 -0500
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:34186 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239345AbhKHOjM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Nov 2021 09:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1636382188;
        bh=IBn03kSx71PpsPJ1UryAfIE+kp3JtlAboO+OQbDdBAA=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=icE1+ZMb3eEvGvpETfVA3cXLZwkAmwxp4wXqYxFEn+BRkUs4SXzOGPOJw4aACBJAS
         dGje+UEa2cqxpU83SZqF11d5WfUkilzQ0ekBAZUL6WbdlV8vSWnE5dKcdwTJatp8HM
         3UdlkRfoX6TALzmuH9RBuvmK7Vl/sr+vkodQx5sI=
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 2197A1280ABF;
        Mon,  8 Nov 2021 09:36:28 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ugb07iMR027K; Mon,  8 Nov 2021 09:36:28 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1636382188;
        bh=IBn03kSx71PpsPJ1UryAfIE+kp3JtlAboO+OQbDdBAA=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=icE1+ZMb3eEvGvpETfVA3cXLZwkAmwxp4wXqYxFEn+BRkUs4SXzOGPOJw4aACBJAS
         dGje+UEa2cqxpU83SZqF11d5WfUkilzQ0ekBAZUL6WbdlV8vSWnE5dKcdwTJatp8HM
         3UdlkRfoX6TALzmuH9RBuvmK7Vl/sr+vkodQx5sI=
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:c551::527])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 80C6A1280AB8;
        Mon,  8 Nov 2021 09:36:27 -0500 (EST)
Message-ID: <5c624bf7869e3fd8382498929261504d7fe22c1b.camel@HansenPartnership.com>
Subject: Re: linux-next: build warning after merge of the scsi-mkp tree
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Bart Van Assche <bvanassche@acm.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 08 Nov 2021 09:36:18 -0500
In-Reply-To: <20211108110333.79f735e0@canb.auug.org.au>
References: <20211019074119.6e180896@canb.auug.org.au>
         <20211108110333.79f735e0@canb.auug.org.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-oKw+Ooyu2hbSimwozIL6"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--=-oKw+Ooyu2hbSimwozIL6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-11-08 at 11:06 +1100, Stephen Rothwell wrote:
[...]
> BTW, James, I tried to use your HansenPartnership.com email address,
> but the DNS is giving SERVER FAIL errors for it ...

Should be fixed now.  An update in debian testing changed the way
dnssec works with bind9 and effectively caused a roll of my zone
signing key (or more accurately moved me from a separated ZSK KSK pair
to a combined key).  Anyway, since there was no DS record for the new
key the whole domain broke.  I've now fixed the delegation and it's
working again.

James



--=-oKw+Ooyu2hbSimwozIL6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCYYk14gAKCRDnQslM7pis
hdDjAQDwzw9mEZS6uJdX0MONrSezQK4qKEmoclXZOd0GJslvWwD9FjxRjRYAjR92
nsZ9nfZrYfieeousV1xHdRnHhXVnywI=
=WXeh
-----END PGP SIGNATURE-----

--=-oKw+Ooyu2hbSimwozIL6--

