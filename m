Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FBE43AA70
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 04:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbhJZCqn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 22:46:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36677 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhJZCqm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 22:46:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdbkV0pTKz4xbM;
        Tue, 26 Oct 2021 13:44:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635216258;
        bh=e+yqnpXu0B7HjSmFPYNQFE491k30m4dzAb57qlF2fpw=;
        h=Date:From:To:Cc:Subject:From;
        b=j9fm43lMzpESWbSdZ/kI1jZvCEggUlG4hRU/UnUvsvxISOze+1r26WG+prMkXbw5D
         Q7c7UWUEfqhHC967rOlkvjGelx55kZ+BxZ+SQk//SHWaMb48CsZ+P+DhkRGFjEVVMc
         yDTjPrBBCmhgsDutL45TpLQrRq/tRcjTcZD+bki6AfaDrsjvh/Kr+4rKw31IFgICSW
         syghzGD1gl/tbYNvErQfeASthBjwInGNvf3ijccgGcUBgwo6+f8qyNv1AaLN9YMZJD
         C0B9mCkxxHJECnyS5MY35Ln/6g7I+dPWQZpKmq1nAjAGpleCoyZv0MppoU2HCPhvEy
         o6Agur3sycWdQ==
Date:   Tue, 26 Oct 2021 13:44:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the devicetree tree
Message-ID: <20211026134417.1be98b56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1a2SAgje1igT8crAvcwruHe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1a2SAgje1igT8crAvcwruHe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/of/unittest-data/tests-phandle.dtsi:11.18-22: Warning (node_name_vs=
_property_name): /testcase-data/duplicate-name: node name and property name=
 conflict
drivers/of/unittest-data/tests-phandle.dtsi:11.18-22: Warning (node_name_vs=
_property_name): /testcase-data/duplicate-name: node name and property name=
 conflict

Presumably exposed by commit

  e76187b9792e ("scripts/dtc: Update to upstream version v1.6.1-19-g0a3a9d3=
449c8")

--=20
Cheers,
Stephen Rothwell

--Sig_/1a2SAgje1igT8crAvcwruHe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3a4EACgkQAVBC80lX
0GxmlQf/XfOW9+GgFnd67IoCx37PvlYBwltqaEY08YY3+P8eEFffmJwvlFx/tl7S
WPhBR4LzFN5cYF2LVx/fLleE+vrnZbYmnAqBQuPhxDIh44QiPtinvFv364YEWvsy
Gm9D1O2FlXwdwHb3/m5Pq18O+8hjU9L4LHGj63zvs0TmTuyLC5GeJCiir832o58d
uVnzugd+cHLYob7Yo2MuFgveY/88jyCBB3ORFjOWgUM4RRnfy3S9dCUR/OoE7B54
38QgGVDZg4b7yASzCKc6+M/jVIyCVDIpcSZ09sdsvuUObdi7CkXqBdcE80IFQLH1
xG51SzaQdt/csSJhNv975YcTZPmq9g==
=v9Dt
-----END PGP SIGNATURE-----

--Sig_/1a2SAgje1igT8crAvcwruHe--
