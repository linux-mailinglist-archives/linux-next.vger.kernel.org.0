Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC21A25B9E6
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 06:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgICEok (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 00:44:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34167 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725943AbgICEoj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Sep 2020 00:44:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BhpB96Z5Mz9sTC;
        Thu,  3 Sep 2020 14:44:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599108276;
        bh=1V5O/0020Usr89jaCP6ONufv5noCmy3GV3afK4uImmU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qRf68gV5A9ZWLDsK8V2zQIzOSRRiN1yJVLf0ZD3U96vslRaeRByM3tAS8mpJGsp3x
         z9MsmVxAQsJgGUVxSGwz0ICxuAs+Al2dRu10ts7HSCbwBljDNl9b9OjuptmBiEHnhf
         XdyTcpRUGyz+7p+HQXIht0R6oy3CIOtKgn7YVfZw83aqoj5OXcs/tZpcG1GWGSIL6A
         z76td9yndL5oWIYt+tStH/V/Lu5f58N2YOakziM6HH2LRH/L861rbdQnux0HZlCXBj
         aNC7EgnYRHyZnmioN9BDPLHWEg1Uco3WgqFYMq8xkAyD3NOhWW5opXtZEwk9bz/Gby
         TtOS2c2vFuXOg==
Date:   Thu, 3 Sep 2020 14:44:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200903144431.185c0d34@canb.auug.org.au>
In-Reply-To: <20200903035108.GA3616759@gmail.com>
References: <20200903123552.0c5d1277@canb.auug.org.au>
        <20200903035108.GA3616759@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1ybp4sLvj+=6fGb+07qpFD_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1ybp4sLvj+=6fGb+07qpFD_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Thu, 3 Sep 2020 05:51:08 +0200 Ingo Molnar <mingo@kernel.org> wrote:
>
> I've merged the old commit by mistake - it's removed now.

Ah, OK, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/1ybp4sLvj+=6fGb+07qpFD_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9QdK8ACgkQAVBC80lX
0Gxq2Af+ICEIrPa/oAUr3nxWkc2JC1WBzx1cg7Do3YJm57dwoTQ2W667w45hgaFX
yHNIYC1OxAf4x0ugIJtXmgman8HcQeQw26onbGc6wP3vZCKZTAq0HZ+4sS8oIj8y
VwceKRfgJA22GOOWkqfWJyWTY2nIDbMNhJTpQmNoSzoIZM4CPr6ncnjAjNwjAxae
b4rvLxjlLEvqDVTQXqfQMtBEW7xHWRxLoA0YaiTrgY7hcdDYG8JMGUyQ29TuBlgd
CpokU6ArHPcCNh3cTQL7QqMKsxTwfqpwx9FgtvzH4EQ2nty1G3ngff2k9s6uNJqz
AJLM/pBURMIlD/8mWkze5rdRM2/fvw==
=Ii72
-----END PGP SIGNATURE-----

--Sig_/1ybp4sLvj+=6fGb+07qpFD_--
