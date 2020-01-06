Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7709130BEE
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 02:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbgAFBzk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 20:55:40 -0500
Received: from ozlabs.org ([203.11.71.1]:40341 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727226AbgAFBzk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jan 2020 20:55:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rdrT1tm4z9sPJ;
        Mon,  6 Jan 2020 12:55:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578275737;
        bh=H8huH0kHSTplQmOfDL3UG9eTTuXnRHDVPGYIItGVNwg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CoMIQEDINd6JcqxZRnnBV5qztqn9gPn1h6L/M5OcDNoxpcN1O0l2kcmZZSKj9r/zs
         ed0+sNSp10WIH6goQ+lC2XDofTdAaV3cv67jEIKntJdls8vVPWfWGgrmDBdbCi6al2
         UeLjV/nWAf5zgeTxUJa5j+wsYK222KkdmReDHrHeN9aVoMLbGXZBxWSEde6EICmXfw
         EHUhLJ2q6uwQ5alyfOHDxxlj/QyExsZYB5cxE5ujicV35qR2XBoRexW4Xy5iZoefqP
         WBsGiwW217koFQ4rNXHIFc/fOqG0y30+cosMpHt1JbNPqETNBBkBmPHzF1fbw4V+7E
         7AskMCowbqV6A==
Date:   Mon, 6 Jan 2020 12:55:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20200106125536.42fa3df4@canb.auug.org.au>
In-Reply-To: <alpine.DEB.2.21.9999.2001051749560.484919@viisi.sifive.com>
References: <20200106093246.6abbb7e9@canb.auug.org.au>
        <alpine.DEB.2.21.9999.2001051749560.484919@viisi.sifive.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+cGBlbluk_+o6SF.ktlJQ/T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+cGBlbluk_+o6SF.ktlJQ/T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sun, 5 Jan 2020 17:50:35 -0800 (PST) Paul Walmsley <paul.walmsley@sifive=
.com> wrote:
>=20
> Thanks, I just reset our for-next branch to v5.5-rc5, so this won't=20
> reappear.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/+cGBlbluk_+o6SF.ktlJQ/T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4Sk5gACgkQAVBC80lX
0Gw0Owf9EGr7v1YpBlpF5thV9GQWkE2gQ5/p9GQ78vTSscEut3TAKP6svS2b/74c
NK8mpeIjVLPiIacaZNe4eWnFIxGb8Z0hbBVSYiU4eMQSU8OnEWOYWoRtWwOYHuRj
WqizGY2hvK6T2VDmZb502cSH2cgIzv9h7lXZ9G8+F18qy9jF9XdjKDko/Gtn4e0o
6lCvlsxZvoCiZBwq+e/KHAUgz0sq+BkPC1sT9iVmZvPZL75/ZPTfONlWM8v4yHPa
XOpXhYuacnMw6sy7EWJoNgtyXyRnLG5DQTmeyp3M9OpH22nBh/HX+cKeTLAAWrDe
AFfVAVnt6n+SGD9QjMn20EnGN+c4QA==
=zceD
-----END PGP SIGNATURE-----

--Sig_/+cGBlbluk_+o6SF.ktlJQ/T--
