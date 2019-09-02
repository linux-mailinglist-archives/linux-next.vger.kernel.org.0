Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05503A5E35
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 01:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfIBXjr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 19:39:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33007 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726833AbfIBXjr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 19:39:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MmlN0Sbzz9s7T;
        Tue,  3 Sep 2019 09:39:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567467584;
        bh=GepEgh3xIqeFzREb1rvJvk+eS9iv4OAFhLY1Qts+vVc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mZ/Xn3EHnMinRzL+nELxHqIBtKnhvNBtoCcKP7wlOHUe4Yeo4hU6sIXaZDFHwAJGh
         QyL/3iVqC7fzMXhC2nFZVIA9iq4vUngZZLNdfn8EZsQqLLYTRRJZ2gbDw1PTaAxd4F
         ow9Ta2/TXW+qbz8upk0cG4Lf/Y5hZ8A3YeQprUO5gxDzBXEyfAwoxe3XKFtCRG48hG
         iNnvVdCvcV/L9d6keYrfSpgk2RtrVTIDzqNpwVyGc33r9HDajP9bcBL58SChLsIijy
         zEwKGdW+z0V3WMruJssGdowdcsn6DESEDCMEKFvNF9JkYyffrgwNa55IGXy40A4ZJg
         QnMfMZ+Kumejw==
Date:   Tue, 3 Sep 2019 09:39:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the keys tree
Message-ID: <20190903093943.5ed397a2@canb.auug.org.au>
In-Reply-To: <22426.1567466408@warthog.procyon.org.uk>
References: <20190903090722.556b66ba@canb.auug.org.au>
        <20190902161935.78bf56f1@canb.auug.org.au>
        <20190829153116.7ffc7470@canb.auug.org.au>
        <16836.1567440079@warthog.procyon.org.uk>
        <22426.1567466408@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ebltfuYTyyr65rFRJKrpdEd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ebltfuYTyyr65rFRJKrpdEd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 03 Sep 2019 00:20:08 +0100 David Howells <dhowells@redhat.com> wrot=
e:
>
> Ah, yes - the sample demonstrates the key/keyring notifications as well a=
s USB
> and block notifications and requires a constant from the keyutils-devel
> package.  Maybe I should get it from the kernel UAPI headers instead, but=
 that
> risks generating a collision.

What sort of collision?
--=20
Cheers,
Stephen Rothwell

--Sig_/ebltfuYTyyr65rFRJKrpdEd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1tqD8ACgkQAVBC80lX
0GyCAAf9GjOQ+ewNsg6e47KEWBXH58uzH6aeY2vFcQHqq37uzTk361ZC3Pm4K/+R
W5DQ4JmxPyZ2f/7TlAF0RxVFYUpqJPu506i96IfWsZnKkDjUM9puZCDOIMfakhv3
WgwhsHay4MZKFWlsd84XUruHO6qvcN7gxCo7Mb5T04vt9IuN3cUSKOPhuVv+jLWV
Bcf0uZTT0NwgnaNprABFhR3VpiUUlLTajs2zoW8clyNjzP8jsFzNae2ps3Y/qLCh
uR6ubgkcHN3wtFqSKNaf+BHsTiHXGeyOxZ8umBRDi/jKksmvW0LRDS8ip/eMjNAP
juV3iOENFOz9B7XPH3HgtDOzveBAzg==
=C5bD
-----END PGP SIGNATURE-----

--Sig_/ebltfuYTyyr65rFRJKrpdEd--
