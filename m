Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F82210F580
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2019 04:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfLCDO1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Dec 2019 22:14:27 -0500
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:53094 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfLCDO1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Dec 2019 22:14:27 -0500
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id E068A8EE180;
        Mon,  2 Dec 2019 19:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1575342866;
        bh=9nKoSLwdyLlq7gWbSICoavwX/Fu9M/NrMTHHzhLxwHY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=C2ifl54y6xLB0IQqQwCGSGb/va411huHcpyi/FMEouLfnwKaI8cBCjVJLg84tn8cj
         WXx+lUoPcj+qbNVPejsmj4ENAL+r9/zKUjl3izxVL6qTtaDapDMu7nV57W5JVhlAKd
         JpglLViauBhaSYwaiDB8Gzq3SAvCH7tvP/DuC3iQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id t3iaSOjBkjd8; Mon,  2 Dec 2019 19:14:26 -0800 (PST)
Received: from jarvis.lan (unknown [50.35.76.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 402908EE11D;
        Mon,  2 Dec 2019 19:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1575342866;
        bh=9nKoSLwdyLlq7gWbSICoavwX/Fu9M/NrMTHHzhLxwHY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=C2ifl54y6xLB0IQqQwCGSGb/va411huHcpyi/FMEouLfnwKaI8cBCjVJLg84tn8cj
         WXx+lUoPcj+qbNVPejsmj4ENAL+r9/zKUjl3izxVL6qTtaDapDMu7nV57W5JVhlAKd
         JpglLViauBhaSYwaiDB8Gzq3SAvCH7tvP/DuC3iQ=
Message-ID: <1575342854.24227.43.camel@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the y2038 tree with the scsi tree
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Date:   Mon, 02 Dec 2019 19:14:14 -0800
In-Reply-To: <20191203140052.0ed8810d@canb.auug.org.au>
References: <20191107153757.4999749b@canb.auug.org.au>
         <20191203140052.0ed8810d@canb.auug.org.au>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-zKgM0jTI4stvZ0vZ3F0Y"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--=-zKgM0jTI4stvZ0vZ3F0Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-12-03 at 14:00 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> This is now a conflict between the scsi tree and Linus' tree.

Actually Linus resolved it:

https://lore.kernel.org/linux-scsi/CAHk-=3DwjWNpPW91wyEj4FC4pOimWEUtLVb_RwQ=
gB+9h2OO6ynyA@mail.gmail.com/

So been there, done that and even got to crack a monty python joke.

James

--=-zKgM0jTI4stvZ0vZ3F0Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCXeXTBgAKCRDnQslM7pis
hYiLAQCBGecZjCZpcDpcdHnKN3GaTRePLNAX+7meQjbrfHb8vAEAigVFa+KsijTg
KswlqXR8HFav0AzdEP0zAcYfIqDAYkM=
=Db50
-----END PGP SIGNATURE-----

--=-zKgM0jTI4stvZ0vZ3F0Y--

