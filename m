Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B3523B450
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 07:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgHDFGc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 01:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgHDFGc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 01:06:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9333C06174A;
        Mon,  3 Aug 2020 22:06:31 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLN5D33t1z9sR4;
        Tue,  4 Aug 2020 15:06:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596517588;
        bh=dMxtds0/HyPZlLPxcj8DFbo4u/2OxCDZFrDPX/g7Xgo=;
        h=Date:From:To:Cc:Subject:From;
        b=N57fJ4S4VQHpJiLNdz8ct9e9G9Th7VyQE1c/4Rw3ULfZDdiy1AjRkrl6+lIYazO7C
         S8eG6NtQbvAARp6oWsyGmVLkH+zacE8MCBtMMT/mP94eJQylQQDeCgPFv2vbC7AlcW
         K80gxTW7szS6GuqBYkRPSxuRqWgS82X/kc+Z3cL5d3YMr2qGHTWqQ3VVCv66FX4kR9
         qYFKUEDxA3jVRLVJWu/QgqBR0jJOgoruWfaMXZFfZklBByTTMuG+Sc0vhTw8UJZZ65
         aaaUskCvXd9/lWft/LtN9+SKt2MTualR256sKfPASF3992QaDJOYr5I6hZ9B8DAH9u
         Hllk+9MuPx/FA==
Date:   Tue, 4 Aug 2020 15:06:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xianting Tian <xianting_tian@126.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: linux-next: manual merge of the vhost tree with the scsi tree
Message-ID: <20200804150622.72067466@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h=AjQxhuR6yeYHE92Ux.WOU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h=AjQxhuR6yeYHE92Ux.WOU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/scsi/virtio_scsi.c

between commit:

  92e8d0323a51 ("scsi: virtio_scsi: Remove unnecessary condition check")

from the scsi tree and commit:

  3dfd411ea7ec ("scsi: virtio_scsi: remove unnecessary condition check")

from the vhost tree.

I fixed it up (I used the former as it was a superset of the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/h=AjQxhuR6yeYHE92Ux.WOU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8o7M4ACgkQAVBC80lX
0Gwn9gf/b2IkA1XsKW9HauXt4Zd95wSvDUojGmiy4b7vJST27G3TLDNZSkY/EfI1
IywVy+MQmHbySH02OZtqNLjKiKSXVgKqjMV58CFlSNHW1HPlv0DjwsCE78utz0ty
HsY9Ztn070+si3api70w0ynn87ztD6jhdBrif+0EJYz/Ulc+f1yVXLXf5oNgb+zm
ZHvbRwGE5mBgJoyJlIA3v3RMt34W2TBu71bFBlAevllbB6E8r/t6EH/ZG2GNWZpT
SUJfdQRzpUGJLq+gfxIn1fIP682zBEfdFlr798igKIp276JSw+9cxRApEc7RVjKY
RW7NG0ra868U3MjjztC10dlDOzcjYA==
=TecQ
-----END PGP SIGNATURE-----

--Sig_/h=AjQxhuR6yeYHE92Ux.WOU--
