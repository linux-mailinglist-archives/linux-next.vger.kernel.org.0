Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50B7D11BE97
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 21:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLKUwg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 15:52:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45499 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfLKUwg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 15:52:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Y87T6bYYz9sR7;
        Thu, 12 Dec 2019 07:44:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576097094;
        bh=o188grKvGRAXTTRAnmYypQCL6OQC91z4G0LRS+LQ9yk=;
        h=Date:From:To:Cc:Subject:From;
        b=EuQ7lqAmd3k+ojpEH+8KqWwFGDWHUsTdx1Zcrqh3raGhv9MX6BkdqzivE5WryIgDe
         K4kUiXms+3EeC/P3wt+pceKXQ6ug2yROahey3oXcZ40iVxRrKar59p7SpowBJUUEtq
         ptaZ6QYFsXG65fnumWzDRv7LgGhvrCkjNt408QfGWGGhr/P5LcYqxaW2hC4vC5cTLA
         47S/fJATL7XHAQOcA+CIr4h/fTwGrzWXyA4vRkVEat7msmrvf8xMDGscEG3tLb/3ka
         ALZcJq5J+8laRUppDg+Yt99tSeEKOg6lZR3QS+rZsUM06iOGYBogqrlB5SSUpAb4YC
         VxfVK5qM7uoVw==
Date:   Thu, 12 Dec 2019 07:44:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <20191212074451.18c69a64@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gzX7T1NyZWQ1_=iUBWQx_tN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gzX7T1NyZWQ1_=iUBWQx_tN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3b570f534011 ("rcutorture: The rcu_boot_ended variable can be static")

Fixes tag

  Fixes: 68ce6668914d ("rcutorture: Suppress forward-progress complaints du=
ring early boot")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 7e1204f7a29e ("rcutorture: Suppress forward-progress complaints duri=
ng early boot")

--=20
Cheers,
Stephen Rothwell

--Sig_/gzX7T1NyZWQ1_=iUBWQx_tN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xVUMACgkQAVBC80lX
0GxyZgf+PaAQQyzo3lOH6jxw7T5/sY4vo1MgQmqOER8XrHwGOvP7UC1BW1dBhmTb
x5GqMGIaTSUKgqt0RjeSJwdrwvQ8owd6je/YA7acRgPoHvB6XjCJ8srMgGUtQLXd
Bojdu8NJvDR9f7/kt1fty57rnV2h1HKptK4Uyxx/DiAwtpKN2j+Dm31Abn/ELmcZ
a5Q91UiC54iqb4YDO+hSBmPfMHwlLdB4rwvvfA7W5nkEJnqmlv6m1Us2JCjSOV+h
3vUMpbb5atb7jeRTPXnSoEJiMf0fcWrNEcBpOipl7Z8FxRQMqtA+eYe8VuP+xUcL
lXifHls8qcdge/I88SaIGc5+mfddRQ==
=/OSC
-----END PGP SIGNATURE-----

--Sig_/gzX7T1NyZWQ1_=iUBWQx_tN--
