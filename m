Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317C5233CC1
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 03:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730963AbgGaBIE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 21:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbgGaBIE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 21:08:04 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B02C061574;
        Thu, 30 Jul 2020 18:08:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHq001wHkz9sT6;
        Fri, 31 Jul 2020 11:07:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596157681;
        bh=QyljU8cs3iw9ERoPZNSc66tKJs9641jk69Ywn/49EqM=;
        h=Date:From:To:Cc:Subject:From;
        b=aqmcegsWI5c3Y/gNKUymzIUL1P1udX0P9DSMqBtmRq7lX22659+11SF0DW7daVyyD
         tIPknhcEUQI1jM8ecGtG6pFiWyaBIFV/5g0NY24cpGHt8LbepXSnT8hBrYOTnLTnte
         X45JDWOpLfAFpPM18LXI+1+aI8tvn6iJ7O0JBiQ8eJ686L+3s64lfGH7uRsWCahZVU
         hhZzZ4eooeFGGr09npMuB88gMrJzw+HFA7ZNCzWRdnjD2ELGdohzlYZJVEcCIfaIni
         Ggj5atLYh5cOXDbrDwBUydw9iQCWOvof50DkWYtVKl/DY9Ao/jNOqkbJilBRCy7S1v
         uiZlZvczqOlKg==
Date:   Fri, 31 Jul 2020 11:07:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Niklas Cassel <niklas.cassel@wdc.com>
Subject: linux-next: manual merge of the block/zonefs trees with Linus' tree
Message-ID: <20200731110759.0df8967d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Y7=v/LXTOCeKkLCRmp=VmI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1Y7=v/LXTOCeKkLCRmp=VmI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the zonefs tree got a conflict in:

  drivers/nvme/host/core.c

between commit:

  5bedd3afee8e ("nvme: add a Identify Namespace Identification Descriptor l=
ist quirk")

from Linus' tree and commit:

  71010c309454 ("nvme: implement multiple I/O Command Set support")

from the zonefs tree.

I fixed it up (I just removed the code that the former removed) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/core.c
index 4ee2330c603e,e9d83b98d79d..000000000000
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@@ -1097,14 -1136,10 +1136,13 @@@ static int nvme_identify_ns_descs(struc
  		struct nvme_ns_ids *ids)
  {
  	struct nvme_command c =3D { };
- 	int status;
+ 	bool csi_seen =3D false;
+ 	int status, pos, len;
  	void *data;
- 	int pos;
- 	int len;
 =20
 +	if (ctrl->quirks & NVME_QUIRK_NO_NS_DESC_LIST)
 +		return 0;
 +
  	c.identify.opcode =3D nvme_admin_identify;
  	c.identify.nsid =3D cpu_to_le32(nsid);
  	c.identify.cns =3D NVME_ID_CNS_NS_DESC_LIST;

--Sig_/1Y7=v/LXTOCeKkLCRmp=VmI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8jbu8ACgkQAVBC80lX
0GyLBggAkEv8Ucl63U8x8V4cBrPi7Pa+x0WiFlCRYrq4Ca8NM1I0o+abFT5nlzOU
ODLfl+XVrhgjLdSHHwsp3P7qPUZXN1t/6yKyvlIjdUAjZqBZG2hFkxURGkbbdC9C
Jo7ChsLVNJjo9D+hvHCDx6Jkt6fr6eLui+9uAr/yaUinhUtV3V+bPUm55PF6LeCH
CZ4Eiyt6NFvPoPuYHh50rj2HLNIPFHnHWeV8Fk8FYmosPaguOpYAPCRYLLB0vTwv
kr/ByFiftlBeYRCRGjx8QTHrgNjJShLTe/lRgAxwpqrivJh8i5FNPtsft37FdQzE
myKdlhOdbQQA5NBu8kJUgWlSsxC7zA==
=2Caa
-----END PGP SIGNATURE-----

--Sig_/1Y7=v/LXTOCeKkLCRmp=VmI--
