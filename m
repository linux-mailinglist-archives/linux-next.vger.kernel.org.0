Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A732C166B38
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 00:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729298AbgBTX7n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 18:59:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38509 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729234AbgBTX7n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Feb 2020 18:59:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Ns5T2bZGz9sRf;
        Fri, 21 Feb 2020 10:59:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582243181;
        bh=H3Bhw27wgMSfXqZ06hdKW86qGZbRwhtvODS+7/bYq7M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q0xgQ8/dL5ErWYPwEyNog28B1fCEM37HenFeUSmx/BYq8wmiOQ8vPI3f1zUeRC1Av
         TCR09UDg729nveVLP7SvwqZyrkdozoKka7D1ZIUCwiSNiRQ7abGao2VzmfK+bos0DQ
         JP5JqKIZRwvL5kB/+MiEQbBTFRdPYnvGaA0AIKbup8TpQeb5z/9TbSq0RWaWmYc3A9
         cJDv43wnU/94SwtGikSSNFOTVAES3S/M/ERGMcs5mekzT9Rl1zgZ+2/NJ7fuMIVwhq
         GdGg6x+JEg468Db1Y9d2NH6WD4qUirmwYVkA4+nWzk8XDbg41N7Mo5D08/P5hVnrKk
         7nvhblx7/Lv0A==
Date:   Fri, 21 Feb 2020 10:59:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arjun Roy <arjunroy@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200221105940.44fd67f1@canb.auug.org.au>
In-Reply-To: <CAOFY-A2tK5=eFt2AQx+FOjyHXQ85XE-N8gdbb49wJphjAAgFUQ@mail.gmail.com>
References: <20200217145711.4af495a3@canb.auug.org.au>
        <CAOFY-A1nfPjf3EcQB6KiEifbFR+aUtdSgK=CHGt_k3ziSG6T_Q@mail.gmail.com>
        <CAOFY-A3q_pmtHKAoOJdbB09wy=dxs9SdpXjCsU1wBxU5EDHVmw@mail.gmail.com>
        <20200221101845.21c0c8c5@canb.auug.org.au>
        <CAOFY-A2ndGCSEDstOmXs-u1XjNsaj8wkLezYsMbzeZeVTJGC5g@mail.gmail.com>
        <20200221104328.0f897efd@canb.auug.org.au>
        <CAOFY-A2tK5=eFt2AQx+FOjyHXQ85XE-N8gdbb49wJphjAAgFUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n=+M1qFwCmphl3AY.Cq.mx5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n=+M1qFwCmphl3AY.Cq.mx5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arjun,

On Thu, 20 Feb 2020 15:44:28 -0800 Arjun Roy <arjunroy@google.com> wrote:
>
> On Thu, Feb 20, 2020 at 3:43 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > On Thu, 20 Feb 2020 15:22:04 -0800 Arjun Roy <arjunroy@google.com> wrot=
e: =20
> > >
> > > I have a possible solution in mind, but it would involve a slight
> > > change in the SPARC macro (to be more inline with the semantics of the
> > > other platforms).
> > > If you're open to such a change, I can send it out. =20
> >
> > Its not up to me :-)
> >
> > If it is not too much work, I would say, do the patch, test it as you
> > can, then send it out cc'ing the Sparc maintainer (DaveM cc'd) and see
> > what happens.
>=20
> Certainly, I will do so.

Just one thing: its worth while making it clear to DaveM that you just
want his Ack (rather than for him to take the patch into the Sparc
tree) so that the patch can go into Andrew's tree along with the rest
of the series.

--=20
Cheers,
Stephen Rothwell

--Sig_/n=+M1qFwCmphl3AY.Cq.mx5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5PHWwACgkQAVBC80lX
0GwXiwf+NAqXQ9gETVZZgq6sHUVnJj0/G11Axq+1O3yLWOEi8RpsRq8Fv0Gzg9oE
l+yil+FOsWiCI5huwAGcHtBFe3D1Q98/qZSSS/tKVTLEbMpKXMCLbODv++66dyxy
Pw3ugAeuJd7aWBlnA9RCMnD80X3k2yThO6UNZRvtx0GKs/yvokvF6g8ivKNKJFwf
69czhR6nPVC1w+Lzqo98V9GZrMPfrh6n7eIvu0wXXiEBe8uPZgRvTkgU+2pLOYTD
gvZpVO7bwd47a37XkBJx8bk23mdbCbi48jwMCBHgC7f/ep5rht6s8X12UCR+S4K9
OZCwdguRNneS4yr48PulWpOnBPP0bA==
=nMVK
-----END PGP SIGNATURE-----

--Sig_/n=+M1qFwCmphl3AY.Cq.mx5--
