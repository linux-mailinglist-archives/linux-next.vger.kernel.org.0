Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D05221CD01
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 04:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgGMCHC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 22:07:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbgGMCHC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Jul 2020 22:07:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B4n8M6rTlz9sDX;
        Mon, 13 Jul 2020 12:06:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594606020;
        bh=nhxvablWCWtzJD3w5WncLhUF1PcAMaf1zj8Yq6akBls=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CtAI9L4oxh0lhFNi5d69X9OEErpt3YKoW+n5/JXq85EU0cfmQhF1cdCBhYbF3ZlLc
         3hn3Sj9HwsW2E2GpDBr9IMYcuhHAnt72lY43xPLYFuJmCNhAHGizQm9aHuA7v9ieQD
         ZhViaC3cwHZfRA2hpDbS8lbeMtvjCGWm8BJCh8+WZ10BsyVaK1RKYTe9yUhQ+f7yS3
         3uPyt6aVesQUU5MEOmZHjgSQShc2hjhLGmb9nxneWc5eQrMucQfk9dYSJKKIibxsgt
         4G/Xr5jO5dOc30F9capHgrgAVM/UGHjTIhdWwixPSbc2YMcsE1ISthYzSrSFPMTBM1
         5n/TlPBNcAOSQ==
Date:   Mon, 13 Jul 2020 12:06:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Colascione <dancol@google.com>
Subject: Re: linux-next: build failure after merge of the security tree
Message-ID: <20200713120659.3710574b@canb.auug.org.au>
In-Reply-To: <20200713120419.33cf7a87@canb.auug.org.au>
References: <20200708140034.546298ff@canb.auug.org.au>
        <20200713120419.33cf7a87@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YrGQ5Qb2xKFRxp4quup7wUK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YrGQ5Qb2xKFRxp4quup7wUK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jul 2020 12:04:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I am still applying the above patch ...

And the mail address Daniel Colascione <dancol@google.com> bounces.

--=20
Cheers,
Stephen Rothwell

--Sig_/YrGQ5Qb2xKFRxp4quup7wUK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8LwcMACgkQAVBC80lX
0Gz4wwf/SRY8K12a2A7Yd44FL//L+jwDnH7vwBNoEkE03muHc1cn7bFKWRBvN6Vl
HOiE11E2RWStlpew9aVInQ6H4zU/i5KIUHD3E0EHtkWkDE5pn+ozDKVFwUHj1rz5
rEg4s+BDGhs4XId9qmaWDRJIA688dX8X/MnAn2denlGumC3eE9KcQa+ILgA87jZ7
aQmbn8AQPjlZWLv5TK7JSQmprK+Wr9DinFlgBtw6Ql6VA8i5nB9Vpp5L+GL7UyPg
c9AkyBF2mU2wUYGRUKbkSkP9+dtuvvZjbHJA3h6DolhHOrgLc56j9jqudOFBzhpc
B3Kqo4qCq14t7fBdSGFz9jcDWzzdfQ==
=yd9u
-----END PGP SIGNATURE-----

--Sig_/YrGQ5Qb2xKFRxp4quup7wUK--
