Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840612FCB77
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 08:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbhATH0g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 02:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbhATH0e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 02:26:34 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0221C061575;
        Tue, 19 Jan 2021 23:25:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLHB54xfXz9sVS;
        Wed, 20 Jan 2021 18:25:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611127549;
        bh=fQ8SremFsAw1pNdcp2/GirejUUXi/uC8fAAZZnA/JM8=;
        h=Date:From:To:Cc:Subject:From;
        b=CboTeKuIdcojdXYzy1P2b6o2tN2t4MIyG+FZ+qQ3PUuCEGz89fR6ghvEOz+egOHwg
         taI0GkZRRsda21sIjZ2bWfmndGigM2e9grQ3XdrqgIOyg5LqpaFanBkdp4Z/qVaRpL
         pelY9d7L4GLG/Xoz0c98FlsM8Ak1tglhn9NXpKmuxZ+tK0UGMQu7gKG4I7EP5yhEwa
         beXJzajQ4+DheIP/d+iG2KpNY8Rpf2/P9vuz97GKt74Xjoq4BOpiRsP50xsCNgUt+c
         k5aeByenyDgZUdMZq4UfnFB2rt55mgaQUNqW0jfD660OFk5V2rwWnzaRsTk3U/HNq1
         NgiXq3JETvU1g==
Date:   Wed, 20 Jan 2021 18:25:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20210120182548.5fca0433@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PkVf2q6StidWB4utqYtn2G7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PkVf2q6StidWB4utqYtn2G7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0ca2233eb71f ("PCI: Update ROM BAR even if disabled")

is missing a Signed-off-by from its authorand committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/PkVf2q6StidWB4utqYtn2G7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAH2vwACgkQAVBC80lX
0Gx2ZggAk/48cSdGqNW85sApfJJzlPPm4hyLxeBgwpwOMvtiYM8CbICzkc6uepX6
lz6AYeIWQ93PkFt/9gcKiDS1zj2cXuIJ0eEYNQJqMBDzohIFfyegQ8KR5PuwEMNs
oJfPfbrPtc+QrqK4kAWUf3y64kT/wMzbZnlR5gwSgK0xBn90uvo85whxkxFPINuH
F5x1C81mv8dvl+LF2c/flq703w+SdG++eIyFiXawtbXHNunG/hg+7lkV6oKtvmgw
UKRa/SeD8B9N4wJMaWB8VZ9U4Y+/RKX8IHvtfdxvvOoBt3O2aeLidtNLLKeNhU1g
jAzwWbF7Wd4/brcd+kwaQYLKWfqFdA==
=EjVV
-----END PGP SIGNATURE-----

--Sig_/PkVf2q6StidWB4utqYtn2G7--
