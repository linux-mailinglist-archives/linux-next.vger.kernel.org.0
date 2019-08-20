Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 718DA96C3E
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 00:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730501AbfHTWcb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 18:32:31 -0400
Received: from ozlabs.org ([203.11.71.1]:53851 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730273AbfHTWcb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 18:32:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Clsm65gpz9s7T;
        Wed, 21 Aug 2019 08:32:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566340348;
        bh=OCor82qOkk0Ckn/Fejx79cmti5gOMmvW8eIAHEKV8Yo=;
        h=Date:From:To:Cc:Subject:From;
        b=duie8aCKpqotZHAJORWfFttNzq8NfXubThQ4xhR6cxj/yZN9SoGwejGHVQRevSYlG
         iB0AcAsB1HzL9BghsrI7FmRYJpRrTOhhKXxnQduatSfWt5vMnovLtkrwAO4dRrIkdp
         VXk343dHLzRmy4m/aOasJFrUhpN2Tz2p+U+1vw5qm0X2M+ypRKwlYE90JDPpTI8nKX
         CsjzsqnsVWxaywMBSIHC/M+V1D8BJl+sYCcNF5XtRhjubo4apGqPYzX2C601VB032r
         NmHXj2wEPPwQCVHMexhQt4g/S3gWxo/lp5uUFPqDXVlNAx5ckAo8xEoJlx5n6ryRM3
         x2suvE/U70H3g==
Date:   Wed, 21 Aug 2019 08:32:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>,
        Kees Cook <keescook@chromium.org>
Subject: linux-next: Signed-off-by missing for commit in the security tree
Message-ID: <20190821083227.794a0a83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.5kJxC6Aj/sbigcZfmYArV1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.5kJxC6Aj/sbigcZfmYArV1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  9d1f8be5cf42 ("bpf: Restrict bpf when kernel lockdown is in confidentiali=
ty mode")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/.5kJxC6Aj/sbigcZfmYArV1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1cdPsACgkQAVBC80lX
0GygaAgAn6YYFvPoOMXF18zkDk+W8dU8XUMt+gTlhCUWresZgjk8waI7i5Yz4jmQ
cnsnx7GyopLifKQxhIy3+XXgj7TJuI2VjSXRCEg3yETAIseHLbf/e8+0+U+62gTI
vAMFVrNdyl7Lrqj3uOnN6BnFqN7OdP9jDw5GMmke2mxsILBhlbc5a4F1YeNal+rM
epRJ/Ypw6Ho0TSc0AaQqYFfADJlGtsGMiUvjQoDJwthAsnN8q+H5XYIElAEZLaRV
mhci2AIQjegAvt379OCEFRHxRIOzjfowPkqgjLEwJO/+nm5xEC+LPb4RqX0zu0l5
jGLe/Yglx+X77bhPeL8Z0shS9tCSYQ==
=fKeu
-----END PGP SIGNATURE-----

--Sig_/.5kJxC6Aj/sbigcZfmYArV1--
