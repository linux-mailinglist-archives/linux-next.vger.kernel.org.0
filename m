Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 765DE183EE0
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 02:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgCMBzG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 21:55:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43625 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgCMBzG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 21:55:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dpfv08WZz9sQx;
        Fri, 13 Mar 2020 12:55:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584064504;
        bh=Oe3ismlq739fmrVVvyGbgIVXeF+BRmS6+YyGbgOEgw0=;
        h=Date:From:To:Cc:Subject:From;
        b=V3BfsLIJ+e/hULC3ZlLht/uHfO5y9O34dKyAelJeKUuIq0IjomUWwDjluAex8d3iB
         IGUrCxxZmc6jj0L67VBxZckypxcEB4tPsGxa/ob22nw6OonC9wLgxT2+PMBBm2G/KU
         oUSkbtfHGgB2VSKTeMbNsPUPK24zllLHuZW4+i/5nCwBtHl1T6FF/rV16GKVvvbV9E
         ndsl2SApzjcaRgt22WmruLpk1xz5VFYUF14x+VEUYpmr+Y0WUcl6tqNeNquK7U7VqV
         kIGSrfJ7YpcSs1e/XsB8227oRE19hYOYJaOrKCswYReuSqKqsLj/0utClJ5GMitXE9
         scujTWox9NnoQ==
Date:   Fri, 13 Mar 2020 12:54:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20200313125454.6314a687@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MwBqppDMHPigmi0FDsWwnm9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MwBqppDMHPigmi0FDsWwnm9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from <command-line>:32:
./usr/include/linux/pcitest.h:25:2: error: unknown type name 'bool'
   25 |  bool use_dma;
      |  ^~~~

Caused by commit

  f6628e69c581 ("tools: PCI: Add 'd' command line option to support DMA")

I have used the pci tree from next-20200312 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/MwBqppDMHPigmi0FDsWwnm9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5q5+4ACgkQAVBC80lX
0GwAGgf6Azu/zqCqW3/1HAjctt6rSEJ4NCWSNzQ4tUwTKybCrIRzSCekzRFoYvrl
jqkWekWTf/HT7TMKGrIVxvgwN3NP5Lm90FN3B7QXKQlRzwDNombQ7hfzVVqwab0/
0uIExOTrQghg6tD7IMp5Zm8CZ/9XdNYy64tNAkFWYns2R5sGGmnqFrVbejinxj8+
rNfBLTdejAOZWnQ/np2yhd4nY+YFH+xzYmmIIXtoWGI1xD6plhQ6Pxxm7CZ2w46q
w/hhp6ga5Rtsuf8qkqnhdIQAYQzTfNPJs/DDHzRge1qYgE1yF+C0TLR/56W0ZBd+
W8ffJ3QxvLllU+soqU8Frbnrpv5beg==
=H2gt
-----END PGP SIGNATURE-----

--Sig_/MwBqppDMHPigmi0FDsWwnm9--
