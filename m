Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7619F395645
	for <lists+linux-next@lfdr.de>; Mon, 31 May 2021 09:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhEaHi6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 May 2021 03:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhEaHiE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 May 2021 03:38:04 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA78C061763;
        Mon, 31 May 2021 00:36:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FtnCT6D0rz9s24;
        Mon, 31 May 2021 17:36:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622446566;
        bh=edAeV7h2A8p3l1up77KsPISLlfxdBbE0RuunYMtKkAo=;
        h=Date:From:To:Subject:From;
        b=mC3xssSdANLRzs0lDYd26OcdH9r432Fxe5Mr8B7axraf6ZA+7jmARvOQr3ZVpqhc1
         9uwpy4WNGV/JOH36KhStG0Dcsznp98N+qRaaq0oNkAUAZodxWmqKsTOgsaHBjhOt3x
         ifCYtMP3JNId+iryxOe4aIvb39DVV/lXEqEE+V70piDeyzo/14kqq24h8QIARckWSd
         nzdhFGX4di9wDdmb7dVgfwWNe/fTEVhFhTRCmgXsdlET7r5u1UYdf3sbY/L2OHTGSn
         KZKiMr2lMC/Zx8Xb7PfP0wrB937CLJXVg2N0mrSXFcEFwj+p4khy20nOeBn1R+iScl
         aQ8SLUYrG5DIg==
Date:   Mon, 31 May 2021 17:36:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release today
Message-ID: <20210531173605.479f7927@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DO6OBqS+dazAZha.j/0STlX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DO6OBqS+dazAZha.j/0STlX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I have not done a release today.  Back to normal tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/DO6OBqS+dazAZha.j/0STlX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC0keUACgkQAVBC80lX
0GyNHwf+LKtRFmHb/zTZd1kLFcap6NLLpPFQ+sWhvj+95jwWfcqYQWsQZmAWoQ71
nDCtpccD32yQSv/dtDLp5UO5FFZzYJKrh6qKgDpqf3rDYkZ4b2E+VPHa+4FvVq4C
r38QE/HJSlsHm9C03ZD2OgHepUYXdDeACWvpZ7QOclXBXjSXAk8gxN6JYHHlBQR4
z/1qW96w85Yo0m/Ud1SCUjaxSg6kXaOuaUW4RRamvsJZiOK+bA2vFVVoAmnWrOVH
3fgbGVfsY4ZHVJPBCZDFh0FGwkFUATrK6qgPK5DhVcoxXVSU6NwLSOqcAA40tWp8
mtvoB0WEVjUakmKTEfllYYEiXti6Bg==
=jT7e
-----END PGP SIGNATURE-----

--Sig_/DO6OBqS+dazAZha.j/0STlX--
