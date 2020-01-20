Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 759F414336A
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 22:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgATVef (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 16:34:35 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:32949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbgATVef (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jan 2020 16:34:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 481lLG6Vcgz9sPK;
        Tue, 21 Jan 2020 08:34:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579556073;
        bh=B/uaXNOzGmgYx5o+zZDaRq+uyNaotC/PaEI4OhmL6/U=;
        h=Date:From:To:Cc:Subject:From;
        b=JBcc76639Ocp2dtjOb89h6KEIrZHrNc76gi8rxRpVYHULgmOvMOm+/4DYaicgmAu3
         pn9dM+seyoL9/Xhygb0wuiC1eJEpKlIKL8Q/WoDUUKCoA6uJ+o3vvrmuAOykE8QUcH
         TtQ/Xn8qQe5gxVogUjoiK4Iu79289rmju09O7k70S1PwX4L0Qh9b7pprkSAwUjYit0
         Os8ZceP+1jmsEXuph1TfaGwU9FdeMZr5a6gK104S4ryRmuhKHggfLEOINlrW1u7Qx1
         20JvLonvHgPhWpqNcGi8bkSCZp+gHhKjqBR+zQzMSMVm/RyZmYRBsJcyDJeSr2GJ0d
         RaY3CsRLFPZ0A==
Date:   Tue, 21 Jan 2020 08:34:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Auld <matthew.auld@intel.com>
Subject: linux-next: build failure after merge of the drm-intel-fixes tree
Message-ID: <20200121083424.66d98dc5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XwC9.aYjJCeolnFRpcIZ6sg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XwC9.aYjJCeolnFRpcIZ6sg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  d8fcca47e195 ("drm/i915/userptr: fix size calculation")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/XwC9.aYjJCeolnFRpcIZ6sg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4mHOAACgkQAVBC80lX
0GyiIggAh+uEumRRLd/uzS0G2uWsepBy1Yq2Du+SZOvq5q6eXzxPFi3v4yq5G/Z3
91kKDbUbXIq0bt+4ZeBWCVa9JHfac7zaD6v96oj0/WAGptURVMWs8IQzSeCE5ly8
OaRbBIw0l/7R6oDXh0+UmePioF1mh1PiZ2uHQNmVgGS9ECzzGsHYst0WlWKbfrcW
tF/i5GkROKKAy92QKh+SHQKa+QMi9qYOzffYXqyVbTmUD4BUit9Es86qFcYnMebu
60CJT2QjE1vOcPeThd8mRGmHy9qrMlLypvMnEV4KmI4hDq3X9LR4GnDsms5Ej+nI
AhoRQjAGR3OGYJqZGubAw/fwzQw1Zg==
=0wfI
-----END PGP SIGNATURE-----

--Sig_/XwC9.aYjJCeolnFRpcIZ6sg--
