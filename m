Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D18C249454
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 07:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725280AbgHSFOI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 01:14:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60681 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgHSFOH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Aug 2020 01:14:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BWbY94s4mz9sPB;
        Wed, 19 Aug 2020 15:14:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597814045;
        bh=WGaH/6wz7oDT6NVY4WdQc1xZavyOGQqbY/4W7LH+sfo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u9qitqFeIWQF12kO/8J82Lhn69C1TyTCx1lImJoK5GO5H7n+4eREyuMJ88u4se7I6
         OLUc8gcdH4S8EwbGSPumZbvruaISE2XG77C+a1zl1RX0q6KucugMStmsehVz1P4iES
         EdPCj2Zi/GXd+ugLTWCfmjEG/jNSmyc83VQt0uFy7WB2gDQ2DEHRxvU6JxQ1vbhQ2Z
         cTiM4hvDakd8JcbMgHoSx5fq3+Urzic8L9IzQ/0AxzhOTIKiyTsI1wVu3vMWN8sovf
         uoSh7IGajH33eD4X7Zz/UQFAsLrHHDBc1tDEmHBG5FRPl06iabUIt6GodoN8gGWkeG
         ol/N5x+0qibCA==
Date:   Wed, 19 Aug 2020 15:14:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the mhi tree
Message-ID: <20200819151403.506714f8@canb.auug.org.au>
In-Reply-To: <20200819040455.GA7693@Mani-XPS-13-9360>
References: <20200819134800.165b78a0@canb.auug.org.au>
        <20200819040455.GA7693@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J0RbOmUIOfsAv8yp5D_074s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J0RbOmUIOfsAv8yp5D_074s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Aug 2020 09:34:55 +0530 Manivannan Sadhasivam <manivannan.sadhas=
ivam@linaro.org> wrote:
>=20
> On Wed, Aug 19, 2020 at 01:48:00PM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the mhi tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > I am not sure which commit(s) caused this.
>=20
> Probably the below commit which built fine with gcc but failing with clan=
g:

In case it matters, I build with gcc ...

> 92ce39feb722 bus: mhi: core: Introduce debugfs entries for MHI
>=20
> I've dropped this and also one dependent commit from mhi-next branch.

We'll see tomorrow is that helps.
--=20
Cheers,
Stephen Rothwell

--Sig_/J0RbOmUIOfsAv8yp5D_074s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl88tRsACgkQAVBC80lX
0GzKLgf/ca5N+SJtBB/NHW/hiol7RVnkf9IzKBkeDKZeb2NoDoZfsYVX4kenVZJc
GzDIB1Y+/lVPCr9ec1xipwtAQE1TaFxaUaEBzX+Wx2PesCsEJKtp+mlN4eaPU0at
TZpFUCDSCt5kZVW6O65VO6fQM/Hk/9CM62Bpyc0rXmM89GSJsDIuw4JyMNDVPrmX
gE60LWA1WJB5lxnpqqGp6RTrzgkxKuaBGQf2jWV8rKNLy7460laW8vNy0bN+Nb3f
bYJHMhake6uKpNVQpdV2n/sNLs6WGYFrhQF+w4BQQQLB1X2H2v1CW5+69HT63VfD
qTPyyEQv/c97dJMWvllUWOXSwQzTmg==
=8QE1
-----END PGP SIGNATURE-----

--Sig_/J0RbOmUIOfsAv8yp5D_074s--
