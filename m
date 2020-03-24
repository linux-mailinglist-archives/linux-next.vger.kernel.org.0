Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C898191C07
	for <lists+linux-next@lfdr.de>; Tue, 24 Mar 2020 22:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXVj7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 17:39:59 -0400
Received: from sauhun.de ([88.99.104.3]:55432 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727023AbgCXVj6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Mar 2020 17:39:58 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 1CA4B2C08EF;
        Tue, 24 Mar 2020 22:39:57 +0100 (CET)
Date:   Tue, 24 Mar 2020 22:39:56 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the i2c tree
Message-ID: <20200324213956.GH7641@ninjato>
References: <20200325082837.62555003@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fd5uyaI9j6xoeUBo"
Content-Disposition: inline
In-Reply-To: <20200325082837.62555003@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--fd5uyaI9j6xoeUBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> is missing a Signed-off-by from its committer.

Argh, fixed now. Sorry, for some reason I had to deal manually with this
patch, patchwork didn't pick it, so my custom scripts failed.


--fd5uyaI9j6xoeUBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl56figACgkQFA3kzBSg
KbZGsRAAju2TbMMDK+mAeGXEheoEpt3w3dakboDPG7P4mlBCpzASTRVzcxQofxqT
lsR5BBqKzKV5Mk7pa+Ab8/nsrfw239sVfm3IeIhwJrqPZbZ9O2tH2UCRWlKFLbis
lMNDSXgdHQFpCJzZjCfMfc73cyy456mDNrCPZCuj761H9YQl21c3AE/CGHCk08Tb
ylBK7bHOYc6cIIU3Y3jTw1vGsgNxdNXtdWJ9tYXfIuYE1cLHC/I91W+Ye/b25zcW
RF4oEZs1fKSVEZ3wA64xHKjuIecdnUN8Zxhti1htd1zNv0H0IBWnnXaqCrtFHDcX
XfH6Cj8dz6fuldqjiVdgvWPR1YdRR7oVZjqpnARoFVG1Qco2BdXSRePj2EJaQXfJ
X2wJokKZ2LNBFCSkFJexJiqVgYuYM4LnQq/bctpt97ref2tolKGI53mOzpFOebaL
GUC6KIKy7TfBJ76IM0Pjvmc0vBRSnBFbAVd7qcWoxDDfeOD8dvTppzpRBIQBzZuL
0fwR2MOyNxgwdIVRZ9lRVxjX4G+ORJ10YUCByd7V7VbpIJ1Asl9c7wkxs+7Gp30T
GRUuMh/0M7KhXjUC53P7WwNSBRbodVhp0z9YEMw82T9SIGN1t8shuEgIya4zEBoX
a5uEu1/44tTjJJmPpLASEkmNqwA/HN0VK3dUoTdpeR0vi/NGJvc=
=QsrV
-----END PGP SIGNATURE-----

--fd5uyaI9j6xoeUBo--
