Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E05438D65
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 04:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbhJYCP1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 22:15:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46467 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhJYCP0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 22:15:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hcz4v2WmXz4xbr;
        Mon, 25 Oct 2021 13:13:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635127983;
        bh=P2dlr+1YHE3vn25ndAcuTZ/ZfGgLIBg60azwnwD5Drs=;
        h=Date:From:To:Cc:Subject:From;
        b=ti67VSrUYPKCwnKU/zFU3y2meQ0iS9cg79WXdz6HBW3bKAO9ulvam3l1LjYJ6iH8O
         BAtKm0gcmH0AgS857YedqR+D6mR09dwFpxcrfwsc/c138BSvHpbrfKzGqs7zb1hack
         h9+yCvy8+Ad18DjC7PAO/5Y8NzUqX+JMMS45sAdEdj9lk5T2xomwUNzhMOsP78+dpR
         +tyax5QuPMU/Ff6CcEX3ZbV7OEl+PZCeSF5X8KvniMe7oxQrQqtUJaOFV3Vrr/74dq
         HYKZKLuzB00c7yp++oHzTVg8cl5ihyIMmim0CQb58tuGBqaKhsNF6uUuaRmFnESBjw
         P68UkRz53sYdw==
Date:   Mon, 25 Oct 2021 13:13:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20211025131302.5c5757fb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DWwfjZGrcl1=.z4KlAU09vc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DWwfjZGrcl1=.z4KlAU09vc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "snd_soc_acpi_amd_acp_machines" [sound/soc/amd/acp/snd-acp-=
renoir.ko] undefined!

Caused by commit

  e646b51f5dd5 ("ASoC: amd: acp: Add callback for machine driver on ACP")

I have used the sound-asoc tree from next-20211022 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DWwfjZGrcl1=.z4KlAU09vc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2Eq4ACgkQAVBC80lX
0GwEvAf7BGEnXrHVGZF2Qsu4DuRkWxb53ImSqHhsWc07JndX6qotcr+MVvBBSenT
oEOREgHr3vPaB1pyBPgUdUFnNgd2eMTPCwergz/PlxVNOBbLR5SUDC9FnaLVMd0g
OpeHv+a/51/rs8TQCmv9y/RMvkU1quYRk4Ug0ztXundEV2O9XBsVsVxBkBRtFtzq
4DukO0f90XADHI1REOArShb4BhpV8duAhAkTkUsbEgWHoziwhU4VQXgks72G2jd5
EhC3WspxW6AKpcYp5GIUWAC3/D80CaLY2OwnLoUaBXPiLpIstUJwUoD1H2LNFZn3
mbLgq5+bpkltQLREu096xWQFXj0sKA==
=E3tc
-----END PGP SIGNATURE-----

--Sig_/DWwfjZGrcl1=.z4KlAU09vc--
