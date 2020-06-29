Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B408820E9D4
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 02:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgF2Xxt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 19:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgF2Xxs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 19:53:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7853BC061755;
        Mon, 29 Jun 2020 16:53:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49wkpb2PQ9z9s6w;
        Tue, 30 Jun 2020 09:53:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593474824;
        bh=pvTRfE5i7jkJTOHAxLss53KGOh0c7JSLNe0DejxnLnE=;
        h=Date:From:To:Cc:Subject:From;
        b=Lhn2OqBtdihILkvnfAYM6iiCNgmvifErr4xP4toaeS2imoDO/+cM3CgRRuB1rwoYb
         2hsNY1wKGxIon7SBnwYwb6OHrNMs3WjUf22cGadFHuCWDPo0I+ohUgrxVTAG7MiOrG
         7ySI7tA49uQ2Vc06TUPt3RtyDdlCiMCSCExTcwlppVGjfMycGAmvssIsugqMhAsmqI
         uts9cH+HwFhjbFR3p0uKaFIJAIGouPML2Zz4E4xoMQg57vJv/GPdS92zu84+dqHs04
         6dZG8rPodUE+lPG2YMRlj39RccfflPabfJaMPBEKss13tRgRz+uFoT7GvN2hLBZlfU
         Ip6cTbUDaftcg==
Date:   Tue, 30 Jun 2020 09:53:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: linux-next: build warning after merge of the clk tree
Message-ID: <20200630095341.0f4ae8ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a8r9_BBK5dF0O0w6_d7CrZ1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a8r9_BBK5dF0O0w6_d7CrZ1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/clk/bcm/clk-bcm2711-d=
vp.o

Introduced by commit

  1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/a8r9_BBK5dF0O0w6_d7CrZ1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl76fwUACgkQAVBC80lX
0Gzb9wgAiCXEKX0LFjn/IdiskS1NmNS4/hDYvwf0u2YdmqO3qYBIakZFlHqF6jpm
M+R5x4Khyhe86rMD4U5mPhewdR6P3i8ioV0jfmcV6ZUNefakMgGG3ktFNdaCL2kX
MwN5Hk8kRl8Ia54WsszgsXJroCYiEwwYWSRUDwWczAqQia9qrrJr0IkShFo9elHf
rwv8/8GPhnboDB9sr0TeN98xpQdnPEKHEPicIKDu8hBdCF6RcDQaNWYwPogAomlh
kQlOKE4Zk6vuyB42t0vXL367Y+dU6oAXU5FhfcMky80/JjSyWzSO7MGOMo7A12Rj
82t2PyXbc9Ji7bgLUE5E43PoV29DzQ==
=n+Q1
-----END PGP SIGNATURE-----

--Sig_/a8r9_BBK5dF0O0w6_d7CrZ1--
