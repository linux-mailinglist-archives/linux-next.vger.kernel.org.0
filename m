Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 591C5DB89B
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2019 22:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731214AbfJQUpL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 16:45:11 -0400
Received: from ozlabs.org ([203.11.71.1]:50851 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729725AbfJQUpL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Oct 2019 16:45:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vLl92PS3z9sPF;
        Fri, 18 Oct 2019 07:45:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571345109;
        bh=A+hZykoo8odPNT3+tk3/9m1PpKZJvOZ/8LQIl7W27w0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dyAobg++7C2PXCs1FBSSqpe4RAeKVHgUg1AgeRNq3ychmvS8zWBzPPpH/T0+NfUIT
         AijOisHJ+dAykNU3lLjJAylo7d/zpQsCjsEYpCS6SkE36tWgwtEVxNuwAWgYrOa/Uh
         8OfyqKyFKcsz2opzNEHOv0cWhc63/husRHhu7Vv/eRl6yMd3m8fFgcaOyKH1nR25xT
         fIY075uniJLVdSVJJUBwDpcGGyUzZytH0NLhr90JWpmJd5D1wYaIUApCD/+Z/XyCbG
         JYpkXctiQWeo3Q2KSmTxu4UJqwlXndZVBvp0d7rzywr6YZ/MCNnx3WPW5WXDGgSpVt
         W3bmPxjh/Mf2g==
Date:   Fri, 18 Oct 2019 07:45:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Adding thermal group git tree
Message-ID: <20191018074507.5cdd9651@canb.auug.org.au>
In-Reply-To: <14977267-32c5-77f6-7c9c-edf8dc5d0c0e@linaro.org>
References: <540b4561-8920-f4fc-1b90-b013f20c8e25@linaro.org>
        <14977267-32c5-77f6-7c9c-edf8dc5d0c0e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i5wfUJ0xLE5J+GdgUC1qxtJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i5wfUJ0xLE5J+GdgUC1qxtJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, 17 Oct 2019 08:28:41 +0200 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>
> is it possible to replace the current monitored branch clockevents/next
> by timers/drivers/next ?
>=20
> From https://git.linaro.org/people/daniel.lezcano/linux.git

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/i5wfUJ0xLE5J+GdgUC1qxtJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2o0tMACgkQAVBC80lX
0Gz0oQf/ab5x+h8cTb2mhPMmYq2VzGdFVzv2uZgzhN1Qyh1HSbKpqOFC0Wzp1IOf
8rKE/z3hd346C7BlqZRigdCM00WGpNBCefNqyUqzuGJ1TKhARhwYKZNodQOmOo4G
CqqtTkpZcR0Ktgg8kqzxwLEr1uremT5AfP8rg7WDpUJ/ULqe3lM7qBiZyTAVnQNz
2AKLsv71o4EAgF/0idOmnOD24yIJnG5NT7MSq+ZpmPl9fq2vQWmWuqnDYGygM2nb
UEbN5xBZPZFSosNCrKJfoYz2n+xARFKWdtECixZETJIbZ94yVAnvecuegVLun0Cy
mqZbzKZMUAGYrLfyX1iaiqzczO7pvg==
=6QcP
-----END PGP SIGNATURE-----

--Sig_/i5wfUJ0xLE5J+GdgUC1qxtJ--
