Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBAE616B136
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2020 21:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgBXUw6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 15:52:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38675 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbgBXUw5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Feb 2020 15:52:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48RDm56mz5z9sNg;
        Tue, 25 Feb 2020 07:52:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582577574;
        bh=MAXNZNQzY7aWe610oRUrFuU3fPXDxQs5ZuGRxGqGl+s=;
        h=Date:From:To:Cc:Subject:From;
        b=WN8t6JCTEEWspOP6wUG02//WxqNNyCl/nUuZHhC/p8JPKQjxiHFOy1L9sKlIjpQu9
         cyDZF3y36tuIjFmlxiTm6CI/+zUxFHldY9pou8K57hfmOJeZbbEhtayxMZbGlKw6C9
         AlZWbSjlSrGPToKerpyHYk2L6HZj2W1q58gZqmG5Fln0guHeRcngd7ajwo2zsCIeP1
         Fc2Hfv/qIQWW4y/dQjQM6DyEQR25221idG1gqpyC8xliSu+gRCYEqZJuZrkNKJNP9b
         BI4pF/xKXdCMbJdT4EPscVz3EgmfW5fzhF25ETjdiMWaGlIRXWjt5uSN6tBCW9vqU/
         xUBFsK9pdbuCw==
Date:   Tue, 25 Feb 2020 07:52:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20200225075237.61e103e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PMq/HqWQoevQGdgfHWnJ69F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PMq/HqWQoevQGdgfHWnJ69F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  39452a5239bb ("cifs: call wake_up(&server->response_q) inside of cifs_rec=
onnect()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/PMq/HqWQoevQGdgfHWnJ69F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5UN5UACgkQAVBC80lX
0GwMwQf/RKRlhmK1GG9uxgicXXh6I9YeBC8wbuEM0dWRRh/PtFuBm3CJ4S1Rp/l7
5qy7A4tMWBP0NZ4jYeVRVyNVZdhLpIykZGBgUiBUD0RVA0fiIDSgMfB5El+hJDJI
SdvmjOBMxuif17PS08n7VcIWS84vKTQ2T8Ih/wgyHO0/olVR206fqvV/wzRgmZ1N
gTj2JtDnWPDXbgX1g3ejWnOKzVvOK4SpcQdR6T5WtxN1E+rdB7TPHiMRhQoG78pL
b1nGAWJMJhYAqLAVA+K9/uZpe9AO6ZmVhLlzOJPqb32ghZX/xapPm5bVqNRn7bqp
VseVTIAUSNNIYkBIq0q9gedwfI43Gg==
=EFT4
-----END PGP SIGNATURE-----

--Sig_/PMq/HqWQoevQGdgfHWnJ69F--
