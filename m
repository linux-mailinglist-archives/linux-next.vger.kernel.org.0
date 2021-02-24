Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2FF32451D
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 21:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbhBXUWc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 15:22:32 -0500
Received: from ozlabs.org ([203.11.71.1]:35747 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232446AbhBXUWX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Feb 2021 15:22:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dm6l01rsjz9sBJ;
        Thu, 25 Feb 2021 07:21:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614198092;
        bh=o1R0leeYTuocMTa7R8knZ5N5njuSTip985B70fN7mbc=;
        h=Date:From:To:Cc:Subject:From;
        b=qlY1bFS2edbBjJyr/NqZqq32xTrR/YnJQ6jMFflFmZG9NgdlH8sWDsRfg5ELzer9j
         GJ4BLhaJAHyeeaBik/YWkzJIlVDsXeuFin42NpwYod7xHFCHneZ3J1ZlmyirG/3rcv
         mVicrEaEZDikRsNHmIcqZUhOv8B7jfyvngdR3VlSwULI2Ze7qwa+7K6gSFe6+D59PC
         XpFVAlXHbe5KeJYPjlFs5ik29V+jLrL58B8YcFshEFffL3j417uAz6y2bGqZYxBLPR
         KD3Y4C2jWAWmH9iHTwulRdH1Vm1SZ7oTCx/G5lX4xrZOvz67vqXekGbzau17RZUjGr
         W3N81zExaDTpA==
Date:   Thu, 25 Feb 2021 07:21:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20210225072131.7e30277f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uwxZF1E8B0PAPqF=ewKT70E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uwxZF1E8B0PAPqF=ewKT70E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  557fb5faf4ca ("PCI: qcom: Add support for ddrss_sf_tbu clock")
  3d0e5cf9c062 ("dt-bindings: PCI: qcom: Document ddrss_sf_tbu clock for sm=
8250")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/uwxZF1E8B0PAPqF=ewKT70E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA2tUsACgkQAVBC80lX
0GxyLwf+MvnxLcbPZgz/TPCtJ6JAj9FOQ3yBg+eg+hUj9Ucow65zSYTv14WNkina
9Gjsk8wwQaFfdhcZkglac4d7iSg0OrY0m3oE4nVApS16L99dKb5ERaJGFqsJEv9T
J7LoBCeuc9LB5QfrB/7aCLcqZa62o1NXMpbxju4bd9SJ3qn2SPm155XCPB7/yQdu
/eLJtpukeNeunTg0H2s/zlf0ZVuKZ3x3xG7JtypnQFbdqB6B/UW1TvVKzxEzlJIw
2qc6bd7tdVuciSgAHt/LN7gb5L/4fMeuLNaJKx0JFgvCWBQaN9TPfup7DH9wyllm
x26l+SRe5SJ2IcSK8xvgpROQTZbysg==
=uCQR
-----END PGP SIGNATURE-----

--Sig_/uwxZF1E8B0PAPqF=ewKT70E--
