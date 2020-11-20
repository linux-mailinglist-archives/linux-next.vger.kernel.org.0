Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5BD2BA1B6
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 06:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgKTFPQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Nov 2020 00:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgKTFPQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Nov 2020 00:15:16 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5042C0613CF;
        Thu, 19 Nov 2020 21:15:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ccl9T6794z9sT6;
        Fri, 20 Nov 2020 16:15:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605849311;
        bh=qmX3V0pKiJMMxrP9g1rgonP2PEr4dj0VZSg2vPAYbqM=;
        h=Date:From:To:Cc:Subject:From;
        b=MTKZ/zBhkTaF/PVJwBtaMtX2lVKej3WfAS+CmEDtdme5OnxsFW9ph8HW0/9FP94GS
         FYtl4crCj0uxsc91IKAH0DdBVh09pUY8pqaQN1IggyVrZcLISxKuyQVnvM5CFdmcHA
         0acmjBvvsduek/HSswSof9zVBgQB3IEjfCUcN0+titrzU7ILNoX7FTuEPWCABRgHpX
         gj1/yl7RBsq5sxQdCwkRiXHZdWAZxjB7CCdYwqiw/BiW0vcJCo4G9gORqRsXPO8Thx
         WMi/I1AwccnJwNR2rfB3XppSf+wszgH2lSw2rIIA8SnPnSjSKerHwcCkm63LzwfAPB
         r15Or838rDqTA==
Date:   Fri, 20 Nov 2020 16:15:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20201120161506.4ff08894@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EsALb==m9xzibz+=6drHdkP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EsALb==m9xzibz+=6drHdkP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'
drivers/usb/typec/class.c:632: warning: Excess function parameter 'num_alt_=
modes' description in 'typec_partner_set_num_altmodes'

Introduced by commit

  a0ccdc4a77a1 ("usb: typec: Add number of altmodes partner attr")

--=20
Cheers,
Stephen Rothwell

--Sig_/EsALb==m9xzibz+=6drHdkP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+3UNoACgkQAVBC80lX
0GxJVQf3eQD/pkNswdMWwP/X53wNEAoylfSH+ioof7nOqx4eGMTmAETU0VmiykQS
b50wI35YZVmIW/mWFiYkj09AG6g2jOEZj4bWaTCXhaY8Pb9tADUYvteTpQuNELAg
EGRt2Kiw4u81qj6Eg0fCtUuYgDZzOiq49vVZTbkR4dfYck2h4wpjViyHomYrrMuH
lGqch9K9vd05wv/9ZsSnzURGNnJgp83CF8wS4WBak3TBlYsLnuoJS9y1mc2UZE19
7gUmnlq/eYsLcMso5yDXN4Kq9JKkW0OwX0HO5AWmJ+1YmC3zP0L7euBXw2LACOXe
puMXIupKY3Im0B+KJB1NBzhZyFQq
=LdQS
-----END PGP SIGNATURE-----

--Sig_/EsALb==m9xzibz+=6drHdkP--
