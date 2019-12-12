Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EED211C148
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 01:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfLLA2E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 19:28:04 -0500
Received: from ozlabs.org ([203.11.71.1]:51979 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727126AbfLLA2E (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 19:28:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47YF4x6CGBz9sR7;
        Thu, 12 Dec 2019 11:28:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576110481;
        bh=gKsnOrnzBzpufC7c13p9ym8YZW4HCQDNibFWg/gofG4=;
        h=Date:From:To:Cc:Subject:From;
        b=qjJfXfBGZGO2EIV9DdnsfVl14vDi8tA3coPpZXs3bad4eamZJcGbugqmp8wxsp2+T
         LCgiToUCYWNJIRWQgQTkrVOYQOWhZ5KQW6djkjvk5bAB+C82zP0SgEqEGoPomU9Q3M
         KBMLUK65xSxdm0yXGhlrpPnBmwhSd/9XgEboW+BUU9T3lhFpdqmnP7FKN45ByJZvqW
         0/mQPMRqGf19Fw7WqbrKGfw1PCmsHXmHLJMS4KsTgp5DZ6d1gtUAApni7DAunk6SMq
         KzhvRqaBkG5fcXKZLAukQiIOaPja45Fr9J1lkw2rmM5kEu+mmEnQrE280x6RI4eD0F
         RJPRC5005OmMg==
Date:   Thu, 12 Dec 2019 11:28:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound tree
Message-ID: <20191212112801.22796858@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YZetE6fgGhwL0WolLt75hf/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YZetE6fgGhwL0WolLt75hf/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/pci/hda/hda_tegra.c: In function 'hda_tegra_runtime_suspend':
sound/pci/hda/hda_tegra.c:169:19: warning: unused variable 'bus' [-Wunused-=
variable]
  169 |  struct hdac_bus *bus =3D azx_bus(chip);
      |                   ^~~

Introduced by commit

  f36da9406e66 ("ALSA: hda: Support PCM sync_stop")

--=20
Cheers,
Stephen Rothwell

--Sig_/YZetE6fgGhwL0WolLt75hf/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xiZEACgkQAVBC80lX
0Gxt/gf9EHEHCGIAEzTQb+rC5pjAf/5G6W8viE/NPGstuPA0A3uLTQfydI+xXC5F
jaNURfcRJuEyASc/re5lDb75r6k/UBcCrVE8dW3DdMcIQxqrXDz0xqGf0NqbRc4S
2TTCk6uCLeBcD/HtL7OOD2OqWdrlHPdWiMWypYrBkMlm7B6mbmbbP6ChxaKPGwlz
4Jcaa9Ss0/OaIufIRPCYucpLcuGL/7BUTFg6+GQnmXcQjDlDvblQQy3y723RRWyr
jZRwzfX2MY1EVatUPHH085Eyp1wEnTgRga/tppBClMmp/+unQ72z7Lr/2Cz+IeOq
EWpd1aI7f45OxZcfFHG7GfLQuDJB+w==
=IOM6
-----END PGP SIGNATURE-----

--Sig_/YZetE6fgGhwL0WolLt75hf/--
